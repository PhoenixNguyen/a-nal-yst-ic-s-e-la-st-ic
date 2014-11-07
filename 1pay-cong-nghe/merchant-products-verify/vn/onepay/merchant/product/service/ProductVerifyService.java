package vn.onepay.merchant.product.service;

import java.util.Date;
import java.util.List;

import vn.onepay.merchant.product.model.MerchantProduct;
import vn.onepay.merchant.product.model.ProductVerify;

public interface ProductVerifyService {
	static final String BEAN_NAME = "productVerifyService";
	
	public void save(ProductVerify productVerify);
	public ProductVerify loadProductVerify(String id);
	/*public ProductVerify getPostAudits(String appCode);*/
	
	public List<ProductVerify> findProductVerifies(String chargingType);
	
	public void delete(ProductVerify productVerify);
	
	public int 				findTotalProductVerifies	(String appCode, String chargingType, String version, int status, String bizzChannel, Date fromExpiredDate, Date toExpiredDate);
	public List<ProductVerify> findProductVerifies		(String appCode, String chargingType, String version, int status, String bizzChannel, Date fromExpiredDate, Date toExpiredDate, int limit, int offset);
	
	//Products
	MerchantProduct findMerchantProductById(String id);
	MerchantProduct findMerchantProductByCode(String productCode);
	MerchantProduct findMerchantProductByAccessKey(String accessKey);
	MerchantProduct findMerchantProductBySMSConfig(String smsServiceId, String smsCommandCode);
	MerchantProduct findMerchantProductByIACGameCode(String gameCode);
}
