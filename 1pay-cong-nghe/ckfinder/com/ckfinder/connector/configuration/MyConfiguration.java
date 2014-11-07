package com.ckfinder.connector.configuration;

import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.dev.dao.DevCategoryDAO;
import vn.onepay.dev.model.DevCategory;
import vn.onepay.service.ServiceFinder;

public class MyConfiguration extends Configuration {

	public MyConfiguration(ServletConfig servletConfig) {
		super(servletConfig);
	}

	@Override
	protected Configuration createConfigurationInstance() {
		return new MyConfiguration(this.servletConf);
	}
	
	@Override
	public boolean checkAuthentication(HttpServletRequest request) {
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
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
					DevCategoryDAO devCategoryDAO = ServiceFinder.getContext(request).getBean(DevCategoryDAO.BEAN_NAME, DevCategoryDAO.class);
					
					DevCategory cate = devCategoryDAO.findDevCategoryById(cid);
					if(cate != null && cate.getParent()!=null && supportCateId.equals(cate.getParent().getId())) {
						isDevManager = true;	
					}
				}
			}
		}
		
		return isDevManager;
	}
}
