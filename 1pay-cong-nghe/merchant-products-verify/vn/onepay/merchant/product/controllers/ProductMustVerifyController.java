package vn.onepay.merchant.product.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.merchant.model.MerchantContract;
import vn.onepay.merchant.product.dao.MerchantProviderAllocationDAO;
import vn.onepay.merchant.product.model.MerchantProduct;
import vn.onepay.merchant.product.model.MerchantProviderAllocation;
import vn.onepay.merchant.product.model.SmsCommandCode;
import vn.onepay.merchant.service.MerchantProfileService;
import vn.onepay.service.ServiceFinder;
import vn.onepay.utils.Utils;

public class ProductMustVerifyController extends AbstractProductVerify {

	private int limit;
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	@Autowired protected MerchantProviderAllocationDAO merchantProviderAllocationDAO;
	
	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		try {
			Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
			boolean requiredManagerPermission = account.checkRole(Account.ACCOUNT_MERCHANT_MANAGER_ROLE) || // dealer
													(account.checkRole(Account.ACCOUNT_STAFF_ROLE) &&
															account.checkRole(
																	Account.ACCOUNT_OPERATION_MANAGER_ROLE, 
																	Account.ACCOUNT_BIZ_SUPPORTER_ROLE, 
																	Account.ACCOUNT_MERCHANT_MANAGER_ROLE
																	));
			model.put("isStaff", requiredManagerPermission);
			
			// map black list and white list sms provider
			try {
				List<MerchantProviderAllocation> merchantProviderAllocations = merchantProviderAllocationDAO.findMerchantProviderAllocations(null, null, MerchantProviderAllocation.STATUS_ON, null, 0, 0);
				if(merchantProviderAllocations != null && merchantProviderAllocations.size() > 0) {
					ModelMap smsBlackList = new ModelMap();
					ModelMap smsWhiteList = new ModelMap();
					for(MerchantProviderAllocation mpa : merchantProviderAllocations) {
						String merchant = mpa.getMerchant();
						if(mpa.getType().equalsIgnoreCase(MerchantProviderAllocation.TYPE_ACCEPT)) {
							@SuppressWarnings("unchecked")
							List<String> providers = (List<String>) smsWhiteList.get(merchant);
							if(providers == null) providers = new ArrayList<String>();
							
							providers.add(mpa.getProvider());
							smsWhiteList.put(merchant, providers);
						} else if(mpa.getType().equalsIgnoreCase(MerchantProviderAllocation.TYPE_REJECT)) {
							@SuppressWarnings("unchecked")
							List<String> providers = (List<String>) smsBlackList.get(merchant);
							if(providers == null) providers = new ArrayList<String>();
							
							providers.add(mpa.getProvider());
							smsBlackList.put(merchant, providers);
						}
					}
					
					model.put("smsBlackList", smsBlackList);
					model.put("smsWhiteList", smsWhiteList);
					
					for(String key : smsBlackList.keySet()) {
						System.out.println(smsBlackList.get(key));
					}
				}
			} catch (Exception e) {
			}
			
			List<String> restrictedMerchants 	= requiredManagerPermission ? findMyOwnMerchants(account):Arrays.asList(new String[]{account.getUsername()});
			List<String> merchants 				= null;
			String searchMerchant 				= StringUtils.trimToEmpty(request.getParameter("searchMerchant"));
			List<String> chargingTypes 			= null; 
			List<String> chargingStatuses		= null; 
			List<String> merchantAction 		= null; 
			List<String> staffAction 			= null;
			String productName 					= StringUtils.trimToEmpty(request.getParameter("pn"));
			
			if(requiredManagerPermission){
				if(restrictedMerchants!=null && restrictedMerchants.size() > 0){
					model.put("merchants", 	restrictedMerchants);
				}
			}
			
			try{
				String[] arrMerchants= request.getParameterValues("merchant");
				if(arrMerchants!=null && arrMerchants.length>0)
					merchants = Arrays.asList(arrMerchants);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			int offset = 0;
			if(StringUtils.isNumeric(request.getParameter("d-49520-p"))){
				offset = Integer.parseInt(request.getParameter("d-49520-p"));
				if(offset>0) {
					offset = (offset - 1) * limit;
				}
			}
			
			model.put("pagesize", limit);
			model.put("offset", offset);
			
			model.put("allServiceContent", smsCommandCodeDAO.getAllSMSServiceContent(account));
			model.put("allCharging", Arrays.asList(new String[] {SharedConstants.SMS_CHARGING_SERVICE_CODE, SharedConstants.IAC_CHARGING_SERVICE_CODE}));
			model.put("allChargingStatus", 	SharedConstants.ALL_CHARGING_STATUS);
			List<String> gameCodes = new ArrayList<String>();
			try {
				List<SmsCommandCode> unUsedCmd = smsCommandCodeDAO.findUnUsedSmsCommandCodes(smsCommandCodeDAO.getAllIACServiceNumbers(account), restrictedMerchants, Arrays.asList(new String[] {SmsCommandCode.APPROVED_STATUS}), -1, 0);
				if(unUsedCmd != null && unUsedCmd.size() > 0)
					for(SmsCommandCode smsCommandCode : unUsedCmd)
						gameCodes.add(smsCommandCode.getCommand_code());
				if(gameCodes.size() > 0)
					Collections.sort(gameCodes);
			} catch (Exception e) {
			}
			model.put("gameCodes", gameCodes);
			
			boolean haveProd = true;
			if(!requiredManagerPermission) {
				//Check is charging confirm
				MerchantContract merchantContract = (MerchantContract) request.getSession().getAttribute(SharedConstants.MERCHANT_CONTRACT_SESSION);
				try{
					if(merchantContract ==null){
						MerchantProfileService merchantProfileService = ServiceFinder.getContext(request).getBean(MerchantProfileService.BEAN_NAME,MerchantProfileService.class); 
						merchantContract = merchantProfileService.findMerchantContractByMerchant(account.getUsername());
						if(merchantContract!=null)
							request.getSession().setAttribute(SharedConstants.MERCHANT_CONTRACT_SESSION, merchantContract);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				Hashtable<String, Boolean> chargingConfirms = new Hashtable<String, Boolean>();
				for(String chargingType : SharedConstants.ALL_CHARGING_SERVICES) {
					chargingConfirms.put(chargingType.toLowerCase(), isHaveChargingConstract(request, account.getUsername(), chargingType));
				}
				model.put("chargingConfirms", chargingConfirms);
				
				haveProd = merchantProductDAO.findTotalMerchantProducts(account, restrictedMerchants, searchMerchant, merchants, chargingTypes, chargingStatuses, staffAction, merchantAction, productName, null, null, null) > 0;
			} else {
				//Chi hien thi san pham de nghi duyet
				merchantAction = Arrays.asList(new String[] {MerchantProduct.APPROVED_STATUS, MerchantProduct.PENDING_STATUS});
				//
				
				String[] merchantsTmp= request.getParameterValues("merchant");
				if(merchantsTmp!=null && merchantsTmp.length>0) {
					merchants = Arrays.asList(merchantsTmp);
				}
			}
			
			model.put("haveProd", haveProd);
			
			
			Date reportFromDay = getDate(request, "startDate");
			Date reportToDay = getDate(request, "endDate");
			final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			try {
				String[] dates = request.getParameter("reservation").split("-");
				reportFromDay = sdf.parse(dates[0].trim());
				reportToDay = sdf.parse(dates[1].trim());
			} catch (Exception e) {
			}
			Date fromTime 	= reportFromDay!=null?Utils.getStartOfDay(reportFromDay):null;
			Date toTime 	= reportToDay!=null?Utils.getEndOfDay(reportToDay):null;

			if("active".equalsIgnoreCase(request.getParameter("tab"))) {
				staffAction = Arrays.asList(new String[] {MerchantProduct.APPROVED_STATUS});
			} else if("inactive".equalsIgnoreCase(request.getParameter("tab"))) {
				staffAction = Arrays.asList(new String[] {MerchantProduct.PENDING_STATUS, MerchantProduct.INIT_STATUS, MerchantProduct.REJECT_STATUS});
			} else {
				String active = StringUtils.trimToEmpty(request.getParameter("a"));
				if(!StringUtils.isBlank(active)) {
					if("1".equals(active)) { // OFF
						if(requiredManagerPermission) {
							staffAction = Arrays.asList(new String[] {MerchantProduct.PENDING_STATUS, MerchantProduct.INIT_STATUS, MerchantProduct.REJECT_STATUS});
						} else {
							merchantAction = Arrays.asList(new String[] {MerchantProduct.INIT_STATUS});
						}
					} else if("2".equals(active)) {// ON
						if(requiredManagerPermission) {
							staffAction = Arrays.asList(new String[] {MerchantProduct.APPROVED_STATUS});
						} else {
							merchantAction = Arrays.asList(new String[] {MerchantProduct.PENDING_STATUS});
						}
					}
				}
			}
			
			String[] chargingTypesTmp = request.getParameterValues("ct");
			if(chargingTypesTmp != null && chargingTypesTmp.length > 0) {
				chargingTypes = new ArrayList<String>();
				for(String ct: chargingTypesTmp)
					if(ct.equalsIgnoreCase(SharedConstants.SMS_CHARGING_SERVICE_CODE)
							|| ct.equalsIgnoreCase(SharedConstants.IAC_CHARGING_SERVICE_CODE))
						chargingTypes.add(ct); 
			} else {
				chargingTypes = Arrays.asList(new String[] {SharedConstants.SMS_CHARGING_SERVICE_CODE, SharedConstants.IAC_CHARGING_SERVICE_CODE});
			}
			
			String[] chargingStatusesTmp = new String[] {MerchantProduct.APPROVED_STATUS};
			if(chargingStatusesTmp != null && chargingStatusesTmp.length > 0) {
				chargingStatuses = Arrays.asList(chargingStatusesTmp);
			}
			
			int total = merchantProductDAO.findTotalMerchantProducts(account, restrictedMerchants, searchMerchant, merchants, chargingTypes, chargingStatuses, staffAction, merchantAction, productName, null, fromTime, toTime);
			model.put("total", total);
			
			List<MerchantProduct> prods = merchantProductDAO.findMerchantProducts(account, restrictedMerchants, searchMerchant, merchants, chargingTypes, chargingStatuses, staffAction, merchantAction, productName, null, fromTime, toTime, offset, limit);
			if(prods!=null && prods.size()>0) {
				model.put("list", prods);
				
				model.put("statusTitle", SharedConstants.PRODUCT_CHARGING_STATUS_TITLE);
				
				Hashtable<String, String> chargingStatusIcon = new Hashtable<String, String>();
				for(MerchantProduct prod:prods) {
					chargingStatusIcon.put(SharedConstants.CARD_CHARGING_SERVICE_CODE.toLowerCase() + "_" + prod.getId(), getProductChargingStatusClass(prod.getCard_charging() != null ? prod.getCard_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.CARD_CHARGING_SERVICE_CODE.toLowerCase()));
					chargingStatusIcon.put(SharedConstants.SMS_CHARGING_SERVICE_CODE.toLowerCase() 	+ "_" + prod.getId(), getProductChargingStatusClass(prod.getSms_charging() != null ? prod.getSms_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.SMS_CHARGING_SERVICE_CODE.toLowerCase()));
					chargingStatusIcon.put(SharedConstants.WAP_CHARGING_SERVICE_CODE.toLowerCase() 	+ "_" + prod.getId(), getProductChargingStatusClass(prod.getWap_charging() != null ? prod.getWap_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.WAP_CHARGING_SERVICE_CODE.toLowerCase()));
					chargingStatusIcon.put(SharedConstants.IAC_CHARGING_SERVICE_CODE.toLowerCase() 	+ "_" + prod.getId(), getProductChargingStatusClass(prod.getIac_charging() != null ? prod.getIac_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.IAC_CHARGING_SERVICE_CODE.toLowerCase()));
					chargingStatusIcon.put(SharedConstants.BANK_CHARGING_SERVICE_CODE.toLowerCase() + "_" + prod.getId(), getProductChargingStatusClass(prod.getBank_charging() != null ? prod.getBank_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.BANK_CHARGING_SERVICE_CODE.toLowerCase()));
				}
				
				model.put("chargingStatusIcon", chargingStatusIcon);
			}

			try {
				// Count total in tabs
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView(getWebView(), "model", model);
	}

	private static SimpleDateFormat dtFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	private Date getDate(HttpServletRequest request, String name) {
		try {
			return dtFormat.parse(request.getParameter(name) + " 00:00:00");
		} catch (Exception e) {
		}
		return null;
	}
}
