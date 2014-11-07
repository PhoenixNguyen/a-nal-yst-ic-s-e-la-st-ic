package vn.onepay.cashflow.dao;

import java.util.List;

import vn.onepay.cashflow.model.CashFlowCategory;

public interface CashFlowCategoryDAO {
	CashFlowCategory findById(String id);
	CashFlowCategory findByCode(String code_name);
	CashFlowCategory findRootCategory(String type);
	//-----------
	void save(CashFlowCategory cashFlowCategory);
	boolean update(CashFlowCategory cashFlowCategory);
	void delete(CashFlowCategory cashFlowCategory);
	//-----------
	//ALL revenue & cost
	public List<CashFlowCategory> findAllCashFlowCategories();
	//ALL revenue & cost
	public List<CashFlowCategory> fetchChilds(String parentId);
	public List<CashFlowCategory> fetchChilds(CashFlowCategory parent);
	public void updateChilds(CashFlowCategory parent, boolean recursive);
	//revenue | cost only
	public List<CashFlowCategory> findCashFlowCategories(String type);
	public List<CashFlowCategory> findCashFlowCategories(String parentId, String type);
	
	
	
	
	
	
	
}
