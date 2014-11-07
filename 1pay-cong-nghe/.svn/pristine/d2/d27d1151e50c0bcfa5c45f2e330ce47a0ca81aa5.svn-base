package vn.onepay.dev.dao.mongodb;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.dev.dao.DevCategoryDAO;
import vn.onepay.dev.model.DevCategory;
import vn.onepay.utils.Utils;

public class DevCategoryDAOMongo implements DevCategoryDAO {
	private MongoTemplate mongoTemplate;

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	@Override
	public void save(DevCategory devCategory) {
		Date now = new Date();
		if(devCategory.getCreated_time() == null) devCategory.setCreated_time(now);
		if(devCategory.getUpdated_time() == null) devCategory.setUpdated_time(now);
		
		devCategory.setCreated_time(Utils.convertToMongoDBTime(devCategory.getCreated_time()));
		devCategory.setUpdated_time(Utils.convertToMongoDBTime(devCategory.getUpdated_time()));
		mongoTemplate.save(devCategory);
	}

	@Override
	public DevCategory findDevCategoryById(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		DevCategory devCategory = mongoTemplate.findOne(query, DevCategory.class);
		if(devCategory!=null){
			devCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getCreated_time()));
			devCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getUpdated_time()));
		}
		return devCategory;
	}

	@Override
	public int findTotalDevCategoriesByName(String categoryName) {
		try{
			Query query = new Query();
			if(StringUtils.isNotBlank(categoryName))
				query.addCriteria(Criteria.where("title").regex(categoryName,"i"));
			return (int) mongoTemplate.count(query, DevCategory.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<DevCategory> findDevCategoriesByName(String categoryName, int offset, int limit) {
		Query query = new Query();
		if(StringUtils.isNotBlank(categoryName))
			query.addCriteria(Criteria.where("title").is(StringUtils.trimToEmpty(categoryName)));
		query.with(new Sort(Sort.Direction.ASC, "order"));
		query.with(new Sort(Sort.Direction.DESC, "updated_time"));
		if(offset>0)
			query.skip(offset);
		if(limit>0)
			query.limit(limit);
		List<DevCategory> devCategories = mongoTemplate.find(query, DevCategory.class);
		if(devCategories!=null && devCategories.size()>0){
			for(DevCategory devCategory:devCategories){
				devCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getCreated_time()));
				devCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getUpdated_time()));
			}
		}
		return devCategories;
	}

	@Override
	public int findTotalChildDevCategories(DevCategory parent, boolean recursive) {
		try{
			Query query = new Query();
			query.addCriteria(Criteria.where("parent").is(parent));
			return (int) mongoTemplate.count(query, DevCategory.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<DevCategory> findChildDevCategories(DevCategory parent, boolean recursive, int offset,
			int limit) {
		Query query = new Query();
		query.addCriteria(Criteria.where("parent").is(parent));
		query.with(new Sort(Sort.Direction.ASC, "order"));
		query.with(new Sort(Sort.Direction.DESC, "updated_time"));
		
		if(!recursive) {
			if(offset>0)
				query.skip(offset);
			if(limit>0)
				query.limit(limit);
		}
		List<DevCategory> devCategories = mongoTemplate.find(query, DevCategory.class);
		if(devCategories!=null && devCategories.size()>0){
			int size = devCategories.size();
			for(int i = 0; i < size; i++){
				DevCategory devCategory = devCategories.get(i);
				devCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getCreated_time()));
				devCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getUpdated_time()));
				if(recursive) {
					devCategory.setChilds(new ArrayList<DevCategory>());
					devCategory.getChilds().addAll(findChildDevCategories(devCategory, recursive, offset, limit));
				}
			}
		}
		return devCategories;
	}

	@Override
	public int findTotalDevCategoriesByType(String categoryType) {
		try{
			Query query = new Query();
			if(StringUtils.isNotBlank(categoryType))
				query.addCriteria(Criteria.where("title").regex(categoryType,"i"));
			return (int) mongoTemplate.count(query, DevCategory.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<DevCategory> findDevCategoriesByType(String categoryType,
			int offset, int limit) {
		Query query = new Query();
		if(StringUtils.isNotBlank(categoryType))
			query.addCriteria(Criteria.where("category_type").is(StringUtils.trimToEmpty(categoryType)));
		query.with(new Sort(Sort.Direction.ASC, "order"));
		query.with(new Sort(Sort.Direction.DESC, "updated_time"));
		if(offset>0)
			query.skip(offset);
		if(limit>0)
			query.limit(limit);
		List<DevCategory> devCategories = mongoTemplate.find(query, DevCategory.class);
		if(devCategories!=null && devCategories.size()>0){
			for(DevCategory devCategory:devCategories){
				devCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getCreated_time()));
				devCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getUpdated_time()));
			}
		}
		return devCategories;
	}

	@Override
	public int findTotalDevCategories(String categoryName, List<String> categoryType, DevCategory parent, List<String> status, boolean recursive) {
		try{
			Query query = new Query();
			if(StringUtils.isNotBlank(categoryName))
				query.addCriteria(Criteria.where("title").regex(categoryName,"i"));
			if(categoryType != null && categoryType.size() > 0)
				query.addCriteria(Criteria.where("category_type").in(categoryType));
			query.addCriteria(Criteria.where("parent").is(parent));
			if(status != null && status.size() > 0)
				query.addCriteria(Criteria.where("status").in(status));
			
			return (int) mongoTemplate.count(query, DevCategory.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<DevCategory> findDevCategories(String categoryName, List<String> categoryType, DevCategory parent, List<String> status, boolean recursive, int offset,
			int limit) {
		Query query = new Query();
		if(StringUtils.isNotBlank(categoryName))
			query.addCriteria(Criteria.where("title").regex(categoryName,"i"));
		if(categoryType != null && categoryType.size() > 0)
			query.addCriteria(Criteria.where("category_type").in(categoryType));
		query.addCriteria(Criteria.where("parent").is(parent));
		if(status != null && status.size() > 0)
			query.addCriteria(Criteria.where("status").in(status));
		
		query.with(new Sort(Sort.Direction.ASC, "order"));
		query.with(new Sort(Sort.Direction.DESC, "updated_time"));
		if(!recursive) {
			if(offset>0)
				query.skip(offset);
			if(limit>0)
				query.limit(limit);
		}
		List<DevCategory> devCategories = mongoTemplate.find(query, DevCategory.class);
		if(devCategories!=null && devCategories.size()>0) {
			int size = devCategories.size();
			for(int i = 0; i < size; i++){
				DevCategory devCategory = devCategories.get(i);
				devCategory.setCreated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getCreated_time()));
				devCategory.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devCategory.getUpdated_time()));
				if(recursive) {
					devCategory.setChilds(new ArrayList<DevCategory>());
					devCategory.getChilds().addAll(findDevCategories(categoryName, categoryType, devCategory, status, recursive, offset, limit));
				}
			}
		}
		return devCategories;
	}

}
