
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
</head>
<%Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED); %>
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
						<!-- Left Menu -->
						<%request.setAttribute("constractNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title" style="width:300px; float:left;">E-Contract</h1>
							
							<c:if test="${model.isReviewProfileInfo}">
								<a href="<%=request.getContextPath() %>/protected/create_merchant_contract.html" class="addproduct_link"><span>Create a new contract</span></a>
							</c:if>
							<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_BIZ_SUPPORTER_ROLE})){ %>
								<a href="<%=request.getContextPath() %>/protected/export_merchant_contract.html?type=support" class="export_link" style="margin-right: 5px;"><span>Export basic information</span></a>
							<%} %>	
							<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_OPERATION_MANAGER_ROLE})){ %>
								<a href="<%=request.getContextPath() %>/protected/export_merchant_contract.html?type=operator" class="export_link" style="margin-right: 5px;"><span>Export full information</span></a>
							<%} %>	
							<div class="clear"></div>
								<div>
									<c:if test="${model.isStaff}">
									<form id="list-sms-scenario" action="merchant_contract_manager.html" method="post">
										<jsp:include page="include_box_filter_merchant_contract_all.jsp"></jsp:include>
									</form>
				                 	</c:if>
				                 	<c:if test="${model.total>0 }">
				                 		<div style="padding-left:5px; padding-top:10px;font-size: 14px;">About <b>${model.total}</b> results found</div>
				                 	</c:if>
				                 	
				                 	<!-- Danh sach gan tt -->
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="true" id="formContractManager"/>
										<input type="hidden" value="${model.isSupportProfile}" id="isSupportProfile"/>
										<input type="hidden" value="${model.isReviewProfileInfo}" id="isReviewProfileInfo"/>
										<input type="hidden" value="${model.isPromoteRate}" id="isPromoteRate"/>
										<input type="hidden" value="${model.isReviewProfileRate}" id="isReviewProfileRate"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<input type="hidden" value="<%=request.getContextPath() %>${model.path_identity_image}" id="path_identity_image"/>
										<display:table name="model.list" id="list" 
														requestURI="merchant_contract_manager.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="#" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <display:column title="Merchant" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;">
										    	${list.merchant}
										    	<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
										    	(<c:out value="${onepay:getDepartmentOfMerchant(list.merchant)}"/>)
										    	<%}%>
										    </display:column>
										    <display:column title="Merchant Name" headerClass="transhead" class="transdata" property="merchantName" style="border: 1px solid #CCC;" />
										    
										    <display:column title="Contract type" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;text-align:center;">
										    	${list.contractType}
										    </display:column>
										    <display:column title="Payment cycle" headerClass="transhead " class="transdata" style="border: 1px solid #CCC;text-align:center;">
										    	${list.paymentPolicy}
										    </display:column>
										    <display:column title="Version" headerClass="transhead " class="transdata" style="border: 1px solid #CCC;text-align:center;">
										    	ver 1.${list.version}
										    </display:column>
										    <display:column title="Charging" headerClass="transhead width90" class="transdata" style="border: 1px solid #CCC;">
										    	<c:set var="has_card" value="0" />
										    	<c:set var="has_sms" value="0" />
										    	<c:set var="has_wap" value="0" />
										    	<c:set var="has_iac" value="0" />
										    	<c:forEach items="${list.chargingServices}" var="chargingRate">
										    		<c:if test="${chargingRate.key=='CARD'}">
										    				<c:set var="has_card" value="1" />
													</c:if>
										    		<c:if test="${chargingRate.key=='SMS'}">
										    				<c:set var="has_sms" value="1" />
										    		</c:if>
										    		<c:if test="${chargingRate.key=='WAP'}">
										    				<c:set var="has_wap" value="1" />
										    		</c:if>
										    		<c:if test="${chargingRate.key=='IAC'}">
										    				<c:set var="has_iac" value="1" />
										    		</c:if>
										    	</c:forEach>
										    	
										    	<c:if test="${has_card==1}">
										    		<a title="Service CARD is used"><img src="../images/card_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_card==0}">
										    		<img src="../images/card_invi.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_sms==1}">
										    		<a title="Service SMS is used"><img src="../images/sms_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_sms==0}">
										    		<img src="../images/sms_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_wap==1}">
										    		<a title="Service WAP is used"><img src="../images/wap_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_wap==0}">
										    		<img src="../images/wap_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_iac==1}">
										    		<a title="Service IAC is used"><img src="../images/iac_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_iac==0}">
										    		<img src="../images/iac_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    </display:column>
										    
										    <display:column title="Status" headerClass="transhead width50" class="svr_data1" style="border: 1px solid #CCC;text-align:center;">
										    	<c:set var="primaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.primaryStatusIcon[primaryIconKey]} duyetsobo" id="${list.id}"
												title="${model.statusTitlePrimary[model.primaryStatusIcon[primaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.primaryStatusIcon[primaryIconKey]=='active' || model.primaryStatusIcon[primaryIconKey]=='reject' || model.primaryStatusIcon[primaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    </display:column>
										    
										    <display:column title="Actions" headerClass="transhead width40" class="svr_data1" style="border: 1px solid #CCC;text-align:center;">
										    	<a href="merchant_contract_detail.html?id=${list.id}" class="act_detail" title="see Merchant Profile" target="blank"></a>
										    	<!-- 
										    	<c:if test="${model.isSupportProfile||model.isReviewProfileInfo}">
										    		<a href="edit_merchant_contract.html?id=${list.id}" class="link_denghi" title="Sửa Merchant Profile"></a>
										    	</c:if>
										    	 -->
												<!-- list hiden for popup -->
												<input type="hidden" id="hd_merchant-${list.id}" value="${list.merchant}"/>
												<input type="hidden" id="hd_merchant_name-${list.id}" value="${list.merchantName}"/>
												<input type="hidden" id="hd_merchant_desc-${list.id}" value="${list.merchantDesc}"/>
												<input type="hidden" id="hd_merchant_email-${list.id}" value="${list.email}"/>
												<input type="hidden" id="hd_merchant_phone-${list.id}" value="${list.phone}"/>
												<input type="hidden" value="${list.contractNo}" class="contract_no" id="contract_no_${list.id}"/>
												<input type="hidden" value="${list.contractType}" class="contract_type" id="contract_type_${list.id}"/>
												<input type="hidden" value="${list.contract_date_fmt}" class="contract_date" id="contract_date_${list.id}"/>
												<input type="hidden" value="${list.paymentPolicy}" class="paymentPolicy" id="payment_policy_${list.id}"/>
												
												<input type="hidden" id="hd_identityImage-${list.id}" value="${list.identityImage}"/>
												<input type="hidden" id="hd_identity-${list.id}" value="${list.identity}"/>
												<input type="hidden" value="${list.expired_date_fmt}" class="contract_expired_date" id="contract_expired_date_${list.id}"/>
												<input type="hidden" id="hd_autoExtendedContract-${list.id}" value="${list.autoExtendedContract}"/>
												
												<input type="hidden" value="${list.status}" class="status_hidden" id="status_hidden_${list.id}"/>
												<input type="hidden" class="amount_total" id="amount_total_${list.id}" value="<c:out value="${amount_3}"></c:out> đ"/>
												<fmt:formatNumber value="${amount_group_card}" var="amount_group_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_sms}" var="amount_group_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_wap}" var="amount_group_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" class="amount_services" id="amount_services_${list.id}" value="<br> - CARD:&nbsp;<c:out value="${amount_group_card}"></c:out> đ <br>  - SMS&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_sms}"></c:out> đ <br>  - WAP&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_wap}"></c:out>  đ"/>
												<!-- list hiden for popup -->
												
												<!-- 
												<c:if test="${model.isReviewProfileInfo||model.isSupportProfile}">
													<div class="onoffswitch">
														<c:set value="${list.status==1}" var="status" />
														<input type="checkbox" name="onoffswitch" value="${list.status}" class="onoffswitch-checkbox" id="svr_${list.id}" ${status?'checked':'' } />
														<label class="onoffswitch-label" for="svr_${list.id}">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div>
														</label>
													</div>	
												</c:if>
												<c:if test="${!model.isReviewProfileInfo && !model.isSupportProfile}">
													<c:if test="${list.status==1}">
														<img src="../images/onoffswitch_on.png" alt="Hoạt động"/>
													</c:if>
													<c:if test="${list.status==0}">
														<img src="../images/onoffswitch_off.png" alt="Chưa kích hoạt"/>
													</c:if>
												</c:if>
												 -->
												 <!-- 
												 	<c:if test="${list.status==1}">
														<img src="../images/onoffswitch_on.png" alt="Hoạt động"/>
													</c:if>
													<c:if test="${list.status==0}">
														<img src="../images/onoffswitch_off.png" alt="Chưa kích hoạt"/>
													</c:if>
												 -->
										    </display:column>	
										</display:table>
										<div id="product_active_change" style="display: none;"></div>
										
										<script type="text/javascript">
													$(document).ready(function() {
														$('.onoffswitch-checkbox').live('click', function() {
															var alertMess = 'Do you want to change the status of contract?';
															var active = $(this).attr('value')+'';
															if(active == '0') {
																alertMess = 'Do you want to review the contract?';
															} else if(active == '1') {
																alertMess = 'Do you want to cancel the contract?';
															}
															
															if(confirm(alertMess)) {
																var chkId = $(this).attr('id')+'';
																var pid = chkId.replace(/svr_/gi, '');
																var url = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html?a=change_contract_status&pid='+pid;
																//alert(pid);
																//alert(url);
																$('#product_active_change').load(url, function(responseTxt,statusTxt,xhr){
																	if(responseTxt == "0" || responseTxt == "1") {
																		$('#' + chkId).val(responseTxt);	
																	}
																});
															} else {
																return false;
															}
														});
													});
												</script>
										
									</div>
									<!-- /Danh sach gan tt -->
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
	</div>
	<!-- / 1PAY WEB -->

	<jsp:include page="include_merchant_profile_popup.jsp"></jsp:include>

</body>
</html>
