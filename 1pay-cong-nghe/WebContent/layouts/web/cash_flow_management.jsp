<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
jQuery(function($){
    $.datepicker.regional['month_of_numbers'] = {
    		closeText: "Chọn", // Display text for close link
    		prevText: "Lùi", // Display text for previous month link
    		nextText: "Tiếp", // Display text for next month link
    		currentText: "Hôm nay", // Display text for current month link
    		monthNames: ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6",
    			"Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"], // Names of months for drop-down and formatting
    		monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"], // For formatting
    		dayNames: ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"], // For formatting
    		dayNamesShort: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"], // For formatting
    		dayNamesMin: ["CN","2","3","4","5","6","7"], // Column headings for days starting at Sunday
    		weekHeader: "Wk", // Column header for week of the year
    		dateFormat: "mm/dd/yy", // See format options on parseDate
    		firstDay: 0, // The first day of the week, Sun = 0, Mon = 1, ...
    		isRTL: false, // True if right-to-left language, false if left-to-right
    		showMonthAfterYear: false, // True if the year select precedes month, false for month then year
    		yearSuffix: "" // Additional text to append to the year in the month headers
    		};
    $.datepicker.setDefaults($.datepicker.regional['month_of_numbers']);
});
</script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
 -->
<style type="text/css">
	.add_category_management { background: url("<%=request.getContextPath() %>/images/config_prct.png") no-repeat scroll left center, url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 25px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	.add_category_management:HOVER, .add_record:HOVER, .back:HOVER { color: #FFFFFF; margin-right: 0; padding-right: 5px; text-shadow: 0 1px #20942B; }
 
	.add_record { background: url("<%=request.getContextPath() %>/images/add.png") no-repeat scroll left center, url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	 
	.back { background:  url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; /* url("<%=request.getContextPath() %>/images/add.png") no-repeat scroll left center, */ border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	 
	#category_management_popup { background: #fff; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); display: none; font-size: 14px; height: auto; padding: 20px; width: 600px; }
	 
	#display_tree table { padding: 10px; }
	 
	#display_tree2 table tr { border-bottom: 1px solid #CCCCCC; }
	 
	.input_number { margin-left: 5%; padding: 5px; text-align: right; width: 80%; }
	 
	.input_text { margin-left: 5%; padding: 5px; text-align: left; width: 80%; }
	 
	.input_time { margin-left: 5%; padding: 5px; text-align: center; width: 80%; }
	 
	.radio_style { margin-left: 5%; margin-top: 5px; padding: 5px; }
	 
	#record_management_popup { background: #fff; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); display: none; font-size: 14px; height: auto; padding: 20px; width: 550px; }
	 
	.requesting_color { color: red; }
	 
	.select_style { margin-left: 5%; padding: 5px; width: 40%; }
	 
	.sms_link, .sms_link:HOVER { background: url(<%=request.getContextPath() %>/images/sub_invi.png) no-repeat scroll left center, url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	 
	.time_picker { margin-left: 0%; padding: 5px; width: 39.5%; }
	 
	.title_category { font-size: 14px; /* color: #2C8F39; */ }
	 
	.title_color { /* color: #2C8F39; */ }
	 
	.width10_percent { width: 10%; }
	 
	.width11_percent { width: 11%; }
	 
	.width12_percent { width: 12%; }
	 
	.width13_percent { width: 13%; }
	 
	.width20 { width: 20px; }
	 
	.width23_percent { width: 23%; }
	 
	.width250 { width: 250px; }
	 
	.width40_percent { width: 40%; }
	 
	.width5_percent { width: 5%; }
	 
	.width60 { width: 60px; }
	 
	.width7_percent { width: 7%; }
	 
	.width8_percent { width: 8%; }
</style>
</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	boolean isAdmin = account.isAdmin();
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
	
	boolean isOperator = account.isOperator();
	request.setAttribute("isOperator",isOperator);
	//thay doi email & phone
%>


<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("moneyFlowMenu",true); %>
				<%request.setAttribute("menuTrangChu", true); %>
				
				<jsp:include page="header.jsp"></jsp:include>
				
				<!-- / Header -->
				<script type="text/javascript">
					if('<c:out value="${model.delete_record_status}"/>' == '1')
						alert('Xóa bản ghi thành công');
					if('<c:out value="${model.delete_record_status}"/>' == '2')
						alert('Xóa bản ghi lỗi');
					
					if('<c:out value="${model.delete_cate_status}"/>' == '1')
						alert('Xóa danh mục thành công');
					if('<c:out value="${model.delete_cate_status}"/>' == '2')
						alert('Không thể xóa danh mục này, hãy chắc chắn danh mục không chứa danh mục con hoặc bản ghi!');
					
				</script>
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("cashFlowManagement", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Quản lý dòng tiền</h1>
							
							<a href="cash-flow-category.html" class="add_category_management" style="margin-right: 5px;"><span>Cây danh mục</span></a>
							
							<div id="money_flow_search" style="display: block; margin-bottom: 20px;">
								<form id="list-sms-scenario" action="cash-flow.html?tab=${param.tab }" method="get">
          							<style>
										.filter_row .fieldset_filter {border: solid 1px #ccc;margin-left:40px; width: auto;}
										.ui-datepicker-calendar {display: none;}
									</style>
									
									<script type="text/javascript">
									$(function(){
									
										$("#filter_period").multiselect({
											selectedList: 4,
											noneSelectedText: "Chu kỳ"
										});
										
									});
									</script>
								
									<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Chọn điều kiện </a>
										</h3>
									</div>
									<!-- .widget-header -->
									<div class="box_locketqua">
										<div class="filter_row">
											<input type="hidden" name="tab" value="${param.tab }"/>
											
											<script type="text/javascript">
												$(document).ready(function(){
													var monthYearSearch = $('input[name=monthYearSearch]');
													if(monthYearSearch.val() == '')
													{
														var date = new Date();
														var month = date.getMonth()+1;
														var today = (month < 10?"0"+month:month) + "/" + date.getFullYear();
														
														monthYearSearch.val(today);
													}
												});
												$(function() {
												    $('#monthYearSearch').datepicker( {
												        changeMonth: true,
												        changeYear: true,
												        showButtonPanel: true,
												        dateFormat: 'mm/yy',
												        onClose: function(dateText, inst) { 
												            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
												            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
												            $(this).datepicker('setDate', new Date(year, month, 1));
												        }
												    });
												});
											</script>
											<span style="padding-left:40px; display:inline-block; width:30px;"><b>Kỳ:</b></span>
											<c:set var="listForSearchPeriod" value="<datalist id='listForSearchPeriod'>" />
											<c:set var="allPeriods" value="," />
											
											<c:if test="${paramValues.periods == null || paramValues.periods == ''}">
												<c:set var="allPeriods" value=",${model.periodList != null?model.periodList.get(0):''}," />
											</c:if>
											<c:forEach var="per" items="${paramValues.periods}">
												<c:set var="allPeriods" value="${allPeriods}${per}," />
											</c:forEach>
											
											<select id="filter_period" name="periods" multiple="multiple" style="width:200px">
												<c:forEach var="period" items="${model.periodList}">
													<c:set var="period2" value=",${period}," />
													
													<option value="${period }" ${fn:contains(allPeriods, period2)?'selected':'' }>
														<c:out value="${period}"/>
													</option>
													<c:set var="listForSearchPeriod" value="${listForSearchPeriod}<option value='${period}'>${period}</option>" />
												</c:forEach>
											</select>
											<%-- <c:out value="${listForSearchPeriod}" escapeXml="false" /> --%>
											
											<span style="padding-left:20px; display:inline-block; width:50px;"><b>Tháng:</b></span>
											<input id="monthYearSearch" maxlength="100" name="monthYearSearch" value="${param.monthYearSearch }" class="txt_calendar" placeholder="Tháng/Năm"/>
											<a onclick="$('#monthYearSearch').val('')">
												<img src="<%=request.getContextPath() %>/images/huy.png" title="reset">
											</a>
											
										</div>
										<div class="filter_row">
											<span class="add-on" style="padding-left:40px; display:block; width:100px;">
												<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Xem báo cáo" />
											</span>
										</div>
									</div>
         						</form>
							</div>
							
							<div class="dash_row">
								
								<div id="dash_tab" style="padding-right: 0;">
									<%
										String queryOld = request.getQueryString();
										String tab = request.getParameter("tab");
										
										if(tab != null){
											if(tab.compareTo("revenue") == 0){
												queryOld = queryOld.replace("tab=revenue&", "");
											}
											if(tab.compareTo("cost") == 0){
												queryOld = queryOld.replace("tab=cost&", "");
											}
											if(tab.compareTo("amount") == 0){
												queryOld = queryOld.replace("tab=amount&", "");
											}
										}
										request.setAttribute("queryOld", queryOld);
									%>
									<a href="cash-flow.html?tab=revenue&${queryOld }" class="tab${(param.tab==null || param.tab=='revenue' || param.tab=='')?'_slc':''}"><span title="Báo cáo Thu">Thu</span>
									</a> <a href="cash-flow.html?tab=cost&${queryOld }" class="tab${param.tab=='cost'?'_slc':''}"><span title="Báo cáo Chi">Chi</span>
									</a> <a href="cash-flow.html?tab=amount&${queryOld }" class="tab${param.tab=='amount'?'_slc':''}"><span title="Báo cáo Lưu chuyển tiền tệ">Tổng hợp</span>
									</a>
									
									
									<c:choose>
									<c:when test="${param.tab=='amount'}">
										<a href="#record_management_popup" rel="leanmodal" class="record_management_popup add_record"><span>Thêm báo cáo</span></a>	
									</c:when>
									<c:otherwise>
										<a href="#record_management_popup" rel="leanmodal" class="record_management_popup add_record"><span>Thêm bản ghi</span></a>
										
									</c:otherwise>
									</c:choose>
									
									
								</div>
							</div>
							
							<div style="text-align: center;margin-top: 10px; margin-bottom: 0px; font-size: 20px;">
								<table width="100%">
									<tr>
										<td>
											<b>Báo cáo 
												<c:if test="${param.tab == null ||  param.tab == 'revenue'}">Thu</c:if>
												<c:if test="${param.tab == 'cost'}">Chi</c:if>
												<c:if test="${param.tab == 'amount'}">Tổng hợp</c:if>
											</b>
										</td>
									</tr>
									<tr>
										<td>
											<c:set var="allPeriods" value="" />
											<c:forEach var="per" items="${paramValues.periods}">
												<c:set var="allPeriods" value="${allPeriods}${per} " />
											</c:forEach>
											<c:set var="periodDefault" value="${model.periodList != null?model.periodList.get(0):''}"/>
											<%
												Date date = new Date();
												int month = date.getMonth()+1;
												int year = date.getYear() + 1900;
												String today = (month<10?"0"+month:month) + "/" + year;
												
												request.setAttribute("monthDefault", today);
												request.setAttribute("curr", request.getQueryString());
											%>
											Chu kỳ: ${allPeriods == null || allPeriods == ''?periodDefault : allPeriods } - Tháng  ${param.monthYearSearch == null || param.monthYearSearch == ''?monthDefault : param.monthYearSearch } 
										</td>
									</tr>
									<tr>
										<c:if test="${model.recordList.size() > 0 || model.amount.size() > 0}">
											<td style="text-align: right;">
												<a href="cash-flow.html?action=export_reports&${curr}" onclick="return confirm('Xuất ra file excel!');"><img src="<%=request.getContextPath() %>/images/export.gif" title="Xuất ra excel"/></a>
											</td>
										</c:if>
									</tr>
								</table>
							</div>
							
							<c:choose>
							<c:when test="${param.tab=='amount'}">
								<jsp:include page="cash_flow_amount.jsp" />	
							</c:when>
							<c:otherwise>
								<jsp:include page="cash_flow_revenue_cost.jsp" />	
							</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- / Web Foot -->
	</div>
	<!-- / 1PAY WEB -->
</body>
</html>
