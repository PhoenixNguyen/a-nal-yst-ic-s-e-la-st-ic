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

public class DevSupportController extends DevAbstractController {

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);		
		boolean isDevManager = isDevManager(request, account);
		model.put("isDevManager", isDevManager);
		List<DevCategory> allCates = getAllDevCategory(isDevManager, new String[] {DevCategory.CATEGORY_TYPE_POPULATION});
		if(allCates != null && allCates.size() > 0) {
			model.put("allCates", isDevManager? allCates : allCates.get(0).getChilds());
			model.put("cateOptions", optionCateTreeBuild(allCates, null, "", 0));
		}
		
		String cid = StringUtils.trimToEmpty(request.getParameter("sid"));
		if(StringUtils.isBlank(cid))
			cid = StringUtils.trimToEmpty(request.getParameter("cid"));
		
		String aid = StringUtils.trimToEmpty(request.getParameter("id"));
		String keyword = StringUtils.trimToEmpty(request.getParameter("s"));
		
		if(!StringUtils.isBlank(keyword)) {
			int offset = 0;
			int limit = 10;
			if(StringUtils.isNumeric(request.getParameter("d-49520-p"))){
				offset = Integer.parseInt(request.getParameter("d-49520-p"));
				if(offset>0) {
					offset = (offset - 1) * limit;
				}
			}
			
			int total = devArticleDAO.findTotalDevArticles((allCates != null && allCates.size() > 0)? allCates.get(0).getChilds() : null, keyword, Arrays.asList(isDevManager ?
					DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}));
			model.put("pagesize", limit);
			model.put("offset", offset);
			model.put("total", total);
			
			List<DevArticle> searchArts = devArticleDAO.findDevArticles((allCates != null && allCates.size() > 0)? allCates.get(0).getChilds() : null, keyword, Arrays.asList(isDevManager ?
					DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}), offset, limit);

			if(searchArts != null && searchArts.size() > 0)
				model.put("list", searchArts);
		} else if(!StringUtils.isBlank(aid)) {
			DevArticle art = devArticleDAO.findDevArticleById(aid);
			if(art != null 
					&& art.getDev_category() != null
					&& cid.equalsIgnoreCase(art.getDev_category().getId()))
				model.put("art", art);
			
			List<DevCategory> devCategories = new ArrayList<DevCategory>();
			devCategories.add(art.getDev_category());
			devCategories.addAll(getChildsOfDevCategory(isDevManager, art.getDev_category(), new String[] {DevCategory.CATEGORY_TYPE_POPULATION}));
			
			List<DevArticle> relateArts = devArticleDAO.findDevArticles(devCategories, null, Arrays.asList(isDevManager ?
					DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}), 0, 7);
			for(DevArticle relateArt : relateArts)
				if(relateArt.getId().equalsIgnoreCase(aid)) {
					relateArts.remove(relateArt);
					break;
				}
			model.put("cate_relate", relateArts);
		} else {
			if(!StringUtils.isBlank(cid) && !"53f6c5cde4b017afe69b1ceb".equals(cid)) {
				DevCategory devCategory = devCategoryDAO.findDevCategoryById(cid);
				if(devCategory != null) {
					int offset = 0;
					int limit = 10;
					if(StringUtils.isNumeric(request.getParameter("d-49520-p"))){
						offset = Integer.parseInt(request.getParameter("d-49520-p"));
						if(offset>0) {
							offset = (offset - 1) * limit;
						}
					}
					
					List<DevCategory> devCategories = new ArrayList<DevCategory>();
					devCategories.add(devCategory);
					devCategories.addAll(getChildsOfDevCategory(isDevManager, devCategory, new String[] {DevCategory.CATEGORY_TYPE_POPULATION}));
					
					int total = devArticleDAO.findTotalDevArticles(devCategories, null, Arrays.asList(isDevManager ?
							DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}));
					
					model.put("pagesize", limit);
					model.put("offset", offset);
					model.put("total", total);
					
					List<DevArticle> arts = devArticleDAO.findDevArticles(devCategories, null, Arrays.asList(isDevManager ?
							DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}), offset, limit);
					
					if(arts != null && arts.size() > 0)
						model.put("list", arts);
				}
			} else if(allCates != null && allCates.size() > 0
					&& allCates.get(0).getChilds() != null && allCates.get(0).getChilds().size() > 0) {
				List<DevArticle> relateArts = new ArrayList<DevArticle>();
				for(DevCategory devCategory : allCates.get(0).getChilds()) {
					List<DevCategory> devCategories = new ArrayList<DevCategory>();
					devCategories.add(devCategory);
					devCategories.addAll(getChildsOfDevCategory(isDevManager, devCategory, new String[] {DevCategory.CATEGORY_TYPE_POPULATION}));
					
					List<DevArticle> arts = devArticleDAO.findDevArticles(devCategories, null, Arrays.asList(isDevManager ?
							DevArticle.ALL_ADMIN_STATUS : new String[] {DevArticle.STATUS_PUBLISH}), 0, 6);
					
					if(arts != null && arts.size() > 0) {
						model.put("cate_" + devCategory.getId(), arts);
						
						if(relateArts.size() < 10)
							relateArts.addAll(arts);
					}
				}
				model.put("cate_relate", relateArts);
			}
		}
		
		return new ModelAndView(getWebView(), "model", model);
	}

}
