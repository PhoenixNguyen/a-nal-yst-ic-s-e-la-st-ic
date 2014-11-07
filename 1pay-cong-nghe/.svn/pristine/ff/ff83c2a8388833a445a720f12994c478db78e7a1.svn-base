package vn.onepay.cashflow.dao.mongodb;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.cashflow.dao.CashFlowRecordDAO;
import vn.onepay.cashflow.model.CashFlowCategory;
import vn.onepay.cashflow.model.CashFlowRecord;
import vn.onepay.utils.Utils;

public class CashFlowRecordDAOMongoImpl implements CashFlowRecordDAO{

	private MongoTemplate mongoTemplate;
	private String mongoCollection;
	
	public MongoTemplate getMongoTemplate() {
		return mongoTemplate;
	}

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	public String getMongoCollection() {
		return mongoCollection;
	}

	public void setMongoCollection(String mongoCollection) {
		this.mongoCollection = mongoCollection;
	}

	
	@Override
	public void save(CashFlowRecord moneyFlowRecord) {
		moneyFlowRecord.setCreated_time(Utils.convertToMongoDBTime(moneyFlowRecord.getCreated_time()));
		moneyFlowRecord.setUpdated_time(Utils.convertToMongoDBTime(moneyFlowRecord.getUpdated_time()));
		
		moneyFlowRecord.setMonth_year(Utils.convertToMongoDBTime(moneyFlowRecord.getMonth_year()));
		mongoTemplate.save(moneyFlowRecord);
	}

