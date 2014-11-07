package vn.onepay.dev.api;

import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.dev.controller.DevAbstractController;
import vn.onepay.dev.model.DevArticle;
import vn.onepay.dev.model.DevCategory;

public class DevApiAjax extends DevAbstractController {

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		
		boolean isDevManager = isDevManager(request, account);
		
		if(!isDevManager) {
			response.getOutputStream().write("Bạn không có quyền thực hiện".getBytes());
			return null;
		}
			
		String action = StringUtils.trimToEmpty(request.getParameter("a"));
		
		try {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			
			if("update_cate".equalsIgnoreCase(action)) {
				updateCate(account, request, response);
			} else if("update_art".equalsIgnoreCase(action)) {
				updateArt(account, request, response);
			}
			
		} catch (Exception e) {
			response.getOutputStream().write(e.getMessage().getBytes());
		}
		
		return null;
	}

	private void updateCate(Account account, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Date now = new Date();
		DevCategory cate = null;
		
		String cateId 			= StringUtils.trimToEmpty(request.getParameter("cid"));
		if(StringUtils.isBlank(cateId)) {// Create new Cate
			cate = new DevCategory();
			cate.setCreated_time(now);
			cate.setUpdated_time(now);
			cate.setCreated_by(account.getUsername());
			cate.setUpdated_by(account.getUsername());
		} else { // Update Cate
			cate = devCategoryDAO.findDevCategoryById(cateId);
			
			if(cate == null)
				throw new Exception("Không tồn tại chuyên mục.");
			
			cate.setUpdated_time(now);
			cate.setUpdated_by(account.getUsername());
		}
		
		String title 			= StringUtils.trimToEmpty(request.getParameter("title"));
		String icon 			= StringUtils.trimToEmpty(request.getParameter("icon"));
		String categoryType 	= StringUtils.trimToEmpty(request.getParameter("categoryType"));
		String pid 				= StringUtils.trimToEmpty(request.getParameter("pid"));
		String status 			= StringUtils.trimToEmpty(request.getParameter("status"));
		String order 			= StringUtils.trimToEmpty(request.getParameter("order"));
		String description 		= StringUtils.trimToEmpty(request.getParameter("description"));
		String url		 		= StringUtils.trimToEmpty(request.getParameter("url"));

		//Validator
		if(StringUtils.isBlank(title))
			throw new Exception("Tên chuyên mục không được bỏ trống.");
		if(StringUtils.isBlank(categoryType) || !Arrays.asList(DevCategory.ALL_CATEGORY_TYPE).contains(categoryType))
			throw new Exception("Loại chuyên mục không hợp lệ.");
		if(StringUtils.isBlank(status) || !Arrays.asList(DevCategory.ALL_STATUS).contains(status))
			throw new Exception("Trạng thái chuyên mục không hợp lệ.");
		if(StringUtils.isBlank(order) || !StringUtils.isNumeric(order))
			throw new Exception("Thứ tự hiển thị không hợp lệ.");
		DevCategory parent = null;
		if(!StringUtils.isBlank(pid)) {
			parent = devCategoryDAO.findDevCategoryById(pid);
			if(parent == null || pid.equals(cate.getId()))
				throw new Exception("Chuyên mục cha không hợp lệ.");
			
			DevCategory _parent = parent.getParent();
			while(_parent!=null) {
				if(_parent.getId().equals(cate.getId()))
					throw new Exception("Chuyên mục cha không hợp lệ.");
				
				_parent = _parent.getParent();
			}
		}

		cate.setTitle(title);
		cate.setCategory_type(categoryType);
		cate.setStatus(status);
		cate.setOrder(Integer.parseInt(order));
		cate.setDescription(description);
		cate.setUrl(url);
		cate.setIcon(icon);
		cate.setParent(parent);
		
		devCategoryDAO.save(cate);
		
		// save or update ok
		response.getOutputStream().write("1".getBytes());
	}
	private void updateArt(Account account, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Date now = new Date();
		DevArticle art = null;
		
		String artId = StringUtils.trimToEmpty(request.getParameter("id"));
		if(StringUtils.isBlank(artId)) { // Add New
			art = new DevArticle();
			art.setCreated_by(account.getUsername());
			art.setUpdated_by(account.getUsername());
			art.setCreated_time(now);
			art.setUpdated_time(now);
		} else {
			art = devArticleDAO.findDevArticleById(artId);
			
			if(art == null)
				throw new Exception("Không tồn tại bài viết.");
			
			art.setUpdated_by(account.getUsername());
			art.setUpdated_time(now);

		}
		
		String title 			= StringUtils.trimToEmpty(request.getParameter("title"));
		String cid 				= StringUtils.trimToEmpty(request.getParameter("sid"));
		if(StringUtils.isBlank(cid))
			cid 				= StringUtils.trimToEmpty(request.getParameter("cid"));
		String status 			= StringUtils.trimToEmpty(request.getParameter("status"));
		String order 			= StringUtils.trimToEmpty(request.getParameter("order"));
		String description 		= StringUtils.trimToEmpty(request.getParameter("description"));
		String content	 		= StringUtils.trimToEmpty(request.getParameter("content"));
		String intro	 		= StringUtils.trimToEmpty(request.getParameter("intro"));
		String tags		 		= StringUtils.trimToEmpty(request.getParameter("tags"));
		String author	 		= StringUtils.trimToEmpty(request.getParameter("author"));
		String avatar	 		= StringUtils.trimToEmpty(request.getParameter("avatar"));

		//Validator
		DevCategory cate = devCategoryDAO.findDevCategoryById(cid);
		if(cate == null)
			throw new Exception("Chuyên mục không hợp lệ.");
		if(StringUtils.isBlank(title))
			throw new Exception("Tiêu đề bài viết không được bỏ trống.");
		if(StringUtils.isBlank(status) || !Arrays.asList(DevArticle.ALL_STATUS).contains(status))
			throw new Exception("Trạng thái bài viết không hợp lệ.");
		if(StringUtils.isBlank(order) || !StringUtils.isNumeric(order))
			throw new Exception("Thứ tự hiển thị không hợp lệ.");
				
		art.setTitle(title);
		art.setDescription(description);
		art.setAuthor(StringUtils.isBlank(author) ? account.getUsername() : author);
		art.setDev_category(cate);
		art.setStatus(status);
		art.setOrder(Integer.parseInt(order));
		art.setIs_intro("1".equals(intro));
		art.setContent(content);
		if(!StringUtils.isBlank(tags)) {
			String[] myTags = tags.split(",");
			for(String tag : myTags) tag = tag.trim();
			art.setTags(myTags);
		}
		art.setAvatar(avatar);
		
		devArticleDAO.save(art);
		
		// save or update ok
		response.getOutputStream().write("1".getBytes());
	}
}
