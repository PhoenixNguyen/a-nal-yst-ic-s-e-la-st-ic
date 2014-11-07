package vn.onepay.cashflow.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.cashflow.model.CashFlowCategory;
import vn.onepay.cashflow.model.CashFlowRecord;

public interface CashFlowRecordDAO {
	public void save(CashFlowRecord cashFlowRecord);
	
	public List<CashFlowRecord> findAllCashFlowRecords();
	public List<CashFlowRecord> findAllCashFlowRecords(String type);
	
	public List<CashFlowRecord> findCashFlowRecords(String category_id);
	
	public CashFlowRecord findCashFlowRecord(String id);
	//month_year with format: MM/yyyy
	public CashFlowRecord findCashFlowRecord(String period, Date month_year);
	public CashFlowRecord findCashFlowRecord(String period, Date month_year, String type);
	public CashFlowRecord findCashFlowRecord(String period, Date month_year, String type, String category_id);
	
	public boolean update(CashFlowRecord cashFlowRecord);
	
	public void delete(CashFlowRecord cashFlowRecord);
	
	public List<CashFlowRecord> findAllCashFlowRecordsInRevenueAndCostType(String last_period, Date last_month_year);
	
	public void updateCodeName(CashFlowCategory cate);
}
