package vn.onepay.search.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.LinkedMap;
import org.apache.commons.lang.StringUtils;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.data.elasticsearch.core.facet.result.IntervalUnit;
import org.springframework.data.elasticsearch.core.facet.result.Term;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.search.entities.ESSmsCdrFilter;
import vn.onepay.search.entities.FilterType;
import vn.onepay.search.entities.FilteringSMS;
import vn.onepay.search.service.ElasticSearchService;
import vn.onepay.web.secure.controllers.AbstractProtectedController;

public class SMSAnalyticController extends AbstractProtectedController {

  private ElasticSearchService elasticSearchService;

  public void setElasticSearchService(ElasticSearchService elasticSearchService) {
    this.elasticSearchService = elasticSearchService;
  }

  private int limit;

  public void setLimit(int limit) {
    this.limit = limit;
  }

  public static List<String> SMS_PLUS_PROVIDERS = Arrays.asList(new String[]{"mw_9029", "1pay_9029"});
  public static int DATE_FILTER_MAX = 31;
  
  public static int SUBCRIBER_TAB = 1;
  public static int MERCHANT_TAB = 2;
  
  public static int SMS_TAB = 1;
  public static int SMS_PLUS_TAB = 2;
  
  @SuppressWarnings({ "unused", "unchecked" })
  @Override
  protected ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, ModelMap model)
      throws Exception {
    Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
    if (account == null
        || !(account.isOperator() || account.isBizSupportManager() || account.isBizSupporter()
            || account.isCustomerCareManager() || account.isCustomerCare() || account.isBizManager() || account
              .isBizStaff()))
      return new ModelAndView("redirect:/");
    // ----------------------------
    Date start = new Date();
    model.put("status", Arrays.asList(new Integer[] { 0, 1, 2 }));
    model.put("DATE_FILTER_MAX", DATE_FILTER_MAX);
    
    // Option param
    String tab = StringUtils.trimToEmpty(request.getParameter("tab"));
    String pv_tab = StringUtils.trimToEmpty(request.getParameter("pv_tab"));
    
    String merchant = StringUtils.trimToEmpty(request.getParameter("filter_merchant"));
    String reservation = StringUtils.trimToEmpty(request.getParameter("reservation"));
    String filter_command_code = StringUtils.trimToEmpty(request.getParameter("filter_command_code"));
    String filter_msisdn = StringUtils.trimToEmpty(request.getParameter("filter_msisdn"));
    String filter_type = StringUtils.trimToEmpty(request.getParameter("filter_type"));
    
    int smsTab = pv_tab.equals("") || pv_tab.equalsIgnoreCase("sms") || !pv_tab.equalsIgnoreCase("smsplus") ? SMS_TAB:SMS_PLUS_TAB;
    int tabFilter = tab.equalsIgnoreCase("") || tab.equalsIgnoreCase("subscriber") || !tab.equalsIgnoreCase("merchant") ? SUBCRIBER_TAB:MERCHANT_TAB;
    model.put("tabFilter", tabFilter);
    
    //Show title pie with filter type
    Map<String , String> filterTypes = new LinkedMap();
    filterTypes.put(FilterType.OVER_03_MESSAGES_LIMIT_PER_05_MINUTES, "03 tin nhắn / 05 phút");
    filterTypes.put(FilterType.OVER_05_MESSAGES_LIMIT_PER_10_MINUTES, "05 tin nhắn / 10 phút");
    filterTypes.put(FilterType.OVER_30_MESSAGES_LIMIT_PER_60_MINUTES, "30 tin nhắn / 60 phút");
    if(smsTab == SMS_TAB){
      filterTypes.put(FilterType.OVER_AMOUNT_LIMIT_PER_DAY, "Vượt giới hạn sử dụng 150000/ngày");
    }else{
      filterTypes.put(FilterType.OVER_AMOUNT_LIMIT_PER_DAY, "Vượt giới hạn sử dụng 500000/ngày");
    }
    model.put("filterTypes", filterTypes);
    
    List<String> filter_providers = new ArrayList<String>();
    if (request.getParameterValues("providers") != null) {
      filter_providers.addAll(Arrays.asList(request.getParameterValues("providers")));
    }

    // (KEY PARAMS*)
    @SuppressWarnings("unchecked")
    Map<String, String> fieldMaps = new LinkedMap();
    fieldMaps.put("msisdn", "Thuê bao");
    fieldMaps.put("merchant", "Merchant");
    fieldMaps.put("provider", "Nhà cung cấp");
    fieldMaps.put("telco", "Nhà mạng");

    model.put("fieldMaps", fieldMaps);

    // ( KEY FIELDS*)
    List<String> fields = new ArrayList<String>();
    fields.add("msisdn");
    fields.add("merchant");
    fields.add("provider");
    fields.add("telco");

    List<String> terms = new ArrayList<String>();
    // Auto param
    for (String field : fieldMaps.keySet()) {

      String param = StringUtils.trimToEmpty(request.getParameter(field));
      terms.add(param);
    }

    // (Regex Search*)
    @SuppressWarnings("unchecked")
    Map<String, List<String>> keywords = new LinkedMap();

    //all
    @SuppressWarnings("unchecked")
    Map<String, List<String>> keywordAll = new LinkedMap();
    
    if (!merchant.equals("")) {
      String operator = "_operator_regex";
      keywords.put("merchant" + operator, Arrays.asList(new String[] { merchant }));
    }

    if (!filter_command_code.equals("")) {
      String operator = "_operator_regex";
      keywords.put("command_code" + operator, Arrays.asList(new String[] { filter_command_code }));
    }

    if (!filter_msisdn.equals("")) {
      String operator = "_operator_regex";
      keywords.put("msisdn" + operator, Arrays.asList(new String[] { filter_msisdn }));
    }

    // Operator IN: Merchant manager permissions
    List<String> merchants = findMyOwnMerchants(account);

    if (account.isOperator() || account.isBizSupportManager() || account.isBizSupporter()
        || account.isCustomerCareManager() || account.isCustomerCare())
      merchants = null;

    if (merchants != null && merchants.size() > 0) {
      String operator = "_operator_in";
      keywords.put("merchant" + operator, merchants);
    }

    //Tab provider not in
    if(SMS_PLUS_PROVIDERS != null && SMS_PLUS_PROVIDERS.size() > 0){
      //except
      if(smsTab == SMS_TAB){
        String operator = "_operator_not_in";
        keywords.put("provider" + operator, SMS_PLUS_PROVIDERS);
        keywordAll.put("provider" + operator, SMS_PLUS_PROVIDERS);
      }
      //only
      else{
        //remove not allow
        List<String> providerTemps = new ArrayList<String>();
        providerTemps.addAll(filter_providers);
        
        if(providerTemps != null && providerTemps.size() > 0){
          for(String filter : providerTemps){
            boolean exist = false;
            for(String tmp : SMS_PLUS_PROVIDERS){
              if(filter.equalsIgnoreCase(tmp)){
                exist = true;
                break;
              }
            }
            if(!exist)
              filter_providers.remove(filter);
          }
        }
        
        //add condition
        for(String filter : SMS_PLUS_PROVIDERS){
          if(!providerTemps.contains(filter))
          filter_providers.add(filter);
        }
        
        String operator = "_operator_in";
        keywordAll.put("provider" + operator, SMS_PLUS_PROVIDERS);
      }
    }
    
    
    if (filter_providers != null && filter_providers.size() > 0) {
      String operator = "_operator_in";
      keywords.put("provider" + operator, filter_providers);
      
    }
    
    // Operator TIME RANGE: filter with time reservation
     String fromDateStr = ""; 
     String toDateStr = "";
     if(!reservation.equals("")){
       try{
         String[] reservationArr = reservation.split("-"); 
         fromDateStr = StringUtils.trimToEmpty(reservationArr[0]); 
         toDateStr = StringUtils.trimToEmpty(reservationArr[1]); 
         
         //Check interval
         DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
         Date fr = df.parse(fromDateStr);
         Date to = df.parse(toDateStr);
         int dayBetween =  (int)(Math.abs(to.getTime() - fr.getTime()) / (24*60*60*1000));
         
         if(dayBetween > DATE_FILTER_MAX){
           String today = df.format(new Date());
           fromDateStr = "";
           toDateStr = "";
           
           model.put("today", today + " - " + today);
         }
       }catch(Exception e){
         e.printStackTrace(); 
       } 
     }
     
    List<String> timeRanges = Arrays.asList(new String[] { handleDate(fromDateStr, false),
        handleDate(toDateStr, true) });
    //System.out.println("fromDateStr: " + handleDate(fromDateStr, false) + " toDateStr: " + handleDate(toDateStr, true));
    
    if (timeRanges != null && timeRanges.size() > 0) {
      String operator = "_operator_time_range";
      keywords.put("request_time" + operator, timeRanges);
    }

    // (Sort *)
    @SuppressWarnings("unchecked")
    Map<String, SortOrder> sorts = new LinkedMap();
    sorts.put("merchant", SortOrder.ASC);
    sorts.put("msisdn", SortOrder.ASC);
    sorts.put("request_time", SortOrder.DESC);

    int offset = 0;
    int page = 0;
    if (StringUtils.isNumeric(request.getParameter("d-49520-p"))) {
      offset = Integer.parseInt(request.getParameter("d-49520-p"));
      page = Integer.parseInt(request.getParameter("d-49520-p")) - 1;
      if (offset > 0) {
        offset = (offset - 1) * this.limit;
      }
    }

    // histogram
    @SuppressWarnings("unchecked")
    Map<String, List<IntervalUnit>> dataHistogramMap = new LinkedMap();

    // List facets*
    List<List<Term>> termLists = new ArrayList<List<Term>>();
    // List all facets*
    List<List<Term>> termAllLists = new ArrayList<List<Term>>();
    // List Object
    List<ESSmsCdrFilter> dataList = new ArrayList<ESSmsCdrFilter>();
    // Count
    int count = 0;
    //Get count for filter types
    Map<String , Integer> dataCount = new LinkedMap();
    
    // Facet size to view
    int facetSize = 20;

    List<ESSmsCdrFilter> sortedDataList = new ArrayList<ESSmsCdrFilter>();
    if (elasticSearchService.checkIndex(ESSmsCdrFilter.class)) {
      count = elasticSearchService.count(fields, terms, keywords, facetSize, ESSmsCdrFilter.class);
      termLists = elasticSearchService.getFacets(fields, terms, keywords, facetSize, ESSmsCdrFilter.class);
      termAllLists = elasticSearchService.getFacets(fields, null, keywordAll, facetSize, ESSmsCdrFilter.class);

      //Get top data with filter type
      Map<String , List<FilteringSMS>> topDataMap = new LinkedMap();
      List<String> typesForFilter = new ArrayList<String>();
      
      if(!filter_type.equalsIgnoreCase("") && Arrays.asList(FilterType.ALL_FILTER_TYPES).contains(filter_type)){
        typesForFilter.add(filter_type);
      }
      else
        typesForFilter.addAll(Arrays.asList(FilterType.ALL_FILTER_TYPES));
      
      for(String type : typesForFilter){
        keywords.put("filterType_operator_term", Arrays.asList(new String[]{type}));
        dataList = elasticSearchService.search(fields, terms, keywords, sorts, 0/* page */, count/* limit */, facetSize,
            ESSmsCdrFilter.class);
        
        //Count
        int filterTypeDataSize = dataList==null?0:dataList.size();
        List<List<Term>> filterFacets = new ArrayList<List<Term>>();
        filterFacets = elasticSearchService.getFacets(fields, terms, keywords, 
            filterTypeDataSize, ESSmsCdrFilter.class);
        filterTypeCount(filterTypeDataSize, filterFacets, type, tabFilter, dataCount);
        
        if(type.equalsIgnoreCase(FilterType.OVER_03_MESSAGES_LIMIT_PER_05_MINUTES) || typesForFilter.size() == 1)
          handleTopDataWithFilterType(model, tabFilter, type, 
              keywords, fields, terms, facetSize, dataList, 
              sortedDataList, topDataMap, dataHistogramMap);
        else
          handleTopDataWithFilterType(model, tabFilter, type, 
              keywords, fields, terms, facetSize, dataList, 
              null, topDataMap, null);
        
        //System.out.println("sortedDataList: " + (sortedDataList == null ? 0 : sortedDataList.size()));
      }
      //show
      model.put("topDataMap", topDataMap);
    }
    //System.out.println("dataList.size(): " + dataList.size());
    // Get provider
    List<String> providers = new ArrayList<String>();
    List<Term> termProviders = null;
    if (termAllLists.size() > 3)
      termProviders = termAllLists.get(2);
    
    if(termProviders != null && termProviders.size() > 0)
    for (Term term : termProviders) {
      providers.add(term.getTerm());
    }
    model.put("providers", providers);

    // Get Merchant
    /*
     * List<String> merchantList = new ArrayList<String>(); List<Term>
     * termMerchants = null; if(termAllLists.size() > 2) termMerchants =
     * termAllLists.get(1); for(Term term : termMerchants){
     * merchantList.add(term.getTerm()); }
     */
    model.put("merchantList", merchants);

    // Term for histogram
    /*
     * List<Term> termForHistograms = null; if(termLists.size() > 4)
     * termForHistograms = termLists.get(3);
     */

    // push to layout
    @SuppressWarnings("unchecked")
    Map<String, List<Term>> facetsMap = new LinkedMap();
    int k = 0;
    for (String field : fieldMaps.keySet()) {
      if (termLists.size() > k)
        facetsMap.put(field, termLists.get(k));
      k++;
    }

    model.put("facetsMap", facetsMap);
    model.put("dataHistogramMap", dataHistogramMap);

    // Display count
    model.put("dataCount", dataCount);
    
    model.put("pagesize", Integer.valueOf(this.limit));
    model.put("offset", Integer.valueOf(offset));
    model.put("list", sortedDataList);
    model.put("total", sortedDataList == null ? 0 : sortedDataList.size());
    
    Date end = new Date();
    Long duration = end.getTime() - start.getTime();
    Long timeHandleTotal = TimeUnit.MILLISECONDS.toMillis(duration);

    model.put("timeHandleTotal", timeHandleTotal);
    return new ModelAndView(getWebView(), "model", model);
  }

  private void filterTypeCount(int filterTypeDataSize, List<List<Term>> filterFacets, String type,
      int tabFilter, Map<String, Integer> dataCount) {
    
    int count = filterTypeDataSize;
    List<Term> fieldFacets = null;
    // Msisdn Facets
    if(tabFilter == SUBCRIBER_TAB){
      if(filterFacets != null && filterFacets.size() > 0)
        fieldFacets = filterFacets.get(0);
    }
    // Merchant Facets
    else{
      if(filterFacets != null && filterFacets.size() > 1)
        fieldFacets = filterFacets.get(1);
    }
    
    if(fieldFacets != null && fieldFacets.size() > 0){
      for(Term term : fieldFacets){
        count = count - (term.getCount()-1);
      }
    }
    dataCount.put(type, count);
  }

  @SuppressWarnings("unchecked")
  private void handleTopDataWithFilterType(ModelMap model, int tabFilter, String type, 
      Map<String, List<String>> keywords, List<String> fields, List<String> terms, int facetSize, List<ESSmsCdrFilter> dataList,
      List<ESSmsCdrFilter> sortedDataList, Map<String , List<FilteringSMS>> topDataMap, 
      Map<String, List<IntervalUnit>> dataHistogramMap) {
    
    Map<String, List<String>> filterOptions = new LinkedMap();
    if(keywords != null)
      filterOptions.putAll(keywords);
    
    List<ESSmsCdrFilter> sortedDataTempList = new ArrayList<ESSmsCdrFilter>();
    
    int limit = 20;
    
    String fieldHistogram = "request_time";
    String fieldFilter = "msisdn";
    String operator = "_operator_term";
    
    if (tabFilter == SUBCRIBER_TAB) {
      sortedDataTempList = handleSortWithSubscriberByCount(dataList, limit);

      List<FilteringSMS> topMsisdns = new ArrayList<FilteringSMS>();
      topMsisdns = getTopMsisdn(sortedDataTempList, limit);
      
      topDataMap.put(type, topMsisdns);
      
      // get histogram
      if (dataHistogramMap != null && topMsisdns != null && topMsisdns.size() > 0) {
        for (FilteringSMS data : topMsisdns) {
          // limit
          if (dataHistogramMap != null && dataHistogramMap.size() >= limit)
            break;

          filterOptions.put(fieldFilter + operator, Arrays.asList(new String[] { data.getMsisdn() }));
          filterOptions.put("merchant" + operator, Arrays.asList(new String[] { data.getMerchant().toLowerCase() }));

          // find msisdn suspect
          dataHistogramMap.put(data.getMsisdn() + "::" +data.getMerchant(), elasticSearchService.getHistogramFacets(fieldHistogram, fields, terms,
              filterOptions, facetSize, ESSmsCdrFilter.class));
        }
      }

    } else {
      sortedDataTempList = handleSortWithMerchantByCount(dataList, limit);

      List<FilteringSMS> topMerchant = new ArrayList<FilteringSMS>();
      topMerchant = getTopMerchant(sortedDataTempList, limit);
      
      topDataMap.put(type, topMerchant);
      
      // get histogram
      if (dataHistogramMap != null && topMerchant != null && topMerchant.size() > 0) {
        for (FilteringSMS data : topMerchant) {
          // limit
          if (dataHistogramMap != null && dataHistogramMap.size() >= limit)
            break;

          filterOptions.put("merchant" + operator, Arrays.asList(new String[] { data.getMerchant().toLowerCase() }));

          // find merchant suspect
          dataHistogramMap.put(data.getMerchant(), elasticSearchService.getHistogramFacets(fieldHistogram, fields, terms,
              filterOptions, facetSize, ESSmsCdrFilter.class));
        }
      }
    }
    
    if(sortedDataTempList != null && sortedDataList != null)
      sortedDataList.addAll(sortedDataTempList);
    
  }

  class IntervalUnitComp implements Comparator<IntervalUnit>{
    
    @Override
    public int compare(IntervalUnit e1, IntervalUnit e2) {
      Integer i1 = (int) (long) e1.getCount();
      Integer i2 = (int) (long) e2.getCount();
        return i1.compareTo(i2);
    }
  }
  
  public static List<FilteringSMS> getTopMsisdn(List<ESSmsCdrFilter> sortedDataList, int limit) {
    if (sortedDataList == null || sortedDataList.size() == 0)
      return null;

    List<FilteringSMS> topMsisdn = new ArrayList<FilteringSMS>();
    for (ESSmsCdrFilter mo : sortedDataList) {
      int index = -1;
      for (int i = 0; i < topMsisdn.size(); i++) {
        if (topMsisdn.get(i).getMerchant().equalsIgnoreCase(mo.getMerchant())
            && topMsisdn.get(i).getMsisdn().equalsIgnoreCase(mo.getMsisdn())) {
          index = i;
          break;
        }
      }

      if (index != -1) {
        topMsisdn.get(index).setAmount(topMsisdn.get(index).getAmount() + mo.getAmount());
        topMsisdn.get(index).setCount_sms(topMsisdn.get(index).getCount_sms() + 1);
      } else{
        // limit
        if (limit >= 0 && limit <= topMsisdn.size())
          break;
        topMsisdn.add(new FilteringSMS(mo.getMsisdn(), mo.getMerchant(), mo.getProvider(), 1, 1, mo.getAmount()));
      }
    }

    return topMsisdn;
  }

  public static List<FilteringSMS> getTopMerchant(List<ESSmsCdrFilter> sortedDataList, int limit) {
    if (sortedDataList == null || sortedDataList.size() == 0)
      return null;

    List<FilteringSMS> topMerchant = new ArrayList<FilteringSMS>();
    List<String> msisdns = new ArrayList<String>();

    for (ESSmsCdrFilter mo : sortedDataList) {
      int index = -1;
      for (int i = 0; i < topMerchant.size(); i++) {
        if (topMerchant.get(i).getMerchant().equalsIgnoreCase(mo.getMerchant())) {
          index = i;
          break;
        }
      }

      if (index != -1) {
        if (!msisdns.contains(mo.getMsisdn())) {
          msisdns.add(mo.getMsisdn());
          // System.out.println("merchant " + mo.getMerchant() + " " +
        }

        topMerchant.get(index).setAmount(topMerchant.get(index).getAmount() + mo.getAmount());
        topMerchant.get(index).setCount_sms(topMerchant.get(index).getCount_sms() + 1);
        topMerchant.get(index).setCount_msisdn(msisdns.size());
      } else {
        // limit
        if (limit >= 0 && limit <= topMerchant.size())
          break;
        
        // System.out.println("merchant " + mo.getMerchant() + " ");
        topMerchant.add(new FilteringSMS("", mo.getMerchant(), mo.getProvider(), 1, 1, mo.getAmount()));

        // reset
        msisdns = new ArrayList<String>();
        msisdns.add(mo.getMsisdn());
      }

    }

    return topMerchant;
  }

  @SuppressWarnings({ "unchecked", "unused" })
  private List<ESSmsCdrFilter> handleSortWithSubscriberBySum(List<ESSmsCdrFilter> dataList) {
    if (dataList == null || dataList.size() == 0)
      return null;

    Map<String, Integer> listSum = new LinkedMap();

    for (int i = 0; i < dataList.size(); i++) {
      if (listSum.containsKey(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn())) {
        int old = listSum.get(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn());
        listSum.put(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn(), dataList.get(i).getAmount()
            + old);
      } else
        listSum.put(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn(), dataList.get(i).getAmount());
    }
    listSum = sortByValue(listSum);

    // result
    List<ESSmsCdrFilter> results = new ArrayList<ESSmsCdrFilter>();
    for (String msisdn : listSum.keySet()) {
      // System.out.println(msisdn.substring(msisdn.indexOf("::") + 2,
      // msisdn.length()) + " " + listSum.get(msisdn));
      for (ESSmsCdrFilter mo : dataList) {
        if (mo.getMsisdn().equalsIgnoreCase(msisdn.substring(msisdn.indexOf("::") + 2, msisdn.length()))) {
          results.add(mo);
        }
      }
    }
    return results;
  }

  @SuppressWarnings("unchecked")
  public static List<ESSmsCdrFilter> handleSortWithSubscriberByCount(List<ESSmsCdrFilter> dataList, int limit) {
    if (dataList == null || dataList.size() == 0)
      return null;

    Map<String, Integer> listSum = new LinkedMap();

    for (int i = 0; i < dataList.size(); i++) {
      if (listSum.containsKey(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn())) {
        int old = listSum.get(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn());
        listSum.put(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn(), 1 + old);
      } else {
        listSum.put(dataList.get(i).getMerchant() + "::" + dataList.get(i).getMsisdn(), 1);
      }
    }
    listSum = sortByValue(listSum);

    // result
    List<ESSmsCdrFilter> results = new ArrayList<ESSmsCdrFilter>();
    int i = 0;
    for (String msisdn : listSum.keySet()) {
      if (limit >= 0 && i++ >= limit)
        break;

      // System.out.println(msisdn.substring(msisdn.indexOf("::") + 2,
      // msisdn.length()) + " " + listSum.get(msisdn));
      for (ESSmsCdrFilter mo : dataList) {
        if (mo.getMsisdn().equalsIgnoreCase(msisdn.substring(msisdn.indexOf("::") + 2, msisdn.length()))) {
          results.add(mo);
        }
      }

    }
    return results;
  }

  @SuppressWarnings("unchecked")
  public static List<ESSmsCdrFilter> handleSortWithMerchantByCount(List<ESSmsCdrFilter> dataList, int limit) {
    if (dataList == null || dataList.size() == 0)
      return null;

    Map<String, Integer> listSum = new LinkedMap();
    List<String> msisdns = new ArrayList<String>();

    for (int i = 0; i < dataList.size(); i++) {
      if (listSum.containsKey(dataList.get(i).getMerchant())) {
        if (!msisdns.contains(dataList.get(i).getMsisdn()))
          msisdns.add(dataList.get(i).getMsisdn());

        listSum.put(dataList.get(i).getMerchant(), msisdns.size());
      } else {
        listSum.put(dataList.get(i).getMerchant(), 1);

        // reset
        msisdns = new ArrayList<String>();
        msisdns.add(dataList.get(i).getMsisdn());
      }
    }
    listSum = sortByValue(listSum);

    // result
    List<ESSmsCdrFilter> results = new ArrayList<ESSmsCdrFilter>();
    int i = 0;
    for (String merchant : listSum.keySet()) {
      if (limit >= 0 && i++ >= limit)
        break;
      //System.out.println(merchant + " " + listSum.get(merchant));
      for (ESSmsCdrFilter mo : dataList) {
        if (mo.getMerchant().equalsIgnoreCase(merchant)) {
          results.add(mo);
        }
      }
    }
    return results;
  }

  @SuppressWarnings({ "unused", "unchecked" })
  private List<ESSmsCdrFilter> handleSortWithMerchantBySum(List<ESSmsCdrFilter> dataList) {
    if (dataList == null || dataList.size() == 0)
      return null;

    Map<String, Integer> listSum = new LinkedMap();
    for (int i = 0; i < dataList.size(); i++) {
      if (listSum.containsKey(dataList.get(i).getMerchant())) {
        int old = listSum.get(dataList.get(i).getMerchant());
        listSum.put(dataList.get(i).getMerchant(), dataList.get(i).getAmount() + old);
      } else
        listSum.put(dataList.get(i).getMerchant(), dataList.get(i).getAmount());
    }
    listSum = sortByValue(listSum);

    // result
    List<ESSmsCdrFilter> results = new ArrayList<ESSmsCdrFilter>();
    for (String merchant : listSum.keySet()) {
      //System.out.println(merchant + " " + listSum.get(merchant));
      for (ESSmsCdrFilter mo : dataList) {
        if (mo.getMerchant().equalsIgnoreCase(merchant)) {
          results.add(mo);
        }
      }
    }
    return results;
  }

  @SuppressWarnings({ "unchecked", "rawtypes" })
  public static Map sortByValue(Map unsortMap) {
    List list = new LinkedList(unsortMap.entrySet());

    Collections.sort(list, new Comparator() {
      public int compare(Object o1, Object o2) {
        return ((Comparable) ((Map.Entry) (o2)).getValue()).compareTo(((Map.Entry) (o1)).getValue());
      }
    });

    Map sortedMap = new LinkedMap();
    for (Iterator it = list.iterator(); it.hasNext();) {
      Map.Entry entry = (Map.Entry) it.next();
      sortedMap.put(entry.getKey(), entry.getValue());
    }
    return sortedMap;
  }

  public static String handleDate(String date, boolean end) throws ParseException {
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    SimpleDateFormat df2 = new SimpleDateFormat("dd/MM/yyyy");
    String time = " 00:00:00";
    String today = df2.format(new Date()) + time;

    if (!end) {
      if (!date.equals("")) {
        date += time;
        try {
          if (df.parse(date) != null) {
            return date;
          } else
            return today;
        } catch (Exception e) {
          e.printStackTrace();
          return today;
        }
      } else {
        return today;
      }
    } else {
      Calendar c = Calendar.getInstance();
      c.setTime(df.parse(today));
      c.add(Calendar.SECOND, 24 * 60 * 60 - 1);

      today = df.format(c.getTime());

      if (!date.equals("")) {
        date += time;
        try {
          if (df.parse(date) != null) {
            Calendar c2 = Calendar.getInstance();
            c2.setTime(df.parse(date));
            c2.add(Calendar.SECOND, 24 * 60 * 60 - 1);

            return df.format(c2.getTime());
          } else
            return today;
        } catch (Exception e) {
          e.printStackTrace();
          return today;
        }
      } else {
        return today;
      }
    }

  }
  
  public void generateLineCoordinates(long interval, Date fromDate, Date toDate, Map<String, List<IntervalUnit>> dataHistogramMap){
    
  }
}