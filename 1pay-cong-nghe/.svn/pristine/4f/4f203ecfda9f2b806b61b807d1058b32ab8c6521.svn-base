package vn.onepay.merchant.product.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.merchant.product.model.ProductVerify;

public interface ProductVerifyDAO {
	static final String BEAN_NAME = "postAuditsDAO";
	
	public void save(ProductVerify productVerify);
	public ProductVerify loadProductVerify(String id);
	/*public ProductVerify getPostAudits(String appCode);*/
	
	public List<ProductVerify> findProductVerifies(String chargingType);
	
	public void delete(ProductVerify productVerify);
	
	public int 				findTotalProductVerifies	(String appCode, String chargingType, String version, int status, String bizzChannel, Date fromExpiredDate, Date toExpiredDate);
	public List<ProductVerify> findProductVerifies		(String appCode, String chargingType, String version, int status, String bizzChannel, Date fromExpiredDate, Date toExpiredDate, int limit, int offset);
	
}
