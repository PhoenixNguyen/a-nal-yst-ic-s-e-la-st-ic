package vn.onepay.money.flow.management.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.commons.collections.map.LinkedMap;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.money.flow.management.model.MoneyFlowCategory;
import vn.onepay.money.flow.management.model.MoneyFlowRecord;
import vn.onepay.money.flow.management.model.Report;

public class MoneyFlowManagementController extends AbstractMoneyFlowManagement{

	private int limit;
	public void setLimit(int limit)
	{
	    this.limit = limit;
	}
	
	private enum Tab{
		revenue, cost, amount
	}
	@Override
	protected ModelAndView handleRequest(
			HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, ModelMap paramModelMap)
			throws Exception {
		
		//Delete record
		String record_id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("delete_record"));
		MoneyFlowRecord record = moneyFlowRecordDAO.findMoneyFlowRecord(record_id);
		if(record != null){
			record.setStatus(2);
			moneyFlowRecordDAO.save(record);
			
			//delete
			String url = paramHttpServletRequest.getQueryString();
			String backURL = (url.substring(url.indexOf("backURL=")).substring(8)); 
			
			paramHttpServletRequest.getSession().setAttribute("delete_record_status", 1);
			System.out.print("backURL: " + backURL);
			return new ModelAndView("redirect:" + backURL, "model", paramModelMap);
		}
		
		int delete_record_status = Integer.parseInt(paramHttpServletRequest.getSession().getAttribute("delete_record_status") == null?
				"0":paramHttpServletRequest.getSession().getAttribute("delete_record_status")+ "");
		paramModelMap.put("delete_record_status", delete_record_status);
		paramHttpServletRequest.getSession().setAttribute("delete_record_status", 0);
		
