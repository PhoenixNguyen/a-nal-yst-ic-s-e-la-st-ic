package vn.onepay.dev.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import vn.onepay.account.dao.AccountDAO;
import vn.onepay.account.model.Account;
import vn.onepay.cache.dynacache.DynaCache;
import vn.onepay.common.SharedConstants;
import vn.onepay.dev.dao.DevArticleDAO;
import vn.onepay.dev.dao.DevCategoryDAO;
import vn.onepay.dev.model.DevCategory;
import vn.onepay.service.AccountService;
import vn.onepay.service.HttpService;
import vn.onepay.service.MerchantService;
import vn.onepay.service.ServiceFinder;
import vn.onepay.utils.AES;

public abstract class DevAbstractController implements Controller {

	@Autowired protected AccountDAO 		accountDAO;
	@Autowired protected HttpService 		httpService;
	@Autowired protected DevCategoryDAO		devCategoryDAO;
	@Autowired protected DevArticleDAO		devArticleDAO;
	
	@Autowired protected AccountService		accountService;
	@Autowired protected MerchantService 	merchantService;
	
	protected String folderLayout = "";
	private String webView;
	public String getWebView() {
		return webView;
	}
	public void setWebView(String webView) {
		this.webView = webView;
	}
	   
	private static final String STEP_STATE = "step_state";
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		this.folderLayout = httpService.initFolderLayout(request, response);
		//Init model
		ModelMap model = new ModelMap();
		model.put("allIcons", ALL_ICONS);
		
		boolean blnLogined = accountService.checkLogin(request, response);

		HttpSession session = request.getSession();
		Integer stepState = (Integer) session.getAttribute(STEP_STATE);
		
		if(stepState == null)
			stepState = Integer.valueOf(0);
		
		if(blnLogined && stepState.intValue() <= 0) {
			String merchantEncode = "";
			Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
			if(account != null && account.isMerchant()) {
				String key = "1pay1pay1pay1pay";// key must be 16 characters
				merchantEncode = AES.encrypt(key.getBytes("UTF-8"), account.getUsername());
				model.put("merchantEncode", merchantEncode);
			}
			
			stepState = Integer.valueOf(1);

			try {
				DynaCache httpDynaCache = ServiceFinder.getContext(request).getBean("httpDynaCache", DynaCache.class);
				String url = "https://1pay.vn/console/check-have-charging-contact.wss?merchant=" + merchantEncode;
				String chargingServices = (String) httpDynaCache.getCachedItem(url);
				if(StringUtils.isNotBlank(chargingServices))
					stepState = Integer.valueOf(2); // Đã ký hợp đồng điện tử
				
				url = "https://1pay.vn/console/get-products.wss?merchant=" + merchantEncode;
				String jsonArrayProducts = (String) httpDynaCache.getCachedItem(url);
				if(StringUtils.isNotBlank(jsonArrayProducts)) {
					model.put("jsonArrayProducts", jsonArrayProducts);
					JSONArray jsonArray = new JSONArray(jsonArrayProducts);
					if(jsonArray != null && jsonArray.length() > 0 && stepState.intValue() >= 2) {
						stepState = Integer.valueOf(3); // Đã có sản phẩm thanh toán
					}
				}
			} catch (Exception e) {
			}
			
			if(stepState.intValue() > 0)
				session.setAttribute(STEP_STATE, stepState);
		} else {
			session.removeAttribute(STEP_STATE);
		}
		
		model.put(STEP_STATE, stepState.intValue());
		
		/*boolean blnLogined = accountService.checkLogin(request, response);
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
		}*/
		
