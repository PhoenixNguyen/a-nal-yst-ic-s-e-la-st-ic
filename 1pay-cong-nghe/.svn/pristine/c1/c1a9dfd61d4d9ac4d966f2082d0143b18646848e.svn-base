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
						<form id="dashboardForm" action="revenue-dashboard.html" method="get">
							<input type="hidden" name="chargingService" value="${param.chargingService }" />
							
							<h1 class="srv_title">
								<c:choose>
									<c:when test="${param.chargingService!=null && fn:length(param.chargingService) >0}">
										<c:out value="${param.chargingService }" /> Charging
									</c:when>
									<c:otherwise>
										Dịch vụ của tôi								
									</c:otherwise>
								</c:choose>
							</h1>
							<div class="dash_row">
								<c:if test="${model.isAdmin}">
								<div class="other_filter">
									<select class="dashboard_filter" id="merchant" name="merchant" style="float: left;">
										<option value="" ${(param.merchant == null || param.merchant=='')?'selected="selected"':''}>Merchants</option>
										<c:forEach var="mer" items="${model.merchants}">
											<option ${param.merchant == mer?'selected="selected"':''} value="${mer}"><c:out value="${mer}" /></option>
										</c:forEach>
									</select> 
									<select class="dashboard_filter" id="paymentProvider" name="paymentProvider" style="float: left;">
										<option value="" ${(param.paymentProvider == null || param.paymentProvider=='')?'selected="selected"':''}>Nhà cung cấp</option>
										<c:forEach var="pp" items="${model.providers}">
											<option ${param.paymentProvider == pp.paymentProvider?'selected="selected"':''} value="${pp.paymentProvider}"><c:out value="${pp.paymentProvider}" /></option>
										</c:forEach>
									</select>
									<!-- 
									<input type="submit" value="Run" name="btnSubmit" class="btn_greensmall" style="height: 100%;margin: 0;width: 50px;margin-left: 5px;" />
									 -->
								</div>
									<script type="text/javascript">
										$(document).ready(function() {
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
										});
									</script>
								</c:if>
							
								<div class="input-prepend">
									<span class="add-on">Chọn ngày:</span><input type="text"
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
							<div class="dash_row">
								<div class="dash_no_box">
									<fmt:formatNumber value="${model.totalRevenueSummary }" var="totalRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalMerchantRevenueSummary }" var="totalMerchantRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.totalProviderRevenueSummary }" var="totalProviderRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									<fmt:formatNumber value="${model.total1PayRevenueSummary }" var="total1PayRevenueSummaryFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
									
									<c:choose>
										<c:when test="${param.chargingService!=null && param.chargingService=='SMS'}">
											<fmt:formatNumber var="totalMerchantRevenuePercent" value="${model.totalRevenueSummary > 0 ? ( model.totalMerchantRevenueSummary/(model.totalRevenueSummary*0.98)) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
										</c:when>
										<c:otherwise>
											<fmt:formatNumber var="totalMerchantRevenuePercent" value="${model.totalRevenueSummary > 0 ? ( model.totalMerchantRevenueSummary/model.totalRevenueSummary) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
										</c:otherwise>
									</c:choose>
									<fmt:formatNumber var="totalProviderRevenuePercent" value="${model.totalRevenueSummary > 0 ? ( model.totalProviderRevenueSummary/model.totalRevenueSummary) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="total1PayRevenuePercent" value="${model.totalRevenueSummary > 0 ? ( model.total1PayRevenueSummary/model.totalRevenueSummary) * 100:0}" maxFractionDigits="2" minFractionDigits="2" />
									<table cellpadding="0" cellspacing="0" width="100%" border="0">
										<tr>
											<td width="22%" class="dash_no_head">Doanh thu phân chia(đ)&nbsp;<img id="myTip" src="<%=request.getContextPath() %>/images/question.png" title="Chú thích" style="vertical-align: bottom; margin-right: 5px;" width="16px"/></td>
											<td width="22%" class="dash_no_head">Doanh thu Merchant(đ)(<c:out value="${totalMerchantRevenuePercent}"/>%)</td>
											<td width="22%" class="dash_no_head">Doanh thu Provider(đ)(<c:out value="${totalProviderRevenuePercent}"/>%)</td>
											<td width="22%" class="dash_no_head">Doanh thu 1Pay(đ)(<c:out value="${total1PayRevenuePercent}"/>%)</td>
										</tr>
										<tr>
											<td class="dash_no"><span id="totalRevenueSummary" style="font-size:24px"> <c:out value="${totalRevenueSummaryFmt}" /></span></td>
											<td class="dash_no"><span id="totalTransSummary" style="font-size:24px"> <c:out value="${totalMerchantRevenueSummaryFmt}" /></span></td>
											<td class="dash_no"><span id="totalFailureSummary" style="font-size:24px"> <c:out value="${totalProviderRevenueSummaryFmt}" /></span></td>
											<td class="dash_no"><span id="totalSuccessSummary" style="font-size:24px"> <c:out value="${total1PayRevenueSummaryFmt}" /></span></td>
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
										 var data = google.visualization.arrayToDataTable([
											['Date', 'Số tiền'],
	                                          <c:forEach var="entry" items="${model.summaryLineChart}">
	                                      			['<c:out value="${entry.key}"/>', <c:out value="${entry.value}"/>],
	                                      	   </c:forEach>
	                                           ]);
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
									<a id="cont" href="#" class="tab${(param.tab == null || param.tab=='' || param.tab=='cont')?'_slc':''}"><span>Sản phẩm</span></a> 
									<a id="telco" href="#" class="tab${param.tab == 'telco'?'_slc':''}">
										<span><c:out value="${param.chargingService =='CARD'?'Loại thẻ':'Nhà mạng'}"></c:out></span>
									</a> 
									<a id="price" href="#" class="tab${param.tab == 'price'?'_slc':''}"><span>Mệnh giá</span></a>
									<c:if test="${model.isAdmin}">
									<a id="merchant" href="#" class="tab${param.tab == 'merchant'?'_slc':''}"><span>Merchants</span></a>
									<a id="provider" href="#" class="tab${param.tab == 'provider'?'_slc':''}"><span>Nhà cung cấp</span></a>
									<a id="service" href="#" class="tab${param.tab == 'service'?'_slc':''}"><span>Dịch vụ</span></a>
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
												|| (model.isAdmin && model.merchantProviderPi!=null && fn:length(model.merchantProviderPi)>0 && model.merchantProviderLine!=null && fn:length(model.merchantProviderLine)>0)
												}">
									<c:forEach var="time" items="${model.lineDatas.times }" varStatus="timeStatus">
										<c:set var="lineData" value="" />
										<c:forEach var="lh" items="${model.lineHeaders }" varStatus="status">
											<c:set var="itemView" value=",${lh}," />
											<c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}">
												<c:if test="${timeStatus.first}">
													<c:set var="lineHeader" value="${lineHeader}'${lh}'" />
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
											<c:choose>
												<c:when test="${param.tab=='telco'}">
													<td width="360">
														<c:out value="${param.chargingService =='CARD'?'Loại thẻ':'Nhà mạng'}"></c:out>
													</td>
												</c:when>
												<c:when test="${param.tab=='price'}">
													<td width="360">Mệnh giá (VNĐ)</td>
												</c:when>
												<c:when test="${model.isAdmin && param.tab=='merchant'}">
													<td width="360">Merchant</td>
												</c:when>
												<c:when test="${model.isAdmin && param.tab=='provider'}">
													<td width="360">Nhà cung cấp</td>
												</c:when>
												<c:when test="${model.isAdmin && param.tab=='service'}">
													<td width="360">Dịch vụ</td>
												</c:when>
												<c:otherwise>
													<td width="360">Sản phẩm</td>
												</c:otherwise>
											</c:choose>
											<td width="150"> Doanh thu phân chia (đ)</td>
											<td width="100">Merchant</td>
											<td width="100">Provider</td>
											<td width="100">1Pay</td>
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
											<c:choose>
												<c:when test="${param.tab=='telco'}">
													<c:forEach var="item" items="${model.telcosPi}" varStatus="status">
														<c:set var="itemView" value=",${item.telco }," />
														<tr>
															<td class="svr_data">
																<table cellpadding="0" cellspacing="0" width="100%" border="0">
																	<tr>
																		<td width="13" style="padding-right: 5px;">
																			<input name="itemView"
																			type="checkbox" 
																			${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																			value="${item.telco}" class="chck_svr" /></td>
																		<td width="13" style="padding-right: 5px;">
																			<!-- <span class="svr_color" style="background: #09F;"></span> --></td>
																		<td>
																			<strong>
																				<c:choose>
																					<c:when test="${item.telco == 'VMS'}">
																						MobiFone
																					</c:when>
																					<c:when test="${item.telco == 'VNP'}">
																						VinaPhone
																					</c:when>
																					<c:when test="${item.telco == 'VTM'}">
																						Viettel
																					</c:when>
																					<c:otherwise>
																						<c:out value="${item.telco}" />
																					</c:otherwise>
																				</c:choose>
																			</strong>
																		</td>
																	</tr>
																</table>
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${revenue}" />
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${merchantRevenue}" />
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${providerRevenue}" />
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${onepayRevenue}" />
															</td>
														</tr>
														<%-- <c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}"> --%>
															<c:set var="piArr" value="${piArr}['${item.telco }', ${item.totalRevenue}]" />
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
															<tr>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.price}" class="chck_svr" /></td>
																			<td width="13" style="padding-right: 5px;">
																				<!-- <span class="svr_color" style="background: #09F;"></span> -->
																			</td>
																			<td style="text-align: right;">
																				<fmt:formatNumber value="${item.price}" var="price" currencyCode="vnd" />
																				<strong><c:out value="${price }" /></strong>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
															</tr>
															<%-- <c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}"> --%>
																<c:set var="piArr" value="${piArr}['${item.price }', ${item.totalRevenue}]" />
																<c:if test="${!status.last}">
																	<c:set var="piArr" value="${piArr}," />
																</c:if>
															<%-- </c:if> --%>
														</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isAdmin && param.tab=='merchant'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.merchant }," />
															<tr>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.merchant}" class="chck_svr" /></td>
																			<td width="13" style="padding-right: 5px;">
																			</td>
																			<td>
																				<strong><c:out value="${item.merchant }" /></strong>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" />
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${item.merchant }', ${item.totalRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isAdmin && param.tab=='provider'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.paymentProvider }," />
															<tr>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.paymentProvider}" class="chck_svr" /></td>
																			<td width="13" style="padding-right: 5px;">
																			</td>
																			<td>
																				<strong><c:out value="${item.paymentProvider }" /></strong>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${item.paymentProvider }', ${item.totalRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:when test="${model.isAdmin && param.tab=='service'}">
													<c:forEach var="item" items="${model.merchantProviderPi}">
															<c:set var="itemView" value=",${item.chargingService }," />
															<tr>
																<td class="svr_data">
																	<table cellpadding="0" cellspacing="0" width="100%" border="0">
																		<tr>
																			<td width="13" style="padding-right: 5px;">
																				<input name="itemView"
																				type="checkbox" 
																				${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																				value="${item.chargingService}" class="chck_svr" /></td>
																			<td width="13" style="padding-right: 5px;">
																			</td>
																			<td>
																				<strong><c:out value="${item.chargingService }" /></strong>
																			</td>
																		</tr>
																	</table>
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${revenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${merchantRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${providerRevenue}" />
																</td>
																<td class="doanhthu_data">
																	<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																	<c:out value="${onepayRevenue}" />
																</td>
															</tr>
															<c:set var="piArr" value="${piArr}['${item.chargingService }', ${item.totalRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach var="item" items="${model.contsPi}">
														<c:set var="itemView" value=",${item.contentService }," />
														<tr>
															<td class="svr_data">
																<table cellpadding="0" cellspacing="0" width="100%" border="0">
																	<tr>
																		<td width="13" style="padding-right: 5px;">
																			<input name="itemView"
																			type="checkbox" 
																			${(model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView))?'checked="checked"':'' } 
																			value="${item.contentService}" class="chck_svr" /></td>
																		<td width="13" style="padding-right: 5px;">
																			<!-- <span class="svr_color" style="background: #09F;"></span> --></td>
																		<td><strong><c:out value="${item.contentService }"/></strong></td>
																	</tr>
																</table>
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="revenue" value="${item.totalRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${revenue}" />
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="merchantRevenue" value="${item.totalMerchantRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${merchantRevenue}" />
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="providerRevenue" value="${item.totalProviderRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${providerRevenue}" />
															</td>
															<td class="doanhthu_data">
																<fmt:formatNumber var="onepayRevenue" value="${item.total1PayRevenue }" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
																<c:out value="${onepayRevenue}" />
															</td>
														</tr>
														<%-- <c:if test="${model.itemsView==null || fn:length(model.itemsView)==0 || fn:contains(model.itemsView, itemView)}"> --%>
															<c:set var="piArr" value="${piArr}['${item.contentService }', ${item.totalRevenue}]" />
															<c:if test="${!status.last}">
																<c:set var="piArr" value="${piArr}," />
															</c:if>
														<%-- </c:if> --%>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>
										
										<script type="text/javascript">
											function drawPiVisualization() {
												var data = google.visualization.arrayToDataTable([
			                                      ['Name', 'Amount'],
			                                      ${piArr}
			                                    ]);
			
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
