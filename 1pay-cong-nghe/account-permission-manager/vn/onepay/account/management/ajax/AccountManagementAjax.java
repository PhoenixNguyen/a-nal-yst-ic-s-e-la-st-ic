package vn.onepay.account.management.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.management.controller.AbstractAccountManagementController;
import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.utils.Utils;

public class AccountManagementAjax extends AbstractAccountManagementController{
	
	private static final Logger logger = Logger.getLogger(AccountManagementAjax.class);
	
	// operator biz support manager=> thay doi mail, phone , pass
	// operator => change role, phan bo merchant
	// phan bo merchant: opearator + merchant_manager; 
	// + operator phan bo cho merchant_manager root
	// + merchant_manager phan bo cho merchant_manager cap duoi gan nhat
	// merchant la truong su: ko co owner va la merchant_manager
	// SHareConstant.DEPARTMENT => SU
	
	private enum Action{
		SET_OWNER, GET_ROLES, ADD_PERMISSIONS, RESET_PASSWORD
	}
	
	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		boolean isOperator = isOperator(account);
		boolean isManager = isManager(account);
		
		String action = request.getParameter("action");
		
		if(action != null && action.compareTo("") != 0){
			Action ac = Action.valueOf(action);
			switch(ac){
			case SET_OWNER:
				if(!isOperator) {
					permissionDenied(response);
					return null;
				}
				changeOwner(request, response, account);
				break;
			case GET_ROLES:
				getRoles(request, response);
				break;
			case ADD_PERMISSIONS:
				if(!isManager) {
					permissionDenied(response);
					return null;
				}
				addPermissions(request, response, account);
				break;
			case RESET_PASSWORD:
				if(!isOperator) {
					permissionDenied(response);
					return null;
				}
				resetPassword(request, response, account);
				break;	
			}
		}
		
		return null;
	}
	
	private void permissionDenied(HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		response.getOutputStream().write("-1".getBytes());
	}
	
	private void changeOwner(HttpServletRequest request,
			HttpServletResponse response, Account account) throws Exception{
		String username = request.getParameter("user_name");
		String ownername = request.getParameter("owner_name");
		
		System.out.println(username);
		System.out.println(ownername);
		
		List<String> ownerList = getMerchantManagerList(account);
		
		boolean status = false;
		String oldOwner = null;
		if(!StringUtils.isBlank(username)
				&& !StringUtils.isBlank(ownername)
				&& ownerList != null && ownerList.size() > 0
				&& ownerList.contains(ownername)){
			
			Account acc = this.accountDAO.find(username);
			if(acc != null) {
				oldOwner = acc.getOwner();
				acc.setOwner(ownername);
				status = this.accountDAO.update(acc);
			}
			
		}
		
		response.setContentType("text/html");
		if(status) {
			response.getOutputStream().write("1".getBytes());
			clearSession(request);
		} else
			response.getOutputStream().write("0".getBytes());
		
		logger.info(account.getUsername() + " change owner of " + username + " from " + oldOwner +" to " + ownername);
	}
	
	private void getRoles(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String username = request.getParameter("user_name");
		
		System.out.println(username);
		
		if(username != null && username.compareTo("") != 0){
			Account account = accountDAO.find(username);
			String[] roles = account.getRoles();
			
			String str = "";
			for(int i = 0; i < roles.length; i++){
				str += roles[i] + ",";
			}
			
			response.setContentType("text/html");
			response.getOutputStream().write(str.getBytes());
		}
	}
	
	private void addPermissions(HttpServletRequest request,
			HttpServletResponse response, Account accountLogined) throws Exception{
		
		boolean isOperator = isOperator(accountLogined);
		
		String username = request.getParameter("user_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		System.out.println(username + " :USER");
		
		List<String> arr = new ArrayList<String>(); 
		arr.addAll(getPermisisonRequest(request, response));
		System.out.println(arr.toString());
		
		String list[] = {};
		for(int i = 0; i < arr.size(); i ++){
			list = append(list, arr.get(i));
		}
		
		System.out.println(Arrays.toString(list));
		boolean status = false;
		if(username != null && username.compareTo("") != 0){
			System.out.println(username + " -----");
			Account account = this.accountDAO.find(username);
			account.setRoles(list);
			
			if(isOperator){
				
				if(Utils.validateEmail(email) && accountDAO.findByEmail(email) == null)
					
					account.setEmail(email);
				
				String phoneNumber = Utils.getFormatedMsisdn(StringUtils.trimToEmpty(phone.replaceAll("\\D+", "")));
				if(Utils.findMobileOperator(phoneNumber) != null && accountDAO.findByPhone(phoneNumber) == null)
					account.setPhone(phoneNumber);
			}
			
			account.setUpdated_time(new Date());
			if(this.accountDAO.update(account)){
				status = true;
				System.out.println(username);
			}
		}
		
		response.setContentType("text/html");
		if(status) {
			response.getOutputStream().write("1".getBytes());
			clearSession(request);
		} else
			response.getOutputStream().write("0".getBytes());
		
		logger.info(accountLogined.getUsername() + " add permission for " + username + " roles " + list 
				+ (isOperator(accountLogined)?(" and change info email=" + email + ", phone=" + phone):""));
	}
	
	private void resetPassword(HttpServletRequest request,
			HttpServletResponse response, Account accountLogined) throws Exception{
		String username = request.getParameter("user_name");
		String pw = request.getParameter("pw");
		
		System.out.println(username);
		System.out.println(pw);
		
		boolean status = false;
		if(username != null && username.compareTo("") != 0 && pw != null && pw.compareTo("") != 0 && pw.length() >= 6){
			try {
			   Account account=accountDAO.find(username);
			   if(account!=null){
			    String hashedPassword = Utils.getAccountHashedPassword(StringUtils.trimToEmpty(pw), account.getSalt());
			    accountDAO.update(account.getUsername(), "raw_password", pw);
			    accountDAO.update(account.getUsername(), "password", hashedPassword);
			    
			    status = true;
			   }
			  } catch (Exception e) {
			   e.printStackTrace();
			   
			  }
		}
		
		response.setContentType("text/html");
		if(status) {
			response.getOutputStream().write("1".getBytes());
			clearSession(request);
		} else
			response.getOutputStream().write("0".getBytes());
		
		logger.info(accountLogined.getUsername() + " reset password of " + username);
	}
	
}
