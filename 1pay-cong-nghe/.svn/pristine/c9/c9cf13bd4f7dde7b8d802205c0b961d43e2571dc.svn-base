<%@page import="vn.onepay.cdr.filter.model.SmsMerchantProductVerify"%>
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
		noneSelectedText: "Tất cả"
	});
});
</script>
<style>
	.filter_row fieldset {border: solid 1px #ccc;width:95%;}
	.filter_row .product_slc_filter {width:100%;}
	#sms_command_code_merchant {width:680px; display:none; background:#FFF; border-radius:5px; -moz-border-radius:5px; -webkit-border-radius:5px; box-shadow:0 0 4px rgba(0,0,0,0.7); -webkit-box-shadow:0 0 4px rgba(0,0,0,0.7); -moz-box-shadow:0 0 4px rgba(0,0,0,0.7); padding: 20px}
	
	#top_sms_cdr table {width:49%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;float:left;}
	#top_sms_cdr table tr:hover {background-color: #eee}
	span.arrow-up {
		width: 0;height: 0; 
		border-left: 5px solid transparent;  /* left arrow slant */
		border-right: 5px solid transparent; /* right arrow slant */
		border-bottom: 5px solid #2f2f2f; /* bottom, add background color here */
		font-size: 0;
		line-height: 0;
		display: inline-block;
	}
	span.arrow-down {
		width: 0;height: 0; 
		border-left: 5px solid transparent;
		border-right: 5px solid transparent;
		border-top: 5px solid #2f2f2f;
		font-size: 0;
		line-height: 0;
		display: inline-block;
	}
</style>
</head>
<%
	request.setAttribute("APPROVED_STATUS", 		SmsMerchantProductVerify.APPROVED_STATUS);
	request.setAttribute("REJECT_STATUS", 			SmsMerchantProductVerify.REJECT_STATUS);
	request.setAttribute("INIT_STATUS", 			SmsMerchantProductVerify.INIT_STATUS);
	request.setAttribute("PENDING_STATUS", 			SmsMerchantProductVerify.PENDING_STATUS);
%>
<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("smsCdrFilter",true); %>
				<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="left_menu.jsp" />
						<div class="right_content">
				            <h1 class="srv_title"> Phân tích & thống kê thuê bao</h1>
				            <form action="sms-cdr-filter.cdr" method="post">
				            	<div class="dash_row">
				            		<input type="hidden" name="tab" value="${param.tab}" />
									<div id="dash_tab" style="padding-right: 0;">
										<a href="<%=request.getContextPath()%>/cdr/sms-cdr-filter.cdr" class="tab${(param.tab==null || param.tab=='')?'_slc':''}"><span>Thống kê</span></a> 
										<a href="<%=request.getContextPath()%>/cdr/sms-cdr-filter.cdr?tab=verify" class="tab${param.tab=='verify'?'_slc':''}"><span>Xác nhận merchant</span></a>
										
										<div class="clear"></div>
									</div>
								</div>
								
								<c:if test="${param.tab == null || fn:length(param.tab) == 0}">
									<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Lọc kết quả</a>
										</h3>
									</div>
									<div class="box_locketqua">
										<div class="filter_row">
											<div class="product_slc_filter">
												<label class="product_lbl_filter" style="margin-right: 45px;"><strong>MSISDN</strong></label> 
												<input id="msisdn" name="msisdn" value="${param.msisdn }" class="dashboard_filter" placeholder="Nhập msisdn" />
											</div>
										</div>
										<c:if test="${account_logined.isAdmin() && model.merchants != null && fn:length(model.merchants) >1 }">
											<c:set var="allMcs" value="," />
											<c:forEach var="mc" items="${paramValues.merchant}">
												<c:set var="allMcs" value="${allMcs}${mc}," />
											</c:forEach>
											<div class="filter_row">
												<div class="field">
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
																<option value="${merchant}" ${((param.searchMerchant == null || fn:length(param.searchMerchant) == 0) && fn:contains(allMcs, merchant2))?'selected':'' }>
																	<c:out value="${merchant}"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>								
										</c:if>
										
										<div class="filter_row">
											<div class="product_slc_filter" style="width: auto; float:left;">
												<label class="product_lbl_filter"><strong>Command Code</strong></label> 
												<input id="commandCode" name="commandCode" value="${param.commandCode }" class="dashboard_filter" placeholder="Nhập Command Code"/>
											</div>
											<div class="input-prepend" style="float:left;">
												<label class="product_lbl_filter"><strong>Chọn ngày</strong></label> <input type="text"
													name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="Toàn thời gian"
													value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.todaySt}" />
													<a href="javascript: $('#reservation').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a>
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
										</div>
										
										<div class="product_slc_filter filter_row" style="margin-right: 5px;">
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
														<div style="display: inline-block;">
															<c:set var="pr" value=",${provider}," />
															<input type="checkbox" class="chck_filter" name="provider" 
																title="${onepay:providerCode2Text(provider)}" value="${provider}" 
																${fn:contains(allPr, pr)?'checked="checked"':'' } />
															<label class="lbl_chcksub">${onepay:providerCode2Text(provider)}</label>
														</div>
													</c:forEach>
												</div>
											</fieldset>
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
									
									<c:set var="req" value="${pageContext.request}" />
									<c:set var="port" value=":${req.serverPort}" />
									<c:set var="http_base" value="${req.scheme}://${req.serverName}${port == ':80'?'': port}" />
									<c:set var="detailUrl" value="${fn:replace(CURR_POST_URL, 'sms-cdr-filter.cdr', 'cdr-filter-api.cdr')}" />
									<c:set var="maxRow" value="10" />
									<div class="srv_row" id="top_sms_cdr">
										<c:if test="${model.list1 != null && fn:length(model.list1) > 0}">
										<table id="top_msisdn">
											<caption class="transhead" style="border-bottom:none;">Top MSISDN</caption>
											<tr>
												<th class="transhead fit_to_content" style="width: 10%" align="right">STT</th>
												<th class="transhead" width="90">MSISDN</th>
												<th class="transhead" width="90">Merchant</th>
												<th class="transhead">SMS</th>
												<th class="transhead">Amount</th>
											</tr>
											<c:forEach var="item" items="${model.list1}" varStatus="status">
											<tr${status.index>=maxRow?' style="display:none;"':''}>
												<td class="transdata" align="right">${status.index + 1}</td>
												<td class="transdata">${item.msisdn}</td>
												<td class="transdata">${item.merchant}</td>
												<td class="transdata" align="right">
													<fmt:formatNumber value="${item.totalSMS}" currencyCode="VND" />
												</td>
												<td class="transdata" align="right">
													<fmt:formatNumber value="${item.amount}" currencyCode="VND" />
												</td>
											</tr>
											<c:set var="detailUrl" value="${detailUrl}${fn:endsWith(detailUrl, '?')?'':'&'}msisdn=${item.msisdn}&totalMSISDN=${item.totalSMS}" />
											</c:forEach>
											<c:if test="${fn:length(model.list1)>maxRow}">
											<tr style="background-color: #eee">
												<td colspan="5" align="center">
													<a href="#top_msisdn" class="show_more">Show more <span class="arrow-down"></span></a>
												</td>
											</tr>
											</c:if>
										</table>
										</c:if>
										<c:if test="${model.list2 != null && fn:length(model.list2) > 0}">
										<table style="float:right;" id="top_merchant">
											<caption class="transhead" style="border-bottom:none;">Top Merchant</caption>
											<tr>
												<th class="transhead fit_to_content" style="width: 10%" align="right">STT</th>
												<th class="transhead" width="90">Merchant</th>
												<th class="transhead">MSISDNs</th>
												<th class="transhead">SMS</th>
												<th class="transhead">Amount</th>
											</tr>
											<c:forEach var="item" items="${model.list2}" varStatus="status">
											<tr${status.index>=maxRow?' style="display:none;"':''}>
												<td class="transdata" align="right">${status.index + 1}</td>
												<td class="transdata">${item.merchant}</td>
												<td class="transdata" align="right">
													<fmt:formatNumber value="${item.totalMSISDN}" currencyCode="VND" />
												</td>
												<td class="transdata" align="right">
													<fmt:formatNumber value="${item.totalSMS}" currencyCode="VND" />
												</td>
												<td class="transdata" align="right">
													<fmt:formatNumber value="${item.amount}" currencyCode="VND" />
												</td>
											</tr>
											</c:forEach>
											<c:if test="${fn:length(model.list2)>maxRow}">
											<tr style="background-color: #eee">
												<td colspan="5" align="center">
													<a href="#top_merchant" class="show_more">Show more <span class="arrow-down"></span></a>
												</td>
											</tr>
											</c:if>
										</table>
										</c:if>
										<script type="text/javascript">
										$(document).ready(function() {
											$('.show_more').live('click', function() {
												var id = $(this).attr('href');
												var i = 0;
												$(id).find('tr').each(function() {
													i++ ;
													if(i > ${maxRow + 1}) {
														if($(this).find('td').length > 1)
															if($(this).is(':hidden')) {
																$(this).fadeIn(400);
															} else {
																$(this).fadeOut(400);
															}
														else {
															var text = $(this).find('a:first').text();
															if(text.trim() == 'Show more')
																text = 'Show less <span class="arrow-up"></span>';
															else
																text = 'Show more <span class="arrow-down"></span>';
															
															$(this).find('a:first').html(text);
														}
													}
												});
											});
										});
										</script>
									</div>
									<div>
										<iframe style="width: 100%;border: none;height: 1000px;" src="${detailUrl}">
										</iframe>
									</div>
					        	</c:if>
					        	
					        	<c:if test="${param.tab == 'verify'}">
					        		<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Lọc kết quả</a>
										</h3>
									</div>
									<div class="box_locketqua">
										<c:if test="${account_logined.isAdmin() && model.merchants != null && fn:length(model.merchants) >1 }">
											<c:set var="allMcs" value="," />
											<c:forEach var="mc" items="${paramValues.merchant}">
												<c:set var="allMcs" value="${allMcs}${mc}," />
											</c:forEach>
											<div class="filter_row">
												<div class="field">
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
																<option value="${merchant}" ${((param.searchMerchant == null || fn:length(param.searchMerchant) == 0) && fn:contains(allMcs, merchant2))?'selected':'' }>
																	<c:out value="${merchant}"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>								
										</c:if>
										
										<div class="filter_row">
											<div class="product_slc_filter" style="width: auto; float:left;">
												<label class="product_lbl_filter"><strong>Command Code</strong></label> 
												<input id="commandCode" name="commandCode" value="${param.commandCode }" class="dashboard_filter" placeholder="Nhập Command Code"/>
											</div>
											<div class="input-prepend" style="float:left;">
												<label class="product_lbl_filter"><strong>Chọn ngày</strong></label> <input type="text"
													name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="Toàn thời gian"
													value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.todaySt}" />
													<a href="javascript: $('#reservation').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a>
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
												<label class="product_lbl_filter"><strong>Status</strong></label> 
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
															<c:when test="${status == REJECT_STATUS }">
															<option value="${status}" ${param.status == status?'selected="selected"':''}>
																Từ chối
															</option>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
										
										<div class="product_slc_filter filter_row" style="margin-right: 5px;">
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
														<div style="display: inline-block;">
															<c:set var="pr" value=",${provider}," />
															<input type="checkbox" class="chck_filter" name="provider" 
																title="${onepay:providerCode2Text(provider)}" value="${provider}" 
																${fn:contains(allPr, pr)?'checked="checked"':'' } />
															<label class="lbl_chcksub">${onepay:providerCode2Text(provider)}</label>
														</div>
													</c:forEach>
												</div>
											</fieldset>
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
											<%
											request.setAttribute("APPROVED_STATUS", SmsMerchantProductVerify.APPROVED_STATUS);
											request.setAttribute("INIT_STATUS", 	SmsMerchantProductVerify.INIT_STATUS);
											request.setAttribute("REJECT_STATUS", 	SmsMerchantProductVerify.REJECT_STATUS);
											request.setAttribute("PENDING_STATUS",	SmsMerchantProductVerify.PENDING_STATUS);
											%>
											<div>
												<span class="pagebanner" style="float: left;"> ${model.total}
													kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới
													${(model.offset + model.pagesize) > model.total ? model.total :
													(model.offset + model.pagesize) }. </span>
											</div>
										</c:if>
										<display:table name="model.list" id="list"
											requestURI="sms-cdr-filter.cdr" pagesize="${model.pagesize}"
											partialList="true" size="model.total"
											style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;"
											sort="list">
											<%@ include file="display_table.jsp"%>
											<display:column title="STT" headerClass="transhead fit_to_content"
												class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<c:out value="${model.offset + list_rowNum }" />
											</display:column>
								
											<display:column property="merchant" title="Merchant" headerClass="transhead"
												class="svr_data1" style="border: 1px solid #CCC;" />
											<display:column title="Sản phẩm" headerClass="transhead"
												class="svr_data1" style="border: 1px solid #CCC;">
												<a target="_blank" href="<%=request.getContextPath()%>/console/details.wss?code=${list.app_code }"><strong><c:out value="${onepay:getContentName(list.app_code, pageContext.request) }"/></strong></a>				
											</display:column>
											<display:column property="provider" title="Provider" headerClass="transhead"
												class="svr_data1" style="border: 1px solid #CCC;text-align:center;" />
											<display:column property="command_code" title="CMD" headerClass="transhead" class="svr_data1"
												style="border: 1px solid #CCC;font-weight:bold;text-transform: uppercase;" />
											<display:column property="updated_time" title="Updated Time" sortable="true"
												headerClass="transhead" class="transdata"
												format="{0,date,yyyy-MM-dd HH:mm:ss}"
												style="border: 1px solid #CCC;text-align:center;" />
											<display:column title="Verified?" headerClass="transhead" class="svr_data1"
												style="border: 1px solid #CCC;text-align:center">
												<a id="${list.id}" href="#sms-cdr-popup" rel="leanModal" class="sms_verify"
													title="${list.comment}"
													mname="${list.merchant}"
													provider="${list.provider}"
													commandCode="${list.command_code}" 
													status="${list.status}">
												<c:choose>
													<c:when test="${list.status == APPROVED_STATUS}">
														<img src="<%=request.getContextPath()%>/images/check.png" border="0" />
													</c:when>
													<c:when test="${list.status == REJECT_STATUS}">
														<img src="<%=request.getContextPath()%>/images/huy.png" border="0" />
													</c:when>
													<c:otherwise>
														<img src="<%=request.getContextPath()%>/images/invalid.png" border="0" />
													</c:otherwise>
												</c:choose>
												</a>
											</display:column>
										</display:table>
									</div>
					        	</c:if>
				            </form>
				            <div id="sms-cdr-popup" style="display: none;background: #fff;padding: 20px;">
								<jsp:include page="include_sms_verify.jsp" />
							</div>
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