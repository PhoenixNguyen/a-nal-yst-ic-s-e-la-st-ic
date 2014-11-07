package vn.onepay.template.dao;

import java.util.List;

import vn.onepay.template.model.EmailTemplate;

public interface EmailTempDAO {
	String BEAN_NAME = "emailTempDAO";

	void save(EmailTemplate emailTemplate);
	void delete(EmailTemplate emailTemplate);
	
	EmailTemplate findTempDataById(String id);

	List<EmailTemplate> findTempDataBySubjectId(String subjectId);
	
	public int         findTotalEmailTemplates     (String name, String subjectId, String subject, String status);
	List<EmailTemplate>     findEmailTemplates	   (String name, String subjectId, String subject, String status, int offset, int limit);
	
	
}
