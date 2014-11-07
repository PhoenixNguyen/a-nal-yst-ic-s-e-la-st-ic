package vn.onepay.account.management.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.web.tld.MyCustomTagLib;

public class ChangePermissisonController extends AbstractAccountManagementController{

	private int limit;
	public void setLimit(int limit)
	{
	    this.limit = limit;
	}
	
	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		boolean isManager = isManager(account);
		boolean isOperator = isOperator(account);
		
		List<String> restrictedMerchants 	= isManager ? merchantService.findMyOwnMerchants(account):Arrays.asList(new String[]{account.getUsername()});
		if(isManager){
			if(restrictedMerchants!=null && restrictedMerchants.size() > 0){
				model.put("merchants", 	restrictedMerchants);
			}
		}
		
		String searchMerchant = StringUtils.trimToEmpty(request.getParameter("searchMerchant"));
		
		@SuppressWarnings("unchecked")
		List<Account> allAccountList = (List<Account>) request.getSession().getAttribute(ALL_ACCOUNT_SESSION);
		if(allAccountList == null || allAccountList.size() == 0) {
			allAccountList = this.accountDAO.findAllAccount();
			if(allAccountList != null && allAccountList.size() > 0)
				request.getSession().setAttribute(ALL_ACCOUNT_SESSION, allAccountList);
		}
		
		List<String> allSues = new ArrayList<String>();
		for(String su : SharedConstants.DEPARTMENTS) {
			if(isOperator || (account.getTags() != null && Arrays.asList(account.getTags()).contains(su)))
					allSues.add(su);
		}
		
		model.put("allSues", allSues);
		
		List<Account> accountList = null;
		
		if(isOperator(account)) {
			accountList = allAccountList;
		} else {
			accountList = new ArrayList<Account>();
			for(Account acc : allAccountList)
				if(restrictedMerchants.contains(acc.getUsername()))
					accountList.add(acc);
		}
		
		// Truong hop nhieu merchant
		List<String> merchants 				= null;
		try{
			String[] arrMerchants= request.getParameterValues("merchants");
			if(arrMerchants!=null && arrMerchants.length>0)
				merchants = Arrays.asList(arrMerchants);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		List<String> sues = null;
		try{
			String[] arrSues= request.getParameterValues("su");
			if(arrSues!=null && arrSues.length>0)
				sues = Arrays.asList(arrSues);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		List<Account> returnList = new ArrayList<Account>();
		int page = paramToInt(request.getParameter("d-49520-p"));
		
		//Get all permission filter
		List<String> permissionRequest = new ArrayList<String>(); 
		permissionRequest.addAll(getPermisisonRequest(request, response));
		
		List<Integer> stepList = new ArrayList<Integer>();
		stepList.add(0);
		stepList.add(3);
		stepList.add(6);
		stepList.add(9);
		
		// Search theo ten merchant
		if(!StringUtils.isBlank(searchMerchant)){
			if(accountList != null && accountList.size() > 0)
				for(Account acc : accountList){
					if(acc.getUsername().toLowerCase().indexOf(searchMerchant.toLowerCase()) != -1){
						addResultList(returnList, permissionRequest, acc);
					}
				}
		} else if(merchants!= null && merchants.size() > 0) {
				if(accountList != null && accountList.size() > 0)
					for(Account acc : accountList){
						if(merchants.contains(acc.getUsername())){
							addResultList(returnList, permissionRequest, acc);
						}
					}
		} else if(permissionRequest.size() > 0)
				for(Account acc : accountList){
					addResultList(returnList, permissionRequest, acc);
				}
		else{
				returnList.addAll(accountList);
		}
		
		if(sues != null && sues.size() > 0) {
			int i = returnList.size() - 1;
			while(i > -1) {
				Account acc = returnList.get(i);
				String su = MyCustomTagLib.getDepartmentOfMerchant(acc.getUsername());
				if(StringUtils.isBlank(su) 
						&& acc.getTags() != null && acc.getTags().length > 0)
					su = acc.getTags()[0];
				
				if(!sues.contains(su))
					returnList.remove(acc);
				i--;
			}
		}
		
		//sort returnList
		Collections.sort(returnList, new Comparator<Account>() {

			@Override
			public int compare(Account o1, Account o2) {
				return o2.getCreated_time().compareTo(o1.getCreated_time());
			}
		});
		
		List<String> ownerList = getMerchantManagerList(account);
		ModelMap mapDeptAccountManager = new ModelMap();
		@SuppressWarnings("unchecked")
		List<Account> managers = (List<Account>) request.getSession().getAttribute(ACCOUNT_MANAGER_SESSION);
		if(managers == null || managers.size() == 0) {
			managers = accountDAO.findByRole(Account.ACCOUNT_MERCHANT_MANAGER_ROLE);
			if(managers != null && managers.size() > 0)
				request.getSession().setAttribute(ACCOUNT_MANAGER_SESSION, managers);
		}
				
		if(managers != null)
			for(Account acc : managers) {
				mapDeptAccountManager.put(acc.getUsername(), acc.getTags());
			}
		model.put("mapDeptAccountManager", mapDeptAccountManager);
		
		model.put("listAccount", returnList);
		model.put("pageSize", Integer.valueOf(this.limit));
		model.put("size", returnList.size());
		model.put("ownerList", ownerList);
		model.put("roleMap", rolesMap(account));
		model.put("stepList", stepList);
		model.put("allPermissions", permissionRequest);
		
		if(page <= 0) page = 1;
		model.put("offset", limit * (page-1));
		
		return new ModelAndView(getWebView(), "model", model);
		
	}
	
	private void addResultList(List<Account> resultList, List<String> permissionRequest, Account account){
		//Check permission filter
		/*int containTotal = 0;
		for(String permission : permissionRequest){
			if(Arrays.asList(account.getRoles()).contains(permission)){
				containTotal ++;
			}
		}
		
		//if permission filter total equals permisison contain total
		if(permissionRequest.size() == containTotal){
			resultList.add(account);
		}*/
		
		for(String permission : permissionRequest){
			if(account.getRoles() != null && Arrays.asList(account.getRoles()).contains(permission)){
				resultList.add(account);
				break;
			}
		}
	}
		
}
