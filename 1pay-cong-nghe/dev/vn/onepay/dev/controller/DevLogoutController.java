package vn.onepay.dev.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.common.SharedConstants;
import vn.onepay.utils.CookieUtil;

public class DevLogoutController extends DevAbstractController {

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		CookieUtil.removeCookie(response, SharedConstants.AUTH_COOKIE_TICKET_NAME);
		try {
			HttpSession session = request.getSession();
			Enumeration<?> attrNames = session.getAttributeNames();
			while(attrNames.hasMoreElements()) {
				session.removeAttribute((String) attrNames.nextElement());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		request.getSession().invalidate();
		return new ModelAndView("redirect:https://id.1pay.vn/logout?service=http://dev.1pay.vn");
	}
}
