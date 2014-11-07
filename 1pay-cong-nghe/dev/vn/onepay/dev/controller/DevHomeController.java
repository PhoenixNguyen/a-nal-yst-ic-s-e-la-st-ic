package vn.onepay.dev.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.dev.model.DevArticle;
import vn.onepay.dev.model.DevCategory;
import vn.onepay.utils.AES;

public class DevHomeController extends DevAbstractController {

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)
			throws Exception {
		
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		if(account != null && account.isMerchant()) {
			String key = "1pay1pay1pay1pay";// key must be 16 characters
			model.put("merchantEncode", AES.encrypt(key.getBytes("UTF-8"), account.getUsername()));
		}
		
		boolean isDevManager = isDevManager(request, account);
		model.put("isDevManager", isDevManager);
		List<DevCategory> allCates = getAllDevCategory(isDevManager, new String[] {DevCategory.CATEGORY_TYPE_NORMAL});
		model.put("allCates", allCates);
		model.put("cateOptions", optionCateTreeBuild(allCates, null, "", 0));
		
		String cid = StringUtils.trimToEmpty(request.getParameter("sid"));
		if(StringUtils.isBlank(cid))
			cid = StringUtils.trimToEmpty(request.getParameter("cid"));
		
		String aid = StringUtils.trimToEmpty(request.getParameter("id"));
		if(!StringUtils.isBlank(aid)) {
			DevArticle art = devArticleDAO.findDevArticleById(aid);
			if(art != null 
					&& art.getDev_category() != null
					&& cid.equalsIgnoreCase(art.getDev_category().getId()))
				model.put("art", art);
		}
		
		if(!StringUtils.isBlank(cid)) {
			DevCategory devCategory = devCategoryDAO.findDevCategoryById(cid);
			if(devCategory != null) {
				List<DevCategory> devCategories = new ArrayList<DevCategory>();
				devCategories.add(devCategory);
				devCategories.addAll(getChildsOfDevCategory(isDevManager, devCategory, new String[] {DevCategory.CATEGORY_TYPE_NORMAL}));
				
				List<DevArticle> arts = devArticleDAO.findDevArticles(devCategories, null, Arrays.asList(isDevManager ?
																		DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}), 0, -1);
				
				if(arts != null && arts.size() > 0)
					model.put("arts", arts);
			}
		}
		
		return new ModelAndView(getWebView(), "model", model);
	}
}
