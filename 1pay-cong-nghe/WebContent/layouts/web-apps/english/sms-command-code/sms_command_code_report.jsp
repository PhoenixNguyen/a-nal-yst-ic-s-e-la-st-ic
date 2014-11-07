<%@page import="vn.onepay.merchant.product.model.MerchantProduct"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
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
$(function(){
	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
});
</script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
</script>
<style>
	.product_slc_filter {margin-right: 5px;}
	.transdata img {margin: 0 15px;}
	.width255 {width:255px;}
	
	.all_sumary {list-style: square;color: #333;}
	.all_sumary li {margin-top: 5px;}
</style>
</head>
<%
	request.setAttribute("APPROVED_STATUS", 		MerchantProduct.APPROVED_STATUS);
	request.setAttribute("REJECT_STATUS", 			MerchantProduct.REJECT_STATUS);
	request.setAttribute("INIT_STATUS", 			MerchantProduct.INIT_STATUS);
	request.setAttribute("PENDING_STATUS", 			MerchantProduct.PENDING_STATUS);
	request.setAttribute("NOT_AVAIABLE_STATUS", 	MerchantProduct.NOT_AVAIABLE_STATUS);
%>
<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("productNavMenu",true); %>
				<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="left_menu.jsp" />
						<div class="right_content">
				            <h1 class="srv_title"> Quản lý mã SMS </h1>
				            <form action="sms-command-code-manager.wss" method="post" name="sms_manager">
				            	<div class="dash_row">
				            		<input type="hidden" name="tab" value="${param.tab}" />
									<div id="dash_tab" style="padding-right: 0;">
										<a href="sms-command-code-manager.wss" class="tab${(param.tab==null || param.tab=='')?'_slc':''}"><span>Tổng quát</span></a> 
										<a href="sms-command-code-manager.wss?tab=sms_store" class="tab${param.tab=='sms_store'?'_slc':''}"><span>Kho mã</span></a>
										
										<c:if test="${param.tab=='sms_store'}">
											<c:if test="${account_logined.isStaff() && (account_logined.isOperator() || account_logined.isBizSupporter())}">
											<a href="#sms_command_code_merchant" rel="leanModal" class="addproduct_link add_sms"><span>Thêm mã SMS</span></a>
											<a href="#sms_command_code_merchant" rel="leanModal" class="export_link do_upload" style="margin-right: 5px;"><span>Upload SMS CMD Code</span></a>
											<a href="#" class="export_link do_export" style="margin-right: 5px;"><span>Export files</span></a>
											</c:if>
										</c:if>
										<c:if test="${param.tab == null || fn:length(param.tab) == 0}">
											<a href="#sms_command_code_merchant" rel="leanModal" class="export_link do_upload" 
												style='background: url("<%=request.getContextPath()%>/images/check.gif") no-repeat scroll left center, url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;'>
												<span>Check mã SMS</span>
											</a>
										</c:if>
										 
										<div class="clear"></div>
									</div>
								</div>
								
								<c:if test="${param.tab == null || fn:length(param.tab) == 0}">
									<div id="provider_pi_chart_div" style="width: 390px;height:250px;float:left"></div>
									<div id="status_pi_chart_div" style="width: 390px;height:250px;float:left;padding-top: 20px;">
										<h1 class="srv_title"> 
											<strong>Tổng số mã SMS:</strong> <fmt:formatNumber value="${model.totalSms}" currencyCode="VND" />
										</h1>
										<ul class="all_sumary">
											<li>
												<strong>Tình trạng sử dụng</strong>
												<ul>
													<li>
														Đã sử dụng: <strong><fmt:formatNumber value="${model.totalSms - model.totalUnUsed}" currencyCode="VND" /></strong>
													</li>
													<li>
														Chưa sử dụng: <strong><fmt:formatNumber value="${model.totalUnUsed}" currencyCode="VND" /></strong>
													</li>
												</ul>
											</li>
											<li>
												<strong>Mã SMS phát sinh doanh thu</strong>
												<ul>
													<li>Đã phát sinh doanh thu: <strong><fmt:formatNumber value="${model.totalRevenueArising}" currencyCode="VND" /></strong></li>
													<li>Chưa phát sinh doanh thu: <strong><fmt:formatNumber value="${model.totalSms - model.totalUnUsed - model.totalRevenueArising}" currencyCode="VND" /></strong></li>
												</ul> 
												
											</li>
											<li>
												<strong>Mã SMS 1Pay duyệt</strong>
												<ul>
												<c:forEach var="_status" items="${model.status}" varStatus="status">
													<li>
														<c:choose>
															<c:when test="${_status == APPROVED_STATUS}">Đã duyệt:</c:when>
															<c:otherwise>Chưa duyệt:</c:otherwise>
														</c:choose>
														<strong>
														<c:set var="key" value="status_${_status}" />
														<fmt:formatNumber value="${model.statistic[key]}" currencyCode="VND" />
														</strong>
													</li>
												</c:forEach>
												</ul>
											</li>
										</ul>
									</div>
									<div class="clear"></div>
									<%-- <div id="top_sms_cmd" style="margin-top: 18px;">
										<style>
											#top_sms_cmd table {border: 1px solid #ccc; display: inline-block; border-radius: 5px;-moz-border-radius: 5px;-webkit-border-radius: 5px;margin-right: 10px;}
											#top_sms_cmd table caption {background-color: #ccc; color: #333; padding: 5px; font-weight: bold;text-transform: capitalize;}
											#top_sms_cmd table th {text-align: center; padding: 5px;border-top: 1px solid #ccc;border-right: 1px solid #ccc;}
											#top_sms_cmd table td {text-align: center; padding: 3px;border-top: 1px solid #ccc;border-right: 1px solid #ccc;}
											#top_sms_cmd table td:last-child, #top_sms_cmd table th:last-child {border-right: none;}
											#top_sms_cmd table tr:hover {background-color: #eee}
										</style>
										<c:if test="${model.unUsedList != null && fn:length(model.unUsedList) > 0}">
												<table>
													<caption>Chưa sử dụng</caption>
													<thead>
														<tr>
															<th>Provider</th>
															<th>SMS CMD</th>
														</tr>
													</thead>
													<c:forEach var="item" items="${model.unUsedList}">
														<tr>
															<td>${item.provider}</td>
															<td>${fn:toUpperCase(item.command_code)}</td>
														</tr>
													</c:forEach>
												</table>
										</c:if>
										<c:forEach var="_status" items="${model.status}" varStatus="status">
											<c:set var="key" value="list_status_${_status}" />
											<c:if test="${model.statistic[key] != null && fn:length(model.statistic[key]) > 0}">
												<table>
													<caption>
														<c:choose>
															<c:when test="${_status == APPROVED_STATUS}">Đã duyệt</c:when>
															<c:otherwise>Chưa duyệt</c:otherwise>
														</c:choose>
													</caption>
													<thead>
														<tr>
															<th>Provider</th>
															<th>SMS CMD</th>
														</tr>
													</thead>
													<c:forEach var="item" items="${model.statistic[key]}">
														<tr>
															<td>${item.provider}</td>
															<td>${fn:toUpperCase(item.command_code)}</td>
														</tr>
													</c:forEach>
												</table>
											</c:if>
										</c:forEach>
										<c:if test="${model.revenueArisingList != null && fn:length(model.revenueArisingList) > 0}">
												<table>
													<caption>Phát sinh doanh thu</caption>
													<thead>
														<tr>
															<th>Provider</th>
															<th>SMS CMD</th>
															<th>Merchant</th>
														</tr>
													</thead>
													<c:forEach var="item" items="${model.revenueArisingList}">
														<tr>
															<td>${item.provider}</td>
															<td>${fn:toUpperCase(item.command_code)}</td>
															<td>${item.merchant}</td>
														</tr>
													</c:forEach>
												</table>
										</c:if>
									</div> --%>
									
									<div id="chart_div_1"></div>
									<div id="chart_div_2"></div>
									
									<c:set var="providerArr" value="" />
									<c:forEach var="_provider" items="${model.providers}" varStatus="status">
										<c:set var="key" value="provider_${_provider}" />
										<c:set var="providerArr" value="${providerArr}['${_provider}', ${model.statistic[key]}]" />
										<c:if test="${!status.last}">
											<c:set var="providerArr" value="${providerArr}, " />
										</c:if>									
									</c:forEach>
									<script type="text/javascript">
										google.setOnLoadCallback(drawProviderPiVisualization);
										function drawProviderPiVisualization() {
											var data = google.visualization.arrayToDataTable([
		                                      ['Status', 'Amount'],
		                                      ${providerArr}
		                                    ]);
											
											var formatter = new google.visualization.NumberFormat({
												pattern : '#,###',
											});
											formatter.format(data, 1); // Apply formatter to second column
		
		                                    var options = {
		                                      /* legend: {position: 'none',}, */
		                                      title: 'Tỷ lệ mã SMS theo provider',
		                                      chartArea: {width:'100%', height:'75%',left:'10',top:'50'},
		                                    };
		
		                                    var chart = new google.visualization.PieChart(document.getElementById('provider_pi_chart_div'));
		                                    chart.draw(data, options);
										}
										
										google.setOnLoadCallback(drawChart(1));
										google.setOnLoadCallback(drawChart(2));
									    function drawChart(x) {
									  	  var formatter = new google.visualization.NumberFormat({
												pattern : '#,###'
											});
									  	  var viewData;
									  	  if(x==1)
									  	  	viewData = [
									  	                  ['Providers', 'Đã duyệt', { role: 'annotation' }, 'Đã sử dụng', { role: 'annotation' }, 'Đã phát sinh doanh thu', { role: 'annotation' }],
									  	                  <c:forEach var="provider" items="${model.providers}" varStatus="status">
									  	                  <c:set var="key" value="provider_${provider}" />
									  	                  ['${provider}', ${model.data[provider].totalApproved}, ${model.data[provider].totalApproved}, ${model.statistic[key] - model.data[provider].totalUnUsed}, ${model.statistic[key] - model.data[provider].totalUnUsed}, ${model.data[provider].totalRevenueArising}, ${model.data[provider].totalRevenueArising}]
									  	                  <c:if test="${!status.last}">,</c:if>
									  	                  </c:forEach>
											        ];
									  	  else if(x==2)
									  		viewData = [
									  	                  ['Providers', 'Chưa duyệt', { role: 'annotation' }, 'Chưa sử dụng', { role: 'annotation' }, 'Chưa phát sinh doanh thu', { role: 'annotation' }],
									  	                  <c:forEach var="provider" items="${model.providers}" varStatus="status">
									  	                  <c:set var="key" value="provider_${provider}" />
									  	                  ['${provider}', ${model.statistic[key] - model.data[provider].totalApproved}, ${model.statistic[key] - model.data[provider].totalApproved}, ${model.data[provider].totalUnUsed}, ${model.data[provider].totalUnUsed}, ${model.statistic[key] - model.data[provider].totalUnUsed - model.data[provider].totalRevenueArising}, ${model.statistic[key] - model.data[provider].totalUnUsed - model.data[provider].totalRevenueArising}]
									  	                  <c:if test="${!status.last}">,</c:if>
									  	                  </c:forEach>
											        ];
									  	  
									      var data = google.visualization.arrayToDataTable(viewData);
										  formatter.format(data, 1);
										  formatter.format(data, 3);
										  formatter.format(data, 5);
									
									      var options = {
									    		  height: 300,
									        title: x == 1 ?'Chi tiết mã đã sử dụng' : 'Chi tiết mã chưa sử dụng',
									        vAxis: { 
									            viewWindow:{ min:0 }
									        }
									      };
									
									      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_' + x));
									      chart.draw(data, options);
									    }
									</script>
								</c:if>
								<c:if test="${param.tab=='sms_store'}">
									<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Lọc kết quả</a>
										</h3>
									</div>
									<div class="box_locketqua">
										<div class="filter_row">
											<div class="product_slc_filter" style="width: auto; float:left;">
												<label class="product_lbl_filter" style="margin-right: 19px;"><strong>Mã lệnh SMS</strong></label> 
												<input id="commandCode" name="commandCode" value="${param.commandCode }" class="dashboard_filter" placeholder="Nhập Mã lệnh SMS"/>
											</div>
										</div>
										<div class="filter_row">
											<div class="input-prepend" style="float:left;">
												<label class="product_lbl_filter" style="margin-right: 31px;"><strong>Chọn ngày</strong></label> <input type="text"
													name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="Toàn thời gian"
													value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:''}" />
													<a href="javascript: $('#reservation').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select name="date_style" class="product_filter" style="width:200px;">
													<option value="" ${(param.date_style == null || fn:length(param.date_style) == 0)?'selected="selected"':''}>
														Ngày cập nhật
													</option>
													<option value="staff_active" ${param.date_style == 'staff_active'?'selected="selected"':''}>
														Ngày cấp phát cho Merchant
													</option>
												</select>
											</div>
											<script type="text/javascript">
												$(document).ready(function() {
												try {
													$('#reservation').daterangepicker({
														format : 'dd/MM/yyyy',
														ranges: {
														'Hôm nay': ['today', 'today'],
														'Hôm qua': ['yesterday', 'yesterday'],
														'15 Ngày đầu tháng': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToFirstDayOfMonth().add({ days: +14 })],
														'15 Ngày cuối tháng': [Date.today().moveToFirstDayOfMonth().add({ days: +15 }), Date.today().moveToLastDayOfMonth()],
														'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
														'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
														'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
														'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
														}
													}
													);
												} catch(e){alert(e);}
												});
											</script>
											<div class="product_slc_filter" style="float: right;width:auto;">
												<label class="product_lbl_filter"><strong>Prv. Status</strong></label> 
												<select name="prvStatus" class="product_filter">
													<option value="" ${(param.prvStatus == null || param.prvStatus == '')?'selected="selected"':''}>Tất cả</option>
													<c:forEach  var="status" items="${model.status }">
														<c:choose>
															<c:when test="${status == APPROVED_STATUS }">
															<option value="${status}" ${param.prvStatus == status?'selected="selected"':''}>
																Đã duyệt
															</option>
															</c:when>
															<c:when test="${status == PENDING_STATUS }">
															<option value="${status}" ${param.prvStatus == status?'selected="selected"':''}>
																Chờ duyệt
															</option>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
										<c:if test="${(account_logined.isStaff() && (account_logined.isOperator() || account_logined.isBizSupporter() || account_logined.isBizStaff())) && model.merchants != null && fn:length(model.merchants) >1 }">
											<c:set var="allMcs" value="," />
											<c:forEach var="mc" items="${paramValues.merchant}">
												<c:set var="allMcs" value="${allMcs}${mc}," />
											</c:forEach>
											<div class="filter_row">
												<div class="field" style="width:auto; float:left;">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="product_lbl_filter" style="margin-right: 38px;"><strong>Merchant</strong></label>
														<input id="searchMerchant" name="searchMerchant" list="searchMerchantList" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
														<datalist id="searchMerchantList">
															<c:forEach var="merchant" items="${model.merchants}">
																<option value="${merchant }">
																	<c:out value="${merchant}"/>
																</option>
															</c:forEach>
														</datalist>
														<select id="filter_merchant" name="merchant" multiple="multiple" style="width:243px" class="product_filter">
															<c:forEach var="merchant" items="${model.merchants}">
																<c:set var="merchant2" value=",${merchant}," />
																<option value="${merchant }" ${((param.searchMerchant == null || fn:length(param.searchMerchant) == 0) && fn:contains(allMcs, merchant2))?'selected':'' }>
																	<c:out value="${merchant}"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
												
												<div class="product_slc_filter" style="float: right;width:auto;">
													<label class="product_lbl_filter"><strong>1Pay Status</strong></label> 
													<select name="status" class="product_filter">
														<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
														<c:forEach  var="status" items="${model.status }">
															<c:choose>
																<c:when test="${status == APPROVED_STATUS }">
																<option value="${status}" ${param.status == status?'selected="selected"':''}>
																	Đã duyệt
																</option>
																</c:when>
																<c:when test="${status == PENDING_STATUS }">
																<option value="${status}" ${param.status == status?'selected="selected"':''}>
																	Chờ duyệt
																</option>
																</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</div>								
										</c:if>
										
										<style>
											.filter_row fieldset {border: solid 1px #ccc;width:95%;}
											.filter_row .product_slc_filter {width:100%;}
										</style>
										<div class="product_slc_filter filter_row" style="margin-right: 5px;width:450px;">
											<fieldset class="short_codes_fs">
												<legend>
													<input type="checkbox" name="prChkAll" value="prChkAll" id="prChkAll" class="chck_filter" /> <strong>Provider</strong>
													<script type="text/javascript">
														$(document).ready(function(){
															$('#prChkAll').click(function() {
																if(this.checked) {
																	$(this).closest('.product_slc_filter').find('input[type=checkbox]').attr('checked', 'checked');
																} else {
																	$(this).closest('.product_slc_filter').find('input[type=checkbox]').removeAttr('checked');
																}
															});
														});
													</script>
												</legend>
												<div style="padding: 2px;">
													<c:set var="allPr" value="," />
													<c:forEach var="pr" items="${paramValues.provider}">
														<c:set var="allPr" value="${allPr}${pr}," />
													</c:forEach>
													<c:forEach var="provider" items="${model.providers}">
														<div style="display: inline-block;width:120px;">
															<c:set var="pr" value=",${provider}," />
															<input type="checkbox" class="chck_filter" name="provider" title="${onepay:providerCode2Text(provider)}" value="${provider}" 
																${fn:contains(allPr, pr)?'checked="checked"':'' } />
															<label class="lbl_chcksub">${provider}</label>
														</div>
													</c:forEach>
												</div>
											</fieldset>
										</div>
										<%-- <div class="product_slc_filter filter_row" style="float:right">
											<fieldset style="width: 240px;">
												<legend><strong>Tình trạng sử dụng & Phát sinh doanh thu</strong></legend>
												<table>
													<tr>
														<td style="padding: 2px;">
															<input type="checkbox" class="chck_filter" name="unUsed" value="1" ${param.unUsed == '1'?'checked="checked"' : ''} />
															<label class="lbl_chcksub">Mã chưa sử dụng</label>
														</td>
													</tr>
													<tr>
														<td style="padding: 2px;">
															<input type="checkbox" class="chck_filter" name="revenueArising" value="1" ${param.revenueArising == '1'?'checked="checked"' : ''} />
															<label class="lbl_chcksub">Mã đã phát sinh DT</label>
														</td>
													</tr>
												</table>
											</fieldset>
										</div> --%>
										<div style="float: right;width:auto;">
											<div class="product_slc_filter" style="float:right;">
												<label class="product_lbl_filter"><strong>MC Status</strong></label> 
												<select name="mcStatus" class="product_filter">
													<option value="" ${(param.mcStatus == null || param.mcStatus == '')?'selected="selected"':''}>Tất cả</option>
													<c:forEach  var="status" items="${model.status }">
														<c:choose>
															<c:when test="${status == APPROVED_STATUS }">
															<option value="${status}" ${param.mcStatus == status?'selected="selected"':''}>
																Đã cấp phát
															</option>
															</c:when>
															<c:when test="${status == PENDING_STATUS }">
															<option value="${status}" ${param.mcStatus == status?'selected="selected"':''}>
																Chưa cấp phát
															</option>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div><br />
											<div class="product_slc_filter" style="margin-top: 10px;">
												<label class="product_lbl_filter"><strong>D.Thu Status</strong></label> 
												<select name="revenue" class="product_filter">
													<option value="" ${(param.revenue == null || param.revenue == '')?'selected="selected"':''}>Tất cả</option>
													<c:forEach  var="status" items="${model.status }">
														<c:choose>
															<c:when test="${status == APPROVED_STATUS }">
															<option value="${status}" ${param.revenue == status?'selected="selected"':''}>
																Đã PSDT
															</option>
															</c:when>
															<c:when test="${status == PENDING_STATUS }">
															<option value="${status}" ${param.revenue == status?'selected="selected"':''}>
																Chưa PSDT
															</option>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="clear"></div>
										<c:choose>
											<c:when test="${param.submit==null || fn:length(param.submit) == 0 }">
											<script type="text/javascript">
												$(document).ready(function() {
													$('.box_locketqua').find('fieldset[class=short_codes_fs]').each(function() {
														$(this).find('input[type=checkbox]').attr('checked', 'checked');
													});
												});
											</script>
											</c:when>
											<c:otherwise>
												<c:if test="${param.prChkAll == 'prChkAll' }">
												<script type="text/javascript">
												$(document).ready(function() {
													$('#prChkAll').attr('checked', 'checked');
												});
												</script>									
												</c:if>
											</c:otherwise>
										</c:choose>
										<div class="filter_row">
											<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submit" />
										</div>
									</div>
					               <div class="srv_row">
					               		<c:if test="${model.total>0 }">
							            	<div>
							            		<span class="pagebanner" style="float:left;"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
											</div>
										</c:if>
					               		<script>var rownum = 1;</script>
					                	<display:table name="model.list" id="list" 
															requestURI="sms-command-code-manager.wss" 
															pagesize="${model.pagesize}" partialList="true" size="model.total"
															style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;"
															sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="STT" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
													<c:out value="${model.offset + list_rowNum }" />
										    </display:column>
										    
										    <display:column title="Merchant / Sản phẩm" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a href="#sms_command_code_merchant" rel="leanModal" style="color:#2C8F39; font-size: 14px;" class="sms_merchant">${list.merchant}</a>
										    	<c:set var="smsKey" value="${list.provider}_${fn:toLowerCase(list.command_code)}" />
										    	<c:set var="iacKey" value="iac_${fn:toLowerCase(list.command_code)}" />
										    	<c:if test="${model.mcpMap[smsKey] != null}">
										    		<div>
										    			<a href="<%=request.getContextPath()%>/console/details.wss?i=${model.mcpMap[smsKey].id}" target="_blank">&raquo; ${model.mcpMap[smsKey].title}</a>
										    		</div>
										    	</c:if>
										    	<c:if test="${model.mcpMap[smsKey] == null && model.mcpMap[iacKey] != null}">
										    		<div>
										    			<a href="<%=request.getContextPath()%>/console/details.wss?i=${model.mcpMap[iacKey].id}" target="_blank">&raquo; ${model.mcpMap[iacKey].title}</a>
										    		</div>
										    	</c:if>
										    </display:column>
											<display:column title="Provider" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;text-align:center;" >
												<c:out value="${list.provider}"/>
											</display:column>
											<display:column title="CMD" headerClass="transhead" class="svr_data1" paramProperty="id" style="border: 1px solid #CCC;font-weight:bold;text-transform: uppercase;" >
												<a class="edit_sms" title="${list.description}" rel="leanModal" id="${list.id}" style="color:#2C8F39; font-size: 14px;" href="#sms_command_code_merchant"><c:out value="${list.command_code}"/></a>
											</display:column>
											<display:column title="Short Code" headerClass="transhead width80" class="svr_data1" style="border: 1px solid #CCC;" >
												<c:forEach var="shortCode" items="${list.short_codes}" varStatus="status">
													<c:out value="${shortCode}"/>${status.last?'':', '}
												</c:forEach>
											</display:column>
											<%-- <display:column title="MT" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;">
												<img border="0" src="<%=request.getContextPath()%>/images/sms_icon.png" title="${list.default_mt}" onclick="alert('${list.default_mt}');" />
											</display:column> --%>
											<display:column title="Ngày cập nhật / <span style='color:#2C8F39;'>cấp phát</span>" headerClass="transhead" class="transdata width90" style="border: 1px solid #CCC;text-align:center;">
												<fmt:formatDate value="${list.updated_time}" pattern="yyyy-MM-dd HH:mm:ss" />
												<div style="margin-top: 5px;color:#2C8F39; font-size: 13px;">
												<c:choose>
													<c:when test="${list.merchant != null && fn:length(list.merchant) > 0}">
														<fmt:formatDate value="${list.staff_actived_time}" pattern="yyyy-MM-dd HH:mm:ss" />
													</c:when>
													<c:otherwise>
														N/A
													</c:otherwise>
												</c:choose>
												</div>
											</display:column>
											<display:column title="Status<br />Provider | 1PAY | Merchant | D.Thu" headerClass="transhead width255" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
												<a class="edit_sms" title="" rel="leanModal" id="${list.id}" href="#sms_command_code_merchant">
												<c:choose>
													<c:when test="${list.provider_action == APPROVED_STATUS }">
														<fmt:formatDate value="${list.provider_actived_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<c:set var="account" value="" />
														<c:if test="${list.update_account != null && fn:length(list.update_account) > 0}">
															<c:set var="account" value=" bởi ${list.update_account}" />
														</c:if>
														<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Đã duyệt lúc ${time}${account}" />
													</c:when>
													<c:when test="${list.provider_action == PENDING_STATUS }">
														<fmt:formatDate value="${list.created_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ duyệt lúc ${time}" />
													</c:when>
													<c:when test="${list.provider_action == REJECT_STATUS }">
														<fmt:formatDate value="${list.updated_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="Từ chối lúc ${time}" />
													</c:when>
													<c:otherwise>
														<fmt:formatDate value="${list.created_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ duyệt lúc ${time}" />
													</c:otherwise>
												</c:choose>
												</a>
												&nbsp;
												<c:set var="account" value="" />
												<c:if test="${list.update_account != null && fn:length(list.update_account) > 0}">
													<c:set var="account" value=" bởi ${list.update_account}" />
												</c:if>
												<a class="edit_sms" title="" rel="leanModal" id="${list.id}" href="#sms_command_code_merchant">
												<c:choose>
													<c:when test="${list.status == APPROVED_STATUS }">
														<fmt:formatDate value="${list.staff_actived_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Đã duyệt lúc ${time}${account}" />
													</c:when>
													<c:when test="${list.status == PENDING_STATUS }">
														<fmt:formatDate value="${list.created_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ duyệt lúc ${time}" />
													</c:when>
													<c:when test="${list.status == REJECT_STATUS }">
														<fmt:formatDate value="${list.update_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="Từ chối lúc ${time}${account}" />
													</c:when>
													<c:otherwise>
														<fmt:formatDate value="${list.created_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ duyệt lúc ${time}" />
													</c:otherwise>
												</c:choose>
												</a>
												&nbsp;
												<c:choose>
													<c:when test="${list.merchant != null && fn:length(list.merchant) > 0}">
														<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Đã cấp phát cho merchant" />
													</c:when>
													<c:otherwise>
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa cấp phát cho merchant" />
													</c:otherwise>
												</c:choose>
												&nbsp;
												<c:choose>
													<c:when test="${list.amount >= 500000}">
														<img border="0" src="<%=request.getContextPath()%>/images/money_normal.png" title="Đã có doanh số >= 500,000đ" />
													</c:when>
													<c:when test="${list.amount > 0}">
														<img border="0" src="<%=request.getContextPath()%>/images/money_active.png" title="Đã có doanh số < 500,000đ" />
													</c:when>
													<c:otherwise>
														<img border="0" src="<%=request.getContextPath()%>/images/money_invi.png" title="Chưa có doanh số" />
													</c:otherwise>
												</c:choose>
										    </display:column>
										</display:table>
					               </div>
					        	</c:if>
					        	
					        	<c:if test="${account_logined.isStaff() && (account_logined.isOperator() || account_logined.isBizSupporter())}">
					        	<style>
									#sms_command_code_merchant {width:680px; display:none; background:#FFF; border-radius:5px; -moz-border-radius:5px; -webkit-border-radius:5px; box-shadow:0 0 4px rgba(0,0,0,0.7); -webkit-box-shadow:0 0 4px rgba(0,0,0,0.7); -moz-box-shadow:0 0 4px rgba(0,0,0,0.7); padding: 20px}
								</style>
								<div id="sms_command_code_merchant"></div>
								<script type="text/javascript">
								$(document).ready(function() {
									$('.sms_merchant').live('click', function() {
										var merchant = $(this).html().trim();
										var url = '<%=request.getContextPath()%>/console/sms-command-code-api.wss?a=sms_command_code_merchant&merchant=' + merchant;
										$('#sms_command_code_merchant').html('');
										$('#sms_command_code_merchant').load(url, function(responseTxt,statusTxt,xhr) {
											if(statusTxt == 'error')
												$(this).html('Không có dữ liệu hiển thị');
										});
									});
									
									$('.do_upload').live('click', function() {
										var url = '<%=request.getContextPath()%>/console/sms-command-code-api.wss?a=sms_command_code_provider_approved_tmp&tab=${param.tab}';
										$('#sms_command_code_merchant').html('');
										$('#sms_command_code_merchant').load(url, function(responseTxt,statusTxt,xhr) {
											if(statusTxt == 'error')
												$(this).html('Không có dữ liệu hiển thị');
										});
									});
									
									$('.do_export').live('click', function() {
										$('form[name=sms_manager]').append('<input type="hidden" name="export" value="true" />');
										$('form[name=sms_manager] input[name=submit]').click();
										$('form[name=sms_manager] input[name=export]').remove();
									});
									
									$('.add_sms').live('click', function() {
										var url = '<%=request.getContextPath()%>/console/sms-command-code-api.wss?a=sms_command_code_add_or_edit';
										$('#sms_command_code_merchant').html('');
										$('#sms_command_code_merchant').load(url, function(responseTxt,statusTxt,xhr) {
											if(statusTxt == 'error')
												$(this).html('Không có dữ liệu hiển thị');
										});
									});
									
									$('.edit_sms').live('click', function() {
										var url = '<%=request.getContextPath()%>/console/sms-command-code-api.wss?a=sms_command_code_add_or_edit&i='+ $(this).attr("id");
										$('#sms_command_code_merchant').html('');
										$('#sms_command_code_merchant').load(url, function(responseTxt,statusTxt,xhr) {
											if(statusTxt == 'error')
												$(this).html('Không có dữ liệu hiển thị');
										});
									});
								});
								</script>
								</c:if>
				            </form>
				         </div>
					</div>
				</div>
				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
		<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>
</body>

</html>