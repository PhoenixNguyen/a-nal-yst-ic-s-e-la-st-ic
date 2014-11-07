package vn.onepay.template.dao.mongodb;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.template.model.EmailSubject;
import vn.onepay.template.dao.EmailSubjectDAO;
import vn.onepay.utils.Utils;

public class EmailSubjectDAOMongo implements EmailSubjectDAO {
	private MongoTemplate mongoTemplate;

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	@Override
	public void save(EmailSubject emailSubject) {
		if(emailSubject.getCreated_time() == null) emailSubject.setCreated_time(new Date());
		if(emailSubject.getUpdated_time() == null) emailSubject.setUpdated_time(new Date());
		emailSubject.setCreated_time(Utils.convertToMongoDBTime(emailSubject.getCreated_time()));
		emailSubject.setUpdated_time(Utils.convertToMongoDBTime(emailSubject.getCreated_time()));
		mongoTemplate.save(emailSubject);
	}

	@Override
	public void delete(EmailSubject emailSubject) {
		mongoTemplate.remove(emailSubject);		
	}

	@Override
	public EmailSubject findEmailSubjectById(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		EmailSubject emailSubject = mongoTemplate.findOne(query, EmailSubject.class);
		if(emailSubject!=null){
			if(emailSubject.getCreated_time() != null)
				emailSubject.setCreated_time(Utils.mongoDbTimeToDisplayTime(emailSubject.getCreated_time()));
			if(emailSubject.getUpdated_time() != null)
				emailSubject.setUpdated_time(Utils.mongoDbTimeToDisplayTime(emailSubject.getUpdated_time()));
		}
		return emailSubject;
	}

	@Override
	public EmailSubject findEmailSubject(String subject) {
		Query query = new Query();
		query.addCriteria(Criteria.where("subject").is(StringUtils.trimToEmpty(subject)));
		EmailSubject emailSubject = mongoTemplate.findOne(query, EmailSubject.class);
		if(emailSubject!=null){
			if(emailSubject.getCreated_time() != null)
				emailSubject.setCreated_time(Utils.mongoDbTimeToDisplayTime(emailSubject.getCreated_time()));
			if(emailSubject.getUpdated_time() != null)
				emailSubject.setUpdated_time(Utils.mongoDbTimeToDisplayTime(emailSubject.getUpdated_time()));
		}
		return emailSubject;
	}

}
