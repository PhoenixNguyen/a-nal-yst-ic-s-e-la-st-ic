package vn.onepay.dev.dao.mongodb;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.dev.dao.DevArticleDAO;
import vn.onepay.dev.model.DevArticle;
import vn.onepay.dev.model.DevCategory;
import vn.onepay.utils.Utils;
import vn.onepay.vietokenizer.service.impl.VietokenServiceImpl;

public class DevArticleDAOMongo implements DevArticleDAO {
	private MongoTemplate mongoTemplate;
	private VietokenServiceImpl vietokenService;
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	
	public void setVietokenService(VietokenServiceImpl vietokenService) {
        this.vietokenService = vietokenService;
    }


    @Override
	public void save(DevArticle devArticle) {
		devArticle.setCreated_time(Utils.convertToMongoDBTime(devArticle.getCreated_time()));
		devArticle.setUpdated_time(Utils.convertToMongoDBTime(devArticle.getUpdated_time()));
		mongoTemplate.save(devArticle);
	}

	@Override
	public DevArticle findDevArticleById(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		DevArticle devArticle = mongoTemplate.findOne(query, DevArticle.class);
		if(devArticle!=null){
			devArticle.setCreated_time(Utils.mongoDbTimeToDisplayTime(devArticle.getCreated_time()));
			devArticle.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devArticle.getUpdated_time()));
		}
		return devArticle;
	}

	private Query getDevArticlesQuery(List<DevCategory> devCategories, String articleTitle, List<String> status) {
		Query query = new Query();
		if(devCategories != null && devCategories.size() > 0) {
			List<ObjectId> objIds = new ArrayList<ObjectId>();
			for(DevCategory cate : devCategories)
				objIds.add(new ObjectId(cate.getId()));
			query.addCriteria(Criteria.where("dev_category.$id").in(objIds));
		}
		
		if(StringUtils.isNotEmpty(articleTitle)) {
		    List<String> lstKey = vietokenService.tokenizeToListKey(articleTitle);
		    Criteria[] lstCriteria = new Criteria[lstKey.size()*2];
            for(int i = 0; i < lstKey.size(); i++) {
                lstCriteria[i] = Criteria.where("title").regex(lstKey.get(i),"i");
                lstCriteria[lstKey.size() + i] = Criteria.where("content").regex(lstKey.get(i),"i");
            }
            query.addCriteria(new Criteria().orOperator(lstCriteria));
		}
		if(status != null && status.size()>0)
			query.addCriteria(Criteria.where("status").in(status));
		
		return query;
	}
	
	@Override
	public int findTotalDevArticles(List<DevCategory> devCategories, String articleTitle, List<String> status) {
		try{
			Query query = getDevArticlesQuery(devCategories, articleTitle, status);
			return (int) mongoTemplate.count(query, DevArticle.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<DevArticle> findDevArticles(List<DevCategory> devCategories, String articleTitle, List<String> status, int offset, int limit) {
		try{
			Query query = getDevArticlesQuery(devCategories, articleTitle, status);
			query.with(new Sort(Sort.Direction.ASC, "order"));
			query.with(new Sort(Sort.Direction.DESC, "updated_time"));
			if(offset > 0)
				query.skip(offset);
			if(limit>0)
				query.limit(limit);
			List<DevArticle> devArticles = mongoTemplate.find(query, DevArticle.class);
			if(devArticles!=null){
				for(DevArticle devArticle:devArticles){
					devArticle.setCreated_time(Utils.mongoDbTimeToDisplayTime(devArticle.getCreated_time()));
					devArticle.setUpdated_time(Utils.mongoDbTimeToDisplayTime(devArticle.getUpdated_time()));
				}
			}
			return devArticles;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
