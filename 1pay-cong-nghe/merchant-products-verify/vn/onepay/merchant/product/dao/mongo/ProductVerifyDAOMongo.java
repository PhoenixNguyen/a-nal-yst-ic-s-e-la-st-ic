package vn.onepay.merchant.product.dao.mongo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.merchant.product.dao.ProductVerifyDAO;
import vn.onepay.merchant.product.model.ProductVerify;
import vn.onepay.utils.Utils;

public class ProductVerifyDAOMongo implements ProductVerifyDAO{
	private MongoTemplate mongoTemplate;

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	@Override
	public void save(ProductVerify productVerify) {
		try {
			setToMongoDBTime(productVerify);
			mongoTemplate.save(productVerify);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProductVerify loadProductVerify(String id) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("id").is(StringUtils.trimToEmpty(id)));
			
			ProductVerify productVerify = mongoTemplate.findOne(query, ProductVerify.class);
			if(productVerify != null) {
				setToDisplayTime(productVerify);
				return productVerify;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*@Override
	public ProductVerify getProductVerify(String appCode) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("app_code").is(StringUtils.trimToEmpty(appCode)));
			
			ProductVerify productVerify = mongoTemplate.findOne(query, ProductVerify.class);
			if(productVerify != null) {
				setToDisplayTime(productVerify);
				return productVerify;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}*/

	@Override
	public List<ProductVerify> findProductVerifies(String chargingType) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("charging_type").is(StringUtils.trimToEmpty(chargingType)));
			
			List<ProductVerify> productVerifies = mongoTemplate.find(query, ProductVerify.class);
			if(productVerifies != null) {
				for(ProductVerify productVerify : productVerifies) {
					setToDisplayTime(productVerify);
				}
				
				return productVerifies;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void delete(ProductVerify productVerify) {
		try {
			mongoTemplate.remove(productVerify);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductVerify> findProductVerifies(String appCode, String chargingType, String version, int status, String bizzChannel,
			Date fromExpiredDate, Date toExpiredDate, int limit, int offset) {
		try {
			Query query = getQuery(appCode, chargingType, version, status, bizzChannel, fromExpiredDate, toExpiredDate);
			Sort orderBy = new Sort(Sort.Direction.DESC, "created_time")
							.and(new Sort(Sort.Direction.DESC, "version"));
			if(orderBy!=null)
				query.with(orderBy);
			if(offset>0)
				query.skip(offset);
			if(limit>0)
				query.limit(limit);
			
			List<ProductVerify> productVerifies = mongoTemplate.find(query, ProductVerify.class);
			if(productVerifies != null) {
				for(ProductVerify productVerify : productVerifies) {
					setToDisplayTime(productVerify);
				}
				
				return productVerifies;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int findTotalProductVerifies(String appCode, String chargingType, String version,
			int status, String bizzChannel, Date fromExpiredDate,
			Date toExpiredDate) {
		try {
			Query query = getQuery(appCode, chargingType, version, status, bizzChannel, fromExpiredDate, toExpiredDate);
			
			return (int)mongoTemplate.count(query, ProductVerify.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	private Query getQuery(String appCode, String chargingType, String version,
			int status, String bizzChannel, Date fromExpiredDate,
			Date toExpiredDate) {
		Query query = new Query();
		
		if(!StringUtils.isBlank(appCode)) {
			query.addCriteria(Criteria.where("app_code").is(StringUtils.trimToEmpty(appCode)));
		}
		if(!StringUtils.isBlank(chargingType)) {
			query.addCriteria(Criteria.where("charging_type").is(StringUtils.trimToEmpty(chargingType)));
		}
		if(!StringUtils.isBlank(version)) {
			query.addCriteria(Criteria.where("version").is(StringUtils.trimToEmpty(version)));
		}
		if(status >= 0) {
			query.addCriteria(Criteria.where("status").is(status));
		}
		if(!StringUtils.isBlank(bizzChannel)) {
			query.addCriteria(Criteria.where("bizz_channel").is(StringUtils.trimToEmpty(bizzChannel)));
		}
		if(fromExpiredDate != null || toExpiredDate != null) {
			if(fromExpiredDate == null) 
				fromExpiredDate = new Date(0L);
			if(toExpiredDate == null) 
				toExpiredDate = new Date();
			if(fromExpiredDate.getTime() <= toExpiredDate.getTime()){
				query.addCriteria(Criteria.where("expired_date").gte(Utils.convertToMongoDBTime(fromExpiredDate))); 
				query.addCriteria(Criteria.where("expired_date").lte(Utils.convertToMongoDBTime(toExpiredDate)));
			}
		}
		
		System.out.println(query.toString());
		
		return query;
	}
	private void setToMongoDBTime(ProductVerify productVerify) {
		if(productVerify != null) {
			if(productVerify.getCreated_date() != null)
				productVerify.setCreated_date(Utils.convertToMongoDBTime(productVerify.getCreated_date()));
			if(productVerify.getExpired_date() != null)
				productVerify.setExpired_date(Utils.convertToMongoDBTime(productVerify.getExpired_date()));
		}
	}
	
	private void setToDisplayTime(ProductVerify productVerify) {
		if(productVerify != null) {
			if(productVerify.getCreated_date() != null)
				productVerify.setCreated_date(Utils.mongoDbTimeToDisplayTime(productVerify.getCreated_date()));
			if(productVerify.getExpired_date() != null)
				productVerify.setExpired_date(Utils.mongoDbTimeToDisplayTime(productVerify.getExpired_date()));
		}
	}
}
