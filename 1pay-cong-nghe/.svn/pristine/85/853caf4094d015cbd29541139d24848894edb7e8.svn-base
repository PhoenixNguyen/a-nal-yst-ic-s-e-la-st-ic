package vn.onepay.merchant.product.controllers;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.LinkedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.merchant.product.model.MerchantProduct;
import vn.onepay.merchant.product.model.ProductVerify;

public class ProductVerifyManagerController extends AbstractProductVerify {
	
	protected int limit;
	
	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		
		boolean requiredManagerPermission = account.checkRole(Account.ACCOUNT_MERCHANT_MANAGER_ROLE) || // dealer
				(account.checkRole(Account.ACCOUNT_STAFF_ROLE) &&
						account.checkRole(
								Account.ACCOUNT_OPERATION_MANAGER_ROLE, 
								Account.ACCOUNT_BIZ_SUPPORTER_ROLE, 
								Account.ACCOUNT_MERCHANT_MANAGER_ROLE
								));
		model.put("isStaff", requiredManagerPermission);
		if(!requiredManagerPermission) {
			return new ModelAndView("redirect:index.wss");
		}
		
		String pageRequest = StringUtils.trimToEmpty(request.getParameter("d-49520-p"));
		String productId = StringUtils.trimToEmpty(request.getParameter("pid"));
		String tab = StringUtils.trimToEmpty(request.getParameter("tab"));
		if(StringUtils.isBlank(tab))
			tab = SharedConstants.SMS_CHARGING_SERVICE_CODE;
		
		String chargingType = tab;
		
		int page = 0;
		if(StringUtils.isNotBlank(pageRequest) && StringUtils.isNumeric(pageRequest)){
			try{
				page = Integer.parseInt(pageRequest);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		int offset = 0;
		if(page > 0){
			offset = (page-1) * limit;
		}
		
		//prodVerifies
		MerchantProduct merchantProduct = null;
		if(!productId.equalsIgnoreCase("")){
			merchantProduct = productVerifyService.findMerchantProductById(productId);
		}
		model.put("merchantProduct", merchantProduct);
		
		List<ProductVerify> prodVerifies = null;
		int total = 0;
		Map<String , String> chargingStatus = new LinkedMap();
		
		if(merchantProduct != null){
			prodVerifies 	= productVerifyService.findProductVerifies		(merchantProduct.getApp_code(), chargingType, "", -1, "", null, null, limit, offset);
			total 			= productVerifyService.findTotalProductVerifies	(merchantProduct.getApp_code(), chargingType, "", -1, "", null, null);
			
			if(merchantProduct.getSms_charging() != null)
				chargingStatus.put(SharedConstants.SMS_CHARGING_SERVICE_CODE, merchantProduct.getSms_charging().getStatus());
			if(merchantProduct.getIac_charging() != null)
				chargingStatus.put(SharedConstants.IAC_CHARGING_SERVICE_CODE, merchantProduct.getIac_charging().getStatus());
			
		}
		model.put("chargingStatus", chargingStatus);
		
		model.put("pagesize", limit);
		model.put("total", total);
		model.put("offset", offset);
		
		model.put("list", prodVerifies);
		
		model.put("currVersion", "1."+generateVersion(merchantProduct.getApp_code(), chargingType));
		
		model.put("statusTitle", SharedConstants.PRODUCT_CHARGING_STATUS_TITLE);
		
		Hashtable<String, String> chargingStatusIcon = new Hashtable<String, String>();
		chargingStatusIcon.put(SharedConstants.CARD_CHARGING_SERVICE_CODE.toLowerCase() + "_" + merchantProduct.getId(), getProductChargingStatusClass(merchantProduct.getCard_charging() != null ? merchantProduct.getCard_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.CARD_CHARGING_SERVICE_CODE.toLowerCase()));
		chargingStatusIcon.put(SharedConstants.SMS_CHARGING_SERVICE_CODE.toLowerCase() 	+ "_" + merchantProduct.getId(), getProductChargingStatusClass(merchantProduct.getSms_charging() != null ? merchantProduct.getSms_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.SMS_CHARGING_SERVICE_CODE.toLowerCase()));
		chargingStatusIcon.put(SharedConstants.WAP_CHARGING_SERVICE_CODE.toLowerCase() 	+ "_" + merchantProduct.getId(), getProductChargingStatusClass(merchantProduct.getWap_charging() != null ? merchantProduct.getWap_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.WAP_CHARGING_SERVICE_CODE.toLowerCase()));
		chargingStatusIcon.put(SharedConstants.IAC_CHARGING_SERVICE_CODE.toLowerCase() 	+ "_" + merchantProduct.getId(), getProductChargingStatusClass(merchantProduct.getIac_charging() != null ? merchantProduct.getIac_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.IAC_CHARGING_SERVICE_CODE.toLowerCase()));
		chargingStatusIcon.put(SharedConstants.BANK_CHARGING_SERVICE_CODE.toLowerCase() + "_" + merchantProduct.getId(), getProductChargingStatusClass(merchantProduct.getBank_charging() != null ? merchantProduct.getBank_charging().getStatus() : MerchantProduct.INIT_STATUS, model, SharedConstants.BANK_CHARGING_SERVICE_CODE.toLowerCase()));
		model.put("chargingStatusIcon", chargingStatusIcon);
		
		return new ModelAndView(getWebView(), "model", model);
	}

}
