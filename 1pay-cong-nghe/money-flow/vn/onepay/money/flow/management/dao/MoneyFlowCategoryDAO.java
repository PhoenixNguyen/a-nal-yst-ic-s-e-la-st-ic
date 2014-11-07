package vn.onepay.money.flow.management.dao;

import java.util.List;

import vn.onepay.money.flow.management.model.MoneyFlowCategory;

public interface MoneyFlowCategoryDAO {
	public void save(MoneyFlowCategory moneyFlowCategory);
	
	//ALL revenue & cost
	public List<MoneyFlowCategory> findAllMoneyFlowCategorys();
	//ALL revenue & cost
	public List<MoneyFlowCategory> findMoneyFlowCategorys(String parent_id);
	
	//revenue | cost only
	public List<MoneyFlowCategory> findMoneyFlowCategorys(String parent_id, String type);
	//revenue | cost only
	public List<MoneyFlowCategory> findAllMoneyFlowCategorys(String type);
	
	public MoneyFlowCategory findMoneyFlowCategory(String id);
	
	public boolean update(MoneyFlowCategory moneyFlowCategory);
	
	public void delete(MoneyFlowCategory moneyFlowCategory);
	
	public List<MoneyFlowCategory> fetchChilds(MoneyFlowCategory parent);
	public void updateChild(MoneyFlowCategory parent, boolean recursive);
	
	public MoneyFlowCategory findRootMoneyFlowCategory(String type);
	
	public MoneyFlowCategory findCategory(String code_name);
}
