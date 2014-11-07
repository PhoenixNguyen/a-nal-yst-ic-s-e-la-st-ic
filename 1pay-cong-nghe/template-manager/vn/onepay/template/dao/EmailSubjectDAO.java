package vn.onepay.template.dao;

import java.util.List;

import vn.onepay.template.model.EmailSubject;

public interface EmailSubjectDAO {
	String BEAN_NAME = "tempNameDAO";
	
	public void save(EmailSubject emailSubject);
	public void delete(EmailSubject emailSubject);
	
	EmailSubject 			findEmailSubjectById			(String id);
	EmailSubject 			findEmailSubject				(String subject);
	
}
