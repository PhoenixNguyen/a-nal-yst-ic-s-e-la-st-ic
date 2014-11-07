<%@page import="vn.onepay.common.SharedConstants"%>
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
	$("#filter_provider").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	$("#filter_card_type").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
});
</script>
</head>

<%
	request.setAttribute("APPROVED_STATUS", 		MerchantProduct.APPROVED_STATUS);
	request.setAttribute("APPROVED_PENDING_STATUS", MerchantProduct.APPROVED_PENDING_STATUS);
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
						<c:choose>
							<c:when test="${model.haveProd || param.submit!=null || fn:length(param.submit) > 0}">
								<h1 class="srv_title">Products</h1>
	
								<form action="manager.wss" method="post">
									<div class="dash_row">
										<c:choose>
											<c:when test="${param.tab=='active'}">
												<input type="hidden" name="tab" value="active" />
											</c:when>
											<c:when test="${param.tab=='inactive'}">
												<input type="hidden" name="tab" value="inactive" />
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
										<div id="dash_tab" style="padding-right: 0;">
											<c:set var="okLabel" value="proposal" />
											<c:if test="${model.isStaff}">
												<c:set var="okLabel" value="approval" />
											</c:if>
											<a href="manager.wss" class="tab${(param.tab==null || param.tab=='')?'_slc':''}"><span>All Products</span>
											</a> <a href="manager.wss?tab=active" class="tab${param.tab=='active'?'_slc':''}"><span>${okLabel == 'proposal'?'Proposed':'Approved'} (<fmt:formatNumber var="totalActive" value="${model.totalActive}" currencyCode="vnd" /> <c:out value="${totalActive}" />)</span>
											</a> <a href="manager.wss?tab=inactive" class="tab${param.tab=='inactive'?'_slc':''}"><span>No ${okLabel} (<fmt:formatNumber var="totalInActive" value="${model.totalInActive}" currencyCode="vnd" /> <c:out value="${totalInActive}" />)</span>
											</a>
											<a href="<%=request.getContextPath()%>/console/create.wss" class="addproduct_link"><span>Add Product</span></a>
											<c:if test="${account_logined.isBizManager() || account_logined.isOperator() || account_logined.isBizSupporter()}">
												<a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss" class="sms_link" style="margin-right: 5px;"><span>SMS Management</span></a>
											</c:if>	
											<div class="clear"></div>
										</div>
									</div>
									<div id="filter_locketqua">
		
										<h3 class="filter_label close">
											<a href="javascript:void(0)">Search box</a>
										</h3>
		
									</div>
		
									<div class="box_locketqua">
										<style>
											.filter_row fieldset {border: solid 1px #ccc;width:95%;}
											.filter_row .product_slc_filter {width:100%;}
											
											::-webkit-input-placeholder {font-style: italic;font-size: 9pt;}
											:-moz-placeholder { /* Firefox 18- */ font-style: italic;font-size: 9pt;}
											::-moz-placeholder {  /* Firefox 19+ */ font-style: italic;font-size: 9pt;}
											:-ms-input-placeholder {font-style: italic;font-size: 9pt;}
											
											.charging_status_pending 			{color:#ffd200;border: 1px solid #ffd200;border-radius: 5px;padding: 1px 5px;}
											.charging_status_reject 			{color:#c90000;border: 1px solid #c90000;border-radius: 5px;padding: 1px 5px;}
											.charging_status_init 				{color:#666666;border: 1px solid #666666;border-radius: 5px;padding: 1px 5px;}
											.charging_status_approved 			{color:#2C8F39;border: 1px solid #2C8F39;border-radius: 5px;padding: 1px 5px;}
											.charging_status_approved_pending 	{color:#ffa200;border: 1px solid #ffa200;border-radius: 5px;padding: 1px 5px;border-top-color: #2c8f39;border-left-color: #2c8f39;}
											.charging_status_not_avaiable 		{color:#cccccc;border: 1px solid #cccccc;border-radius: 5px;padding: 1px 5px;}
											
											.sms_link, .sms_link:HOVER {
												background: url(../images/sms_white.gif) no-repeat scroll left center, url("../images/btngreen_bg.png") repeat-x scroll center top;
											    color: #FFFFFF;
											    display: block;
											    float: right;
											    font-weight: bold;
											    height: 20px;
											    line-height: 20px;
											    padding-left: 20px;
											    padding-right: 5px;
											
											    border: 1px solid #39B54A;
											    border-radius: 10px;
											    text-shadow: 0 1px #20942B;
											}
											
											.approved_pending:BEFORE {background-color: #ffa200 !important;}
										</style>
										<div class="filter_row">
											<div class="product_slc_filter" style="width:auto;float:left;">
												<label class="product_lbl_filter"><strong>Product name</strong></label> 
												<input name="pn" value="${param.pn}" placeholder="Type a product name..." class="product_filter" />
											</div>

											<div class="input-prepend" style="float:left;">
												<label class="product_lbl_filter"><strong>Date range</strong></label> <input type="text"
													name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="All time"
													value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:''}" />
													<a href="javascript:void(0)" 
														onclick="$('#reservation').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" 
														style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a>
											</div>
											<script type="text/javascript">
												$(document).ready(function() {
													/* $('#reservation').daterangepicker({
														format : 'dd/MM/yyyy',
													}); */
													$('#reservation').daterangepicker({
														format : 'dd/MM/yyyy',
														ranges: {
														'Today': ['today', 'today'],
														'Yesterday': ['yesterday', 'yesterday'],
														'Last 7 days': [Date.today().add({ days: -7 }), 'today'],
														'Last 30 days': [Date.today().add({ days: -30 }), 'today'],
														'This month': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
														'Last month': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
														}
													});
												});
											</script>
											
											<c:if test="${param.tab == null || param.tab == ''}">
											<div class="product_slc_filter" style="width:auto;float:right;">
												<label class="product_lbl_filter"><strong>Status</strong></label> <select name="a"
													class="product_filter">
													<option value="" ${(param.a == null || param.a == '')?'selected="selected"':''}>All status</option>
													<option value="2" ${param.a == '2'?'selected="selected"':''}>ON</option>
													<option value="1" ${param.a == '1'?'selected="selected"':''}>OFF</option>
												</select>
											</div>
											</c:if>
											
											<div class="product_slc_filter filter_row">
												<fieldset>
													<legend>
														<input type="checkbox" name="ctChkAll" value="ctChkAll" id="ctChkAll" class="chck_filter" /> <strong>Charging type</strong>
														<script type="text/javascript">
															$(document).ready(function(){
																$('#ctChkAll').click(function() {
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
														<c:set var="allCt" value="," />
														<c:forEach var="ct" items="${paramValues.ct}">
															<c:set var="allCt" value="${allCt}${ct}," />
														</c:forEach>
														<c:forEach var="charging" items="${model.allCharging }">
															<div style="display: inline-block;">
																<c:set var="ct" value=",${charging}," />
																<input type="checkbox" class="chck_filter" name="ct" title="${charging} charging" value="${charging}" 
																	${fn:contains(allCt, ct)?'checked="checked"':'' } />
																<label class="lbl_chcksub"><img src="../images/${fn:toLowerCase(charging)}_active2.png" align="top" /> ${charging}</label>
															</div>
														</c:forEach>
													</div>
												</fieldset>
											</div>
											
											<div class="product_slc_filter filter_row">
												<fieldset>
													<legend>
														<input type="checkbox" name="csChkAll" value="csChkAll" id="csChkAll" class="chck_filter" /> <strong>Charging status</strong>
														<script type="text/javascript">
															$(document).ready(function(){
																$('#csChkAll').click(function() {
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
														<c:set var="allCs" value="," />
														<c:forEach var="cs" items="${paramValues.cs}">
															<c:set var="allCs" value="${allCs}${cs}," />
														</c:forEach>
														<c:forEach var="status" items="${model.allChargingStatus }">
															<c:if test="${status.key != NOT_AVAIABLE_STATUS}">
															<div style="display: inline-block;">
																<c:set var="cs" value=",${status.key}," />
																<input type="checkbox" class="chck_filter" name="cs" title="${status.value}" value="${status.key}" 
																	${fn:contains(allCs, cs)?'checked="checked"':'' } />
																<label class="lbl_chcksub charging_status_${status.key}">${fn:replace(ALL_CHARGING_STATUS_EN[status.value], '1PAY', '<span style="color:#2c8f39;">1PAY</span>')}</label>
															</div>
															</c:if>
														</c:forEach>
													</div>
												</fieldset>
											</div>
		
										</div>
							
										<c:if test="${model.isStaff && model.merchants != null && fn:length(model.merchants) >1 }">
											<c:set var="allMcs" value="," />
											<c:forEach var="mc" items="${paramValues.merchant}">
												<c:set var="allMcs" value="${allMcs}${mc}," />
											</c:forEach>
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chcksub_admin">Merchant:</label>
													</div>
													<div class="clear"></div>
													<div>
													<input id="searchMerchant" list="listForSearchMc" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
													<c:set var="listForSearchMc" value="<datalist id='listForSearchMc'>" />
													<select id="filter_merchant" name="merchant" multiple="multiple">
														<c:forEach var="merchant" items="${model.merchants}">
															<c:set var="merchant2" value=",${merchant}," />
															<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
																<c:out value="${merchant}"/>
															</option>
															<c:set var="listForSearchMc" value="${listForSearchMc}<option value='${merchant}'>${merchant}</option>" />
														</c:forEach>
													</select>
													<c:out value="${listForSearchMc}" escapeXml="false" />
													</div>
												</div>
											</div>								
										</c:if>
		
										<div class="filter_row">
											<input type="submit" class="btn_greensmall" value="Search" name="submit" />
										</div>
	
									</div>
									<c:choose>
										<c:when test="${param.submit==null || fn:length(param.submit) == 0 }">
										<script type="text/javascript">
											$(document).ready(function() {
												$('.box_locketqua').find('fieldset').each(function() {
													$(this).find('input[type=checkbox]').attr('checked', 'checked');
												});
											});
										</script>
										</c:when>
										<c:otherwise>
											<c:if test="${param.ctChkAll == 'ctChkAll' }">
											<script type="text/javascript">
											$(document).ready(function() {
												$('#ctChkAll').attr('checked', 'checked');
											});
											</script>									
											</c:if>
											<c:if test="${param.csChkAll == 'csChkAll' }">
											<script type="text/javascript">
											$(document).ready(function() {
												$('#csChkAll').attr('checked', 'checked');
											});
											</script>									
											</c:if>
										</c:otherwise>
									</c:choose>
									<div class="srv_row">
										<c:if test="${model.total > 0}">
											<span class="pagebanner"> ${model.total} results, display from ${model.offset + 1} to ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
										</c:if>
										<% request.setAttribute("PRODUCT_ICON_HOST", SharedConstants.PRODUCT_ICON_HOST); %>
										<c:set var="isOperatorOrBizSupporter" value="${account_logined.isOperator() || account_logined.isBizSupporter()}" />
										<display:table name="model.list" id="list" 
														requestURI="/console/manager.wss" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;"
														sort="list">
											<%@ include file="display_table.jsp" %>
										    <c:set var="isOwnerProduct" value="${account_logined.username == list.merchant}" />
										    <display:column title="Product name" href="details.wss" paramId="i" paramProperty="id" headerClass="transhead" class="svr_data_name" style="border: 1px solid #CCC;">
										    	<%-- <img src="<%=request.getContextPath()%>/icon?i=${list.id}" border="0" align="absmiddle" style="width: 20px;height: 20px;"/> --%>
										    	<img src="${PRODUCT_ICON_HOST}/${list.icon_path}" border="0" align="absmiddle" style="width: 20px;height: 20px;"/>
										    	<fmt:formatDate var="created_time" value="${list.created_time}" pattern="dd-MM-yyyy HH:mm:ss" />
										    	<span style="color:#2C8F39;font-size: 14px;" title="Created time ${created_time}"><c:out value="${list.title}" /></span>
										    	<a href="<%=request.getContextPath() %>/console/details.wss?i=${list.id}" title="Product details"><img src="<%=request.getContextPath() %>/images/editComparison.png" height="12" /></a>
										    </display:column>
										    <c:if test="${model.isStaff}">
										    <display:column title="Merchant" headerClass="transhead width105" class="svr_data1" style="border: 1px solid #CCC;font-weight:bold;">
										    	<c:out value="${list.merchant}" />
										    	<span style="font-size: 11px;">
										    		(<c:out value="${onepay:getDepartmentOfMerchant(list.merchant)}" /> -
										    		${onepay:getContractTypeOfMerchant(list.merchant, pageContext.request)})
										    	</span>
										    </display:column>
										    </c:if>
										    <display:column title="Description" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;">
										    	<c:set var="des" value="${list.description}" />
										    	<c:if test="${fn:length(list.description) > 40}">
										    		<c:set var="des" value="${fn:substring(list.description, 0, 40)}..." />
										    	</c:if>
										    	<span title="${fn:escapeXml(list.description)}">${des}</span>
										    </display:column>
										    <%-- <img src='${pageContext.request.contextPath}/images/question.png' alt='?' title='Dịch vụ thanh toán' width='18' style='margin-top:-10px' align='middle' /> --%>
										    <display:column 
										    	title="Charging register <br /><img id='csTip' src='${pageContext.request.contextPath}/images/question.png' alt='?' width='18' style='margin-top:4px' align='middle' />" 
										    	headerClass="transhead width130" class="svr_data1" style="border: 1px solid #CCC;">
										    	<c:set var="activeCtCount" value="0" />
										    	<c:forEach var="charging" items="${model.allCharging }">
										    		<c:set var="ct" value="${fn:toLowerCase(charging)}" />
										    		<c:set var="ctIconKey" value="${ct}_${list.id}" />
										    		
										    		<fmt:formatDate value="${list.card_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
										    		<fmt:formatDate value="${list.updated_time}" var="updatedTime" pattern="dd/MM/yyyy HH:mm:ss" />
										    		<c:set var="userName" value="${list.card_charging.update_status_by_account}" />
										    		<c:choose>
										    			<c:when test="${ct == 'sms'}">
										    				<fmt:formatDate value="${list.sms_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
										    				<c:set var="userName" value="${list.sms_charging.update_status_by_account}" />
										    			</c:when>
										    			<c:when test="${ct == 'wap'}">
										    				<fmt:formatDate value="${list.wap_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
										    				<c:set var="userName" value="${list.wap_charging.update_status_by_account}" />
										    			</c:when>
										    			<c:when test="${ct == 'iac'}">
										    				<fmt:formatDate value="${list.iac_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
										    				<c:set var="userName" value="${list.iac_charging.update_status_by_account}" />
										    			</c:when>
										    			<c:otherwise></c:otherwise>
										    		</c:choose>
										    		<c:if test="${activedTime != null && fn:length(fn:trim(activedTime)) > 0}">
										    			<c:set var="activedTime" value=": ${activedTime}" />
										    		</c:if>
										    		<c:if test="${updatedTime != null && fn:length(fn:trim(updatedTime)) > 0}">
										    			<c:set var="activedTime" value="${activedTime} / ${updatedTime}" />
										    			<c:set var="updatedTime" value=": ${updatedTime}" />
										    		</c:if>
										    		<c:if test="${userName != null && fn:length(fn:trim(userName)) > 0}">
										    			<c:set var="userName" value=" by ${userName}" />
										    		</c:if>
										    		<c:if test="${!model.isStaff}">
										    			<c:set var="userName" value="" />
										    			<c:if test="${model.chargingStatusIcon[ctIconKey] == 'normal_active'}">
										    				<c:set var="userName" value=". Please check mail to confirm." />
										    			</c:if>
										    		</c:if>
										    		<a class="${ct}_${model.chargingStatusIcon[ctIconKey]} go_${ct} go_${ct}_${list.id} charging_${list.id}" 
										    			accesskey="${list.access_key}" secretkey="${list.secret}" 
										    			id="${list.id}" app_code="${list.app_code}" pname="${list.title}" title="${ALL_CHARGING_STATUS_EN[model.statusTitle[model.chargingStatusIcon[ctIconKey]]]} ${model.chargingStatusIcon[ctIconKey]=='active'?activedTime:updatedTime} ${userName}" 
														href="#${ct}char_pop" name="${ct}char_pop" state="${model.chargingStatusIcon[ctIconKey]}"
														owner="${isOwnerProduct}"
														${(!model.isStaff || isOwnerProduct)?'rel="leanModal"':((model.chargingStatusIcon[ctIconKey]=='active' || model.chargingStatusIcon[ctIconKey]=='normal_active' || model.chargingStatusIcon[ctIconKey]=='reject' || model.chargingStatusIcon[ctIconKey]=='normal')?'rel="leanModal"':'')}>
													</a>
													
													<c:if test="${model.chargingStatusIcon[ctIconKey] == 'active'}">
														<c:set var="activeCtCount" value="${activeCtCount + 1}" />
													</c:if>
										    	</c:forEach>
										    	<c:set var="unameTmp" value=",${account_logined.username}," />
										    	<c:if test="${fn:contains(',hahm,thuannh,huyln,huydq,dung,hahmvn,sonnh,linhnt,nguyenluan1990,hien,', unameTmp) }">
												<a title="Download SDK"
													class="go_sdk" active="${activeCtCount}"
													href="<%=request.getContextPath()%>/console/sdk-item-manager.wss?access_key=${list.access_key}" 
													style="${activeCtCount > 0?'':'opacity:0.3;'}background: url(<%=request.getContextPath()%>/images/sdk_18.png) no-repeat scroll left center;display: block;float: left;height: 16px;margin-right: 5px;width: 16px;">
												</a>
										    	</c:if>
												<a class="more_normal" title="Services register" href="#"></a>
										    </display:column>
										    <display:column 
										    	title="Merchant ON/OFF charging <img src='${pageContext.request.contextPath}/images/question.png' alt='?' title='Merchant ON/OFF products' width='18' style='margin-top:-10px' align='middle' />" 
										    	headerClass="transhead width90" 
										    	class="svr_data1"
										    	style="border: 1px solid #CCC;text-align:center;${!isOwnerProduct?'background:#F3F3F3;':'' }">
												<div title="${!isOwnerProduct?(list.merchant_action == APPROVED_STATUS?'':'Merchant off product'):(list.staff_action == APPROVED_STATUS?'Product approved':(list.staff_action == REJECT_STATUS?'Product rejected':''))}"
													class="onoffswitch" style="text-align: left;margin-left: 15px;${!isOwnerProduct?'pointer-events: none;':''}">
													<c:set var="active" value="${list.merchant_action == APPROVED_STATUS}" />
													<input type="checkbox" name="onoffswitch" value="${list.merchant_action}"
														${!isOwnerProduct? 'disabled':''}
														owner="${isOwnerProduct}"
														class="onoffswitch-checkbox" id="svr_${list.id}${!isOwnerProduct? '_merchant':''}" ${active?'checked="checked"':'' } />
													<label class="onoffswitch-label" for="svr_${list.id}${!isOwnerProduct? '_merchant':''}">
														<div class="onoffswitch-inner"></div>
														<div class="onoffswitch-switch"></div>
													</label>
												</div>
										    </display:column>
										    <display:column 
										    	title="1PAY ON/OFF charging <img src='${pageContext.request.contextPath}/images/question.png' alt='?' title='1PAY ON/OFF products' width='18' style='margin-top:-10px' align='middle' />" 
										    	headerClass="transhead width90" 
										    	class="svr_data1"
										    	style="border: 1px solid #CCC;text-align:center;${!isOperatorOrBizSupporter?'background:#F3F3F3;':'' }">
										    	<c:set var="logTitle" value="${model.isStaff?(list.merchant_action == APPROVED_STATUS?'':'Merchant off product'):(list.staff_action == APPROVED_STATUS?'Product approved':(list.staff_action == REJECT_STATUS?'Product rejected':''))}" />
										    	<c:if test="${list.lastLog != null && fn:length(list.lastLog)>0}">
										    		<c:set var="logTitle" value="${logTitle}${fn:length(fn:trim(logTitle))>0?'. ':''}${list.lastLog}" />
										    	</c:if>
												<div title="${logTitle}"
													class="onoffswitch" style="text-align: left;margin-left: 15px;${!isOperatorOrBizSupporter?'pointer-events: none;':''}">
													<c:set var="active" value="${list.staff_action == APPROVED_STATUS}" />
													<input type="checkbox" name="onoffswitch" value="${list.staff_action}"
														${!model.isStaff ? 'disabled':''}
														class="onoffswitch-checkbox" id="svr_${list.id}${!model.isStaff ? '_staff':''}" ${active?'checked="checked"':'' } />
													
													<label class="onoffswitch-label"
														for="svr_${list.id}${!model.isStaff ? '_staff':''}">
														<div class="onoffswitch-inner"></div>
														<div class="onoffswitch-switch"></div>
													</label>
													<a href="#onOffProduct_pop" class="go_onOffProduct" pn="${list.title}" pid="${list.id}" pa="${list.staff_action}" rel="leanModal" name="onOffProduct_pop" style="display: block;top: 0;left: 0;position: absolute;float:left;z-index: 99999;width: 55px;height: 25px;"></a>	
												</div>
										    </display:column>
										    <%-- <display:column title="Actions of 1PAY" headerClass="transhead width80" 
										    	class="svr_data1 ${model.isStaff?(list.merchant_action == APPROVED_STATUS?'':'reject_row'):(list.staff_action == APPROVED_STATUS?'approved_row':(list.staff_action == REJECT_STATUS?'reject_row':''))}"
										    	style="border: 1px solid #CCC;text-align:center;">
												<div
													title="${model.isStaff?(list.merchant_action == APPROVED_STATUS?'':'Merchant off sản phẩm'):(list.staff_action == APPROVED_STATUS?'Sản phẩm đã được duyệt':(list.staff_action == REJECT_STATUS?'Sản phẩm bị từ chối':''))}" 
													class="onoffswitch" style="text-align: left;">
													<c:set var="active" value="${(model.isStaff && list.staff_action == APPROVED_STATUS) || (!model.isStaff && list.merchant_action == APPROVED_STATUS)}" />
													<input type="checkbox" name="onoffswitch" value="${model.isStaff ? list.staff_action : list.merchant_action}"
														class="onoffswitch-checkbox" id="svr_${list.id}" ${active?'checked="checked"':'' } />
													<label class="onoffswitch-label" for="svr_${list.id}">
														<div class="onoffswitch-inner"></div>
														<div class="onoffswitch-switch"></div>
													</label>
												</div>
										    </display:column> --%>
										</display:table>
										
										<div id="product_active_change" style="display: none;"></div>
										<script type="text/javascript">
											$(document).ready(function() {
												
												$('.onoffswitch-checkbox').live('click', function() {
													if($(this).is(':checked')) {
														$(this).removeAttr('checked');	
													} else {
														$(this).attr('checked','checked');
													}
													
													if('true' != '${model.isStaff}' || 'true' == $(this).attr('owner')) {
														var svrId = $(this).attr("id").replace(/svr_/gi, '');
														var haveActiveOrPendingCharg = false;
														$('.charging_' + svrId).each(function() {
															var state = $(this).attr('state') + '';
															if(state == 'normal' || state == 'active') {
																haveActiveOrPendingCharg = true;
															}
														});
														if(!haveActiveOrPendingCharg) {
															alert('This product has no charging type.');
															return false;
														}
													} else {
														return false;
													}
													
													var alertMess = 'Are you sure turn ON/OFF this product?';
													var active = $(this).attr('value')+'';
													
													/* if('true' == '${model.isStaff}') {
														if(active == '${INIT_STATUS}' || active=='${REJECT_STATUS}' || active == '${PENDING_STATUS}') {
															alertMess = 'Bạn có chắc chắn kích hoạt status?';
														} else if(active == '${APPROVED_STATUS}') {
															alertMess = 'Bạn có chắc chắn khóa status?';
														}
													} else {
														if(active == '${INIT_STATUS}' || active=='${REJECT_STATUS}') {
															alertMess = 'Bạn có chắc chắn bật status?';
														} else if(active == '${PENDING_STATUS}' || active == '${APPROVED_STATUS}') {
															alertMess = 'Bạn có chắc chắn tắt status?';
														}
													} */
													
													if(active == '${INIT_STATUS}' || active=='${REJECT_STATUS}' || active == '${PENDING_STATUS}') {
														alertMess = 'true' == '${model.isStaff}' ? 'Are you sure turn ON this product?' : 'Are you sure turn ON this product?';
													} else if(active == '${APPROVED_STATUS}') {
														alertMess = 'true' == '${model.isStaff}' ? 'Are you sure turn OFF this product?' : 'Are you sure turn OFF this product?';
													}
													
													if(confirm(alertMess)) {
														var chkId = $(this).attr('id')+'';
														var pid = chkId.replace(/svr_/gi, '');
														var url = '<%=request.getContextPath()%>/console/ajax.wss?a=product_active_change&pid='+pid + '&pa=' + active;
														
														var onOffChk = $(this);
														$('#product_active_change').load(url, function(responseTxt,statusTxt,xhr){
															if(responseTxt == "${REJECT_STATUS}" || responseTxt == "${PENDING_STATUS}" 
																	|| responseTxt == "${INIT_STATUS}" || responseTxt == "${APPROVED_STATUS}") {
																onOffChk.val(responseTxt);
																/* var isActive = ('true' == '${model.isStaff}' && responseTxt == '${APPROVED_STATUS}') || 
																			   ('false' == '${model.isStaff}' && (responseTxt == '${PENDING_STATUS}' || responseTxt == '${APPROVED_STATUS}')); */
																var isActive = (responseTxt == '${APPROVED_STATUS}');			   
																if(isActive) {
																	$('#' + chkId).attr('checked','checked');
																} else {
																	$('#' + chkId).removeAttr('checked');
																}
																
															}
														});
													} else {
														return false;
													}
												});
												
												$("#csTip").qtip({
													content: '' //'<div align="justify">Merchant đăng ký cấu hình dịch vụ thanh toán cho Sản phẩm để có thể sử dụng Dịch vụ. Các icons thể hiện các loại Dịch vụ thanh toán. Có các trạng thái Đăng ký cấu hình như sau:<br />'
														+ '<ul style="padding-left: 15px;list-style-type:circle;">'
														+ '<li>Gray icons: No contracted electronic</li>'
														+ '<li>Dark gray icons: Have contracted electronic</li>'
														+ '<li>Yellow icons: Proposed</li>'
														+ '<li>Red icons: Rejected</li>'
														+ '<li>Yellow and Green icons: 1PAY approve</li>'
														+ '<li>Green icons: Approved</li>'
														+ '</ul></div>',										
													position : {
														corner : {
															target : 'rightMiddle',
															tooltip : 'leftMiddle'
														}
													},
													style : {
														name : 'cream',
														tip : 'leftMiddle',
														border : {
															width : 1,
															radius : 12,
															color : '#ffffcc'
														},
														color : '#333',
														background : '#ffffcc'
													}
												});
											});
										</script>
										<%--
										<div id="charging_data_temp" style="display: none;"></div>
										<script type="text/javascript">
											$(document).ready(function() {
												$('.go_card').live('click', function() {
													if($("form[name=card_post]").length > 0) {
														$('.go_card_access_key').html($(this).attr('accesskey'));
														$('.go_card_secret_key').html($(this).attr('secretkey'));
														$('.go_card_product_name').html($(this).attr('pname'));
														$('input[name=go_card_access_key]').val($(this).attr('accesskey'));
														$('input[name=go_card_secret_key]').val($(this).attr('secretkey'));
														$('form[name=card_post] input[name=pid]').val($(this).attr('id'));
														
														if('${model.isStaff}' == 'true') {
															if($(this).attr('state') == 'active') {
																$('form[name=card_post] input[name=approve]').css('display', 'none');
																$('form[name=card_post] input[name=reject]').css('display', '');
															} else if($(this).attr('state') == 'reject') {
																$('form[name=card_post] input[name=approve]').css('display', '');
																$('form[name=card_post] input[name=reject]').css('display', 'none');
															} else {
																$('form[name=card_post] input[name=approve]').css('display', '');
																$('form[name=card_post] input[name=reject]').css('display', '');
															}
														} else {
															if($(this).attr('state') == 'active') {
																$('form[name=card_post] input[name=approve]').css('display', 'none');
															} else {
																$('form[name=card_post] input[name=approve]').css('display', '');
															}
														}
													}
													
													if("leanModal" != $(this).attr('rel')) {
														alert("${model.isStaff?'Sản phẩm chưa đăng ký kích hoạt card charging':'Sản phẩm đã được kích hoạt card charging'}");
														return false;
													}
												});

												
												$('.go_sms').live('click', function() {
													if($("form[name=sms_post]").length > 0) {
														$('.go_sms_product_name').html($(this).attr('pname'));
														var pid = $(this).attr('id');
														$('form[name=sms_post] input[name=pid]').val(pid);
														$("form[name=sms_post] input[name=service_numbers]").attr('checked', 'checked');
														
														var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=sms&pid='+pid;
														$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
															var obj = eval ("(" + responseTxt + ")");
															$("form[name=sms_post] select[name=service_number]").val(obj.service_number);
															$("form[name=sms_post] input[name=radio_cmd]").removeAttr('checked');
															$("form[name=sms_post] input[name=radio_cmd]").each(function() {
																if($(this).val() == obj.radio_cmd) {
																	$(this).attr('checked', 'checked');
																	serviceChange();
																	if($(this).val() == 'selectCmd') {
																		$("form[name=sms_post] select[name=select_service_code]").val(obj.service_code);
																	} else {
																		$("form[name=sms_post] input[name=service_code]").val(obj.service_code);
																	}
																} else {
																	$(this).removeAttr('checked');
																}
															});
															$("form[name=sms_post] input[name=mo_receive_url]").val(obj.mo_receive_url);
															$("form[name=sms_post] input[name=mo]").val(obj.mo);
															$("form[name=sms_post] textarea[name=mt]").val(obj.mt);
															$("form[name=sms_post] input[name=mt_type]").each(function() {
																if($(this).val() == obj.mt_type) {
																	$(this).attr('checked', 'checked');
																}else{
																	$(this).removeAttr('checked');
																}
															});
															
															$("form[name=sms_post] input[name=service_numbers]").removeAttr('checked');
															var isNewFrm = true;
															try {
																var serviceNumbers = obj.service_numbers;
																$("form[name=sms_post] input[name=service_numbers]").each(function() {
																	for(var i=0;i<serviceNumbers.length;i++) {
																		if($(this).attr('id').indexOf(serviceNumbers[i])>0) {
																			$(this).attr('checked', 'checked');
																			isNewFrm = false;
																			break;
																		}
																	}
																});	
															} catch(e) {}
															if(isNewFrm) {
																$("form[name=sms_post] input[name=service_numbers]").attr('checked', 'checked');
															}
														});
														
														if('${model.isStaff}' == 'true') {
															if($(this).attr('state') == 'active') {
																$('form[name=sms_post] input[name=approve]').css('display', 'none');
																$('form[name=sms_post] input[name=reject]').css('display', '');
															} else if($(this).attr('state') == 'reject') {
																$('form[name=sms_post] input[name=approve]').css('display', '');
																$('form[name=sms_post] input[name=reject]').css('display', 'none');
															} else {
																$('form[name=sms_post] input[name=approve]').css('display', '');
																$('form[name=sms_post] input[name=reject]').css('display', '');
															}
														} else {
															if($(this).attr('state') == 'active') {
																$('form[name=sms_post] input[name=approve]').css('display', 'none');
															} else {
																$('form[name=sms_post] input[name=approve]').css('display', '');
															}
														}
													}
													
													if("leanModal" != $(this).attr('rel')) {
														alert("${model.isStaff?'Sản phẩm chưa đăng ký kích hoạt sms charging':'Sản phẩm đã được kích hoạt sms charging'}");
														return false;
													}
												});

												
												$('.go_wap').live('click', function() {
													var pid = $(this).attr('id');
													if($("form[name=wap_post]").length > 0) {
														$('.go_wap_access_key').html($(this).attr('accesskey'));
														$('.go_wap_secret_key').html($(this).attr('secretkey'));
														$('.go_wap_product_name').html($(this).attr('pname'));
														$('input[name=go_wap_access_key]').val($(this).attr('accesskey'));
														$('input[name=go_wap_secret_key]').val($(this).attr('secretkey'));
														$('form[name=wap_post] input[name=pid]').val($(this).attr('id'));

														var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=wap&pid='+pid;
														$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
															var obj = eval ("(" + responseTxt + ")");
															$("form[name=wap_post] input[name=go_wap_back_url]").val(obj.back_url);
															$("form[name=wap_post] input[name=go_wap_error_url]").val(obj.error_url);
														});
														
														if('${model.isStaff}' == 'true') {
															if($(this).attr('state') == 'active') {
																$('form[name=wap_post] input[name=approve]').css('display', 'none');
																$('form[name=wap_post] input[name=reject]').css('display', '');
															} else if($(this).attr('state') == 'reject') {
																$('form[name=wap_post] input[name=approve]').css('display', '');
																$('form[name=wap_post] input[name=reject]').css('display', 'none');
															} else {
																$('form[name=wap_post] input[name=approve]').css('display', '');
																$('form[name=wap_post] input[name=reject]').css('display', '');
															}
														} else {
															if($(this).attr('state') == 'active') {
																$('form[name=wap_post] input[name=approve]').css('display', 'none');
															} else {
																$('form[name=wap_post] input[name=approve]').css('display', '');
															}
														}
													}
													
													if("leanModal" != $(this).attr('rel')) {
														alert("${model.isStaff?'Sản phẩm chưa đăng ký kích hoạt wap charging':'Sản phẩm đã được kích hoạt wap charging'}");
														return false;
													}
												});
											});


											$('.go_iac').live('click', function() {
												var pid = $(this).attr('id');
												if($("form[name=iac_post]").length > 0) {
													$('.go_iac_access_key').html($(this).attr('accesskey'));
													$('.go_iac_secret_key').html($(this).attr('secretkey'));
													$('.go_iac_product_name').html($(this).attr('pname'));
													$('input[name=go_iac_access_key]').val($(this).attr('accesskey'));
													$('input[name=go_iac_secret_key]').val($(this).attr('secretkey'));
													$('form[name=iac_post] input[name=pid]').val($(this).attr('id'));
													
													var repCode = '000000' + pid;
													$("form[name=iac_post] input[name=rep_code]").val('REP_' + repCode.substring(repCode.length - 6));
													$("form[name=iac_post] input[id=rep_code_radio]").click();
													
													var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=iac&pid='+pid;
													$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
														var obj = eval ("(" + responseTxt + ")");
														$("form[name=iac_post] select[name=game_code]").val(obj.game_code);
														if(obj.rep_code) {
															$("form[name=iac_post] input[name=rep_code]").val(obj.rep_code);
															$("form[name=iac_post] input[id=rep_code_radio]").click();
														} else {
															$("form[name=iac_post] input[id=game_code_radio]").click();
														}
														$("form[name=iac_post] input[name=go_iac_notify_url]").val(obj.notify_url);
														$("form[name=iac_post] input[name=mo_vtm]").val(obj.mo_vtm);
														$("form[name=iac_post] input[name=mo_vms]").val(obj.mo_vms);
														$("form[name=iac_post] textarea[name=mt]").val(obj.mt);
													});
													
													if('${model.isStaff}' == 'true') {
														if($(this).attr('state') == 'active') {
															$('form[name=iac_post] input[name=approve]').css('display', 'none');
															$('form[name=iac_post] input[name=reject]').css('display', '');
														} else if($(this).attr('state') == 'reject') {
															$('form[name=iac_post] input[name=approve]').css('display', '');
															$('form[name=iac_post] input[name=reject]').css('display', 'none');
														} else {
															$('form[name=iac_post] input[name=approve]').css('display', '');
															$('form[name=iac_post] input[name=reject]').css('display', '');
														}
													} else {
														if($(this).attr('state') == 'active') {
															$('form[name=iac_post] input[name=approve]').css('display', 'none');
														} else {
															$('form[name=iac_post] input[name=approve]').css('display', '');
														}
													}
												}
												
												if("leanModal" != $(this).attr('rel')) {
													alert("${model.isStaff?'Sản phẩm chưa đăng ký kích hoạt In-App Charging':'Sản phẩm đã được kích hoạt In-App Charging'}");
													return false;
												}
											});
										</script>
										 --%>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<div id="khoitao_box">
									<h1>You have no product, please add new product.</h1>
									<div class="khoitao_icon">
										<img border="0" src="<%=request.getContextPath()%>/images/api-g.png" />
									</div>
								
									<div class="content">
										Add <strong> new product </strong>, help you:
										<ul>
											<li>Manage <strong>products</strong>
											</li>
											<li>Follow product infomation</li>
											<li>Sharing API, manage Teamwork.</li>
										</ul>
									</div>
									<div>
										<a class="btn_khoitaosp" href="<%=request.getContextPath()%>/console/create.wss">Add new product</a>
									</div>
								</div>
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
			<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>

	<jsp:include page="include_popup.jsp" />
	
</body>

</html>
