package vn.onepay.web.secure.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import vn.onepay.cashflow.model.CashFlowCategory;
import vn.onepay.cashflow.model.CashFlowRecord;
import vn.onepay.cashflow.model.CashFlowReport;

public class CashFlowManagementController extends AbstractCashFlowManagement{
	
	private int limit;
	public void setLimit(int limit){
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
		CashFlowRecord record = cashFlowRecordDAO.findCashFlowRecord(record_id);
		if(record != null){
			record.setStatus(2);
			cashFlowRecordDAO.save(record);
			
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
		CashFlowCategory cate = cashFlowCategoryDAO.findById(category_id);
		if(cate != null){
			List<CashFlowCategory> cate_childs = cashFlowCategoryDAO.fetchChilds(cate);
			List<CashFlowRecord> cate_records = cashFlowRecordDAO.findCashFlowRecords(cate.getId());
			
			int st = 0;
			if((cate_childs == null || cate_childs.size() == 0) && (cate_records == null || cate_records.size() == 0)){
				cashFlowCategoryDAO.delete(cate);
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
		
		String cate_type = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("cate_type"));
		
		Tab tab = Tab.valueOf(tabRequest);
		switch(tab){
		case revenue:
			paramModelMap.put("tabActive", "Thu");
			tabActive(paramHttpServletRequest, paramModelMap, CashFlowCategory.REVENUE_TYPE, cate_type);
			break;
		case cost:
			paramModelMap.put("tabActive", "Chi");
			tabActive(paramHttpServletRequest, paramModelMap, CashFlowCategory.COST_TYPE, cate_type);
			break;
		case amount:
			paramModelMap.put("tabActive", "Tong Hop");
			amountTabActive(paramHttpServletRequest, paramModelMap);
			break;
		/*default:
			paramModelMap.put("tabActive", "Thu");
			tabActive(paramHttpServletRequest, paramModelMap, CashFlowCategory.REVENUE_TYPE, "");
			break;*/
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
	private void generateReports(HttpServletRequest paramHttpServletRequest, HttpServletResponse response, ModelMap model, String tab) throws ParsePropertyException, InvalidFormatException, IOException {
		//If Amount
		/*if(tab.compareTo(Tab.amount.name()) == 0){
			List<CashFlowRecord> amount = (List<CashFlowRecord>)model.get("amount");
			export(amount, "report", CashFlowManagementController.class.getResourceAsStream("/vn/onepay/cashflow/template/report_amount.xls"), response, model);
			return;
		}*/
		//else
		Map<CashFlowCategory , Map> map = new LinkedMap();
		List<CashFlowRecord> resultList = new ArrayList<CashFlowRecord>();
		
		map = (Map<CashFlowCategory , Map>)model.get("categoryMap");
		resultList = (List<CashFlowRecord>)model.get("recordList");
		
		List<CashFlowReport> reports = new ArrayList<CashFlowReport>();
		
		if(tab.compareTo(Tab.amount.name()) != 0)
			getReport(map, resultList, reports, 0, model, "");
		else
			getReport(map.get(null), resultList, reports, 0, model, "amount");
		
		System.out.print("SIZE___________: " + reports.size());
		
		//Save
		export(reports, "report", CashFlowManagementController.class.getResourceAsStream("/vn/onepay/cashflow/template/report.xls"), response, model);
		
	}

	private void export(List<?> dataList, String dataKey, InputStream templateInputStream, HttpServletResponse response, ModelMap model) throws ParsePropertyException, InvalidFormatException, IOException {
		
		String tab = StringUtils.trimToEmpty((String)model.get("tabActive"));
		String periodStr = (String)model.get("periods");
		String month_year = (String)model.get("monthYear");
		
		Map<String, Object> beans = new HashMap<String, Object>();
        beans.put(dataKey, dataList);
        beans.put("periods", periodStr);
        beans.put("monthYear", month_year);
        
        if(tab.toLowerCase().equals("thu"))
        	beans.put("tab", "THU");
        if(tab.toLowerCase().equals("chi"))
        	beans.put("tab", "CHI");
        if(tab.toLowerCase().equals("tong hop"))
        	beans.put("tab", "TỔNG HỢP");
        
		XLSTransformer transformer = new XLSTransformer();
		Workbook workbook = transformer.transformXLS(templateInputStream, beans);
        //
        String fileName = "Bao_cao_"+tab.toLowerCase()+"_" + periodStr+ "_" + month_year.replace("/", "-") + ".xls";
        //Download file
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename="+fileName);
        OutputStream outputStream = response.getOutputStream();
        //Write to hardware
        /*OutputStream outputStream = new FileOutputStream(desFilePath);*/
        
        workbook.setSheetName(0, fileName.substring(0, fileName.lastIndexOf(".")));
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        
        System.out.println("Export is OK!");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void getReport(Map<CashFlowCategory, Map> map, List<CashFlowRecord> resultList, List<CashFlowReport> reports, int level, ModelMap paramModelMap, String amount) {
		//category like key
		if(map != null && map.size() > 0){
			int index = 0;
			for(CashFlowCategory category : map.keySet()){
				
				if(category == null ){
					return;
				}
				
				if(category.getFirst_period() == 0 && category.getIn_period() == 0 && category.getLast_period() == 0)
					continue;
				
				CashFlowReport report = new CashFlowReport();
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
					for(CashFlowRecord record : resultList){
						if(record.getRequest().compareTo(CashFlowRecord.ACCEPTED) == 0)
							if(record.getCategory_id().compareTo(category.getId()) == 0){
								String space = "";
								if(index > 3)
									for(int i = 4; i< index; i++)
										space += "   ";
								
								CashFlowReport report1 = new CashFlowReport(); 
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
				if(!amount.equals("amount"))
					getReport(map.get(category), resultList, reports, level+1, paramModelMap, amount);
				else{
					if(!category.getType().equals(CashFlowCategory.COST_TYPE) && !category.getType().equals(CashFlowCategory.REVENUE_TYPE)){
						getReport(map.get(category), resultList, reports, level+1, paramModelMap, amount);
					}
				}
					
			}
		}
		
	}

	private void cloneRecords(String period, String monthYear) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("MM/yyyy");
		
		List<CashFlowRecord> records = new ArrayList<CashFlowRecord>();
		records = cashFlowRecordDAO.findAllCashFlowRecordsInRevenueAndCostType(getLastPeriod(period), getLastMonthYear(monthYear));
		
		Date mYear = df.parse(monthYear);
		
		if(records != null && records.size() > 0)
			for(CashFlowRecord object : records){
				CashFlowRecord mfr = cashFlowRecordDAO.findCashFlowRecord(period, mYear, object.getType(), object.getCategory_id());
				
				if(mfr != null)
					continue;
				
				object.setFirst_period(object.getLast_period());
				object.setIn_period(0);
				object.setLast_period(0);
				object.setId(null);
				object.setMonth_year(mYear);
				object.setPeriod(period);
				object.setRequest(CashFlowRecord.REQUESTING);
				
				cashFlowRecordDAO.save(object);
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
		
		//Other cates
		String cate_type = StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("cate_type"));
		if(getOtherCateTypes().keySet().contains(cate_type)){
			tabActive(paramHttpServletRequest, paramModelMap, cate_type, "cate");
		}
		else
			tabActive(paramHttpServletRequest, paramModelMap, "", "");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void tabActive(HttpServletRequest paramHttpServletRequest, ModelMap paramModelMap, String type, String cate){
		int page = paramToInt(paramHttpServletRequest.getParameter("page"));
		
		List<CashFlowRecord> resultList = new ArrayList<CashFlowRecord>();
		List<CashFlowRecord> records = new ArrayList<CashFlowRecord>();
		
		if(cate.equals("cate")){
			CashFlowCategory root = cashFlowCategoryDAO.findRootCategory(type);
			
			if(root == null){
				paramModelMap.put("categoryMap", null);
				return;
			}
			else{
				
				Map<CashFlowCategory , Map> map = new LinkedMap();
				map = addChilds(root, new LinkedMap(),resultList);
				
				paramModelMap.put("categoryMap", map);
				return;
			}
		}
		
		if(type.equals(""))
			records = cashFlowRecordDAO.findAllCashFlowRecords();
		else	
			records = cashFlowRecordDAO.findAllCashFlowRecords(type);
		
		//SEARCH
		search(paramHttpServletRequest, records, resultList, paramModelMap);
		
		//GET ROOT
		CashFlowCategory root = cashFlowCategoryDAO.findRootCategory(type);
		
		Map<CashFlowCategory , Map> map = new LinkedMap();
		
		//if(root != null)
		if((type.equals(CashFlowCategory.COST_TYPE) || type.equals(CashFlowCategory.COST_TYPE))){
			if(root != null)
				map = addChilds(root, new LinkedMap(),resultList);
		}
		else
			map = addChilds(root, new LinkedMap(),resultList);
		
		
		paramModelMap.put("categoryMap", map);
		
		paramModelMap.put("recordList", resultList);
		paramModelMap.put("size", records.size());
		
		if(page <= 0) page = 1;
		paramModelMap.put("offset", limit * (page-1));
	}
	
	private void search(HttpServletRequest paramHttpServletRequest, List<CashFlowRecord> records, List<CashFlowRecord> resultList, ModelMap paramModelMap){
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
//			int month = date.getMonth() + 1;
//			int year =  date.getYear() + 1900;
			
			String today = df.format(date);
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
				for(CashFlowRecord obj : records){
					if(periods.contains(obj.getPeriod()))
						resultList.add(obj);
					
				}
			else{
				for(CashFlowRecord obj : records){
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
				for(CashFlowRecord obj : records){
					if(obj.getMonth_year() != null && df.format(obj.getMonth_year()).compareTo(month_year) == 0)
						resultList.add(obj);
				}
			}
		}
				
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private Map<CashFlowCategory , Map> addChilds(CashFlowCategory root, Map mapTmp, List<CashFlowRecord> resultList){
		//Get Amount
		setAmountRoot(root, resultList);
		
		//Get Childs
		List<CashFlowCategory> childs = cashFlowCategoryDAO.fetchChilds(root);
		
		if(childs == null || childs.size() == 0){
			mapTmp.put(root, null);
			return mapTmp;
		}
		else{
			
		}
		
		for(CashFlowCategory mf : childs){
			mapTmp.putAll(addChilds(mf, new LinkedMap(), resultList));
		}
		
		Map tmp = new LinkedMap();
		tmp.put(root, mapTmp);
		
		return tmp;
	}
	
	private void setAmountRoot(CashFlowCategory root, List<CashFlowRecord> resultList){
		List<CashFlowCategory> childs = cashFlowCategoryDAO.fetchChilds(root);
		
		if(childs == null || childs.size() == 0){
			if(root != null){
				List<CashFlowRecord> records = cashFlowRecordDAO.findCashFlowRecords(root.getId());
				calculator(root, records, resultList);
			}
			return;
		}
		
		for(CashFlowCategory tmp : childs){
			setAmountRoot(tmp, resultList);
		}
		
		//Get of record child
		if(root != null){
			List<CashFlowRecord> records = cashFlowRecordDAO.findCashFlowRecords(root.getId());
			calculator(root, records, resultList);
		}
		
		//Get of child
		for(CashFlowCategory tmp : childs){
			if(root != null){
				root.setFirst_period(root.getFirst_period() + tmp.getFirst_period());
				root.setLast_period(root.getLast_period() + tmp.getLast_period());
				root.setIn_period(root.getIn_period() + tmp.getIn_period());
					
				root.setSum_requesting(root.getSum_requesting() + tmp.getSum_requesting());
			}
		}
		
	}
	
	private void calculator(CashFlowCategory root, List<CashFlowRecord> records, List<CashFlowRecord> resultList){
		int requesting = 0;
		for(CashFlowRecord tmp : records){
			for(CashFlowRecord result : resultList){
				if(result.getId().compareTo(tmp.getId()) == 0 && result.getRequest().compareTo(CashFlowRecord.REJECTED) != 0){
					if(result.getRequest().compareTo(CashFlowRecord.ACCEPTED) == 0){
						root.setFirst_period(root.getFirst_period() + tmp.getFirst_period());
						root.setLast_period(root.getLast_period() + tmp.getLast_period());
						root.setIn_period(root.getIn_period() + tmp.getIn_period());
					}
					if(result.getRequest().compareTo(CashFlowRecord.REQUESTING) == 0){
						root.setSum_requesting(++requesting + root.getSum_requesting());
						
					}
				}
				
					
			}
		}
	}
}
