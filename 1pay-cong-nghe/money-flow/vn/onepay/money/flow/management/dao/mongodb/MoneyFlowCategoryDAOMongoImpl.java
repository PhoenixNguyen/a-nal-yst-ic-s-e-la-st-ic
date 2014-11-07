package vn.onepay.money.flow.management.dao.mongodb;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.money.flow.management.dao.MoneyFlowCategoryDAO;
import vn.onepay.money.flow.management.model.MoneyFlowCategory;
import vn.onepay.utils.Utils;

public class MoneyFlowCategoryDAOMongoImpl implements MoneyFlowCategoryDAO{

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
	public void save(MoneyFlowCategory moneyFlowCategory) {
		moneyFlowCategory.setCreated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getCreated_time()));
		moneyFlowCategory.setUpdated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getUpdated_time()));
		
		mongoTemplate.save(moneyFlowCategory);
	}

	@Override
	public List<MoneyFlowCategory> findAllMoneyFlowCategorys() {
		Query query = new Query();
		query.with(new Sort(Sort.Direction.ASC, new String[] {"parent_id"}));
		query.addCriteria(Criteria.where("status").is(1));
		
		List<MoneyFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, MoneyFlowCategory.class);
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(MoneyFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public List<MoneyFlowCategory> findMoneyFlowCategorys(String parent_id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parent_id").is(StringUtils.trimToEmpty(parent_id)));
		query.addCriteria(Criteria.where("status").is(1));
		
		List<MoneyFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, MoneyFlowCategory.class);
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(MoneyFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public List<MoneyFlowCategory> findMoneyFlowCategorys(String parent_id,
			String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parent_id").is(StringUtils.trimToEmpty(parent_id)));
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"index"}));
		
		List<MoneyFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, MoneyFlowCategory.class);
		
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(MoneyFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public List<MoneyFlowCategory> findAllMoneyFlowCategorys(String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"index"}));
		List<MoneyFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, MoneyFlowCategory.class);
		
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(MoneyFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public MoneyFlowCategory findMoneyFlowCategory(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		query.addCriteria(Criteria.where("status").is(1));
		
		MoneyFlowCategory moneyFlowCategory = mongoTemplate.findOne(query, MoneyFlowCategory.class);
		if(moneyFlowCategory!=null){
			moneyFlowCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getCreated_time()));
			moneyFlowCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getUpdated_time()));
		}
		return moneyFlowCategory;
	}

	@Override
	public boolean update(MoneyFlowCategory moneyFlowCategory) {
		Query query = new Query();
	    query.addCriteria(Criteria.where("_id").is(moneyFlowCategory.getId()));
	    if (this.mongoTemplate.findOne(query, MoneyFlowCategory.class) != null) {
	    	moneyFlowCategory.setCreated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getCreated_time()));
	    	moneyFlowCategory.setUpdated_time(Utils.convertToMongoDBTime(moneyFlowCategory.getUpdated_time()));
	    	
	    	this.mongoTemplate.save(moneyFlowCategory);
	    	return true;
	    }
	    return false;
	}

	@Override
	public void delete(MoneyFlowCategory moneyFlowCategory) {
		mongoTemplate.remove(moneyFlowCategory);
		
	}
	
	//get Root revenue or cost
	public MoneyFlowCategory findRootMoneyFlowCategory(String type) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parentCategory").is(null));
		query.addCriteria(Criteria.where("type").is(StringUtils.trimToEmpty(type)));
		query.addCriteria(Criteria.where("status").is(1));
		
		/*query.addCriteria(Criteria.where("childCategorys.$ref").is("MoneyFlowCategory"));*/
		/*query.addCriteria(Criteria.where("childCategorys.$id").is("53d137fa3dc46b1570211a4e"));*/
		
		MoneyFlowCategory moneyFlowCategory = mongoTemplate.findOne(query, MoneyFlowCategory.class);
		if(moneyFlowCategory!=null){
			moneyFlowCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getCreated_time()));
			moneyFlowCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getUpdated_time()));
		}
		return moneyFlowCategory;
	}

	@Override
	public List<MoneyFlowCategory> fetchChilds(MoneyFlowCategory parent) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parentCategory").is(parent));
		query.addCriteria(Criteria.where("status").is(1));
		
		query.with(new Sort(Sort.Direction.ASC, new String[] {"index"}));
		query.with(new Sort(Sort.Direction.ASC, new String[] {"created_time"}));
		
		List<MoneyFlowCategory> moneyFlowCategorys = mongoTemplate.find(query, MoneyFlowCategory.class);
		
		if(moneyFlowCategorys != null && moneyFlowCategorys.size() > 0){
			for(MoneyFlowCategory mfc : moneyFlowCategorys){
				mfc.setCreated_time(Utils.mongoDbTimeToDisplayTime(mfc.getCreated_time()));
				mfc.setUpdated_time(Utils.mongoDbTimeToDisplayTime(mfc.getUpdated_time()));
			}
		}
		return moneyFlowCategorys;
	}

	@Override
	public void updateChild(MoneyFlowCategory parent, boolean recursive) {
		List<MoneyFlowCategory> childs = fetchChilds(parent);
		/*if(childs != null && childs.size() > 0){
			parent.setChildCategorys(childs);
			mongoTemplate.save(parent);
		}*/
		
		for(MoneyFlowCategory child : childs){
			child.setParentCategory(parent);
			mongoTemplate.save(child);
		}
		
		if(recursive){
			for(MoneyFlowCategory child : childs){
				updateChild(child, true);
			}
		}
		
	}
	
	@Override
	public MoneyFlowCategory findCategory(String code_name) {
		Query query = new Query();
		query.addCriteria(Criteria.where("code_name").is(StringUtils.trimToEmpty(code_name)));
		query.addCriteria(Criteria.where("status").is(1));
		
		MoneyFlowCategory moneyFlowCategory = mongoTemplate.findOne(query, MoneyFlowCategory.class);
		if(moneyFlowCategory!=null){
			moneyFlowCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getCreated_time()));
			moneyFlowCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(moneyFlowCategory.getUpdated_time()));
		}
		return moneyFlowCategory;
	}
}
