package vn.onepay.web.secure.api;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.cashflow.model.CashFlowCategory;
import vn.onepay.cashflow.model.CashFlowRecord;
import vn.onepay.common.SharedConstants;
import vn.onepay.web.secure.controllers.AbstractCashFlowManagement;

public class CashFlowManagementAjax extends AbstractCashFlowManagement{
	private enum Action{
		CATEGORY_MANAGE, RECORD_MANAGE, RECORD_REPORT
	}
	@Override
	protected ModelAndView handleRequest(
			HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, ModelMap paramModelMap)
			throws Exception {
		
		System.out.print("AJAXXXXX______");
		
		Account account = (Account) paramHttpServletRequest.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		paramHttpServletResponse.setContentType("text/html");
//		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		
		String actionRequest = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("action"));
		if(StringUtils.isEmpty(actionRequest)) {
			paramHttpServletResponse.setContentType("text/html");
			paramHttpServletResponse.getOutputStream().write("0".getBytes());
			return null;
		}
		Action action = Action.valueOf(actionRequest);
		switch(action){
		case CATEGORY_MANAGE:
			handlingCategory(paramHttpServletRequest, paramHttpServletResponse, account);
			break;
		case RECORD_MANAGE:
			handlingRecord(paramHttpServletRequest, paramHttpServletResponse, account);
			break;
		case RECORD_REPORT:
			handlingReport(paramHttpServletRequest, paramHttpServletResponse, account);
			break;
		}
		
		return null;
	}
	
	private void handlingCategory(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Account account) throws IOException {
		paramHttpServletResponse.setContentType("text/html");
		
		String parent_id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("parent_id"));
		
		String id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("id"));
		String title = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("title"));
		String type = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("type"));
		
		String code_name = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("code_name"));
		
		String index = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("index"));
		
		CashFlowCategory moneyFlowCategory = null;
		CashFlowCategory parent = cashFlowCategoryDAO.findById(parent_id);
		
		int editCodeName = 0;
		if(id.compareTo("") != 0){
			moneyFlowCategory = cashFlowCategoryDAO.findById(id);
			
			//parent is parent
			if(parent_id.compareTo(id) == 0){
				paramHttpServletResponse.getOutputStream().write("3".getBytes());
				return;
			}
			
			moneyFlowCategory.setParentCategory(parent);
			
			//Check code name
			//Check exist
			if(code_name.compareTo(moneyFlowCategory.getCode_name()) != 0)
				if((StringUtils.isNotBlank(code_name))){
					if(cashFlowCategoryDAO.findByCode(code_name) == null){
						editCodeName = 1;
						moneyFlowCategory.setCode_name(code_name);
					}
						
					else{
						paramHttpServletResponse.getOutputStream().write("4".getBytes());
						return;
					}
				}
				else{
					paramHttpServletResponse.getOutputStream().write("5".getBytes());
					return;
				}
		}
		else{
			moneyFlowCategory = new CashFlowCategory();
			moneyFlowCategory.setCreated_time(new Date());
			
			
			//Check ROOT
			if(parent == null){
				CashFlowCategory root = cashFlowCategoryDAO.findRootCategory(type);
				if(root == null){
					moneyFlowCategory.setParentCategory(parent);
					moneyFlowCategory.setType(type);
				}
				else{
					paramHttpServletResponse.getOutputStream().write("2".getBytes());
					return;
				}
			}
			else{
				moneyFlowCategory.setParentCategory(parent);
				moneyFlowCategory.setType(parent.getType());
			}
			
			//Check code name
			//Check exist
			if((StringUtils.isNotBlank(code_name))){
				if(cashFlowCategoryDAO.findByCode(code_name) == null)
					moneyFlowCategory.setCode_name(code_name);
				else{
					paramHttpServletResponse.getOutputStream().write("4".getBytes());
					return;
				}
			}
			else{
				paramHttpServletResponse.getOutputStream().write("5".getBytes());
				return;
			}
			
		}
		
		try{
			
			int indexInt = Integer.parseInt(index);
			moneyFlowCategory.setIndex(indexInt);
		}
		catch(Exception e){
			e.printStackTrace();
			paramHttpServletResponse.getOutputStream().write("0".getBytes());
			return ;
		}
		
		moneyFlowCategory.setTitle(title);
		
		moneyFlowCategory.setStatus(1);
		moneyFlowCategory.setUpdated_time(new Date());
		moneyFlowCategory.setAccount(account.getUsername());
		
		
		
		cashFlowCategoryDAO.save(moneyFlowCategory);
		
		//Update code name for all childs and records
		if(editCodeName == 1){
			cashFlowRecordDAO.updateCodeName(moneyFlowCategory);
		}
		paramHttpServletResponse.getOutputStream().write("1".getBytes());
		
	}
	
	
	private void handlingRecord(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Account account) throws IOException, ParseException {
		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		
		String parent_id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("parent_id"));
		
		String id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("id"));
		//new title
		String title = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("title"));
		String description = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("description"));
