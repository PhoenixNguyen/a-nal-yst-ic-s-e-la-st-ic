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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
</script>
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
						<form id="dashboardForm" action="cash-flow.html" method="get">
							<h1 class="srv_title">
								<c:choose>
									<c:when test="${param.chargingService!=null && fn:length(param.chargingService) >0 && param.chargingService =='IAC'}">
										In-App Charging
									</c:when>
									<c:when test="${param.chargingService!=null && fn:length(param.chargingService) >0 && param.chargingService !='IAC'}">
										<c:out value="${param.chargingService }" /> Charging
									</c:when>
									<c:otherwise>
										Báo cáo lợi nhuận gộp								
									</c:otherwise>
								</c:choose>
								<div style="float: right;">
									<a href="http://help.1pay.vn"><img src="<%=request.getContextPath() %>/images/user_help.png" alt="Help Center"  width="24px"/></a>
								</div>
							</h1>
							<div class="dash_row">
								<div class="other_filter">
									<c:if test="${!MBIZ}">
									<select  id="chargingService" name="chargingService" style="float: left; width:85px; margin-right:5px;">
										<option value="" ${(param.chargingService == null || param.chargingService=='')?'selected="selected"':''}>Dịch vụ</option>
										<option ${param.chargingService == 'CARD'?'selected="selected"':''} value="CARD">Card Charging</option>
										<option ${param.chargingService == 'SMS'?'selected="selected"':''} value="SMS">SMS Charging</option>
										<option ${param.chargingService == 'WAP'?'selected="selected"':''} value="WAP">WAP Charging</option>
										<option ${param.chargingService == 'IAC'?'selected="selected"':''} value="IAC">In-App Charging</option>
									</select>
									</c:if>
									<c:if test="${model.departments !=null && fn:length(model.departments) > 1}">
										<c:if test="${!MBIZ}">
											<select id="department" name="department" style="float: left; width:85px; margin-right:5px;">
												<option value="" ${(param.department == null || param.department=='')?'selected="selected"':''}>Dept.</option>
												<c:forEach var="department" items="${model.departments}">
													<option ${param.department == department?'selected="selected"':''} value="${department}"><c:out value="${department}" /></option>
												</c:forEach>
											</select>
										</c:if>
									</c:if>
									<c:if test="${model.merchants !=null && fn:length(model.merchants) > 1}">
									<select  id="merchant" name="merchant" style="float: left; width:90px; margin-right:5px;">
										<option value="" ${(param.merchant == null || param.merchant=='')?'selected="selected"':''}>Merchants</option>
										<c:forEach var="mer" items="${model.merchants}">
											<option ${param.merchant == mer?'selected="selected"':''} value="${mer}"><c:out value="${mer}" /></option>
										</c:forEach>
									</select> 
									</c:if>
									<c:if test="${model.providers!=null && fn:length(model.providers) > 1}">
										<c:if test="${!MBIZ}">
											<select  id="paymentProvider" name="paymentProvider" style="float: left; width:90px; margin-right:5px;">
												<option value="" ${(param.paymentProvider == null || param.paymentProvider=='')?'selected="selected"':''}>Providers</option>
												<c:forEach var="pp" items="${model.providers}">
													<option ${param.paymentProvider == pp?'selected="selected"':''} value="${pp}"><c:out value="${onepay:providerCode2Text(pp)}" /></option>
												</c:forEach>
											</select>
										</c:if>
									</c:if>
									<c:if test="${model.isStaff && model.merchantPolicies!=null && fn:length(model.merchantPolicies) > 1}">
									<select  id="merchantPolicy" name="merchantPolicy" style="float: left; width:90px; margin-right:5px;">
										<option value="" ${(param.merchantPolicy == null || param.merchantPolicy=='')?'selected="selected"':''}>Chính sách</option>
										<c:forEach var="merchantPolicy" items="${model.merchantPolicies}">
											<option ${param.merchantPolicy == merchantPolicy?'selected="selected"':''} value="${merchantPolicy}"><c:out value="${onepay:merchantPolicyCode2Text(merchantPolicy)}" /></option>
										</c:forEach>
									</select>
									</c:if>
									<c:if test="${model.isStaff && account_logined.isAdmin() && model.merchantContracts!=null && fn:length(model.merchantContracts) > 1}">
									<select  id="merchantContract" name="merchantContract" style="float: left; width:90px; margin-right:5px;">
										<option value="" ${(param.merchantContract == null || param.merchantContract=='')?'selected="selected"':''}>Hợp đồng</option>
										<c:forEach var="merchantContract" items="${model.merchantContracts}">
											<option ${param.merchantContract == merchantContract?'selected="selected"':''} value="${merchantContract}"><c:out value="${onepay:merchantContractCode2Text(merchantContract)}" /></option>
										</c:forEach>
									</select>
									</c:if>
								</div>
									<script type="text/javascript">
										$(document).ready(function() {
											$("#chargingService").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#dashboardForm").submit();
												return false;
											});
											$("#department").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#dashboardForm").submit();
												return false;
											});
											$("#merchant").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#dashboardForm").submit();
												return false;
											});
											$("#paymentProvider").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#dashboardForm").submit();
												return false;
											});
											$("#merchantContract").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#dashboardForm").submit();
												return false;
											});
											$("#merchantPolicy").change(function(){
												$('.chck_svr').prop('checked',false);
												$("#dashboardForm").submit();
												return false;
											});
										});
									</script>
							
								<div class="input-prepend">
									<!-- <span style="float: left; line-height: 30px; width:35px;">Chọn:</span> --><input type="text"
														title="Chọn thời gian"
														name="reservation" id="reservation" class="txt_calendar"
														value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}" />
								</div>
								<script type="text/javascript">
									$(document).ready(function() {
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
										},
										function(start, end) {
											val = start.toString('MM/dd/yyyy') + ' - ' + end.toString('MM/dd/yyyy');
											$("#form_daterange").val(val);
											$("#dashboardForm").submit();
										});
									});
								</script>
							</div>
							
							<c:if test="${model.departments !=null && fn:length(model.departments) > 1 && (param.department == null || param.department=='')}">
								<c:if test="${!MBIZ}">
									<div class="dash_row">
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
												    	<fmt:formatNumber value="${model.mapDeptTotal1PayRevenue[dept] }" var="deptTotal1PayRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
												    	<fmt:formatNumber value="${model.mapDeptQuotaRevenue[dept] }" var="deptQuotaRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
												    	<td class="dash_no">
												    		<span style="font-size:12px"> 
												    			<c:out value="${deptTotal1PayRevenueFmt}" />đ (<c:out value="${deptQuotaRevenueFmt}" /> M)
												    		</span>
												    	</td>
													</tr>
												</table>
												</div>
											</td>
										</c:forEach>
										</tr>
										</table>	
									</div>
								</c:if>
							</c:if>
							
							<jsp:include page="include_dashboard_popup.jsp" />
							
							<div class="dash_row">
								<div class="dash_no_box">
									<fmt:formatNumber value="${model.totalRevenueSummary }" var="totalRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalMerchantRevenueSummary }" var="totalMerchantRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalProviderRevenueSummary }" var="totalProviderRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.total1PayRevenueSummary }" var="total1PayRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									
									<fmt:formatNumber value="${model.totalPassRevenueSummary4Percent }" var="totalPassRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalPassMerchantRevenueSummary4Percent }" var="totalPassMerchantRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalPassProviderRevenueSummary4Percent }" var="totalPassProviderRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalPass1PayRevenueSummary4Percent }" var="totalPass1PayRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									
									
									<fmt:formatNumber var="totalLNGRevenuePercentFmt" value="${(model.total1PayRevenueSummary > 0 && model.totalRevenueSummary > 0)?( model.total1PayRevenueSummary/model.totalRevenueSummary) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="total1PayLNGRevenuePercentFmt" value="${(model.totalPass1PayRevenueSummary4Percent > 0 && model.totalRevenueSummary4Percent > 0)?( (model.total1PayRevenueSummary4Percent*model.totalPassRevenueSummary4Percent)/(model.totalPass1PayRevenueSummary4Percent*model.totalRevenueSummary4Percent) -1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									
									<fmt:formatNumber var="totalRevenuePercent" value="${(model.totalPassRevenueSummary4Percent > 0 && model.totalRevenueSummary4Percent > 0)?( model.totalRevenueSummary4Percent/model.totalPassRevenueSummary4Percent -1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="totalMerchantRevenuePercent" value="${(model.totalPassMerchantRevenueSummary4Percent > 0 && model.totalMerchantRevenueSummary4Percent > 0)?( model.totalMerchantRevenueSummary4Percent/model.totalPassMerchantRevenueSummary4Percent -1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="totalProviderRevenuePercent" value="${(model.totalPassProviderRevenueSummary4Percent > 0 && model.totalProviderRevenueSummary4Percent > 0)?( model.totalProviderRevenueSummary4Percent/model.totalPassProviderRevenueSummary4Percent -1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="total1PayRevenuePercent" value="${(model.totalPass1PayRevenueSummary4Percent > 0 && model.total1PayRevenueSummary4Percent > 0)?( model.total1PayRevenueSummary4Percent/model.totalPass1PayRevenueSummary4Percent -1) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									
									<table cellpadding="0" cellspacing="0" width="100%" border="0">
										<tr>
											<td width="30%" class="dash_no_head" align="right">DT phân chia(đ)(<span style="color:${fn:contains(totalRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalRevenuePercent}"/>%</span>)&nbsp;<img id="myTip" src="<%=request.getContextPath() %>/images/question.png" title="Chú thích" style="vertical-align: bottom; margin-right: 5px;" width="16px"/></td>
											<td width="25%" class="dash_no_head" align="right">Merchants(đ)(<span style="color:${fn:contains(totalMerchantRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalMerchantRevenuePercent}"/>%</span>)</td>
											<c:if test="${model.isStaff}">
												<c:if test="${!MBIZ}">
												<td width="25%" class="dash_no_head" align="right">Providers(đ)(<span style="color:${fn:contains(totalProviderRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalProviderRevenuePercent}"/>%</span>)</td>
												</c:if>
											<td width="5%" class="dash_no_head" align="right">%LNG(<span style="color:${fn:contains(total1PayLNGRevenuePercentFmt,'-')?'#F30':'#0C0' }"><c:out value="${total1PayLNGRevenuePercentFmt }"/>%</span>)</td>
											<td width="15%" class="dash_no_head" align="right">1Pay(đ)(<span style="color:${fn:contains(total1PayRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${total1PayRevenuePercent}"/>%</span>)</td>
											</c:if>
										</tr>
										<tr>
											<c:choose>
												<c:when test="${model.totalRevenueSummary4Percent > model.totalPassRevenueSummary4Percent}">
													<td class="dash_no_money"><span id="totalRevenueSummary" style="font-size:24px"> <c:out value="${totalRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:when test="${model.totalRevenueSummary4Percent < model.totalPassRevenueSummary4Percent}">
													<td class="dash_no"><span id="totalRevenueSummary" style="color: red;font-size:24px"> <c:out value="${totalRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:otherwise>
													<td class="dash_no"><span id="totalRevenueSummary" style="font-size:24px"> <c:out value="${totalRevenueSummaryFmt}" /></span></td>
												</c:otherwise>
											</c:choose>
											
											<c:choose>
												<c:when test="${model.totalMerchantRevenueSummary4Percent > model.totalPassMerchantRevenueSummary4Percent}">
													<td class="dash_no_money"><span id="totalMerchantRevenueSummary" style="font-size:24px"> <c:out value="${totalMerchantRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:when test="${model.totalRevenueSummary4Percent < model.totalPassRevenueSummary4Percent}">
													<td class="dash_no"><span id="totalMerchantRevenueSummary" style="color: red;font-size:24px"> <c:out value="${totalMerchantRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:otherwise>
													<td class="dash_no"><span id="totalMerchantRevenueSummary" style="font-size:24px"> <c:out value="${totalMerchantRevenueSummaryFmt}" /></span></td>
												</c:otherwise>
											</c:choose>
											<c:if test="${model.isStaff}">
												<c:if test="${!MBIZ}">
													<c:choose>
														<c:when test="${model.totalProviderRevenueSummary4Percent > model.totalPassProviderRevenueSummary4Percent}">
															<td class="dash_no_money"><span id="totalProviderRevenueSummary" style="font-size:24px"> <c:out value="${totalProviderRevenueSummaryFmt}" /></span></td>
														</c:when>
														<c:when test="${model.totalProviderRevenueSummary4Percent < model.totalPassProviderRevenueSummary4Percent}">
															<td class="dash_no"><span id="totalProviderRevenueSummary" style="color: red;font-size:24px"> <c:out value="${totalProviderRevenueSummaryFmt}" /></span></td>
														</c:when>
														<c:otherwise>
															<td class="dash_no"><span id="totalProviderRevenueSummary" style="font-size:24px"> <c:out value="${totalProviderRevenueSummaryFmt}" /></span></td>
														</c:otherwise>
													</c:choose>
												</c:if>
											<td class="dash_no"><span id="totalLNGRevenuePercent" style="font-size:24px;color:${fn:contains(total1PayLNGRevenuePercentFmt,'-')?'#F30':'#0C0' }"> <c:out value="${totalLNGRevenuePercentFmt}" />%</span></td>
											<c:choose>
												<c:when test="${model.total1PayRevenueSummary4Percent > model.totalPass1PayRevenueSummary4Percent}">
													<td class="dash_no_money"><span id="total1PayRevenueSummary" style="font-size:24px"> <c:out value="${total1PayRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:when test="${model.totalProviderRevenueSummary4Percent < model.totalPassProviderRevenueSummary4Percent}">
													<td class="dash_no"><span id="total1PayRevenueSummary" style="color: red;font-size:24px"> <c:out value="${total1PayRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:otherwise>
													<td class="dash_no"><span id="total1PayRevenueSummary" style="font-size:24px"> <c:out value="${total1PayRevenueSummaryFmt}" /></span></td>
												</c:otherwise>
											</c:choose>
											</c:if>
										</tr>
									</table>
	               					<script type="text/javascript" language="javascript">
										$(document).ready(function() {
								
											$("#myTip").qtip({
												content: 'Doanh thu phân chia: Tổng phần doanh thu 1Pay thu về sau khi trừ đi chi phí trả nhà mạng.',										
												position : {
													corner : {
														target : 'topRight',
														tooltip : 'bottomLeft'
													}
												},
												style : {
													name : 'cream',
													tip : 'bottomLeft',
													border : {
														width : 1,
														radius : 12,
														color : '#F49105'
													},
													color : '#fff',
													background : '#F49105'
												}
											});
										});
									</script>
								</div>
							</div>
							<c:if test="${model.summaryLineChart!=null}">
							<div class="dash_row">
								<!-- KHU VUC BIEU DO LINE SUMMARY-->
								<div id="summary_line_chart_div"></div>
								<script>
									function drawSummaryLineVisualization() {
										var formatter = new google.visualization.NumberFormat({
											pattern : '#,###',
										});
										
										 var data = google.visualization.arrayToDataTable([
										<c:choose>
											<c:when test="${model.summaryLineChart1!=null}">
												['Date', '<c:out value="${model.summaryLineChartHeader}"/>','<c:out value="${model.summaryLineChartHeader1}"/>'],
	                                           	<c:forEach var="entry" items="${model.summaryLineChart}">
	                                           		<c:set var="key" value="${entry.key}" />
	                                       			['<c:out value="${key}"/>', <c:out value="${model.summaryLineChart[key]}"/>, <c:out value="${model.summaryLineChart1[key]}"/>],
	                                       	   	</c:forEach>
	                                            ]);
										 	
												 formatter.format(data, 1); // Apply formatter to second column
												 formatter.format(data, 2); // Apply formatter to third column
											</c:when>
											<c:otherwise>
												['Date', 'Số tiền'],
	                                           <c:forEach var="entry" items="${model.summaryLineChart}">
	                                       			['<c:out value="${entry.key}"/>', <c:out value="${entry.value}"/>],
	                                       	   </c:forEach>
	                                            ]);
	                                            formatter.format(data, 1); // Apply formatter to second column
											</c:otherwise>
										</c:choose>
										
										var options = {
									      series: {
									        0:{color: '#3366cc', lineWidth: 2, pointSize: 1},
									        1:{color: '#5CC26A', lineWidth: 2, pointSize: 1},
									      },
									    };

                                            var chart = new google.visualization.AreaChart(document.getElementById('summary_line_chart_div'));
                                            chart.draw(data, options);
										};
										google.setOnLoadCallback(drawSummaryLineVisualization);
								</script>
								<!-- /KHU VUC BIEU DO LINE SUMMARY-->
							</div>
							</c:if>
							<div class="dash_row">
								<div id="dash_tab">
									<c:if test="${!MBIZ}">
										<a id="service" href="#" class="tab${param.tab == null || param.tab=='' || param.tab == 'service'?'_slc':''}"><span>D.Vụ</span></a>
									</c:if>
									<c:if test="${model.merchants !=null && fn:length(model.merchants) > 1}">
									<a id="merchant" href="#" class="tab${(param.tab=='merchant')?'_slc':''}"><span>Merchants</span></a>
									<a id="new_merchant" href="#" class="tab${param.tab=='new_merchant'?'_slc':''}"><span>Merchants mới</span></a>
									</c:if>
									<a id="cont" href="#" class="tab${(param.tab=='cont' || ( (model.merchants== null || fn:length(model.merchants) < 1) && (param.tab == null || param.tab=='')))?'_slc':''}"><span>S.Phẩm</span></a> 
									<c:if test="${model.providers !=null}">
										<c:if test="${!MBIZ}">
											<a id="provider" href="#" class="tab${param.tab == 'provider'?'_slc':''}"><span>Providers</span></a>
										</c:if>
									</c:if>
									<a id="telco" href="#" class="tab${param.tab == 'telco'?'_slc':''}">
										<span><c:out value="${param.chargingService =='CARD'?'Loại thẻ':'Nhà mạng'}"></c:out></span>
									</a> 
									<a id="price" href="#" class="tab${param.tab == 'price'?'_slc':''}"><span>Mệnh giá</span></a>
									<c:if test="${model.isStaff && model.merchantContracts!=null && fn:length(model.merchantContracts) > 1}">
									<a id="merchant_policy" href="#" class="tab${param.tab == 'merchant_policy'?'_slc':''}"><span>C.Sách</span></a>
									</c:if>
									<c:if test="${model.isStaff && account_logined.isAdmin() && model.merchantContracts!=null && fn:length(model.merchantContracts) > 1}">
									<a id="merchant_contract" href="#" class="tab${param.tab == 'merchant_contract'?'_slc':''}"><span>HĐ</span></a>
									</c:if>
									<input type="hidden" value="${param.tab}" name="tab" id="tab" />
									<script type="text/javascript">
										$(document).ready(function() {
											$('#dash_tab a').live('click', function(){
												$('#tab').val($(this).attr('id'));
												
												$('.chck_svr').prop('checked',false);
												
												$('#dashboardForm').submit();
												return false;
											});
										});
									</script>
									<div class="clear"></div>
								</div>
							</div>
							<div class="dash_row">
								<!-- KHU VUC BIEU DO LINE -->
								<div id="line_chart_div"></div>
								<c:set var="lineHeader" value="" />
								<c:set var="lineDatas" value="" />
								<c:if test="${(param.tab=='telco' && model.telcosPi!=null && model.telcosLine!=null && fn:length(model.telcosPi)>0 && fn:length(model.telcosLine)>0)
												|| (param.tab=='price' && model.pricesPi!=null && model.pricesLine!=null && fn:length(model.pricesPi)>0 && fn:length(model.pricesLine)>0)
												|| (model.contsPi!=null && model.contsLine!=null && fn:length(model.contsPi)>0 && fn:length(model.contsLine)>0)
												|| (model.isStaff && model.merchantProviderPi!=null && fn:length(model.merchantProviderPi)>0 && model.merchantProviderLine!=null && fn:length(model.merchantProviderLine)>0)
												}">
									<c:forEach var="time" items="${model.lineDatas.times }" varStatus="timeStatus">
										<c:set var="lineData" value="" />
										<c:forEach var="lh" items="${model.lineHeaders }" varStatus="status">
											<c:set var="itemView" value=",${lh}," />
											<c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}">
												<c:if test="${timeStatus.first}">
													<c:set var="lineHeader" value="${lineHeader}'${(model.contsPi!=null && model.contsLine!=null && fn:length(model.contsPi)>0 && fn:length(model.contsLine)>0) ? onepay:getContentName(lh, pageContext.request):(model.telcosPi!=null && model.telcosLine!=null && fn:length(model.telcosPi)>0 && fn:length(model.telcosLine)>0) ? onepay:getOperatorName(lh):lh}'" />
													<c:if test="${!status.last}">
														<c:set var="lineHeader" value="${lineHeader}," />
													</c:if>
												</c:if>
												<c:set var="key" value="${time}_${lh}" />
												<c:set var="lineData" value="${lineData}${model.lineDatas[key]}" />
												<c:if test="${!status.last}">
													<c:set var="lineData" value="${lineData}," />
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${timeStatus.first}">
											<c:set var="lineHeader" value="['Time', ${lineHeader}]," />
										</c:if>
										<c:set var="lineData" value="['${time}', ${lineData}]" />
									
										<c:set var="lineDatas" value="${lineDatas}${lineData}" />
										<c:if test="${!timeStatus.last}">
											<c:set var="lineDatas" value="${lineDatas}," />
										</c:if>
									</c:forEach>
									<c:set var="lineDatas" value="[${lineHeader}${lineDatas}]" />
								</c:if>
								<script type="text/javascript">
									function drawLineVisualization() {
									  var data = google.visualization.arrayToDataTable(${fn:replace(lineDatas,',]',']')});
									  
									  var formatter = new google.visualization.NumberFormat({
											pattern : '#,###',
										});
									  	formatter.format(data, 1); // Apply formatter to second column
										formatter.format(data, 2); // Apply formatter to third column
										formatter.format(data, 3); // Apply formatter to fourth column
										
									  var options = {
									  };
									  var chart = new google.visualization.LineChart(document.getElementById('line_chart_div'));
									  chart.draw(data, options);
									};
									google.setOnLoadCallback(drawLineVisualization);
								</script>
								<!-- / KHU VUC BIEU DO LINE -->
							</div>
							
							
							
							<div class="dash_row">
								<!-- TABLE DASH CONTENT -->
								<div class="table_dash_head">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td width="360" align="left">Thống kê chi tiết</td>
											<td width="80%">&nbsp;</td>
										</tr>
									</table>
								</div>
							
								<div class="table_dash_body">
									<div class="round_graph">
										<div>
											<div id="pi_chart_div" style="width:165px; height:165px;"></div>
										</div>
									</div>
									<div class="table_data" id="table_data">
										<c:set var="piArr" value="" />

										<table cellpadding="0" cellspacing="0" width="100%" border="0">
											<tr >
													<c:choose>
														<c:when test="${param.tab=='telco'}">
															<td width="360" align="center">
																<strong><c:out value="${param.chargingService =='CARD'?'Loại thẻ':'Nhà mạng'}"></c:out></strong>
															</td>
														</c:when>
														<c:when test="${param.tab=='price'}">
															<td width="360" align="center"><strong>Mệnh giá (VNĐ)</strong></td>
														</c:when>
														<c:when test="${model.isStaff && param.tab=='merchant'}">
															<td width="360" align="center"><strong>Merchant</strong></td>
														</c:when>
														<c:when test="${model.isStaff && param.tab=='new_merchant'}">
															<td width="360" align="center"><strong>Merchant</strong></td>
														</c:when>
														<c:when test="${model.isStaff && param.tab=='provider'}">
															<c:if test="${!MBIZ}">
																<td width="360" align="center"><strong>Nhà cung cấp</strong></td>
															</c:if>
														</c:when>
														<c:when test="${model.isStaff && (param.tab == null || param.tab=='' || param.tab=='service')}">
															<c:if test="${!MBIZ}">
																<td width="360" align="center"><strong>Dịch vụ</strong></td>
															</c:if>
														</c:when>
														<c:when test="${param.tab=='cont'}">
															<td width="360" align="center"><strong>Sản phẩm</strong></td>
														</c:when>
														<c:when test="${model.isStaff && param.tab=='merchant_policy'}">
															<td width="360" align="center"><strong>Chính sách</strong></td>
														</c:when>
														<c:when test="${model.isStaff && account_logined.isAdmin() && param.tab=='merchant_contract'}">
															<td width="360" align="center"><strong>Hợp đồng</strong></td>
														</c:when>
														<c:otherwise>
															<td width="360" align="center"><strong>Sản phẩm</strong></td>
														</c:otherwise>
													</c:choose>
													<td width="150" height="40" align="center"><strong>DT phân chia (đ)</strong></td>
													<td width="100" align="center"><strong>Merchants</strong></td>
													<c:if test="${!MBIZ}">
													<td width="100" align="center"><strong>Providers</strong></td>
													</c:if>
													<td width="50" align="center"><strong>%LNG</strong></td>
													<td width="100" align="center"><strong>1Pay</strong></td>
													<td width="50" align="center"><strong>+/- %</strong></td>
												</tr>
											<%int count=0;final int limit =20; %>	
											<c:choose>
												<c:when test="${param.tab=='telco'}">
													<c:forEach var="item" items="${model.telcosPi}" varStatus="status">
														<c:set var="itemView" value=",${item.telco }," />
														<%count++;if(count<=limit){ %>
														<tr>
														<%}else{%>
														<tr class="tr_hidden" style="display:none">
														<%};%>
															<td class="svr_data">
																<table cellpadding="0" cellspacing="0" width="100%" border="0">
																	<tr>
																		<td width="13" style="padding-right: 5px;">
																			<input name="itemView"
																			type="checkbox" 
																			${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																			value="${item.telco}" class="chck_svr" /></td>
																		<td>
																			<strong>
																				<c:out value="${onepay:getOperatorName(item.telco) }"/>
																			</strong>
																		</td>
																	</tr>
																</table>
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${revenue}" />
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${merchantRevenue}" />
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${providerRevenue}" />
															</td>
															<td class="tyle_data">
																<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																<c:out value="${onepayRevenuePercent}" />%
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${onepayRevenue}" />
															</td>
															<td class="tyle_data">
																<c:set var="key" value="${item.telco}_per" />
																<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2" />
																<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																	<c:out value="${percent}" />%
																</span>
															</td>
														</tr>
														<%-- <c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}"> --%>
															<c:set var="piArr" value="${piArr}['${onepay:getOperatorName(item.telco) }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
														<%-- </c:if> --%>
													</c:forEach>
												</c:when>
												<c:when test="${param.tab=='price'}">
													<c:forEach var="item" items="${model.pricesPi}">
														<c:if test="${item.price > 0}">
															<c:set var="itemView" value=",${item.price }," />
															<%count++;if(count<=limit){ %>
															<tr>
															<%}else{%>
															<tr class="tr_hidden" style="display:none">
															<%};%>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.price}" class="chck_svr" /></td>
																			<td style="text-align: right;">
																				<fmt:formatNumber value="${item.price}" var="price" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
																				<strong><c:out value="${price }" /></strong>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="tyle_data">
																	<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																	<c:out value="${onepayRevenuePercent}" />%
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
																<td class="tyle_data">
																	<c:set var="key" value="${item.price}_per" />
																	<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																	<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																		<c:out value="${percent}" />%
																	</span>
																</td>
															</tr>
															<%-- <c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}"> --%>
																<c:set var="piArr" value="${piArr}['${item.price }', ${item.total1PayRevenue}]" />
																<c:if test="${!status.last}">
																	<c:set var="piArr" value="${piArr}," />
																</c:if>
															<%-- </c:if> --%>
														</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isStaff && param.tab=='merchant'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.merchant }," />
															<%count++;if(count<=limit){ %>
															<tr>
															<%}else{%>
															<tr class="tr_hidden" style="display:none">
															<%};%>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.merchant}" class="chck_svr" /></td>
																			<td>
																				<a href="<%=request.getContextPath()%>/protected/cash-flow.html?${onepay:setParam(pageContext.request.queryString,'merchant',item.merchant) }"><strong><c:out value="${item.merchant }" />
																				(<c:out value="${onepay:getDepartmentOfMerchant(item.merchant) }" /><c:if test="${model.isStaff && account_logined.isAdmin()}">-<c:out value="${onepay:getContractTypeOfMerchant(item.merchant, pageContext.request) }" /></c:if>)
																				</strong></a>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="tyle_data">
																	<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																	<c:out value="${onepayRevenuePercent}" />%
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
																<td class="tyle_data">
																	<c:set var="key" value="${item.merchant}_per" />
																	<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																	<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																		<c:out value="${percent}" />%
																	</span>
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${item.merchant }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isStaff && param.tab=='new_merchant'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.merchant }," />
															<%count++;if(count<=limit){ %>
															<tr>
															<%}else{%>
															<tr class="tr_hidden" style="display:none">
															<%};%>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.merchant}" class="chck_svr" /></td>
																			<td>
																				<a href="<%=request.getContextPath()%>/protected/cash-flow.html?${onepay:setParam(pageContext.request.queryString,'merchant',item.merchant) }"><strong><c:out value="${item.merchant }" />
																				(<c:out value="${onepay:getDepartmentOfMerchant(item.merchant) }" /><c:if test="${model.isStaff && account_logined.isAdmin()}">-<c:out value="${onepay:getContractTypeOfMerchant(item.merchant, pageContext.request) }" /></c:if>)
																				</strong></a>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="tyle_data">
																	<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																	<c:out value="${onepayRevenuePercent}" />%
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
																<td class="tyle_data">
																	<c:set var="key" value="${item.merchant}_per" />
																	<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																	<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																		<c:out value="${percent}" />%
																	</span>
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${item.merchant }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isStaff && param.tab=='provider'}">
													<c:if test="${!MBIZ}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.paymentProvider }," />
															<%count++;if(count<=limit){ %>
															<tr>
															<%}else{%>
															<tr class="tr_hidden" style="display:none">
															<%};%>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.paymentProvider}" class="chck_svr" /></td>
																			<td>
																				<a href="<%=request.getContextPath()%>/protected/cash-flow.html?${onepay:setParam(pageContext.request.queryString,'paymentProvider',item.paymentProvider) }"><strong><c:out value="${onepay:providerCode2Text(item.paymentProvider) }" /></strong></a>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="tyle_data">
																	<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																	<c:out value="${onepayRevenuePercent}" />%
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
																<td class="tyle_data">
																	<c:set var="key" value="${item.paymentProvider}_per" />
																	<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																	<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																		<c:out value="${percent}" />%
																	</span>
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${onepay:providerCode2Text(item.paymentProvider) }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
													</c:if>
												</c:when>
												<c:when test="${model.isStaff && param.tab=='merchant_policy'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.merchantPolicy }," />
															<%count++;if(count<=limit){ %>
															<tr>
															<%}else{%>
															<tr class="tr_hidden" style="display:none">
															<%};%>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.merchantPolicy}" class="chck_svr" /></td>
																			<td>
																				<a href="<%=request.getContextPath()%>/protected/cash-flow.html?${onepay:setParam(pageContext.request.queryString,'merchantPolicy',item.merchantPolicy) }"><strong><c:out value="${onepay:merchantPolicyCode2Text(item.merchantPolicy) }" /></strong></a>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="tyle_data">
																	<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																	<c:out value="${onepayRevenuePercent}" />%
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
																<td class="tyle_data">
																	<c:set var="key" value="${item.merchantPolicy}_per" />
																	<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																	<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																		<c:out value="${percent}" />%
																	</span>
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${onepay:merchantPolicyCode2Text(item.merchantPolicy) }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isStaff && account_logined.isAdmin() && param.tab=='merchant_contract'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.merchantContract }," />
															<%count++;if(count<=limit){ %>
															<tr>
															<%}else{%>
															<tr class="tr_hidden" style="display:none">
															<%};%>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.merchantPolicy}" class="chck_svr" /></td>
																			<td>
																				<a href="<%=request.getContextPath()%>/protected/cash-flow.html?${onepay:setParam(pageContext.request.queryString,'merchantContract',item.merchantContract) }"><strong><c:out value="${onepay:merchantContractCode2Text(item.merchantContract) }" /></strong></a>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="tyle_data">
																	<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																	<c:out value="${onepayRevenuePercent}" />%
																</td>
																<td class="doanhthu_data" style="padding: 5px">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
																<td class="tyle_data">
																	<c:set var="key" value="${item.merchantContract}_per" />
																	<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																	<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																		<c:out value="${percent}" />%
																	</span>
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${item.merchantContract }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isStaff && (param.tab == null || param.tab=='' || param.tab=='service')}">
													<c:if test="${!MBIZ}">
														<c:forEach var="item" items="${model.merchantProviderPi}">
																<c:set var="itemView" value=",${item.chargingService }," />
																<%count++;if(count<=limit){ %>
																<tr>
																<%}else{%>
																<tr class="tr_hidden" style="display:none">
																<%};%>
																	<td class="svr_data">
																		<table cellpadding="0" cellspacing="0" width="100%" border="0">
																			<tr>
																				<td width="13" style="padding-right: 5px;">
																					<input name="itemView"
																					type="checkbox" 
																					${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																					value="${item.chargingService}" class="chck_svr" /></td>
																				<td>
																					<a href="<%=request.getContextPath()%>/protected/cash-flow.html?${onepay:setParam(pageContext.request.queryString,'chargingService',item.chargingService) }"><strong><c:out value="${item.chargingService }" /></strong></a>
																				</td>
																			</tr>
																		</table>
																	</td>
																	<td class="doanhthu_data" style="padding: 5px">
																		<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																		<c:out value="${revenue}" />
																	</td>
																	<td class="doanhthu_data" style="padding: 5px">
																		<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																		<c:out value="${merchantRevenue}" />
																	</td>
																	<td class="doanhthu_data" style="padding: 5px">
																		<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																		<c:out value="${providerRevenue}" />
																	</td>
																	<td class="tyle_data">
																		<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																		<c:out value="${onepayRevenuePercent}" />%
																	</td>
																	<td class="doanhthu_data">
																		<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																		<c:out value="${onepayRevenue}" />
																	</td>
																	<td class="tyle_data">
																		<c:set var="key" value="${item.chargingService}_per" />
																		<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2"  currencyCode="vnd" />
																		<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																			<c:out value="${percent}" />%
																		</span>
																	</td>
																</tr>
																<c:set var="piArr" value="${piArr}['${item.chargingService }', ${item.total1PayRevenue}]" />
																<c:if test="${!status.last}">
																	<c:set var="piArr" value="${piArr}," />
																</c:if>
														</c:forEach>
													</c:if>
												</c:when>
												<c:otherwise>
													<c:forEach var="item" items="${model.contsPi}">
														<c:set var="itemView" value=",${item.contentService }," />
														<%count++;if(count<=limit){ %>
														<tr>
														<%}else{%>
														<tr class="tr_hidden" style="display:none">
														<%};%>
															<td class="svr_data">
																<table cellpadding="0" cellspacing="0" width="100%" border="0">
																	<tr>
																		<td width="13" style="padding-right: 5px;">
																			<input name="itemView"
																			type="checkbox" 
																			${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																			value="${item.contentService}" class="chck_svr" /></td>
																		<td>
																			<a href="<%=request.getContextPath()%>/console/details.wss?code=${item.contentService }"><strong><c:out value="${onepay:getContentName(item.contentService, pageContext.request) }"/></strong></a>
																		</td>
																	</tr>
																</table>
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${revenue}" />
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${merchantRevenue}" />
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${providerRevenue}" />
															</td>
															<td class="tyle_data">
																<fmt:formatNumber var="onepayRevenuePercent" value="${(item.total1PayRevenue/item.totalRevenue) * 100}" maxFractionDigits="2" minFractionDigits="2" />
																<c:out value="${onepayRevenuePercent}" />%
															</td>
															<td class="doanhthu_data" style="padding: 5px">
																<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${onepayRevenue}" />
															</td>
															<td class="tyle_data">
																<c:set var="key" value="${item.contentService}_per" />
																<fmt:formatNumber var="percent" value="${model.piDatas2[key] * 100}" maxFractionDigits="2" minFractionDigits="2" />
																<span class="tyle_${fn:contains(percent,'-')?'am':'duong' }">
																	<c:out value="${percent}" />%
																</span>
															</td>
														</tr>
														<%-- <c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}"> --%>
															<c:set var="piArr" value="${piArr}['${onepay:getContentName(item.contentService, pageContext.request) }', ${item.total1PayRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
														<%-- </c:if> --%>
													</c:forEach>
												</c:otherwise>	
											</c:choose>
												<%if(count>limit) {%>
												<tr>
													<td colspan="10" align="right" style="padding:5px;">
														<a href="#" class="show_hide" id="plus" style="float:right; padding-right:20px; cursor: pointer;">[+] Xem thêm</a>
													</td>
												</tr>
												<%} %>
										</table>
										
										<script type="text/javascript">
											function drawPiVisualization() {
												var data = google.visualization.arrayToDataTable([
			                                      ['Name', 'Amount'],
			                                      ${piArr}
			                                    ]);
												
												var formatter = new google.visualization.NumberFormat({
													pattern : '#,###',
												});
												formatter.format(data, 1); // Apply formatter to second column
			
			                                    var options = {
			                                      legend: {position: 'none',},
			                                      chartArea: {width:'100%', height:'100%',left:'0',top:'0'},
			                                    };
			
			                                    var chart = new google.visualization.PieChart(document.getElementById('pi_chart_div'));
			                                    chart.draw(data, options);
											}
											google.setOnLoadCallback(drawPiVisualization);
										</script>
 									</div>
 									<script type="text/javascript">
										$(document).ready(function(){
											$('.chck_svr').live('click', function() {
												$('#dashboardForm').submit();
											});

											$('.show_hide').toggle(function(){
										       $(".tr_hidden").slideDown(
										         function(){
										           $("#plus").text("[-] Thu gọn")
										         }
										       );
										   },function(){
										       $(".tr_hidden").slideUp(
										       function(){
										           $("#plus").text("[+] Xem thêm")
										       }
										       );
										   });
										});
									</script>
								</div>
								<!-- / TABLE DASH CONTENT -->
							</div>
						</form>
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
