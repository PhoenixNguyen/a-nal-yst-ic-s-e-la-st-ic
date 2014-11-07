package vn.onepay.dev.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;

public class CkfinderController extends DevAbstractController {

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		
		boolean isDevManager = isDevManager(request, account);
		model.put("isDevManager", isDevManager);
		if(!isDevManager)
			return new ModelAndView("redirect:/");
		
		return new ModelAndView(getWebView(), "model", model);
	}

}
