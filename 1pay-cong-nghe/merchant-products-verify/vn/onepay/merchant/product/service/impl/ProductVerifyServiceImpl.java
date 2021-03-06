package vn.onepay.merchant.product.service.impl;

import java.util.Date;
import java.util.List;

import vn.onepay.merchant.product.dao.MerchantProductDAO;
import vn.onepay.merchant.product.dao.ProductVerifyDAO;
import vn.onepay.merchant.product.model.MerchantProduct;
import vn.onepay.merchant.product.model.ProductVerify;
import vn.onepay.merchant.product.service.ProductVerifyService;

public class ProductVerifyServiceImpl implements ProductVerifyService {

	private MerchantProductDAO merchantProductDAO;
	public void setMerchantProductDAO(MerchantProductDAO merchantProductDAO) {
		this.merchantProductDAO = merchantProductDAO;
	}
	
	private ProductVerifyDAO productVerifyDAO;
	public void setProductVerifyDAO(ProductVerifyDAO productVerifyDAO) {
		this.productVerifyDAO = productVerifyDAO;
	}
	
	@Override
	public void save(ProductVerify productVerifiy) {
		productVerifyDAO.save(productVerifiy);
	}

	@Override
	public ProductVerify loadProductVerify(String id) {
		return productVerifyDAO.loadProductVerify(id);
	}

	/*@Override
	public ProductVerify getPostAudits(String appCode) {
		return productVerifyDAO.getPostAudits(appCode);
	}*/

	@Override
	public List<ProductVerify> findProductVerifies(String chargingType) {
		return productVerifyDAO.findProductVerifies(chargingType);
	}

	@Override
	public void delete(ProductVerify productVerify) {
		productVerifyDAO.delete(productVerify);
	}

	@Override
	public int findTotalProductVerifies(String appCode, String chargingType, String version,
			int status, String bizzChannel, Date fromExpiredDate,
			Date toExpiredDate) {
		return productVerifyDAO.findTotalProductVerifies(appCode, chargingType, version, status, bizzChannel, fromExpiredDate, toExpiredDate);
	}

	@Override
	public List<ProductVerify> findProductVerifies(String appCode, String chargingType, String version,
			int status, String bizzChannel, Date fromExpiredDate,
			Date toExpiredDate, int limit, int offset) {
		return productVerifyDAO.findProductVerifies(appCode, chargingType, version, status, bizzChannel, fromExpiredDate, toExpiredDate, limit, offset);
	}

	@Override
	public MerchantProduct findMerchantProductById(String id) {
		return merchantProductDAO.findMerchantProductById(id);
	}

	@Override
	public MerchantProduct findMerchantProductByCode(String productCode) {
		return merchantProductDAO.findMerchantProductByCode(productCode);
	}

	@Override
	public MerchantProduct findMerchantProductByAccessKey(String accessKey) {
		return merchantProductDAO.findMerchantProductByAccessKey(accessKey);
	}

	@Override
	public MerchantProduct findMerchantProductBySMSConfig(String smsServiceId,
			String smsCommandCode) {
		return merchantProductDAO.findMerchantProductBySMSConfig(smsServiceId, smsCommandCode);
	}

	@Override
	public MerchantProduct findMerchantProductByIACGameCode(String gameCode) {
		return merchantProductDAO.findMerchantProductByIACGameCode(gameCode);
	}
}