		return handleRequest(request, response, model);
	}

	protected abstract ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception;
	
	protected String optionCateTreeBuild(List<DevCategory> cates, DevCategory parent, String optionsStr, int level) {
		if(cates == null || cates.size() == 0)
			return optionsStr;
		
		String prefix = "";
		for(int i=0; i<level; i++) prefix += "--";
		for(DevCategory cate : cates)
			if((parent == null && cate.getParent() == null)
					|| (parent != null && cate.getParent() != null && parent.getId().equalsIgnoreCase(cate.getParent().getId()))) {
				optionsStr += "<option value=\"${value}\">${prefix}${title}</option>\n"
									.replace("${value}", cate.getId())
									.replace("${prefix}", prefix)
									.replace("${title}", cate.getTitle());
				
				if(cate.getChilds() != null && cate.getChilds().size() > 0)
					optionsStr = optionCateTreeBuild(cate.getChilds(), cate, optionsStr, level + 1);
			}
		
		return optionsStr;
	}
	
	protected List<DevCategory> getAllDevCategory(boolean isDevManager, String[] categoryType) {
		return devCategoryDAO.findDevCategories(null, Arrays.asList(categoryType), 
												null, Arrays.asList(isDevManager ?
														DevCategory.ALL_ADMIN_STATUS : new String[] {DevCategory.STATUS_PUBLISH}), true, -1, -1);
	}
	
	protected List<DevCategory> getChildsOfDevCategory(boolean isDevManager, DevCategory devCategory, String[] categoryType) {
		return devCategoryDAO.findDevCategories(null, Arrays.asList(categoryType), 
												devCategory, Arrays.asList(isDevManager ?
														DevCategory.ALL_ADMIN_STATUS : new String[] {DevCategory.STATUS_PUBLISH}), true, -1, -1);
	}
	
	protected boolean isDevManager(HttpServletRequest request, Account account) {
		boolean isDevManager = (account != null && account.isOperator());
		
		//fix code
		List<String> whiteList = Arrays.asList(new String[] {"linhnt"});
		if(account != null && whiteList.contains(account.getUsername())) {
			String cid = request.getParameter("cid");
			String supportCateId = "53f6c5cde4b017afe69b1ceb";
			if(supportCateId.equals(cid)) {
				isDevManager = true;
			} else {
				if(StringUtils.isBlank(cid))
					cid = request.getParameter("pid");
				if(supportCateId.equals(cid)) {
					isDevManager = true;
				} else {
					DevCategory cate = devCategoryDAO.findDevCategoryById(cid);
					if(cate != null && cate.getParent()!=null && supportCateId.equals(cate.getParent().getId())) {
						isDevManager = true;	
					}
				}
			}
		}
		
		return isDevManager;
	}
	
	public static final String[] ALL_ICONS = {
												"fa-adjust", "fa-anchor", "fa-archive", "fa-arrows", "fa-arrows-h", "fa-arrows-v", "fa-asterisk",  
												"fa-ban", "fa-bar-chart-o", "fa-barcode", "fa-bars", "fa-beer", "fa-bell", "fa-bell-o", "fa-bolt",  
												"fa-book", "fa-bookmark", "fa-bookmark-o", "fa-briefcase", "fa-bug", "fa-building-o", "fa-bullhorn",  
												"fa-bullseye", "fa-calendar", "fa-calendar-o", "fa-camera", "fa-camera-retro", "fa-caret-square-o-down",  
												"fa-caret-square-o-left", "fa-caret-square-o-right", "fa-caret-square-o-up", "fa-certificate", "fa-check",  
												"fa-check-circle", "fa-check-circle-o", "fa-check-square", "fa-check-square-o", "fa-circle", "fa-circle-o",  
												"fa-clock-o", "fa-cloud", "fa-cloud-download", "fa-cloud-upload", "fa-code", "fa-code-fork", "fa-coffee",  
												"fa-cog", "fa-cogs", "fa-comment", "fa-comment-o", "fa-comments", "fa-comments-o", "fa-compass",  
												"fa-credit-card", "fa-crop", "fa-crosshairs", "fa-cutlery", "fa-dashboard", "fa-desktop", "fa-dot-circle-o",  
												"fa-download", "fa-edit", "fa-ellipsis-h", "fa-ellipsis-v", "fa-envelope", "fa-envelope-o", "fa-eraser",  
												"fa-exchange", "fa-exclamation", "fa-exclamation-circle", "fa-exclamation-triangle", "fa-external-link",  
												"fa-external-link-square", "fa-eye", "fa-eye-slash", "fa-female", "fa-fighter-jet", "fa-film", "fa-filter",  
												"fa-fire", "fa-fire-extinguisher", "fa-flag", "fa-flag-checkered", "fa-flag-o", "fa-flash", "fa-flask",  
												"fa-folder", "fa-folder-o", "fa-folder-open", "fa-folder-open-o", "fa-frown-o", "fa-gamepad", "fa-gavel",  
												"fa-gear", "fa-gears", "fa-gift", "fa-glass", "fa-globe", "fa-group", "fa-hdd-o", "fa-headphones", "fa-heart",  
												"fa-heart-o", "fa-home", "fa-inbox", "fa-info", "fa-info-circle", "fa-key", "fa-keyboard-o", "fa-laptop",  
												"fa-leaf", "fa-legal", "fa-lemon-o", "fa-level-down", "fa-level-up", "fa-lightbulb-o", "fa-location-arrow",  
												"fa-lock", "fa-magic", "fa-magnet", "fa-mail-forward", "fa-mail-reply", "fa-mail-reply-all", "fa-male",  
												"fa-map-marker", "fa-meh-o", "fa-microphone", "fa-microphone-slash", "fa-minus", "fa-minus-circle",  
												"fa-minus-square", "fa-minus-square-o", "fa-mobile", "fa-mobile-phone", "fa-money", "fa-moon-o", "fa-music",  
												"fa-pencil", "fa-pencil-square", "fa-pencil-square-o", "fa-phone", "fa-phone-square", "fa-picture-o", "fa-plane",  
												"fa-plus", "fa-plus-circle", "fa-plus-square", "fa-plus-square-o", "fa-power-off", "fa-print", "fa-puzzle-piece",  
												"fa-qrcode", "fa-question", "fa-question-circle", "fa-quote-left", "fa-quote-right", "fa-random", "fa-refresh",  
												"fa-reply", "fa-reply-all", "fa-retweet", "fa-road", "fa-rocket", "fa-rss", "fa-rss-square", "fa-search",  
												"fa-search-minus", "fa-search-plus", "fa-share", "fa-share-square", "fa-share-square-o", "fa-shield",  
												"fa-shopping-cart", "fa-sign-in", "fa-sign-out", "fa-signal", "fa-sitemap", "fa-smile-o", "fa-sort",  
												"fa-sort-alpha-asc", "fa-sort-alpha-desc", "fa-sort-amount-asc", "fa-sort-amount-desc", "fa-sort-asc",  
												"fa-sort-desc", "fa-sort-down", "fa-sort-numeric-asc", "fa-sort-numeric-desc", "fa-sort-up", "fa-spinner",  
												"fa-square", "fa-square-o", "fa-star", "fa-star-half", "fa-star-half-empty", "fa-star-half-full",  
												"fa-star-half-o", "fa-star-o", "fa-subscript", "fa-suitcase", "fa-sun-o", "fa-superscript", "fa-tablet",  
												"fa-tachometer", "fa-tag", "fa-tags", "fa-tasks", "fa-terminal", "fa-thumb-tack", "fa-thumbs-down",  
												"fa-thumbs-o-down", "fa-thumbs-o-up", "fa-thumbs-up", "fa-ticket", "fa-times", "fa-times-circle",  
												"fa-times-circle-o", "fa-tint", "fa-toggle-down", "fa-toggle-left", "fa-toggle-right", "fa-toggle-up",  
												"fa-trash-o", "fa-trophy", "fa-truck", "fa-umbrella", "fa-unlock", "fa-unlock-alt", "fa-unsorted", "fa-upload",  
												"fa-user", "fa-users", "fa-video-camera", "fa-volume-down", "fa-volume-off", "fa-volume-up", "fa-warning",  
												"fa-wheelchair", "fa-wrench"
												};
	
	public static void main(String[] args) {
		List<DevCategory> cates = new ArrayList<DevCategory>();
		for(int i =0 ; i<10; i++) {
			DevCategory cate = new DevCategory();
			cate.setId(i + "");
			cate.setTitle("cate" + i);
			if(i>0 && i%3==0) {
				int pid = new Random().nextInt(i);
				DevCategory parent = new DevCategory();
				parent.setId(pid + "");
				parent.setTitle("cate" + pid);
				cate.setParent(parent);
			}
			cates.add(cate);
		}
		
//		System.out.println(optionCateTreeBuild(cates, null, "", 0));
	}
}
