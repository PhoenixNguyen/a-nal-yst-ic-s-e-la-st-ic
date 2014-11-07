package vn.onepay.template.controllers;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.todomap.minigeoip.GeoipResolver;

import vn.onepay.account.dao.AccountDAO;
import vn.onepay.account.model.Account;
import vn.onepay.template.dao.EmailTempDAO;
import vn.onepay.service.ServiceFinder;
import vn.onepay.utils.AES;
import vn.onepay.utils.CookieUtil;
import vn.onepay.utils.Utils;

public abstract class AbstractController implements Controller {
	protected AccountDAO accountDAO;
	protected EmailTempDAO emailTempDAO;
	
	public void setEmailTempDAO(EmailTempDAO emailTempDAO) {
		this.emailTempDAO = emailTempDAO;
	}	
	
	protected String folderLayout = "";
	private String webView;

	public AccountDAO getAccountDAO() {
		return this.accountDAO;
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	public String getWebView() {
		return this.folderLayout + this.webView;
	}

	public void setWebView(String webView) {
		this.webView = webView;
	}

	protected void initFolderLayout(HttpServletRequest request,
			HttpServletResponse response) {
		String LAYOUT_FOLDER_KEY = "LAYOUT_FOLDER_KEY";
		this.folderLayout = "";
		try {
			String version = StringUtils.trimToEmpty(request
					.getParameter("ver"));
			if (("en".equalsIgnoreCase(version))
					|| ("vi".equalsIgnoreCase(version))) {
				if (response != null)
					CookieUtil.setCookieValue(response, "ver", version,
							2147483647);
				if ("en".equalsIgnoreCase(version))
					this.folderLayout = "english/";
				else
					this.folderLayout = "";
			} else if (request.getSession().getAttribute("LAYOUT_FOLDER_KEY") != null) {
				this.folderLayout = StringUtils.trimToEmpty((String) request
						.getSession().getAttribute("LAYOUT_FOLDER_KEY"));
			} else {
				version = CookieUtil.getCookieValue(request, "ver");
				if ((!"en".equalsIgnoreCase(version))
						&& (!"vi".equalsIgnoreCase(version))) {
					GeoipResolver geoipResolver = (GeoipResolver) ServiceFinder
							.getContext(request).getBean("geoipResolver",
									GeoipResolver.class);
					String coutryCode = geoipResolver.getCountryCode(Utils
							.getIP(request));
					if ((StringUtils.isEmpty(coutryCode))
							|| ("VN".equalsIgnoreCase(coutryCode)))
						version = "vi";
					else {
						version = "en";
					}
					if (response != null)
						CookieUtil.setCookieValue(response, "ver", version,
								2147483647);
				}
				if ("en".equalsIgnoreCase(version))
					this.folderLayout = "english/";
				else
					this.folderLayout = "";
			}
		} catch (Exception exp) {
			exp.printStackTrace();
		} finally {
			System.out.println(this.folderLayout);
			request.getSession().setAttribute("LAYOUT_FOLDER_KEY",
					StringUtils.trimToEmpty(this.folderLayout));
		}
	}

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		initFolderLayout(request, response);

		ModelMap model = new ModelMap();

		boolean blnLogined = checkLogin(request, response);
		if (!blnLogined) {
			String backUrl = request.getRequestURL().toString();
			String ver = request.getParameter("ver");
			if (StringUtils.isEmpty(ver)) {
				ver = (StringUtils.isNotEmpty(this.folderLayout))
						&& (this.folderLayout.indexOf("english") != -1) ? "en"
						: "vi";
				backUrl = backUrl + (backUrl.indexOf("?") != -1 ? "&" : "?");
				backUrl = backUrl + "ver=" + ver;
			}
			return new ModelAndView("redirect:/login.html?back_url="
					+ URLEncoder.encode(backUrl, "UTF-8") + "&ver="
					+ URLEncoder.encode(ver, "UTF-8"));
		}
		return handleRequest(request, response, model);
	}

	protected abstract ModelAndView handleRequest(
			HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, ModelMap paramModelMap)
			throws Exception;

	public boolean checkLogin(HttpServletRequest request,
			HttpServletResponse response) {
		Account account = (Account) request.getSession().getAttribute(
				"account_logined");
		if (account != null)
			return true;
		String userName = null;
		Assertion assertion = (Assertion) request.getSession().getAttribute(
				"_const_cas_assertion_");
		if (assertion != null) {
			userName = assertion.getPrincipal().getName();
			try {
				String ticketValue = AES.encrypt("0123456789abcdef".getBytes(),
						userName);
				CookieUtil.setCookieValue(response, "auth_ticket", ticketValue,
						10000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String authTicket = CookieUtil.getCookieValue(request,
					"auth_ticket");
			if (authTicket != null) {
				try {
					userName = AES.decrypt("0123456789abcdef".getBytes(),
							authTicket);
				} catch (Exception e) {
					userName = null;
				}
			}
		}
		if (userName != null) {
			if (account == null) {
				account = this.accountDAO.find(userName);
				if (account != null) {
					request.getSession().setAttribute("account_logined",
							account);
					try {
						String ticketValue = AES.encrypt(
								"0123456789abcdef".getBytes(), userName);
						CookieUtil.setCookieValue(response, "auth_ticket",
								ticketValue, 10000);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			return true;
		}
		return false;
	}

}
