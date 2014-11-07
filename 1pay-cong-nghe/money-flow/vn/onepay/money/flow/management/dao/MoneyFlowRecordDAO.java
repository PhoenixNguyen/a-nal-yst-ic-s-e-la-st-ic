package vn.onepay.money.flow.management.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.money.flow.management.model.MoneyFlowCategory;
import vn.onepay.money.flow.management.model.MoneyFlowRecord;

public interface MoneyFlowRecordDAO {
	public void save(MoneyFlowRecord moneyFlowRecord);
	
	public List<MoneyFlowRecord> findAllMoneyFlowRecords();
	public List<MoneyFlowRecord> findAllMoneyFlowRecords(String type);
	
	public List<MoneyFlowRecord> findMoneyFlowRecords(String category_id);
	
	public MoneyFlowRecord findMoneyFlowRecord(String id);
	//month_year with format: MM/yyyy
	public MoneyFlowRecord findMoneyFlowRecord(String period, Date month_year);
	public MoneyFlowRecord findMoneyFlowRecord(String period, Date month_year, String type);
	public MoneyFlowRecord findMoneyFlowRecord(String period, Date month_year, String type, String category_id);
	
	public boolean update(MoneyFlowRecord moneyFlowRecord);
	
	public void delete(MoneyFlowRecord moneyFlowRecord);
	
	public List<MoneyFlowRecord> findAllMoneyFlowRecordsInRevenueAndCostType(String last_period, Date last_month_year);
	
	public void updateCodeName(MoneyFlowCategory cate);
}
