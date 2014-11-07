package vn.onepay.dev.dao;

import java.util.List;

import vn.onepay.dev.model.DevCategory;

public interface DevCategoryDAO {
	String BEAN_NAME = "devCategoryDAO";
	
	//Dev category
	void save(DevCategory devCategory);
	DevCategory findDevCategoryById(String id);
	//------
	int 				findTotalDevCategoriesByName	(String categoryName);
	List<DevCategory> 	findDevCategoriesByName			(String categoryName, int offset, int limit);
	
	int 				findTotalDevCategoriesByType	(String categoryType);
	List<DevCategory> 	findDevCategoriesByType			(String categoryType, int offset, int limit);
	
	int 				findTotalChildDevCategories		(DevCategory parent, boolean recursive);
	List<DevCategory> 	findChildDevCategories			(DevCategory parent, boolean recursive, int offset, int limit);
	
	int 				findTotalDevCategories			(String categoryName, List<String> categoryType, DevCategory parent, List<String> status, boolean recursive);
	List<DevCategory> 	findDevCategories				(String categoryName, List<String> categoryType, DevCategory parent, List<String> status, boolean recursive, int offset, int limit);
	
	//Dev category
}
