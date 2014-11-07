package vn.onepay.account.management.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.LinkedMap;
import org.apache.commons.lang.StringUtils;
import org.jasig.cas.client.util.AbstractCasFilter;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.todomap.minigeoip.GeoipResolver;

import vn.onepay.account.dao.AccountDAO;
import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.service.MerchantService;
import vn.onepay.service.ServiceFinder;
import vn.onepay.utils.AES;
import vn.onepay.utils.CookieUtil;
import vn.onepay.utils.Utils;

public abstract class AbstractAccountManagementController implements Controller {
	protected static final String ALL_ACCOUNT_SESSION 		= "ALL_ACCOUNT_SESSION";
	protected static final String ACCOUNT_MANAGER_SESSION 	= "ACCOUNT_MANAGER_SESSION";
	
	protected AccountDAO accountDAO;

	protected String folderLayout = "";
	private String webView;

	public AccountDAO getAccountDAO() {
		return this.accountDAO;
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Autowired
	MerchantService merchantService;

	public String getWebView() {
		return this.folderLayout + this.webView;
	}

	public void setWebView(String webView) {
		this.webView = webView;
	}

	protected void initFolderLayout(HttpServletRequest request,
			HttpServletResponse response) {
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
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		if(account!=null){
			if("ON".equalsIgnoreCase(SharedConstants.OTP_AUTH_ON_OFF_STATUS)){
				//---
				if(account.checkRoles(new String[]{Account.ACCOUNT_STAFF_ROLE})){
					Object verifiedOTP = request.getSession().getAttribute(SharedConstants.ACCOUNT_VERIFIED_OTP);
					if(verifiedOTP ==null)
						return false;
				}
				//---
			}
			return true;
		}
		String userName=null;
		Assertion assertion = (Assertion) request.getSession().getAttribute(AbstractCasFilter.CONST_CAS_ASSERTION);
		if(assertion!=null){
			userName = assertion.getPrincipal().getName();
			try{
				String ticketValue = AES.encrypt(SharedConstants.AUTH_TICKET_ENCRIPT_CODE.getBytes(), userName);
				CookieUtil.setCookieValue(response, SharedConstants.AUTH_COOKIE_TICKET_NAME, ticketValue, 10000);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			String authTicket = CookieUtil.getCookieValue(request, SharedConstants.AUTH_COOKIE_TICKET_NAME);
			if(authTicket!=null){
				try{
					userName = AES.decrypt(SharedConstants.AUTH_TICKET_ENCRIPT_CODE.getBytes(), authTicket);
				}catch(Exception e){
					userName = null;
				}
			}
		}
		if(userName!=null){
			if(account ==null){
				account = accountDAO.find(userName);
				if(account!=null){
					request.getSession().setAttribute(SharedConstants.ACCOUNT_LOGINED,account);
					try{
						String ticketValue = AES.encrypt(SharedConstants.AUTH_TICKET_ENCRIPT_CODE.getBytes(), userName);
						CookieUtil.setCookieValue(response, SharedConstants.AUTH_COOKIE_TICKET_NAME, ticketValue, 10000);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
			if(account!=null){
				if("ON".equalsIgnoreCase(SharedConstants.OTP_AUTH_ON_OFF_STATUS)){
					//---
					if(account.checkRoles(new String[]{Account.ACCOUNT_STAFF_ROLE})){
						Object verifiedOTP = request.getSession().getAttribute(SharedConstants.ACCOUNT_VERIFIED_OTP);
						if(verifiedOTP ==null)
							return false;
					}
					//---
				}
				return true;
			}
		}
		return false;
	}

	public List<String> getMerchantManagerList(Account account) {
		List<String> merchantManagerList = new ArrayList<String>();
		List<Account> accountList = accountDAO.findByRole(new String[] {Account.ACCOUNT_MERCHANT_MANAGER_ROLE});
		Collections.sort(accountList, new Comparator<Account>() {

			@Override
			public int compare(Account o1, Account o2) {
				if(o1.getTags() == null || o1.getTags().length == 0) return 1;
				if(o2.getTags() == null || o2.getTags().length == 0) return -1;
				
				return o1.getTags()[0].compareToIgnoreCase(o2.getTags()[0]);
			}
		});
		
		if(accountList != null && accountList.size() > 0)
			for (Account acc : accountList) {
				if (account.isOperator()
						&& StringUtils.isBlank(acc.getOwner())) //Root manager (Truong SU)
					merchantManagerList.add(acc.getUsername());
				else if(account.isMerchantManager()
						&& acc.getOwner().equalsIgnoreCase(account.getUsername())) // Merchant manager cap con gan nhat
					merchantManagerList.add(acc.getUsername());
					
			}
		return merchantManagerList;
	}

	public static int paramToInt(String str) {
		int number = 0;
		try {
			if (!StringUtils.isBlank(str) && StringUtils.isNumeric(str))
				number = Integer.parseInt(str);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		return number;
	}

	public <T> T[] append(T[] arr, T element) {
		final int N = arr.length;
		arr = Arrays.copyOf(arr, N + 1);
		arr[N] = element;
		return arr;
	}

	public List<String> getPermisisonRequest(HttpServletRequest request,
			HttpServletResponse response) {
		List<String> arr = new ArrayList<String>();
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		
		if(account == null) return arr;
		
		Map<String , String> rolesMap = rolesMap(account);
		
		for(String key : rolesMap.keySet()){
			addPermission(arr, request.getParameter(key), key);
		}
		
		return arr;
	}

	private void addPermission(List<String> arr, String p, String k) {
		if (p != null && (p.compareTo("true") == 0 || p.compareTo("on") == 0)) {
			arr.add(k);
		}
	}

	protected boolean isStaff(Account account) {
		return account.isOperator() || account.isBizSupporter()
				|| account.isBizStaff() || account.isMerchantManager();
	}

	protected boolean isManager(Account account) {
		return account.isOperator() || account.isBizSupporter()
				|| account.isBizStaff() || account.isMerchantManager();
	}
	
	protected boolean isOperator(Account account) {
		return account.isOperator() || account.isBizSupportManager();
	}
	
	@SuppressWarnings("unchecked")
	protected Map<String , String> rolesMap(Account account){
		Map<String, String> tmp = new LinkedMap();
		
		tmp.put(Account.ACCOUNT_MERCHANT_ROLE, "Merchant");
		if(account.isOperator() || account.isAdmin() || account.isBizSupportManager() || account.isBizStaff() || account.isMerchantManager()) tmp.put(Account.ACCOUNT_MERCHANT_MANAGER_ROLE, "Merchant Manager");
		if(account.isOperator() || account.isAdmin() || account.isBizSupportManager() || account.isBizStaff()) tmp.put(Account.ACCOUNT_STAFF_ROLE, "Staff");
		if(account.isOperator() || account.isAdmin() || account.isBizSupportManager()) tmp.put(Account.ACCOUNT_STAFF_MANAGER_ROLE, "Staff Manager");
		if(account.isOperator() || account.isAdmin() || account.isBizSupportManager()) tmp.put(Account.ACCOUNT_BIZ_SUPPORTER_ROLE, "Biz Supporter");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_MARKETING_MANAGER_ROLE, "Maketing Manager");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_SHARE_HOLDER_ROLE, "Share Holder");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_CUSTOMER_CARE_ROLE, "Customer Care");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_BOOK_KEEPER_ROLE, "Book Keeper");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_BILLING_ROLE, "Billing");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_REPORTER_ROLE, "Reporter");
		if(account.isOperator() || account.isAdmin()) tmp.put(Account.ACCOUNT_OPERATION_MANAGER_ROLE, "Operation Manager");
		
		return tmp;
	}
	
	protected void clearSession(HttpServletRequest request) {
		request.getSession().removeAttribute(ALL_ACCOUNT_SESSION);
		request.getSession().removeAttribute(ACCOUNT_MANAGER_SESSION);
	}
}