	@Override
	public List<CashFlowRecord> findAllCashFlowRecords() {
		Query query = new Query();
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"period"}));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"status"}));
		query.with(new Sort(Sort.Direction.DESC, new String[] {"month_year"}));
		
		List<CashFlowRecord> moneyFlowRecords = mongoTemplate.find(query, CashFlowRecord.class);
		
		if(moneyFlowRecords != null && moneyFlowRecords.size() > 0){
			for(CashFlowRecord mfr : moneyFlowRecords){
				mfr.setMonth_year(Utils.mongoDbTimeToDisplayTime(mfr.getMonth_year()));
				mfr.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfr.getCreated_time()));
				mfr.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfr.getUpdated_time()));
			}
		}
		return moneyFlowRecords;
	}

	@Override
	public CashFlowRecord findCashFlowRecord(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		query.addCriteria(Criteria.where("status").is(1));
		
		CashFlowRecord moneyFlowRecord = mongoTemplate.findOne(query, CashFlowRecord.class);
		if(moneyFlowRecord!=null){
			moneyFlowRecord.setMonth_year(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getMonth_year()));
			moneyFlowRecord.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getCreated_time()));
			moneyFlowRecord.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getUpdated_time()));
		}
		return moneyFlowRecord;
	}

	@Override
	public boolean update(CashFlowRecord moneyFlowRecord) {
		Query query = new Query();
	    query.addCriteria(Criteria.where("_id").is(moneyFlowRecord.getId()));
	    if (this.mongoTemplate.findOne(query, CashFlowRecord.class) != null) {
	    	moneyFlowRecord.setCreated_time(Utils.convertToMongoDBTime(moneyFlowRecord.getCreated_time()));
	    	moneyFlowRecord.setUpdated_time(Utils.convertToMongoDBTime(moneyFlowRecord.getUpdated_time()));
	    	moneyFlowRecord.setMonth_year(Utils.convertToMongoDBTime(moneyFlowRecord.getMonth_year()));
	    	
	    	this.mongoTemplate.save(moneyFlowRecord);
	    	return true;
	    }
	    return false;
		
	}

	@Override
	public void delete(CashFlowRecord moneyFlowRecord) {
		mongoTemplate.remove(moneyFlowRecord);
	}

	@Override
	public CashFlowRecord findCashFlowRecord(String period, Date month_year) {
		Query query = new Query();
	    query.addCriteria(Criteria.where("period").is(period));
	    query.addCriteria(Criteria.where("month_year").is(Utils.convertToMongoDBTime(month_year)));
	    query.addCriteria(Criteria.where("status").is(1));
	    
	    CashFlowRecord moneyFlowRecord = mongoTemplate.findOne(query, CashFlowRecord.class);
		if(moneyFlowRecord!=null){
			moneyFlowRecord.setMonth_year(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getMonth_year()));
			moneyFlowRecord.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getCreated_time()));
			moneyFlowRecord.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getUpdated_time()));
		}
		return moneyFlowRecord;
	}

	@Override
	public List<CashFlowRecord> findCashFlowRecords(String category_id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"type"}));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"period"}));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"status"}));
		query.with(new Sort(Sort.Direction.DESC, new String[] {"month_year"}));
		
		query.addCriteria(Criteria.where("category_id").is(StringUtils.trimToEmpty(category_id)));
		
		List<CashFlowRecord> moneyFlowRecords = mongoTemplate.find(query, CashFlowRecord.class);
		
		if(moneyFlowRecords != null && moneyFlowRecords.size() > 0){
			for(CashFlowRecord mfr : moneyFlowRecords){
				mfr.setMonth_year(Utils.mongoDbTimeToDisplayTime(mfr.getMonth_year()));
				mfr.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfr.getCreated_time()));
				mfr.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfr.getUpdated_time()));
			}
		}
		return moneyFlowRecords;
	}

	@Override
	public List<CashFlowRecord> findAllCashFlowRecords(String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"type"}));
		query.with(new Sort(Sort.Direction.ASC, new String[] {"period"}));
		
		query.with(new Sort(Sort.Direction.DESC, new String[] {"month_year"}));
		
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		
		List<CashFlowRecord> moneyFlowRecords = mongoTemplate.find(query, CashFlowRecord.class);
		
		if(moneyFlowRecords != null && moneyFlowRecords.size() > 0){
			for(CashFlowRecord mfr : moneyFlowRecords){
				mfr.setMonth_year(Utils.mongoDbTimeToDisplayTime(mfr.getMonth_year()));
				mfr.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfr.getCreated_time()));
				mfr.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfr.getUpdated_time()));
			}
		}
		return moneyFlowRecords;
	}

	@Override
	public CashFlowRecord findCashFlowRecord(String period, Date month_year, String type) {
		Query query = new Query();
	    query.addCriteria(Criteria.where("period").is(StringUtils.trimToEmpty(period)));
	    query.addCriteria(Criteria.where("month_year").is(Utils.convertToMongoDBTime(month_year)));
	    query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
	    query.addCriteria(Criteria.where("status").is(1));
	    
	    CashFlowRecord moneyFlowRecord = mongoTemplate.findOne(query, CashFlowRecord.class);
		if(moneyFlowRecord!=null){
			moneyFlowRecord.setMonth_year(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getMonth_year()));
			moneyFlowRecord.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getCreated_time()));
			moneyFlowRecord.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getUpdated_time()));
		}
		return moneyFlowRecord;
	}
	
	@Override
	public CashFlowRecord findCashFlowRecord(String period, Date month_year, String type, String category_id) {
		Query query = new Query();
	    query.addCriteria(Criteria.where("period").is(StringUtils.trimToEmpty(period)));
	    query.addCriteria(Criteria.where("month_year").is(Utils.convertToMongoDBTime(month_year)));
	    query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
	    query.addCriteria(Criteria.where("category_id").is(StringUtils.trimToEmpty(category_id)));
	    query.addCriteria(Criteria.where("status").is(1));
	    
	    CashFlowRecord moneyFlowRecord = mongoTemplate.findOne(query, CashFlowRecord.class);
		if(moneyFlowRecord!=null){
			moneyFlowRecord.setMonth_year(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getMonth_year()));
			moneyFlowRecord.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getCreated_time()));
			moneyFlowRecord.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowRecord.getUpdated_time()));
		}
		return moneyFlowRecord;
	}
	
	
	public List<CashFlowRecord> findAllCashFlowRecordsInRevenueAndCostType(String last_period, Date last_month_year) {
		Query query = new Query();
		query.addCriteria(Criteria.where("status").is(1));
		query.addCriteria(Criteria.where("request").is(CashFlowRecord.ACCEPTED));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"type"}));
		query.with(new Sort(Sort.Direction.ASC, new String[] {"period"}));
		query.with(new Sort(Sort.Direction.DESC, new String[] {"month_year"}));
		
		query.addCriteria(Criteria.where("type").exists(true).orOperator(Criteria.where("type").is(CashFlowCategory.REVENUE_TYPE), Criteria.where("type").is(CashFlowCategory.COST_TYPE)));
		query.addCriteria(Criteria.where("period").is(last_period));
		query.addCriteria(Criteria.where("month_year").is(Utils.convertToMongoDBTime(last_month_year)));
		
		List<CashFlowRecord> moneyFlowRecords = mongoTemplate.find(query, CashFlowRecord.class);
		
		if(moneyFlowRecords != null && moneyFlowRecords.size() > 0){
			for(CashFlowRecord mfr : moneyFlowRecords){
				mfr.setMonth_year(Utils.mongoDbTimeToDisplayTime(mfr.getMonth_year()));
				mfr.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfr.getCreated_time()));
				mfr.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfr.getUpdated_time()));
			}
		}
		return moneyFlowRecords;
	}
	
	public void updateCodeName(CashFlowCategory cate) {
		List<CashFlowRecord> records = findCashFlowRecords(cate.getId());
		
		for(CashFlowRecord record : records){
			record.setCode_name(cate.getCode_name());
			save(record);
		}
		
	}
}
