package vn.onepay.template.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.onepay.template.model.EmailTemplate;
import vn.onepay.template.controllers.AbstractController;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

public class EmailTemplateController extends AbstractController {
	private int limit;
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		// Danh sách chủ đề
		List<String> allsubject= Arrays.asList(new String[]{"chủ đề 1","chủ đề 2","chủ đề 3"});	
		model.put("allsubject", allsubject);
		
		// sắp xếp template theo tên abc
		List<EmailTemplate> EmailTemplates = new ArrayList<EmailTemplate>();
		Collections.sort(EmailTemplates, new Comparator<EmailTemplate>() {
	        @Override
	        public int compare(EmailTemplate temp1, EmailTemplate temp2) {
	            return (temp1.getTitle().compareTo(temp2.getTitle()));
	            // Muốn đảo danh sách các bạn đối thành
	            //return (dic2.hoTen.compareTo(dic1.hoTen));
	        }
	    });

		
		String filtertemplate = StringUtils.trimToEmpty(request.getParameter("filtertemplate"));
		String filtersubject = StringUtils.trimToEmpty(request.getParameter("filtersubject"));	
		String filterstatus = StringUtils.trimToEmpty(request.getParameter("filterstatus"));
		
		EmailTemplates 	= emailTempDAO.findEmailTemplates		(filtertemplate,"", filtersubject, filterstatus, 0, 0);
		
		
		//Phân trang
		int page = 100;
		if (page <= 0) page = 1;
		int offset = limit * (page - 1);
		model.put("offset", offset);
	
		int total = 0;
		
		total 			= emailTempDAO.findTotalEmailTemplates	(filtertemplate,"", filtersubject, filterstatus);


		
		model.put("EmailTemplates", EmailTemplates);
		model.put("pageSize", 	limit);
		model.put("size", 		total);		
		
		return new ModelAndView(getWebView(), "model", model);
	}	
	
}







