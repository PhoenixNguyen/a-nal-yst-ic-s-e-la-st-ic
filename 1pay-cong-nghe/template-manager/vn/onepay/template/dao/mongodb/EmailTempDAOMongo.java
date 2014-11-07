package vn.onepay.template.dao.mongodb;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.utils.Utils;
import vn.onepay.template.dao.EmailTempDAO;
import vn.onepay.template.model.EmailTemplate;

public class EmailTempDAOMongo implements EmailTempDAO{
	private MongoTemplate mongoTemplate;

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	

	@Override
	public void save(EmailTemplate emailTemplate) {
		if(emailTemplate.getCreated_time() == null) emailTemplate.setCreated_time(new Date());
		if(emailTemplate.getUpdated_time() == null) emailTemplate.setUpdated_time(new Date());
		emailTemplate.setCreated_time(Utils.convertToMongoDBTime(emailTemplate.getCreated_time()));
		emailTemplate.setUpdated_time(Utils.convertToMongoDBTime(emailTemplate.getUpdated_time()));
		mongoTemplate.save(emailTemplate)	;
	}

	@Override
	public void delete(EmailTemplate emailTemplate) {
		mongoTemplate.remove(emailTemplate);
		
	}

	@Override
	public EmailTemplate findTempDataById(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(StringUtils.trimToEmpty(id)));
		EmailTemplate emailTemplate = mongoTemplate.findOne(query, EmailTemplate.class);
		if(emailTemplate!=null){
			if(emailTemplate.getCreated_time() != null )
			   emailTemplate.setCreated_time(Utils.mongoDbTimeToDisplayTime(emailTemplate.getCreated_time()));
			if(emailTemplate.getUpdated_time() != null)
				emailTemplate.setUpdated_time(Utils.mongoDbTimeToDisplayTime(emailTemplate.getUpdated_time()));
		}
		return emailTemplate;
	}


	@Override
	public int findTotalEmailTemplates(String name, String subjectId, String subject, String status) {
		try{
			Query query = new Query();
			if(StringUtils.isNotBlank(name))
				query.addCriteria(Criteria.where("name").is(name));
			if(StringUtils.isNotBlank(subjectId))
				query.addCriteria(Criteria.where("subjectId").is(subjectId));
			if(StringUtils.isNotBlank(subject))
				query.addCriteria(Criteria.where("subject").is(subject));
			if(StringUtils.isNotBlank(status))
				query.addCriteria(Criteria.where("status").is(status));
			return (int) mongoTemplate.count(query, EmailTemplate.class);
		}catch(Exception e){
			e.printStackTrace();
		}		
		return 0;
	}


	@Override
	public List<EmailTemplate> findEmailTemplates(String name, String subjectId,
			String subject,String status, int offset, int limit) {
		Query query = new Query();
		
		if(StringUtils.isNotBlank(name))
			query.addCriteria(Criteria.where("name").is(name));
		if(StringUtils.isNotBlank(subjectId))
			query.addCriteria(Criteria.where("subjectId").is(subjectId));
		if(StringUtils.isNotBlank(subject))
			query.addCriteria(Criteria.where("subject").is(subject));
		if(StringUtils.isNotBlank(status))
			//query.addCriteria(Criteria.is("status").regex(status));
			query.addCriteria(Criteria.where("status").is(status));
	
		if(offset>0)
			query.skip(offset);
		if(limit > 0)
			query.limit(limit);
		
		System.out.println(query);
		List<EmailTemplate> emailTemplates = mongoTemplate.find(query, EmailTemplate.class);
		if(emailTemplates!=null){
			for(EmailTemplate emailTemplate : emailTemplates){
				if(emailTemplate.getCreated_time() != null)
				   emailTemplate.setCreated_time(Utils.mongoDbTimeToDisplayTime(emailTemplate.getCreated_time()));
				if(emailTemplate.getUpdated_time() != null)
				   emailTemplate.setUpdated_time(Utils.mongoDbTimeToDisplayTime(emailTemplate.getUpdated_time()));
		    }		
		}
		return emailTemplates;
	}


	@Override
	public List<EmailTemplate> findTempDataBySubjectId(String subjectId) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_subjectId").is(StringUtils.trimToEmpty(subjectId)));
		List<EmailTemplate> emailTemplates = mongoTemplate.find(query, EmailTemplate.class);
		if(emailTemplates!=null)
			for(EmailTemplate emailTemplate : emailTemplates){
			if(emailTemplate.getCreated_time() != null )
			   emailTemplate.setCreated_time(Utils.mongoDbTimeToDisplayTime(emailTemplate.getCreated_time()));
			if(emailTemplate.getUpdated_time() != null)
			   emailTemplate.setUpdated_time(Utils.mongoDbTimeToDisplayTime(emailTemplate.getUpdated_time()));
		}
		return emailTemplates;
	}

}
