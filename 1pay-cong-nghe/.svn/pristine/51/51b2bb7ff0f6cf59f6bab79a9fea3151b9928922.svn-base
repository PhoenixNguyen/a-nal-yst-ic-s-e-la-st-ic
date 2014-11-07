package vn.onepay.cdr.filter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.onepay.cdr.filter.service.CdrFilterService;
import vn.onepay.dao.service.BaseService;
import vn.onepay.merchant.product.dao.SmsCommandCodeDAO;
import vn.onepay.service.CommonService;
import vn.onepay.service.HttpService;
import vn.onepay.service.MerchantService;

@Controller
public abstract class AbstractController {
	@Autowired protected CommonService commonService;
	@Autowired protected MerchantService merchantService;
	@Autowired protected BaseService baseService;
	@Autowired protected CdrFilterService cdrFilterService;
	@Autowired protected HttpService httpService;
	@Autowired protected SmsCommandCodeDAO smsCommandCodeDAO;
	
	private static final String CURR_URL_SESSION = "CURR_URL";
	private static final String CURR_POST_URL_SESSION = "CURR_POST_URL";
	
	@ModelAttribute(CURR_URL_SESSION)
	public String getCurrUrl(HttpServletRequest request, HttpServletResponse response) {
		return httpService.getCurrentUrl(request);
	}
	
	@ModelAttribute(CURR_POST_URL_SESSION)
	public String getCurrPostUrl(HttpServletRequest request, HttpServletResponse response) {
		return httpService.getCurrentPostUrl(request);
	}
}