		//Delete Category if not contains childs and not contains records
		String category_id = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("delete_category"));
		MoneyFlowCategory cate = moneyFlowCategoryDAO.findMoneyFlowCategory(category_id);
		if(cate != null){
			List<MoneyFlowCategory> cate_childs = moneyFlowCategoryDAO.fetchChilds(cate);
			List<MoneyFlowRecord> cate_records = moneyFlowRecordDAO.findMoneyFlowRecords(cate.getId());
			
			int st = 0;
			if((cate_childs == null || cate_childs.size() == 0) && (cate_records == null || cate_records.size() == 0)){
				moneyFlowCategoryDAO.delete(cate);
				st = 1;
			}
			else
				st = 2;
			
			//delete
			String url = paramHttpServletRequest.getQueryString();
			String backURL = (url.substring(url.indexOf("backURL=")).substring(8)); 
			
			paramHttpServletRequest.getSession().setAttribute("delete_cate_status", st);
			System.out.print("backURL: " + backURL);
			return new ModelAndView("redirect:" + backURL, "model", paramModelMap);
		}
		
		int delete_cate_status = Integer.parseInt(paramHttpServletRequest.getSession().getAttribute("delete_cate_status")==null?
				"0":paramHttpServletRequest.getSession().getAttribute("delete_cate_status")+ "");
		paramModelMap.put("delete_cate_status", delete_cate_status);
		paramHttpServletRequest.getSession().setAttribute("delete_cate_status", 0);
		
		//Response curr URL
		String currQuery = paramHttpServletRequest.getQueryString();
		if(StringUtils.isNotBlank(currQuery))
			paramModelMap.put("currURL", paramHttpServletRequest.getRequestURL() +"?" + currQuery);
		else
			paramModelMap.put("currURL", paramHttpServletRequest.getRequestURL());
		
		
		String tabRequest = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("tab"));
		if(tabRequest == null || tabRequest.compareTo("") == 0)
			tabRequest = "revenue";
		
		Tab tab = Tab.valueOf(tabRequest);
		switch(tab){
		case revenue:
			paramModelMap.put("tabActive", "Thu");
			revenueTabActive(paramHttpServletRequest, paramModelMap, MoneyFlowCategory.REVENUE_TYPE);
			break;
		case cost:
			paramModelMap.put("tabActive", "Chi");
			revenueTabActive(paramHttpServletRequest, paramModelMap, MoneyFlowCategory.COST_TYPE);
			break;
		case amount:
			paramModelMap.put("tabActive", "Tong Hop");
			amountTabActive(paramHttpServletRequest, paramModelMap);
			break;
		default:
			paramModelMap.put("tabActive", "Thu");
			revenueTabActive(paramHttpServletRequest, paramModelMap, MoneyFlowCategory.REVENUE_TYPE);
			break;
		}
		initVariable(paramModelMap);
		
		//Export reports
		String action = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("action"));
		if(action.compareTo("export_reports") == 0){
			generateReports(paramHttpServletRequest,	paramHttpServletResponse, paramModelMap, tabRequest);
			return null;
		}
		
		//Send period list
		paramModelMap.put("periodList", getPeriodList());
		
		paramModelMap.put("pageSize", Integer.valueOf(this.limit));
		
		//cloneRecords TEST;
		//cloneRecords("15-1", "08/2014");
		
		return new ModelAndView(getWebView(), "model", paramModelMap);
		
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void generateReports(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse, ModelMap paramModelMap, String tab) throws ParsePropertyException, InvalidFormatException, IOException {
		String filePath = "/layouts/money-flow/report.xls";
		String filePathAmount = "/layouts/money-flow/report-amount.xls";
		
		ServletContext context = paramHttpServletRequest.getSession().getServletContext();
        String appPath = context.getRealPath("");
        System.out.print(appPath + filePath);
        
		//If Amount
		if(tab.compareTo(Tab.amount.name()) == 0){
			List<MoneyFlowRecord> amount = (List<MoneyFlowRecord>)paramModelMap.get("amount");
			export(amount, "report", appPath + filePathAmount, "P:\\Users\\HP\\Desktop/report.xls", paramHttpServletResponse, paramModelMap);
			return;
		}
		//else
		Map<MoneyFlowCategory , Map> map = new LinkedMap();
		List<MoneyFlowRecord> resultList = new ArrayList<MoneyFlowRecord>();
		
		map = (Map<MoneyFlowCategory , Map>)paramModelMap.get("categoryMap");
		resultList = (List<MoneyFlowRecord>)paramModelMap.get("recordList");
		
		List<Report> reports = new ArrayList<Report>();
		
		getReport(map, resultList, reports, 0, paramModelMap);
		
		System.out.print("SIZE___________: " + reports.size());
		
		//Save
		export(reports, "report", appPath + filePath, "P:\\Users\\HP\\Desktop/report_list.xls", paramHttpServletResponse, paramModelMap);
		
	}

	private void export(List<?> dataList, String dataKey, String tempFilePath, String desFilePath, HttpServletResponse paramHttpServletResponse, ModelMap paramModelMap) throws ParsePropertyException, InvalidFormatException, IOException {
		
		String tab = StringUtils.trimToEmpty((String)paramModelMap.get("tabActive"));
		String periodStr = (String)paramModelMap.get("periods");
		String month_year = (String)paramModelMap.get("monthYear");
		
		Map<String, Object> beans = new HashMap<String, Object>();
        beans.put(dataKey, dataList);
        beans.put("periods", periodStr);
        beans.put("monthYear", month_year);
        
		XLSTransformer transformer = new XLSTransformer();
        File tempFile = new File(tempFilePath);
        if(!tempFile.exists()) {
        	System.out.println("Template file not found!");
        	return;
        }
        
		Workbook workbook = transformer.transformXLS(new FileInputStream(tempFile), beans);
        //
        String fileName = "Bao Cao "+tab+" Chu ky " + periodStr+ "  - Thang " + month_year + ".xls";
        //Download file
        paramHttpServletResponse.setContentType("application/vnd.ms-excel");
        paramHttpServletResponse.setHeader("Content-Disposition", "attachment; filename="+fileName);
        OutputStream outputStream = paramHttpServletResponse.getOutputStream();
        //Write to hardware
        /*OutputStream outputStream = new FileOutputStream(desFilePath);*/
        
        workbook.setSheetName(0, fileName.substring(0, fileName.lastIndexOf(".")));
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        
        System.out.println("Export is OK!");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void getReport(Map<MoneyFlowCategory, Map> map, List<MoneyFlowRecord> resultList, List<Report> reports, int level, ModelMap paramModelMap) {
		//category like key
		if(map != null && map.size() > 0){
			int index = 0;
			for(MoneyFlowCategory category : map.keySet()){
				
				if(category == null ){
					return;
				}
				
				if(category.getFirst_period() == 0 && category.getIn_period() == 0 && category.getLast_period() == 0)
					continue;
				
				Report report = new Report();
				String stt = "";
				String titlePre = "";
				
				if(level== 1 || level == 2){
					Map<String , List<String>> levelMap = (Map<String , List<String>>)paramModelMap.get("level");
					stt = levelMap.get(level+"").get(index++);
					
					
				}
				if(level == 3){
					titlePre = "-";
				}
				
				if(level == 4){
					titlePre = "  +";				
				}
				
				if(level > 4){
					
					for(int i = 5; i< level; i++)
						titlePre += "   ";
				}
				report.setStt(stt);
				
				report.setContent(titlePre +" " + category.getTitle());
				report.setFirst_period(category.getFirst_period());
				report.setIn_period(category.getIn_period());
				report.setLast_period(category.getLast_period());
				//add
				reports.add(report);
				
				if(resultList != null && resultList.size() > 0){
					int indexRecord = 0;
					for(MoneyFlowRecord record : resultList){
						if(record.getRequest().compareTo(MoneyFlowRecord.ACCEPTED) == 0)
							if(record.getCategory_id().compareTo(category.getId()) == 0){
								String space = "";
								if(index > 3)
									for(int i = 4; i< index; i++)
										space += "   ";
								
								Report report1 = new Report(); 
								report1.setContent(space + (++indexRecord) + ". " + record.getTitle());
								report1.setFirst_period(record.getFirst_period());
								report1.setIn_period(record.getIn_period());
								report1.setLast_period(record.getLast_period());
								
								//add
								reports.add(report1);
							}
					}
				}
				
				//call next
				getReport(map.get(category), resultList, reports, level+1, paramModelMap);
			}
		}
		
	}

	private void cloneRecords(String period, String monthYear) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		
		List<MoneyFlowRecord> records = new ArrayList<MoneyFlowRecord>();
		records = moneyFlowRecordDAO.findAllMoneyFlowRecordsInRevenueAndCostType(getLastPeriod(period), getLastMonthYear(monthYear));
		
		Date mYear = df.parse(monthYear);
		
		if(records != null && records.size() > 0)
			for(MoneyFlowRecord object : records){
				MoneyFlowRecord mfr = moneyFlowRecordDAO.findMoneyFlowRecord(period, mYear, object.getType(), object.getCategory_id());
				
				if(mfr != null)
					continue;
				
				object.setFirst_period(object.getLast_period());
				object.setIn_period(0);
				object.setLast_period(0);
				object.setId(null);
				object.setMonth_year(mYear);
				object.setPeriod(period);
				object.setRequest(MoneyFlowRecord.REQUESTING);
				
				moneyFlowRecordDAO.save(object);
			}
	}
	
	private String getLastPeriod(String periodSearch){
		if(periodSearch.compareTo(getPeriodList().get(0)) == 0)
			return getPeriodList().get(1);
		else
			return getPeriodList().get(0);
		
	}
	
	private Date getLastMonthYear(String monthYearSearch) throws ParseException{
		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		Date search = df.parse(monthYearSearch);
		
		Calendar result = Calendar.getInstance();
		result.setTime(search);
		
		result.add(Calendar.MONTH, -1);
		
		return result.getTime();
		
	}

	private void amountTabActive(HttpServletRequest paramHttpServletRequest,
			ModelMap paramModelMap) {
		MoneyFlowCategory rootRevenue = moneyFlowCategoryDAO.findRootMoneyFlowCategory(MoneyFlowCategory.REVENUE_TYPE);
		MoneyFlowCategory rootCost = moneyFlowCategoryDAO.findRootMoneyFlowCategory(MoneyFlowCategory.COST_TYPE);
		
		//
		List<MoneyFlowRecord> resultListForRevenueRoot = new ArrayList<MoneyFlowRecord>();
		List<MoneyFlowRecord> recordsForRevenueRoot = new ArrayList<MoneyFlowRecord>();
		recordsForRevenueRoot = moneyFlowRecordDAO.findAllMoneyFlowRecords(MoneyFlowCategory.REVENUE_TYPE);
		
		//
		List<MoneyFlowRecord> resultListForCostRoot = new ArrayList<MoneyFlowRecord>();
		List<MoneyFlowRecord> recordsForCostRoot = new ArrayList<MoneyFlowRecord>();
		recordsForCostRoot = moneyFlowRecordDAO.findAllMoneyFlowRecords(MoneyFlowCategory.COST_TYPE);
		
		//SEARCH
		search(paramHttpServletRequest, recordsForRevenueRoot, resultListForRevenueRoot, paramModelMap);
		search(paramHttpServletRequest, recordsForCostRoot, resultListForCostRoot, paramModelMap);
		
		if(rootRevenue != null)	
			setAmountRoot(rootRevenue, resultListForRevenueRoot);
		else
			rootRevenue = new MoneyFlowCategory();
		if(rootCost != null)
			setAmountRoot(rootCost, resultListForCostRoot);
		else
			rootCost = new MoneyFlowCategory();
		
		
		//Add thu & chi to display
		List<MoneyFlowRecord> resultList = new ArrayList<MoneyFlowRecord>();
		List<MoneyFlowRecord> recordReportList = new ArrayList<MoneyFlowRecord>();
		
		recordReportList.addAll(moneyFlowRecordDAO.findMoneyFlowRecords(""));
		
		//SEARCH
		search(paramHttpServletRequest, recordReportList, resultList, paramModelMap);
		
		resultList.add(0, new MoneyFlowRecord(rootRevenue.getType(), rootRevenue.getTitle(), 
				rootRevenue.getFirst_period(), rootRevenue.getIn_period(), rootRevenue.getLast_period(), 
				rootRevenue.getAccount()));
		resultList.add(1, new MoneyFlowRecord(rootCost.getType(), rootCost.getTitle(), 
				-1*rootCost.getFirst_period(), -1*rootCost.getIn_period(), -1*rootCost.getLast_period(), 
				rootCost.getAccount()));
		
		//NEXT PAGE
		int page = paramToInt(paramHttpServletRequest.getParameter("d-49520-p"));
		if(page <= 0) page = 1;
		paramModelMap.put("offset", limit * (page-1));
		
		paramModelMap.put("amount", resultList);
		paramModelMap.put("size", resultList.size());
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void revenueTabActive(HttpServletRequest paramHttpServletRequest, ModelMap paramModelMap, String type){
		int page = paramToInt(paramHttpServletRequest.getParameter("page"));
		
		List<MoneyFlowRecord> resultList = new ArrayList<MoneyFlowRecord>();
		List<MoneyFlowRecord> records = new ArrayList<MoneyFlowRecord>();
		records = moneyFlowRecordDAO.findAllMoneyFlowRecords(type);
		
		//SEARCH
		search(paramHttpServletRequest, records, resultList, paramModelMap);
		
		//GET ROOT
		MoneyFlowCategory root = moneyFlowCategoryDAO.findRootMoneyFlowCategory(type);
		
		Map<MoneyFlowCategory , Map> map = new LinkedMap();
		
		if(root != null)
			map = addChilds(root, new LinkedMap(),resultList);
				
		paramModelMap.put("categoryMap", map);
		paramModelMap.put("recordList", resultList);
		paramModelMap.put("size", records.size());
		
		if(page <= 0) page = 1;
		paramModelMap.put("offset", limit * (page-1));
	}
	
	private void search(HttpServletRequest paramHttpServletRequest, List<MoneyFlowRecord> records, List<MoneyFlowRecord> resultList, ModelMap paramModelMap){
		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		//SEARCH
		//Month year
		String month_year = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("monthYearSearch"));
		//many periods
		List<String> periods = new ArrayList<String>();
		try{
			String[] arrCFs= paramHttpServletRequest.getParameterValues("periods");
			if(arrCFs!=null && arrCFs.length>0)
				periods = Arrays.asList(arrCFs);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//Set Default value
		if(month_year.compareTo("") == 0){
			Date date = new Date();
			int month = date.getMonth() + 1;
			int year =  date.getYear() + 1900;
			
			String today = (month < 10? "0"+month:month) + "/" + (year);
			month_year = today;
		}
		List<String> periodList = getPeriodList();
		if(periods.size() == 0 && periodList != null && periodList.size() > 0){
			periods.add(getPeriodList().get(0));
		}
		
		//Save period and month year
		String periodStr = "";
		
		for(String p : periods){
			periodStr += p + " ";
		}
		paramModelMap.put("periods", periodStr);
		paramModelMap.put("monthYear", month_year);
		
		//
		//If have period
		if (periods != null && periods.size() > 0){
			if(month_year.compareTo("") == 0)
				for(MoneyFlowRecord obj : records){
					if(periods.contains(obj.getPeriod()))
						resultList.add(obj);
					
				}
			else{
				for(MoneyFlowRecord obj : records){
					if(periods.contains(obj.getPeriod()) && obj.getMonth_year() != null && df.format(obj.getMonth_year()).compareTo(month_year) == 0)
						resultList.add(obj);
					
				}
			}
		}
		
		//if not choose period
		else{
			if(month_year.compareTo("") == 0)
				resultList.addAll(records);
			else{
				for(MoneyFlowRecord obj : records){
					if(obj.getMonth_year() != null && df.format(obj.getMonth_year()).compareTo(month_year) == 0)
						resultList.add(obj);
				}
			}
		}
				
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private Map<MoneyFlowCategory , Map> addChilds(MoneyFlowCategory root, Map mapTmp, List<MoneyFlowRecord> resultList){
		//Get Amount
		setAmountRoot(root, resultList);
		
		//Get Childs
		List<MoneyFlowCategory> childs = moneyFlowCategoryDAO.fetchChilds(root);
		
		if(childs == null || childs.size() == 0){
			mapTmp.put(root, null);
			return mapTmp;
		}
		else{
			
		}
		
		for(MoneyFlowCategory mf : childs){
			mapTmp.putAll(addChilds(mf, new LinkedMap(), resultList));
		}
		
		Map tmp = new LinkedMap();
		tmp.put(root, mapTmp);
		
		return tmp;
	}
	
	private void setAmountRoot(MoneyFlowCategory root, List<MoneyFlowRecord> resultList){
		List<MoneyFlowCategory> childs = moneyFlowCategoryDAO.fetchChilds(root);
		
		if(childs == null || childs.size() == 0){
			List<MoneyFlowRecord> records = moneyFlowRecordDAO.findMoneyFlowRecords(root.getId());
			calculator(root, records, resultList);
			return;
		}
		
		for(MoneyFlowCategory tmp : childs){
			setAmountRoot(tmp, resultList);
		}
		
		//Get of record child
		List<MoneyFlowRecord> records = moneyFlowRecordDAO.findMoneyFlowRecords(root.getId());
		calculator(root, records, resultList);
		
		//Get of child
		for(MoneyFlowCategory tmp : childs){
			
			root.setFirst_period(root.getFirst_period() + tmp.getFirst_period());
			root.setLast_period(root.getLast_period() + tmp.getLast_period());
			root.setIn_period(root.getIn_period() + tmp.getIn_period());
				
			root.setSum_requesting(root.getSum_requesting() + tmp.getSum_requesting());
		}
		
	}
	
	private void calculator(MoneyFlowCategory root, List<MoneyFlowRecord> records, List<MoneyFlowRecord> resultList){
		int requesting = 0;
		for(MoneyFlowRecord tmp : records){
			for(MoneyFlowRecord result : resultList){
				if(result.getId().compareTo(tmp.getId()) == 0 && result.getRequest().compareTo(MoneyFlowRecord.REJECTED) != 0){
					if(result.getRequest().compareTo(MoneyFlowRecord.ACCEPTED) == 0){
						root.setFirst_period(root.getFirst_period() + tmp.getFirst_period());
						root.setLast_period(root.getLast_period() + tmp.getLast_period());
						root.setIn_period(root.getIn_period() + tmp.getIn_period());
					}
					if(result.getRequest().compareTo(MoneyFlowRecord.REQUESTING) == 0){
						root.setSum_requesting(++requesting + root.getSum_requesting());
						
					}
				}
				
					
			}
		}
	}

}
