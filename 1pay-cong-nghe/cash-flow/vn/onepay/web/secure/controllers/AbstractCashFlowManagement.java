package vn.onepay.web.secure.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.LinkedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;

import vn.onepay.cashflow.dao.CashFlowCategoryDAO;
import vn.onepay.cashflow.dao.CashFlowRecordDAO;
import vn.onepay.cashflow.model.CashFlowCategory;
import vn.onepay.web.secure.controllers.AbstractProtectedController;

public abstract class AbstractCashFlowManagement extends AbstractProtectedController{
	protected CashFlowCategoryDAO cashFlowCategoryDAO;
	protected CashFlowRecordDAO cashFlowRecordDAO;
	public void setCashFlowCategoryDAO(CashFlowCategoryDAO cashFlowCategoryDAO) {
		this.cashFlowCategoryDAO = cashFlowCategoryDAO;
	}
	public void setCashFlowRecordDAO(CashFlowRecordDAO cashFlowRecordDAO) {
		this.cashFlowRecordDAO = cashFlowRecordDAO;
	}
	
	protected List<String> getPeriodList(){
		List<String> periodList = new ArrayList<String>();
		periodList.add("15-1");
		periodList.add("30-1");
		return periodList;
	}
	
	protected void initVariable(ModelMap paramModelMap){
		@SuppressWarnings("unchecked")
		Map<String , List<String>> level = new LinkedMap();
		
		List<String> level1List = new ArrayList<String>();
		level1List.add("I");
		level1List.add("II");
		level1List.add("III");
		level1List.add("IV");
		level1List.add("V");
		level1List.add("VI");
		level1List.add("VII");
		level1List.add("VIII");
		level1List.add("IX");
		level1List.add("X");
		level1List.add("XI");
		level1List.add("XII");
		level1List.add("XIII");
		level1List.add("XIV");
		
		List<String> level2List = new ArrayList<String>();
		level2List.add("A");
		level2List.add("B");
		level2List.add("C");
		level2List.add("D");
		level2List.add("E");
		level2List.add("F");
		level2List.add("G");
		level2List.add("H");
		level2List.add("I");
		level2List.add("J");
		level2List.add("K");
		level2List.add("L");
		level2List.add("M");
		level2List.add("N");
		level2List.add("M");
		level2List.add("O");
		level2List.add("P");
		level2List.add("Q");
		level2List.add("R");
		level2List.add("S");
		level2List.add("X");
		
		level.put("1", level1List);
		level.put("2", level2List);
		
		paramModelMap.put("level", level);
		
		//SET other cate
		paramModelMap.put("cateTypes", getOtherCateTypes());
		
		
	}
	
	protected int paramToInt(String str) {
		int number = 0;
		try {
			if (!StringUtils.isBlank(str) && StringUtils.isNumeric(str))
				number = Integer.parseInt(str);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		return number;
	}

	protected <T> T[] append(T[] arr, T element) {
		final int N = arr.length;
		arr = Arrays.copyOf(arr, N + 1);
		arr[N] = element;
		return arr;
	}
	
	@SuppressWarnings("rawtypes")
	protected Map getOtherCateTypes(){
		@SuppressWarnings("unchecked")
		Map<String , String> map = new LinkedMap();
		
		int i = 0;
		for(CashFlowCategory.CateType key : CashFlowCategory.CateType.values()){
			map.put(key.name(), "Danh mục " + ++i);
		}
		
		return map;
	}
}
