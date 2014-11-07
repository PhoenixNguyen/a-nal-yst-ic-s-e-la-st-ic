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
	
	request.setAttribute("REQUIRED_MERCHANT_PRODUCT_CONTRACT", SharedConstants.REQUIRED_MERCHANT_PRODUCT_CONTRACT);
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
								<h1 class="srv_title">Sản phẩm hậu kiểm</h1>
	
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
											<c:set var="okLabel" value="hậu kiểm" />
											<a href="manager.wss" class="tab${(param.tab==null || param.tab=='')?'_slc':''}"><span>Tất cả</span>
											</a> 
											<%-- <a href="manager.wss?tab=active" class="tab${param.tab=='active'?'_slc':''}"><span>Đã được ${okLabel} (<fmt:formatNumber var="totalActive" value="${model.totalActive}" currencyCode="vnd" /> <c:out value="${totalActive}" />)</span>
											</a> <a href="manager.wss?tab=inactive" class="tab${param.tab=='inactive'?'_slc':''}"><span>Chưa ${okLabel} (<fmt:formatNumber var="totalInActive" value="${model.totalInActive}" currencyCode="vnd" /> <c:out value="${totalInActive}" />)</span>
											</a> --%>
											<div class="clear"></div>
										</div>
									</div>
									<div id="filter_locketqua">
		
										<h3 class="filter_label close">
											<a href="javascript:void(0)">Lọc kết quả</a>
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
												<label class="product_lbl_filter"><strong>Tên sản phẩm</strong></label> 
												<input name="pn" value="${param.pn}" placeholder="Nhập tên sản phẩm..." class="product_filter" />
											</div>

											<div class="input-prepend" style="float:left;">
												<label class="product_lbl_filter"><strong>Chọn ngày</strong></label> <input type="text"
													name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="Toàn thời gian"
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
														'Hôm nay': ['today', 'today'],
														'Hôm qua': ['yesterday', 'yesterday'],
														'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
														'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
														'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
														'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
														}
													});
												});
											</script>
											
											<%-- <c:if test="${param.tab == null || param.tab == ''}">
											<div class="product_slc_filter" style="width:auto;float:right;">
												<label class="product_lbl_filter"><strong>Status</strong></label> <select name="a"
													class="product_filter">
													<option value="" ${(param.a == null || param.a == '')?'selected="selected"':''}>Tất cả</option>
													<option value="2" ${param.a == '2'?'selected="selected"':''}>Bật</option>
													<option value="1" ${param.a == '1'?'selected="selected"':''}>Tắt</option>
												</select>
											</div>
											</c:if> --%>
											
											<div class="product_slc_filter filter_row">
												<fieldset>
													<legend>
														<input type="checkbox" name="ctChkAll" value="ctChkAll" id="ctChkAll" class="chck_filter" /> <strong>Loại dịch vụ thanh toán</strong>
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
																<label class="lbl_chcksub"><img src="../images/${fn:toLowerCase(charging)}_active2.png" align="top" /> ${fn:replace(onepay:chargingServiceCode2Text(charging), 'Charging', '')}</label>
															</div>
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
											<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submit" />
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
											<span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
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
										    <c:if test="${model.isStaff || !isOwnerProduct}">
											    <c:set var="contractType" value="${onepay:getContractTypeOfMerchant(list.merchant, pageContext.request)}" />
											    <c:set var="su" value="${onepay:getDepartmentOfMerchant(list.merchant)}" />
										    </c:if>
										    <display:column title="Tên sản phẩm" href="details.wss" paramId="i" paramProperty="id" headerClass="transhead" class="svr_data_name" style="border: 1px solid #CCC;">
										    	<%-- <img src="<%=request.getContextPath()%>/icon?i=${list.id}" border="0" align="absmiddle" style="width: 20px;height: 20px;"/> --%>
										    	<img src="${PRODUCT_ICON_HOST}/${list.icon_path}" border="0" align="absmiddle" style="width: 20px;height: 20px;"/>
										    	<fmt:formatDate var="created_time" value="${list.created_time}" pattern="dd-MM-yyyy HH:mm:ss" />
										    	<span style="color:#2C8F39;font-size: 14px;" title="Ngày tạo ${created_time}"><c:out value="${list.title}" /></span>
										    	<a href="<%=request.getContextPath() %>/console/details.wss?i=${list.id}" title="Chi tiết sản phẩm"><img src="<%=request.getContextPath() %>/images/editComparison.png" height="12" /></a>
										    </display:column>
										    <c:if test="${model.isStaff || !isOwnerProduct}">
										    <display:column title="Merchant" headerClass="transhead width105" class="svr_data1" style="border: 1px solid #CCC;font-weight:bold;">
										    	<c:out value="${list.merchant}" />
										    	<span style="font-size: 11px;">
										    		(${su} - ${contractType})
										    	</span>
										    </display:column>
										    </c:if>
										    <display:column title="Mô tả" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;">
										    	<c:set var="des" value="${list.description}" />
										    	<c:if test="${fn:length(list.description) > 40}">
										    		<c:set var="des" value="${fn:substring(list.description, 0, 40)}..." />
										    	</c:if>
										    	<span title="${fn:escapeXml(list.description)}">${des}</span>
										    </display:column>
										    <%-- <img src='${pageContext.request.contextPath}/images/question.png' alt='?' title='Dịch vụ thanh toán' width='18' style='margin-top:-10px' align='middle' /> --%>
										    <display:column 
										    	title="Dịch vụ thanh toán <img id='csTip' src='${pageContext.request.contextPath}/images/question.png' alt='?' width='18' align='middle' />" 
										    	headerClass="transhead width130" class="svr_data1" style="border: 1px solid #CCC;">
										    	<c:set var="activeCtCount" value="0" />
										    	<c:set var="unameTmp" value=",${account_logined.username}," />
										    	<%
										    	request.setAttribute("ALL_ACTIVED_CHARGING_SERVICES", SharedConstants.ALL_ACTIVED_CHARGING_SERVICES);
										    	%>
										    	<c:forEach var="charging" items="${ALL_ACTIVED_CHARGING_SERVICES}">
										    		<c:set var="ct" value="${fn:toLowerCase(charging)}" />
											    	<c:if test="${ct != 'bank' || (ct == 'bank' && fn:contains(',hahm,thuannh,huyln,huydq,dung,hahmvn,', unameTmp) )}">
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
										    			<c:when test="${ct == 'bank'}">
										    				<fmt:formatDate value="${list.bank_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
										    				<c:set var="userName" value="${list.bank_charging.update_status_by_account}" />
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
										    			<c:set var="userName" value=" bởi ${userName}" />
										    		</c:if>
										    		<c:if test="${!model.isStaff}">
										    			<c:set var="userName" value="" />
										    			<c:if test="${model.chargingStatusIcon[ctIconKey] == 'normal_active'}">
										    				<c:set var="userName" value=". Bạn vui lòng kiểm tra email để xác nhận." />
										    			</c:if>
										    		</c:if>
										    		<c:set var="requiredContract" value="false" />
										    		<c:set var="contract" value="false" />
										    		<c:forEach var="_ct" items="${REQUIRED_MERCHANT_PRODUCT_CONTRACT[fn:toUpperCase(contractType)]}">
										    			<c:if test="${_ct == fn:toUpperCase(ct)}">
										    				<c:set var="requiredContract" value="true" />
										    			</c:if>
										    		</c:forEach>
										    		<a class="${ct}_${model.chargingStatusIcon[ctIconKey]} go_${ct} go_${ct}_${list.id} charging_${list.id}" 
										    			accesskey="${list.access_key}" secretkey="${list.secret}" 
										    			id="${list.id}" app_code="${list.app_code}" pname="${list.title}" title="${model.statusTitle[model.chargingStatusIcon[ctIconKey]]} ${model.chargingStatusIcon[ctIconKey]=='active'?activedTime:updatedTime} ${userName}" 
														href="#${ct}char_pop" name="${ct}char_pop" state="${model.chargingStatusIcon[ctIconKey]}"
														owner="${isOwnerProduct}"
														required_contract="${requiredContract}"
														contract_type="${contractType}"
														su="${su}"
														merchant="${list.merchant}"
														${(!model.isStaff || isOwnerProduct)?'rel="leanModal"':((model.chargingStatusIcon[ctIconKey]=='active' || model.chargingStatusIcon[ctIconKey]=='normal_active' || model.chargingStatusIcon[ctIconKey]=='reject' || model.chargingStatusIcon[ctIconKey]=='normal')?'rel="leanModal"':'')}>
													</a>
													
													<c:if test="${model.chargingStatusIcon[ctIconKey] == 'active'}">
														<c:set var="activeCtCount" value="${activeCtCount + 1}" />
													</c:if>
													</c:if>
										    	</c:forEach>
										    	
										    </display:column>
										    <display:column 
										    	title="Tình trạng hậu kiểm" 
										    	headerClass="transhead width90" 
										    	class="svr_data1"
										    	style="border: 1px solid #CCC;text-align:center;">
										    	<span class="pvStatus" app_code="${list.app_code}"></span>
										    </display:column>
										    <display:column 
										    	title="Action" 
										    	headerClass="transhead width90" 
										    	class="svr_data1"
										    	style="border: 1px solid #CCC;text-align:center;">
												<a href="product-verify-manager.wss?pid=${list.id }">Hậu kiểm</a>
										    </display:column>
										</display:table>
										
										<div id="product_active_change" style="display: none;"></div>
										<script type="text/javascript">
											$(document).ready(function() {
												$('.pvStatus').each(function() {
													var app_code = $(this).attr('app_code');
													var url = 'product-verify-manager-ajax.wss?action=CHECK_BY_APP_CODE&app_code='+app_code;
													var spanTitle = ['Chưa có', 'Chờ duyệt', 'Hết hạn', 'Còn hạn']; 
													var span = $(this);
													$.ajax({
							             				type : 'get',
							             				url : url,
							             				data : $(this).serializeArray(),
							             				success : function(data){
							             					var sms = data.charAt(0);
							             					var iac = data.charAt(1);
							             					
							             					var smsClass = 'sms_invi';
							             					var iacClass = 'iac_invi';
							             					
							             					if(sms == '3')
							             						smsClass = 'sms_active';
							             					if(iac == '3')
							             						iacClass = 'iac_active';
							             					
							             					if(sms == '2')
							             						smsClass = 'sms_normal_active';
							             					if(iac == '2')
							             						iacClass = 'iac_normal_active';
							             					
							             					if(sms == '1')
							             						smsClass = 'sms_normal';
							             					if(iac == '1')
							             						iacClass = 'iac_normal';
							             					
							             					$(span).html('<span class="svr_data1" style="border:none;"><a class="'+smsClass+'" title="'+spanTitle[parseInt(sms)]+'"></a><a class="'+iacClass+'" title="'+spanTitle[parseInt(iac)]+'"></a></span>');
							             				}
							             			});
												});
												$("#csTip").qtip({
													content: '<div align="justify">Merchant đăng ký cấu hình dịch vụ thanh toán cho Sản phẩm để có thể sử dụng Dịch vụ. Các icons thể hiện các loại Dịch vụ thanh toán. Có các trạng thái Đăng ký cấu hình như sau:<br />'
														+ '<ul style="padding-left: 15px;list-style-type:circle;">'
														+ '<li>Icons màu ghi nhạt: Chưa ký hợp đồng điện tử</li>'
														+ '<li>Icons màu ghi đậm: Đã ký hợp đồng điện tử</li>'
														+ '<li>Icons màu vàng: Đã đề nghị</li>'
														+ '<li>Icosn màu đỏ: Bị 1PAY từ chối</li>'
														+ '<li>Icons màu da cam: 1PAY đã xác nhận</li>'
														+ '<li>Icons màu xanh: Đã xác nhận</li>'
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
									</div>
								</form>
							</c:when>
							<c:otherwise>
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
