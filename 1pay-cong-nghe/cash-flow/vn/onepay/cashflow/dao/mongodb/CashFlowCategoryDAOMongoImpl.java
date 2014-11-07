package vn.onepay.cashflow.dao.mongodb;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.cashflow.dao.CashFlowCategoryDAO;
import vn.onepay.cashflow.model.CashFlowCategory;
import vn.onepay.utils.Utils;

public class CashFlowCategoryDAOMongoImpl implements CashFlowCategoryDAO{
	private MongoTemplate mongoTemplate;
	public MongoTemplate getMongoTemplate() {
		return mongoTemplate;
	}
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	
	@Override
	public void save(CashFlowCategory moneyFlowCategory) {
		moneyFlowCategory.setCreated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getCreated_time()));
		moneyFlowCategory.setUpdated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getUpdated_time()));
		
		mongoTemplate.save(moneyFlowCategory);
	}

	@Override
	public List<CashFlowCategory> findAllCashFlowCategories() {
		Query query = new Query();
		query.with(new Sort(Sort.Direction.ASC, new String[] {"parent_id"}));
		query.addCriteria(Criteria.where("status").is(1));
		
		List<CashFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, CashFlowCategory.class);
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(CashFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public List<CashFlowCategory> fetchChilds(String parent_id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parent_id").is(StringUtils.trimToEmpty(parent_id)));
		query.addCriteria(Criteria.where("status").is(1));
		
		List<CashFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, CashFlowCategory.class);
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(CashFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public List<CashFlowCategory> findCashFlowCategories(String parent_id,
			String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parent_id").is(StringUtils.trimToEmpty(parent_id)));
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"index"}));
		
		List<CashFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, CashFlowCategory.class);
		
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(CashFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public List<CashFlowCategory> findCashFlowCategories(String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"index"}));
		List<CashFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, CashFlowCategory.class);
		
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(CashFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public CashFlowCategory findById(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		query.addCriteria(Criteria.where("status").is(1));
		
		CashFlowCategory moneyFlowCategory = mongoTemplate.findOne(query, CashFlowCategory.class);
		if(moneyFlowCategory!=null){
			moneyFlowCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getCreated_time()));
			moneyFlowCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getUpdated_time()));
		}
		return moneyFlowCategory;
	}

	@Override
	public boolean update(CashFlowCategory moneyFlowCategory) {
		Query query = new Query();
	    query.addCriteria(Criteria.where("_id").is(moneyFlowCategory.getId()));
	    if (this.mongoTemplate.findOne(query, CashFlowCategory.class) != null) {
	    	moneyFlowCategory.setCreated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getCreated_time()));
	    	moneyFlowCategory.setUpdated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getUpdated_time()));
	    	
	    	this.mongoTemplate.save(moneyFlowCategory);
	    	return true;
	    }
	    return false;
	}

	@Override
	public void delete(CashFlowCategory moneyFlowCategory) {
		mongoTemplate.remove(moneyFlowCategory);
		
	}
	
	//get Root revenue or cost
	public CashFlowCategory findRootCategory(String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parentCategory").is(null));
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		query.addCriteria(Criteria.where("status").is(1));
		
		/*query.addCriteria(Criteria.where("childCategorys.$ref").is("MoneyFlowCategory"));*/
		/*query.addCriteria(Criteria.where("childCategorys.$id").is("53d137fa3dc46b1570211a4e"));*/
		
		CashFlowCategory moneyFlowCategory = mongoTemplate.findOne(query, CashFlowCategory.class);
		if(moneyFlowCategory!=null){
			moneyFlowCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getCreated_time()));
			moneyFlowCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getUpdated_time()));
		}
		return moneyFlowCategory;
	}

	@Override
	public List<CashFlowCategory> fetchChilds(CashFlowCategory parent) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parentCategory").is(parent));
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"index"}));
		query.with(new Sort(Sort.Direction.ASC, new String[] {"created_time"}));
		
		List<CashFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, CashFlowCategory.class);
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(CashFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public void updateChilds(CashFlowCategory parent, boolean recursive) {
		List<CashFlowCategory> childs = fetchChilds(parent);
		/*if(childs != null && childs.size() > 0){
			parent.setChildCategorys(childs);
			mongoTemplate.save(parent);
		}*/
		
		for(CashFlowCategory child : childs){
			child.setParentCategory(parent);
			mongoTemplate.save(child);
		}
		if(recursive){
			for(CashFlowCategory child : childs){
				updateChilds(child, true);
			}
		}
	}
	
	@Override
	public CashFlowCategory findByCode(String code_name) {
		Query query = new Query();
		query.addCriteria(Criteria.where("code_name").is(StringUtils.trimToEmpty(code_name)));
		query.addCriteria(Criteria.where("status").is(1));
		
		CashFlowCategory moneyFlowCategory = mongoTemplate.findOne(query, CashFlowCategory.class);
		if(moneyFlowCategory!=null){
			moneyFlowCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getCreated_time()));
			moneyFlowCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getUpdated_time()));
		}
		return moneyFlowCategory;
	}
}
