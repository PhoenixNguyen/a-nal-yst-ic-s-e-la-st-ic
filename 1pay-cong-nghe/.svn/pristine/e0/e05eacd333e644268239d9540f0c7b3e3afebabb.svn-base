package vn.onepay.cdr.filter.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import vn.onepay.service.AccountService;

public class InitInterceptor extends HandlerInterceptorAdapter {

	@Autowired private AccountService accountService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean blnLogined = accountService.checkLogin(request,response);
		if(!blnLogined) {
			String backUrl = request.getRequestURL().toString();
			String ver = request.getParameter("ver");
			if(StringUtils.isEmpty(ver)){
				ver = "vi";
				backUrl+= (backUrl.indexOf("?")!=-1?"&":"?");
				backUrl+=("ver="+ver);
			}
			response.sendRedirect(request.getContextPath() + "/login.html?back_url="+URLEncoder.encode(backUrl,"UTF-8")+"&ver="+URLEncoder.encode(ver,"UTF-8"));
		}
		return super.preHandle(request, response, handler);
	}
}