//		String code_name = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("number_code"));
		
		String first_period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("first_period"));
		String in_period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("in_period"));
		String last_period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("last_period"));
		
		String period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("period"));
		String month_year = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("month_year"));
		
		String requestStatus = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("request"));
		
		CashFlowRecord moneyFlowRecord = null;
		CashFlowCategory parent = cashFlowCategoryDAO.findById(parent_id);
		//Check not parent
		if(parent == null){
			paramHttpServletResponse.getOutputStream().write("3".getBytes());
			return;
		}
		if(id.compareTo("") == 0){
			//Check exist
			CashFlowRecord mfr = cashFlowRecordDAO.findCashFlowRecord(period, df.parse(month_year), parent.getType(), parent_id);
			if(mfr != null){
				paramHttpServletResponse.getOutputStream().write("2".getBytes());
				return ;
			}
			
			moneyFlowRecord = new CashFlowRecord();
			moneyFlowRecord.setCreated_time(new Date());
			moneyFlowRecord.setType(parent.getType());
			moneyFlowRecord.setStatus(1);
			
			if(requestStatus.compareTo(CashFlowRecord.REJECTED) == 0 )
				moneyFlowRecord.setStatus(2);
			else
				moneyFlowRecord.setRequest(requestStatus);
			
			//Check numbercode
			/*if(number_code.compareTo(parent.getCode_name()) == 0)
				moneyFlowRecord.setNumber_code(number_code);
			else{
				paramHttpServletResponse.getOutputStream().write("5".getBytes());
				return ;
			}*/
		}
		else{
			moneyFlowRecord = cashFlowRecordDAO.findCashFlowRecord(id);
			
			//Check exist
			if(period.compareTo(moneyFlowRecord.getPeriod()) != 0 || df.format(moneyFlowRecord.getMonth_year()).compareTo(month_year) != 0 || parent_id.compareTo(moneyFlowRecord.getCategory_id()) != 0){
				CashFlowRecord mfr = cashFlowRecordDAO.findCashFlowRecord(period, df.parse(month_year), parent.getType(), parent_id);
				if(mfr != null){
					paramHttpServletResponse.getOutputStream().write("2".getBytes());
					return ;
				}
			}
			
			if(requestStatus.compareTo(CashFlowRecord.REQUESTING) == 0 || requestStatus.compareTo(CashFlowRecord.ACCEPTED) == 0 || requestStatus.compareTo(CashFlowRecord.REJECTED) == 0){
				moneyFlowRecord.setRequest(requestStatus);
				if(requestStatus.compareTo(CashFlowRecord.REJECTED) == 0 )
					moneyFlowRecord.setStatus(2);
			}
			else
				moneyFlowRecord.setRequest(CashFlowRecord.REQUESTING);
			
		}
		
		try{
			float f = Float.parseFloat(first_period);
			float i = Float.parseFloat(in_period);
			float l = Float.parseFloat(last_period);
			moneyFlowRecord.setFirst_period(f);
			moneyFlowRecord.setIn_period(i);
			moneyFlowRecord.setLast_period(l);
			
			//Set month year
			moneyFlowRecord.setMonth_year(df.parse(month_year)); 
		}
		catch(Exception e){
			e.printStackTrace();
			paramHttpServletResponse.getOutputStream().write("0".getBytes());
			return ;
		}
		
		moneyFlowRecord.setTitle(title);
			
		moneyFlowRecord.setDescription(description);
		
		moneyFlowRecord.setCategory_id(parent_id);
		moneyFlowRecord.setCode_name(parent.getCode_name());
		moneyFlowRecord.setPeriod(period);
		moneyFlowRecord.setAccount(account.getUsername());
		
		moneyFlowRecord.setUpdated_time(new Date());
		
		cashFlowRecordDAO.save(moneyFlowRecord);
		
		paramHttpServletResponse.getOutputStream().write("1".getBytes());
	}
	
	private void handlingReport(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Account account) throws IOException, ParseException {
		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		
		String type = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("type"));
		
		String id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("id"));
		//new title
		String title = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("title"));
		String description = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("description"));
		String code_name = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("number_code"));
		
		String first_period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("first_period"));
		String in_period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("in_period"));
		String last_period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("last_period"));
		
		String period = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("period"));
		String month_year = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("month_year"));
		
		//String requestStatus = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("request"));
		
		if(StringUtils.isNotBlank(type)){
			if(type.toLowerCase().compareTo(CashFlowCategory.COST_TYPE.toLowerCase()) == 0 || type.toLowerCase().compareTo(CashFlowCategory.REVENUE_TYPE.toLowerCase()) == 0){
				paramHttpServletResponse.getOutputStream().write("3".getBytes());
				return ;
			}
				
		}
		else{
			paramHttpServletResponse.getOutputStream().write("4".getBytes());
			return ;
		}
		CashFlowRecord moneyFlowRecord = null;
		if(id.compareTo("") == 0){
			//Check exist
			CashFlowRecord mfr = cashFlowRecordDAO.findCashFlowRecord(period, df.parse(month_year), type);
			if(mfr != null){
				paramHttpServletResponse.getOutputStream().write("2".getBytes());
				return ;
			}
			
			moneyFlowRecord = new CashFlowRecord();
			moneyFlowRecord.setCreated_time(new Date());
			
			moneyFlowRecord.setRequest(CashFlowRecord.REQUESTING);
			moneyFlowRecord.setStatus(1);
		}
		else{
			moneyFlowRecord = cashFlowRecordDAO.findCashFlowRecord(id);
			
			//Check exist
			if(type.toLowerCase().compareTo(moneyFlowRecord.getType()) != 0 || period.compareTo(moneyFlowRecord.getPeriod()) != 0 || df.format(moneyFlowRecord.getMonth_year()).compareTo(month_year) != 0){
				CashFlowRecord mfr = cashFlowRecordDAO.findCashFlowRecord(period, df.parse(month_year), type);
				if(mfr != null){
					paramHttpServletResponse.getOutputStream().write("2".getBytes());
					return ;
				}
			}
			
			/*if(requestStatus.compareTo(MoneyFlowRecord.REQUESTING) == 0 || requestStatus.compareTo(MoneyFlowRecord.ACCEPTED) == 0 || requestStatus.compareTo(MoneyFlowRecord.REJECTED) == 0){
				moneyFlowRecord.setRequest(requestStatus);
				if(requestStatus.compareTo(MoneyFlowRecord.REJECTED) == 0 )
					moneyFlowRecord.setStatus(2);
			}
			else
				moneyFlowRecord.setRequest(MoneyFlowRecord.REQUESTING);*/
		}
		
		try{
			float f = Float.parseFloat(first_period);
			float i = Float.parseFloat(in_period);
			float l = Float.parseFloat(last_period);
			moneyFlowRecord.setFirst_period(f);
			moneyFlowRecord.setIn_period(i);
			moneyFlowRecord.setLast_period(l);
			
			//Set month year
			moneyFlowRecord.setMonth_year(df.parse(month_year)); 
		}
		catch(Exception e){
			e.printStackTrace();
			paramHttpServletResponse.getOutputStream().write("0".getBytes());
			return ;
		}
		
		moneyFlowRecord.setType(type);
		moneyFlowRecord.setCode_name(code_name);
		moneyFlowRecord.setDescription(description);
		
		moneyFlowRecord.setTitle(title);
		
		moneyFlowRecord.setCategory_id("");
		moneyFlowRecord.setPeriod(period);
		moneyFlowRecord.setAccount(account.getUsername());
		
		moneyFlowRecord.setUpdated_time(new Date());
		
		cashFlowRecordDAO.save(moneyFlowRecord);
		
		paramHttpServletResponse.getOutputStream().write("1".getBytes());
	}
	
}
