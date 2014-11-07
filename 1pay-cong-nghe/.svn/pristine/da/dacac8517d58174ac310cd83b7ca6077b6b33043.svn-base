package vn.onepay.dev.dao;

import java.util.List;

import vn.onepay.dev.model.DevArticle;
import vn.onepay.dev.model.DevCategory;

public interface DevArticleDAO {
	String BEAN_NAME = "devArticleDAO";
	
	//Dev article
	void save(DevArticle devArticle);
	DevArticle findDevArticleById(String id);
	//------
	int 				findTotalDevArticles(List<DevCategory> devCategories, String articleTitle, List<String> status);
	List<DevArticle> 	findDevArticles		(List<DevCategory> devCategories, String articleTitle, List<String> status, int offset, int limit);
	//Dev article
}
