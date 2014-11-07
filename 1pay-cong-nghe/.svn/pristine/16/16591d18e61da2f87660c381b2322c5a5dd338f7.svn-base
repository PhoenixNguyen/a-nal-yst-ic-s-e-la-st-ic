<%@page import="vn.onepay.common.SharedConstants"%>
<%@page import="vn.onepay.account.model.Account"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/moment.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	var chartNames = ["Lợi nhuận gộp", "Doanh thu phân chia", "Doanh thu khách hàng", "Merchant phát sinh doanh thu"];
	google.load("visualization", "1", {packages:["corechart"]});
</script>
<style>
	 .kpi_percent {display: none;}
</style>
</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	boolean isAdmin = account.isAdmin();
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
%>

<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("menuTrangChu", true); %>
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("dashboard", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
						<form id="kpiForm" action="kpi_chart.html" method="get">
							<h1 class="srv_title">
								Theo dõi kế hoạch								
								<div style="float: right;">
									<a href="#help" name="help" rel="leanModal"><img src="<%=request.getContextPath() %>/images/user_help.png" alt="Chỉ tiêu đăng ký"  width="24px"/></a>
								</div>
							</h1>
							<div class="dash_row">
								<div class="other_filter">
									<c:if test="${account_logined.isOperator()}">
										<%request.setAttribute("departments", SharedConstants.DEPARTMENTS); %>
										<select id="department" name="department" style="float: left; width:85px; margin-right:5px;">
											<option value="" ${(param.department == null || param.department=='')?'selected="selected"':''}>Dept.</option>
											<c:forEach var="department" items="${departments}">
												<option ${param.department == department?'selected="selected"':''} value="${department}"><c:out value="${department}" /></option>
											</c:forEach>
										</select>
									</c:if>
								</div>
									<script type="text/javascript">
										$(document).ready(function() {
											$("#chargingService").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
											$("#department").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
											$("select[name=quarter]").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
											$("#merchant").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
											$("#paymentProvider").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
											$("#merchantContract").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
											$("#merchantPolicy").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#kpiForm").submit();
												return false;
											});
										});
									</script>
							
								<div class="input-prepend" style="float: left;">
									<span style="line-height: 30px;">Chọn kỳ này: </span><input type="text"
														name="reservation" id="reservation" class="txt_calendar"
														value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}" />
								</div>
								<div class="input-prepend" style="float: left;margin-left: 30px;">
									<%-- <span style="line-height: 30px;">Chọn kỳ trước: </span><input type="text" placeholder="Không chọn"
														name="reservation_bf" id="reservation_bf" class="txt_calendar"
														value="${(param.reservation_bf!=null && fn:length(param.reservation_bf)>0)?param.reservation_bf:model.today_bf}" />
														<a href="javascript:void(0)" 
														onclick="$('#reservation_bf').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" 
														style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Không chọn" /></a> --%>
									<span style="line-height: 30px;">So với: </span>
									<select name="quarter" class="">
										<c:forEach var="i" begin="1" end="4">
											<option value="${i}" ${(param.quarter == i || model.quarter == i)?'selected="selected"':''}>Quý ${i}</option>
										</c:forEach>
									</select>
								</div>
								<script type="text/javascript">
									$(document).ready(function() {
										$('#reservation').daterangepicker({
											format : 'dd/MM/yyyy',
											ranges: {
/* 											'Hôm nay': ['today', 'today'],
											'Hôm qua': ['yesterday', 'yesterday'],
											'15 Ngày đầu tháng': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToFirstDayOfMonth().add({ days: +14 })],
											'15 Ngày cuối tháng': [Date.today().moveToFirstDayOfMonth().add({ days: +15 }), Date.today().moveToLastDayOfMonth()],
											'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
											'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
 */											'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
											'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })],
											'Quý 1': [moment().quarter(1).startOf('quarter').format(), moment().quarter(1).endOf('quarter').format()],
											'Quý 2': [moment().quarter(2).startOf('quarter').format(), moment().quarter(2).endOf('quarter').format()],
											'Quý 3': [moment().quarter(3).startOf('quarter').format(), moment().quarter(3).endOf('quarter').format()],
											'Quý 4': [moment().quarter(4).startOf('quarter').format(), moment().quarter(4).endOf('quarter').format()],
											}
										},
										function(start, end) {
											val = start.toString('MM/dd/yyyy') + ' - ' + end.toString('MM/dd/yyyy');
											$("#form_daterange").val(val);
											$("#kpiForm").submit();
										});
										
										/* $('#reservation_bf').daterangepicker({
											format : 'dd/MM/yyyy',
											ranges: {
											'Hôm nay': ['today', 'today'],
											'Hôm qua': ['yesterday', 'yesterday'],
											'15 Ngày đầu tháng': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToFirstDayOfMonth().add({ days: +14 })],
											'15 Ngày cuối tháng': [Date.today().moveToFirstDayOfMonth().add({ days: +15 }), Date.today().moveToLastDayOfMonth()],
											'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
											'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
											'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
											'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })],
											'Quý 1': [moment().quarter(1).startOf('quarter').format(), moment().quarter(1).endOf('quarter').format()],
											'Quý 2': [moment().quarter(2).startOf('quarter').format(), moment().quarter(2).endOf('quarter').format()],
											'Quý 3': [moment().quarter(3).startOf('quarter').format(), moment().quarter(3).endOf('quarter').format()],
											'Quý 4': [moment().quarter(4).startOf('quarter').format(), moment().quarter(4).endOf('quarter').format()],
											}
										},
										function(start, end) {
											$("#kpiForm").submit();
										}); */
									});
								</script>
							</div>
							<c:if test="${model.departments !=null && fn:length(model.departments) >= 1}">
								<%-- <div class="dash_row">
									<table cellpadding="1" cellspacing="1" width="100%" border="0" >
									<tr>
									<c:forEach items="${model.mapDeptTotalRevenue}" var="mapDeptTotalRevenue" varStatus="status">
										<c:set var="dept" value="${mapDeptTotalRevenue.key}" />
										<td width="20%">
											<div style="border: 1px solid #CCCCCC; padding-top : 5px; padding-bottom: 5px; border-radius: 10px 10px 10px 10px;">
											<table cellpadding="0" cellspacing="0" width="100%" border="0" >
												<tr>
													<td class="dash_no_head">
											         	<span style="font-size:16px">
											         		<strong>${dept}</strong>(<c:out value="${model.mapDeptAccountManager[dept]}" />)
											         	</span>
											         </td>
												</tr>
												<tr>
													<fmt:formatNumber value="${mapDeptTotalRevenue.value }" var="deptTotalRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
											    	<fmt:formatNumber value="${model.mapDeptTotalPassRevenue4Percent[dept]}" var="deptTotalRevenueFmt1" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
											    	<fmt:formatNumber var="totalDeptRevenuePercent" value="${(model.mapDeptTotalPassRevenue4Percent[dept] > 0 && mapDeptTotalRevenue.value > 0)?( mapDeptTotalRevenue.value/model.mapDeptTotalPassRevenue4Percent[dept] -1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
											    	<td class="dash_no">
											    		<span style="font-size:12px">
											    			<c:out value="${deptTotalRevenueFmt}" />đ 
											    			(<span style="color:${fn:contains(totalDeptRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalDeptRevenuePercent}"/>%</span>)
											    		</span>
											    	</td>
												</tr>
												<tr>
													<fmt:formatNumber var="deptTotalKPIRevenueFmt" value="${model.mapDeptKPIRevenueA[dept]}" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
											    	<fmt:formatNumber var="totalDeptKPIRevenuePercent" value="${(mapDeptTotalRevenue.value > 0 && model.mapDeptKPIRevenueA[dept] > 0)?( mapDeptTotalRevenue.value/model.mapDeptKPIRevenueA[dept]-1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
											    	<td class="dash_no">
											    		<span style="font-size:12px">
											    			<c:out value="${deptTotalKPIRevenueFmt}" />đ 
											    			(<span style="color:${fn:contains(totalDeptKPIRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalDeptKPIRevenuePercent}"/>%</span>)
											    		</span>
											    	</td>
												</tr>
												<tr>
													<fmt:formatNumber var="deptTotal1PayRevenueFmt" value="${model.mapDeptTotal1PayRevenue[dept]}" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
											    	<fmt:formatNumber var="deptTotal1PayRevenuePercent" value="${model.mapDeptTotalPassRevenue4Percent[dept]}" maxFractionDigits="2" minFractionDigits="2" />
											    	
											    	<fmt:formatNumber value="${model.mapDeptKPINetRevenue[dept] }" var="deptTotalKPINetRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
											    	<fmt:formatNumber value="${model.mapDeptTotal1PayRevenue[dept] }" var="deptTotal1PayRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
											    	<td class="dash_no">
											    		<span style="font-size:12px"> 
											    			<c:out value="${deptTotal1PayRevenueFmt}" />đ (<c:out value="${deptTotal1PayRevenuePercent}" /> M)
											    		</span>
											    	</td>
												</tr>
											</table>
											</div>
										</td>
									</c:forEach>
									</tr>
									</table>	
								</div> --%>
								
								<style>
									.sumary strong {padding: 2px 0;display: block;}
								</style>
								<div class="dash_row">
									<c:set var="unit" value="1000000" />
									<table cellpadding="1" cellspacing="1" width="100%" border="0" class="sumary" >
									<tr>
										<td width="25%">
											<div align="right" style="border: 1px solid #CCCCCC; padding: 10px; border-radius: 10px 10px 10px 10px;">
												<strong style="font-size:16px;height: 40px;line-height: 20px;">
													<c:choose>
														<c:when test="${model.departments != null && fn:length(model.departments) == 1}">
															Merchants  PSDT (${model.departments[0]})
														</c:when>
														<c:otherwise>
															Tổng Merchants  PSDT 
														</c:otherwise>
													</c:choose>
												</strong>
												<c:set var="afPer" value="${model.totalKPIBillableMerchant > 0?model.totalBillableMerchantSummary*100/model.totalKPIBillableMerchant:0}" />
												<c:set var="bfPer" value="${model.totalPassBillableMerchantSummary > 0?model.totalKPIBillableMerchant/model.totalPassBillableMerchantSummary*100:0}" />
												<table width="100%">
													<tr>
														<td align="right">
															<strong>
																Kỳ trước:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalPassBillableMerchantSummary}" currencyCode="VND" maxFractionDigits="0" />
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right">
															<strong>
																KPI <span style="color:${bfPer < 100 ? '#F30' : '#0C0'};" class="kpi_percent">(<fmt:formatNumber value="${bfPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalKPIBillableMerchant}" currencyCode="VND" maxFractionDigits="0" />
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<strong>
																Kỳ này:
															</strong>
														</td>
														<td align="right" valign="top">
															<strong>
																<fmt:formatNumber value="${model.totalBillableMerchantSummary}" currencyCode="VND" />
															</strong>
															<span style="color:${afPer < 100 ? '#F30' : '#0C0'};font-weight:bold;">(<fmt:formatNumber value="${afPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>
														</td>
													</tr>
												</table>
											</div>
										</td>
										<td width="25%">
											<div align="right" style="border: 1px solid #CCCCCC; padding: 10px; border-radius: 10px 10px 10px 10px;">
												<strong style="font-size:16px;height: 40px;line-height: 20px;">
													<c:choose>
														<c:when test="${model.departments != null && fn:length(model.departments) == 1}">
															DT khách hàng (${model.departments[0]})
														</c:when>
														<c:otherwise>
															Tổng DT khách hàng
														</c:otherwise>
													</c:choose>
												</strong>
												<c:set var="afPer" value="${model.totalKPIBilling > 0?model.totalBillingSummary*100/model.totalKPIBilling:0}" />
												<c:set var="bfPer" value="${model.totalPassBillingSummary > 0?model.totalKPIBilling/model.totalPassBillingSummary*100:0}" />
												<table width="100%">
													<tr>
														<td align="right">
															<strong>
																Kỳ trước:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalPassBillingSummary/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right">
															<strong>
																KPI <span style="color:${bfPer < 100 ? '#F30' : '#0C0'};" class="kpi_percent">(<fmt:formatNumber value="${bfPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalKPIBilling/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<strong>
																Kỳ này:
															</strong>
														</td>
														<td align="right" valign="top">
															<strong>
																<fmt:formatNumber value="${model.totalBillingSummary/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
															<span style="color:${afPer < 100 ? '#F30' : '#0C0'};font-weight:bold;">(<fmt:formatNumber value="${afPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>
														</td>
													</tr>
												</table>
											</div>
										</td>
										<td width="25%">
											<div align="right" style="border: 1px solid #CCCCCC; padding: 10px; border-radius: 10px 10px 10px 10px;">
												<strong style="font-size:16px;height: 40px;line-height: 20px;">
													<c:choose>
														<c:when test="${model.departments != null && fn:length(model.departments) == 1}">
															DT phân chia (${model.departments[0]})
														</c:when>
														<c:otherwise>
															Tổng DT phân chia
														</c:otherwise>
													</c:choose>
												</strong>
												<c:set var="afPer" value="${model.totalKPIRevenue > 0?model.totalRevenueSummary*100/model.totalKPIRevenue:0}" />
												<c:set var="bfPer" value="${model.totalPassRevenueSummary > 0?model.totalKPIRevenue/model.totalPassRevenueSummary*100:0}" />
												<table width="100%">
													<tr>
														<td align="right">
															<strong>
																Kỳ trước:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalPassRevenueSummary/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right">
															<strong>
																KPI <span style="color:${bfPer < 100 ? '#F30' : '#0C0'};" class="kpi_percent">(<fmt:formatNumber value="${bfPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalKPIRevenue/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<strong>
																Kỳ này:
															</strong>
														</td>
														<td align="right" valign="top">
															<strong>
																<fmt:formatNumber value="${model.totalRevenueSummary/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
															<span style="color:${afPer < 100 ? '#F30' : '#0C0'};font-weight:bold;">(<fmt:formatNumber value="${afPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>
														</td>
													</tr>
												</table>
											</div>
										</td>
										<td width="25%">
											<div align="right" style="border: 1px solid #CCCCCC; padding: 10px; border-radius: 10px 10px 10px 10px;">
												<strong style="font-size:16px;height: 40px;line-height: 20px;">
													<c:choose>
														<c:when test="${model.departments != null && fn:length(model.departments) == 1}">
															Lợi nhuận gộp (${model.departments[0]})
														</c:when>
														<c:otherwise>
															Tổng LNG
														</c:otherwise>
													</c:choose>
												</strong>
												<c:set var="afPer" value="${model.totalKPI1PayRevenue > 0?model.total1PayRevenueSummary*100/model.totalKPI1PayRevenue:0}" />
												<c:set var="bfPer" value="${model.totalPass1PayRevenueSummary > 0?model.totalKPI1PayRevenue/model.totalPass1PayRevenueSummary*100:0}" />
												<table width="100%">
													<tr>
														<td align="right">
															<strong>
																Kỳ trước:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalPass1PayRevenueSummary/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right">
															<strong>
																KPI <span style="color:${bfPer < 100 ? '#F30' : '#0C0'};" class="kpi_percent">(<fmt:formatNumber value="${bfPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>:
															</strong>
														</td>
														<td align="right">
															<strong>
																<fmt:formatNumber value="${model.totalKPI1PayRevenue/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<strong>
																Kỳ này:
															</strong>
														</td>
														<td align="right" valign="top">
															<strong>
																<fmt:formatNumber value="${model.total1PayRevenueSummary/unit}" currencyCode="VND" maxFractionDigits="0" />M
															</strong>
															<span style="color:${afPer < 100 ? '#F30' : '#0C0'};font-weight:bold;">(<fmt:formatNumber value="${afPer}" maxFractionDigits="2" minFractionDigits="2" />%)</span>
														</td>
													</tr>
												</table>
											</div>
										</td>
										</tr>
									</table>	
								</div>
								
								<%-- <div class="dash_row">
									<div class="dash_no_box">
										<table cellpadding="0" cellspacing="0" width="100%" border="0">
											<tr>
												<td width="33%" class="dash_no_head">Tổng lợi nhuận 1Pay</td>
												<td width="33%" class="dash_no_head">Tổng doanh thu phân chia</td>
												<td width="33%" class="dash_no_head">Tổng doanh thu khách hàng</td>
											</tr>
											<tr>
												<td class="dash_no"><span id="total1PayRevenueSummary"> <fmt:formatNumber value="${model.total1PayRevenueSummary}" currencyCode="VND" /></span></td>
												<td class="dash_no"><span id="totalRevenueSummary"> <fmt:formatNumber value="${model.totalRevenueSummary}" currencyCode="VND" /></span></td>
												<td class="dash_no"><span id="totalBillingSummary"> <fmt:formatNumber value="${model.totalBillingSummary}" currencyCode="VND" /></span></td>
											</tr>
										</table>
									</div>
								</div> --%>
								
								<div class="dash_row" style="${model.departments != null && fn:length(model.departments) == 1?'width:auto;display: none;':''}">
									<%-- <table>
										<tr>
											<th class="transhead" rowspan="2">Doanh thu</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<th colspan="3" class="transhead">${department}</th>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<th class="transhead">Kỳ trước</th>
												<th class="transhead">KPI</th>
												<th class="transhead">Kỳ này</th>
											</c:forEach>
										</tr>
										<tr>
											<td class="transhead" style="text-align: left;">Kpi lợi nhuận 1Pay</td>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata" align="right"><fmt:formatNumber value="${model.mapDeptTotalPassRevenue[department]}" currencyCode="VND" /></td>
												<td class="transdata" align="right"><fmt:formatNumber value="${model.mapDeptTotalKPI1PayRevenue[department]}" currencyCode="VND" /></td>
												<td class="transdata" align="right"><fmt:formatNumber value="${model.mapDeptTotalRevenue[department]}" currencyCode="VND" /></td>
											</c:forEach>
										</tr>
										<tr>
											<td class="transhead" style="text-align: left;">Kpi doanh thu phân chia</td>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata" align="right">111</td>
												<td class="transdata" align="right">111</td>
												<td class="transdata" align="right">111</td>
											</c:forEach>
										</tr>
										<tr>
											<td class="transhead" style="text-align: left;">Kpi doanh thu khách hàng</td>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata" align="right">111</td>
												<td class="transdata" align="right">111</td>
												<td class="transdata" align="right">111</td>
											</c:forEach>
										</tr>
									</table> --%>
									<style>
										.transdata {text-align: right;}
										#detail_tb td div { height: 0; position: relative; width: 0; }
										#detail_tb div.t {border-top: 3em solid transparent;}
										#detail_tb div.b {border-bottom: 6em solid #f88;}
										#detail_tb div.r {border-left: 16em solid #ddd;}
										#detail_tb div.l {border-right: 6em solid transparent;}
										#detail_tb td div p { position: absolute; width: 5.5em; margin: 0; padding: 0 .25em; }
										#detail_tb p.message {text-align: center;}
										#detail_tb div.t p.message {top: -1.5em;}
										#detail_tb div.b p.message {top: 2em;}
										#detail_tb div.r p.message {left: -15em;}
										#detail_tb div.l p.message {left: 0;}
										#detail_tb div p.day {text-align: right;}
										#detail_tb div.l p.day { left: 0; text-align: left; }
										#detail_tb div.r p.day {left: -7em;}
										#detail_tb div.t p.day {top: -2.2em;}
										#detail_tb div.b p.day {top: 0;}
									</style>
									<table id="detail_tb" style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;">
										<tr>
											<td class="transhead" colspan="2" style="padding: 0;">
												<div class="t r">
													<p class="day">Đơn vị</p>
													<p class="message">Chỉ tiêu</p>
										        </div>
											</td>
											<c:if test="${model.departments != null && fn:length(model.departments) > 0}">
												<c:set var="tb" value="${(780 - 192) / fn:length(model.departments)}" />
												<c:forEach var="department" items="${model.departments}" varStatus="status">
													<th class="transhead" width="${tb}px">${department}</th>
												</c:forEach>
											</c:if>
										</tr>
										<!-- Kpi merchant phát sinh doanh thu -->
										<tr>
											<th rowspan="3" class="transhead" style="text-align: left;"><a href="#chart_div_4">Merchants phát sinh doanh thu</a></th>
											<th class="transhead" style="text-align: left;">Kỳ trước</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalPassBillableMerchant[department]}" currencyCode="VND" maxFractionDigits="0" />
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">KPI</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalPassBillableMerchant[department]>0 ? model.mapDeptTotalKPIBillableMerchant[department]/model.mapDeptTotalPassBillableMerchant[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalKPIBillableMerchant[department]}" currencyCode="VND"  maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }" class="kpi_percent">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">Kỳ này</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalKPIBillableMerchant[department]>0 ? model.mapDeptTotalBillableMerchant[department]/model.mapDeptTotalKPIBillableMerchant[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalBillableMerchant[department]}" currencyCode="VND" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<!-- /Kpi merchant phát sinh doanh thu -->
										<!-- Kpi doanh thu khách hàng -->
										<tr>
											<th rowspan="3" class="transhead" style="text-align: left;"><a href="#chart_div_3">Doanh thu khách hàng</a></th>
											<th class="transhead" style="text-align: left;">Kỳ trước</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalPassBilling[department]/unit}" currencyCode="VND" maxFractionDigits="0" />
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">KPI</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalPassBilling[department]>0 ? model.mapDeptTotalKPIBilling[department]/model.mapDeptTotalPassBilling[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalKPIBilling[department]/unit}" currencyCode="VND"  maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }" class="kpi_percent">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">Kỳ này</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalKPIBilling[department]>0 ? model.mapDeptTotalBilling[department]/model.mapDeptTotalKPIBilling[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalBilling[department]/unit}" currencyCode="VND" maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<!-- Kpi doanh thu khách hàng -->
										<!-- Kpi doanh thu phân chia -->
										<tr>
											<th rowspan="3" class="transhead" style="text-align: left;"><a href="#chart_div_2">Doanh thu phân chia</a></th>
											<th class="transhead" style="text-align: left;">Kỳ trước</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalPassRevenue[department]/unit}" currencyCode="VND" maxFractionDigits="0" />
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">KPI</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalPassRevenue[department]>0 ? model.mapDeptTotalKPIRevenue[department]/model.mapDeptTotalPassRevenue[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalKPIRevenue[department]/unit}" currencyCode="VND"  maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }" class="kpi_percent">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">Kỳ này</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalKPIRevenue[department]>0 ? model.mapDeptTotalRevenue[department]/model.mapDeptTotalKPIRevenue[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalRevenue[department]/unit}" currencyCode="VND" maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<!-- Kpi doanh thu phân chia -->
										<!-- Kpi lợi nhuận 1Pay -->
										<tr>
											<th rowspan="3" class="transhead" width="80" style="text-align: left;"><a href="#chart_div_1">Lợi nhuận gộp</a></th>
											<th class="transhead" style="text-align: left;" width="80">Kỳ trước</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalPass1PayRevenue[department]/unit}" currencyCode="VND" maxFractionDigits="0" />
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">KPI</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalPass1PayRevenue[department]>0 ? model.mapDeptTotalKPI1PayRevenue[department]/model.mapDeptTotalPass1PayRevenue[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotalKPI1PayRevenue[department]/unit}" currencyCode="VND" maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }" class="kpi_percent">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<th class="transhead" style="text-align: left;">Kỳ này</th>
											<c:forEach var="department" items="${model.departments}" varStatus="status">
												<c:set var="percent" value="${model.mapDeptTotalKPI1PayRevenue[department]>0 ? model.mapDeptTotal1PayRevenue[department]/model.mapDeptTotalKPI1PayRevenue[department]*100 : 0}" />
												<td class="transdata">
													<fmt:formatNumber value="${model.mapDeptTotal1PayRevenue[department]/unit}" currencyCode="VND" maxFractionDigits="0" /><br />
													<span style="font-size:smaller;color:${percent < 100?'#F30':'#0C0' }">(<fmt:formatNumber value="${percent}" pattern="#,###.##"/>%)</span>
												</td>
											</c:forEach>
										</tr>
										<!-- Kpi lợi nhuận 1Pay -->
									</table>
								</div>
								<div class="dash_row">
									<div id="chart_div_4" style="${model.departments != null && fn:length(model.departments) == 1?'width:50%;display:inline-block;float:left;':''}"></div>
									<div id="chart_div_3" style="${model.departments != null && fn:length(model.departments) == 1?'width:50%;display:inline-block;float:left;':''}"></div>
									<div id="chart_div_2" style="${model.departments != null && fn:length(model.departments) == 1?'width:50%;display:inline-block;float:left;':''}"></div>
									<div id="chart_div_1" style="${model.departments != null && fn:length(model.departments) == 1?'width:50%;display:inline-block;float:left;':''}"></div>
									<script type="text/javascript">
									  google.setOnLoadCallback(drawChart(4));
								      google.setOnLoadCallback(drawChart(1));
								      google.setOnLoadCallback(drawChart(2));
								      google.setOnLoadCallback(drawChart(3));
								      
								      function drawChart(x) {
								    	  var formatter = new google.visualization.NumberFormat({
												pattern : '#,###'
											});
								    	  
								    	  var viewData;
								    	  try {
							    		  if(x == 1)
								    		  viewData = [
												          ['Đơn vị', 'Kỳ trước', { role: 'annotation' }, { role: 'style' }, 'KPI', { role: 'annotation' }, { role: 'style' },	'Kỳ này', { role: 'annotation' }, { role: 'style' }],
												          <c:set var="i" value="0" />
												          <c:forEach var="department" items="${model.departments}" varStatus="status">
												          	<c:if test="${model.mapDeptTotalKPI1PayRevenue[department] > 0}">
												          		<c:set var="per" value="${model.mapDeptTotal1PayRevenue[department] / model.mapDeptTotalKPI1PayRevenue[department]}" />
												          		${i > 0?', ':''}
													          	['${department}', Math.round(${model.mapDeptTotalPass1PayRevenue[department]/unit}*1),
													          	Math.round(${model.mapDeptTotalPass1PayRevenue[department]/unit}),
													          	'#777',
													          	 ${model.mapDeptTotalKPI1PayRevenue[department]/unit},
													          	${model.mapDeptTotalPass1PayRevenue[department]} < 0?
													          	((${model.mapDeptTotalKPI1PayRevenue[department]}/${model.mapDeptTotalPass1PayRevenue[department]}*100).toFixed(2) + '%') : 
													          	Math.round(${model.mapDeptTotalKPI1PayRevenue[department]/unit}),
													          	"${model.mapDeptTotalKPI1PayRevenue[department] == model.mapDeptTotalPass1PayRevenue[department]?'#f8d253':(model.mapDeptTotalKPI1PayRevenue[department] < model.mapDeptTotalPass1PayRevenue[department] ? '#c6524a':'#4a84bd')}",
													          	 ${model.mapDeptTotal1PayRevenue[department]/unit}, 
													          	 (${model.mapDeptTotal1PayRevenue[department]}/${model.mapDeptTotalKPI1PayRevenue[department]}*100).toFixed(2) + '%',
													          	"${per < 0.8 ? 'red' : (per > 1 ? '#2c8f39' : '#f8d253')}"
													          	]<c:set var="i" value="${i+1}" />
												          	</c:if>
												          </c:forEach>
												        ];
								    	  else if(x==2)
								    		  viewData = [
												          ['Đơn vị', 'Kỳ trước', { role: 'annotation' }, { role: 'style' }, 'KPI', { role: 'annotation' }, { role: 'style' },	'Kỳ này', { role: 'annotation' }, { role: 'style' }],
												          <c:set var="i" value="0" />
												          <c:forEach var="department" items="${model.departments}" varStatus="status">
													      	<c:if test="${model.mapDeptTotalKPIRevenue[department] > 0}">
													      		<c:set var="per" value="${model.mapDeptTotalRevenue[department] / model.mapDeptTotalKPIRevenue[department]}" />
													      		${i > 0?', ':''}
													          	['${department}', Math.round(${model.mapDeptTotalPassRevenue[department]/unit}),
													          	Math.round(${model.mapDeptTotalPassRevenue[department]/unit}),
													          	'#777',
													          	 ${model.mapDeptTotalKPIRevenue[department]/unit}, 
													          	${model.mapDeptTotalPassRevenue[department]} < 0?
													          	((${model.mapDeptTotalKPIRevenue[department]}/${model.mapDeptTotalPassRevenue[department]}*100).toFixed(2) + '%') :
													          	Math.round(${model.mapDeptTotalKPIRevenue[department]/unit}),
													          	"${model.mapDeptTotalKPIRevenue[department] == model.mapDeptTotalPassRevenue[department]?'#f8d253':(model.mapDeptTotalKPIRevenue[department] < model.mapDeptTotalPassRevenue[department] ? '#c6524a':'#4a84bd')}",
													          	 ${model.mapDeptTotalRevenue[department]/unit}, 
													          	 (${model.mapDeptTotalRevenue[department]}/${model.mapDeptTotalKPIRevenue[department]}*100).toFixed(2) + '%',
													          	"${per < 0.8 ? 'red' : (per > 1 ? '#2c8f39' : '#f8d253')}"
													          	]<c:set var="i" value="${i+1}" />
												          	</c:if>
												          </c:forEach>
												        ];
								    	  else if(x==3)
								    		  viewData = [
												          ['Đơn vị', 'Kỳ trước', { role: 'annotation' }, { role: 'style' }, 'KPI', { role: 'annotation' }, { role: 'style' },	'Kỳ này', { role: 'annotation' }, { role: 'style' }],
												          <c:set var="i" value="0" />
												          <c:forEach var="department" items="${model.departments}" varStatus="status">
												          	<c:if test="${model.mapDeptTotalKPIBilling[department] > 0}">
												          		<c:set var="per" value="${model.mapDeptTotalBilling[department] / model.mapDeptTotalKPIBilling[department]}" />
												          		${i > 0?', ':''}
													          	['${department}', Math.round(${model.mapDeptTotalPassBilling[department]/unit}),
													          	Math.round(${model.mapDeptTotalPassBilling[department]/unit}),
													          	'#777',
													          	 ${model.mapDeptTotalKPIBilling[department]/unit}, 
													          	${model.mapDeptTotalPassBilling[department]} < 0?
													          	((${model.mapDeptTotalKPIBilling[department]}/${model.mapDeptTotalPassBilling[department]}*100).toFixed(2) + '%') :
													          	Math.round(${model.mapDeptTotalKPIBilling[department]/unit}),
													          	"${model.mapDeptTotalKPIBilling[department] == model.mapDeptTotalPassBilling[department]?'#f8d253':(model.mapDeptTotalKPIBilling[department] < model.mapDeptTotalPassBilling[department] ? '#c6524a':'#4a84bd')}",
													          	 ${model.mapDeptTotalBilling[department]/unit}, 
													          	 (${model.mapDeptTotalBilling[department]}/${model.mapDeptTotalKPIBilling[department]}*100).toFixed(2) + '%',
													          	"${per < 0.8 ? 'red' : (per > 1 ? '#2c8f39' : '#f8d253')}"
													          	]<c:set var="i" value="${i+1}" />
													          </c:if>
												          </c:forEach>
												        ];
								    	  else if(x == 4)
								    		  viewData = [
												          ['Đơn vị', 'Kỳ trước', { role: 'annotation' }, { role: 'style' }, 'KPI', { role: 'annotation' }, { role: 'style' },	'Kỳ này', { role: 'annotation' }, { role: 'style' }],
												          <c:set var="i" value="0" />
												          <c:forEach var="department" items="${model.departments}" varStatus="status">
												          	<c:if test="${model.mapDeptTotalKPIBillableMerchant[department] > 0}">
												          		<c:set var="per" value="${model.mapDeptTotalBillableMerchant[department] / model.mapDeptTotalKPIBillableMerchant[department]}" />
												          		${i > 0?', ':''}
													          	['${department}', Math.round(${model.mapDeptTotalPassBillableMerchant[department]}*1),
													          	Math.round(${model.mapDeptTotalPassBillableMerchant[department]}*1),
													          	'#777',
													          	 ${model.mapDeptTotalKPIBillableMerchant[department]},
													          	${model.mapDeptTotalPassBillableMerchant[department]} < 0?
													          	((${model.mapDeptTotalKPIBillableMerchant[department]}/${model.mapDeptTotalPassBillableMerchant[department]}*100).toFixed(2) + '%') : 
													          	Math.round(${model.mapDeptTotalKPIBillableMerchant[department]}),
													          	"${model.mapDeptTotalKPIBillableMerchant[department] == model.mapDeptTotalPassBillableMerchant[department]?'#f8d253':(model.mapDeptTotalKPIBillableMerchant[department] < model.mapDeptTotalPassBillableMerchant[department] ? '#c6524a':'#4a84bd')}",
													          	 ${model.mapDeptTotalBillableMerchant[department]}, 
													          	 (${model.mapDeptTotalBillableMerchant[department]}/${model.mapDeptTotalKPIBillableMerchant[department]}*100).toFixed(2) + '%',
													          	"${per < 0.8 ? 'red' : (per > 1 ? '#2c8f39' : '#f8d253')}"
													          	]<c:set var="i" value="${i+1}" />
												          	</c:if>
												          </c:forEach>
												        ];
								    	  } catch(e){}
								    	  
								        var data = google.visualization.arrayToDataTable(viewData);
										formatter.format(data, 1);
										formatter.format(data, 2);
										formatter.format(data, 4);
										formatter.format(data, 5);
										formatter.format(data, 7);
										
								        var options = {
								        		height: 300,
								        		chartArea: {width: "${model.departments != null && fn:length(model.departments) == 1?'190':'580'}"},
								          title: chartNames[x-1],
								          legend: { position: "none" },
								          vAxis: { 
								              viewWindow:{
								                min:0
								              }
								            }
								          /* hAxis: {title: chartNames[x-1], titleTextStyle: {color: 'red', bold:true}} */
								        };
								
								        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_'+x));
								        chart.draw(data, options);
								      }
								    </script>
								</div>
							</c:if>
							<%-- <jsp:include page="include_dashboard_popup.jsp" /> --%>
						</form>
						</div>
						
						<style>
							#help table th {background-color: #eee;}
							#help table td {border-bottom: 1px solid #ccc;padding: 5px;}
							#help {width:680px;max-height:800px;min-height:400px;overflow-y:auto;display:none;background:#FFF;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;box-shadow:0 0 4px rgba(0,0,0,0.7);-webkit-box-shadow:0 0 4px rgba(0,0,0,0.7);-moz-box-shadow:0 0 4px rgba(0,0,0,0.7);padding: 20px;}
							#help .close {position:absolute;top:1px;right:1px;padding:3px 6px;display: block;border-radius: 10px;width: 10px;background-color: #2c8f39;color: #fff;}
						</style>
						<div id="help">
							<h2>Chỉ tiêu đăng ký</h2>
							<a  href="javascript:void(0);" onclick="$('#lean_overlay').click();" title="Đóng" class="close">X</a>
							<table width="100%">
								<tr>
									<th class="transhead" colspan="2">Chỉ tiêu</th>
									<c:forEach var="i" begin="1" end="4">
									<th class="transhead">Quý ${i}</th>
									</c:forEach>
								</tr>
								<c:forEach var="department" items="${model.departments}" varStatus="status">
								<tr>
										<th class="transhead" rowspan="4">${department}</th>
										<th class="transhead">Billable Merchants</th>
										<c:forEach var="i" begin="1" end="4">
										<td class="transdata" style="text-align: right;">
											<c:set var="key" value="QUARTER_${i}_${department}" />
											<fmt:formatNumber value="${model.mapDepartmentKPIPerQuarter[key][0]}" currencyCode="VND" maxFractionDigits="0" />
										</td>
										</c:forEach>
									</tr>
									<tr>
										<th class="transhead">Doanh thu khách hàng</th>
										<c:forEach var="i" begin="1" end="4">
										<td class="transdata" style="text-align: right;">
											<c:set var="key" value="QUARTER_${i}_${department}" />
											<fmt:formatNumber value="${model.mapDepartmentKPIPerQuarter[key][1]}" currencyCode="VND" maxFractionDigits="0" />
										</td>
										</c:forEach>
									</tr>
									<tr>
										<th class="transhead">Doanh thu phân chia</th>
										<c:forEach var="i" begin="1" end="4">
										<td class="transdata" style="text-align: right;">
											<c:set var="key" value="QUARTER_${i}_${department}" />
											<fmt:formatNumber value="${model.mapDepartmentKPIPerQuarter[key][2]}" currencyCode="VND" maxFractionDigits="0" />
										</td>
										</c:forEach>
									</tr>
									<tr>
										<th class="transhead">Lợi nhuận gộp</th>
										<c:forEach var="i" begin="1" end="4">
										<td class="transdata" style="text-align: right;">
											<c:set var="key" value="QUARTER_${i}_${department}" />
											<fmt:formatNumber value="${model.mapDepartmentKPIPerQuarter[key][3]}" currencyCode="VND" maxFractionDigits="0" />
										</td>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
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
	<script type="text/javascript">
		/*         */
		jQuery(function($) {

			$(function() {
				$('#hot_productslides').slides({
					preload : true,
					preloadImage : 'images/loading.gif',
					play : 5000,
					pause : 2500,
					hoverPause : true
				});
			});

		});
		/*   */
	</script>
	<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">
		qm_create(0, false, 0, 250, false, false, false, false, false);
	</script>
	<!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->
</body>
</html>
