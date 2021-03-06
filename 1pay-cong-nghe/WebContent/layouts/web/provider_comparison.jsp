<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
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
						<%request.setAttribute("providerComparisonNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title">Đối soát Provider</h1>
								<div>
									<div id="dash_tab">
										<a href="#" class="tab_slc"><span>Tất cả</span></a>
										<a href="<%=request.getContextPath() %>/protected/provider_comparison_active.html" class="tab"><span>Đối soát</span></a>
										<a href="<%=request.getContextPath() %>/protected/provider_comparison_reject.html" class="tab"><span>Đối soát bị hủy</span></a>
										<a href="<%=request.getContextPath() %>/protected/import_provider_comparison.html" class="addcomparison_link"><span>Tạo mới</span></a>
										<div class="clear"></div>
									</div>
									<form id="provider_comparison" action="provider_comparison.html" method="post">
										<jsp:include page="include_box_filter_provider_comparison_all.jsp"></jsp:include>
									</form>
				                 	
				                 	<!-- Danh sach gan tt -->
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="${model.isPreliminary}" id="isPreliminary"/>
										<input type="hidden" value="${model.isMerchant}" id="isMerchant"/>
										<input type="hidden" value="${model.isOffical}" id="isOffical"/>
										<input type="hidden" value="${model.isBilling}" id="isBilling"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<display:table name="model.list" id="list" 
														requestURI="comparison.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <c:if test="${model.isStaff }">
										    <display:column title="Provider" headerClass="transhead" class="transdata" property="provider" style="border: 1px solid #CCC;" />
										    </c:if>
										    <display:column title="Title" headerClass="transhead" class="transdata" property="title" style="border: 1px solid #CCC;" />
										    
										    <display:column title="Charging" headerClass="transhead width90" class="transdata" style="border: 1px solid #CCC;">
										    	<c:set var="has_card" value="0" />
										    	<c:set var="has_sms" value="0" />
										    	<c:set var="has_wap" value="0" />
										    	<c:set var="has_iac" value="0" />
										    	<c:set var="amount_total" value="${list.sum_total}"/>
										    	<c:forEach items="${list.chargingComparisonGroups}" var="chargingComparisonGroup">
										    		<c:if test="${chargingComparisonGroup.chargingService=='CARD'}">
										    			<c:if test="${chargingComparisonGroup.revenue>0}">
										    				<c:set var="has_card" value="1" />
										    				<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			</c:if>
													</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='SMS'}">
										    			<c:if test="${chargingComparisonGroup.revenue>0}">
										    				<c:set var="has_sms" value="1" />
										    				<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			</c:if>
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='WAP'}">
										    			<c:if test="${chargingComparisonGroup.revenue>0}">
										    				<c:set var="has_wap" value="1" />
										    				<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			</c:if>
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='IAC'}">
										    			<c:if test="${chargingComparisonGroup.revenue>0}">
										    				<c:set var="has_iac" value="1" />
										    				<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_iac" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			</c:if>
										    		</c:if>
										    	</c:forEach>
										    	
										    	<c:if test="${has_card==1}">
										    		<a title="CARD: <c:out value="${amount_card}"></c:out> đ"><img src="../images/card_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_card==0}">
										    		<img src="../images/card_invi.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_sms==1}">
										    		<a title="SMS: <c:out value="${amount_sms}"></c:out> đ"><img src="../images/sms_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_sms==0}">
										    		<img src="../images/sms_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_wap==1}">
										    		<a title="WAP: <c:out value="${amount_wap}"></c:out> đ"><img src="../images/wap_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_wap==0}">
										    		<img src="../images/wap_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_iac==1}">
										    		<a title="SMS Plus: <c:out value="${amount_iac}"></c:out> đ"><img src="../images/iac_normal.png" alt="" class="iac_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_iac==0}">
										    		<img src="../images/iac_invi.png" alt="" class="iac_invi"/>
										    	</c:if>
										    </display:column>
										    <display:column title="DT chia sẻ (đ) &nbsp;<img id='myTip' src='/images/question.png' title='Chú thích' style='vertical-align: bottom; margin-right: 5px;' width='16px'/>" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;text-align:right; width:85px">
										    	<fmt:formatNumber value="${list.sum_total_received}" var="amount_3" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
						                        <c:out value="${amount_3}"></c:out>
						                        
						                        <c:set var="amount_group_card" value="0"/>
						                        <c:set var="amount_group_sms" value="0"/>
						                        <c:set var="amount_group_wap" value="0"/>
						                        <c:set var="amount_group_iac" value="0"/>
						                        
										    	<c:forEach items="${list.chargingComparisonGroups}" var="chargingComparisonGroup">
										    		<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    		<c:if test="${chargingComparisonGroup.chargingService=='CARD'}">
										    			<!-- 
										    			CARD:<c:out value="${amount_card}"></c:out>&nbsp;
										    			 -->
										    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			<c:set var="amount_group_card" value="${chargingComparisonGroup.revenue}" />
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='SMS'}">
										    			<!-- 
										    			SMS:<c:out value="${amount_card}"></c:out>&nbsp;
										    			 -->
										    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			<c:set var="amount_group_sms" value="${chargingComparisonGroup.revenue}" />
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='WAP'}">
										    			<!-- 
										    			WAP:<c:out value="${amount_card}"></c:out>&nbsp;
										    			 -->
										    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			<c:set var="amount_group_wap" value="${chargingComparisonGroup.revenue}" />
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='IAC'}">
										    			<!-- 
										    			SMS Plus:<c:out value="${amount_iac}"></c:out>&nbsp;
										    			 -->
										    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_iac" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
										    			<c:set var="amount_group_iac" value="${chargingComparisonGroup.revenue}" />
										    		</c:if>
										    	</c:forEach>
										    </display:column>
											
											<display:column title="Status" headerClass="transhead width110" class="svr_data1" style="border: 1px solid #CCC;">
										    	<div style="display:none">
										    		<a id="${list.id}" class="sms_avai1 act_copylink comparison_info_pop card_invi" title="Hủy bỏ" href="#smschar_pop" name="smschar_pop"  rel="leanModal123"></a>
										    		<!-- Merchant xác nhận thanh toán-->
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_approval_bill card_invi" title="Hủy bỏ" href="#merchant_approval_bill" name="merchant_approval_bill"  rel="leanModal123"></a>
										    		<!-- /Merchant xác nhận thanh toán-->
										    		
										    		<!-- 1.Yêu cầu đs -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink require_preliminary_approval card_invi" title="Hủy bỏ" href="#comparison_provider_require" name="require_preliminary_approval"  rel="leanModal123"></a>
										    		<!-- /1.Yêu cầu đs -->
										    		<!-- 2.Duyệt đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink preliminary_approval card_invi" title="Hủy bỏ" href="#comparison_provider_accept" name="preliminary_approval"  rel="leanModal123"></a>
										    		<!-- /2.Duyệt đối soát -->
										    		<!-- 3.Provider xác nhận đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_approval card_invi" title="Hủy bỏ" href="#confirm_comparison_provider" name="merchant_approval"  rel="leanModal123"></a>
										    		<!-- /3.Provider xác nhận đối soát -->
										    		<!-- 4.Provider xác nhận thanh toán -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink offical_approval card_invi" title="Hủy bỏ" href="#confirm_payment_provider" name="offical_approval"  rel="leanModal123"></a>
										    		<!-- /4.Provider xác nhận thanh toán -->
										    		<!-- 5.1pay xác nhận được thanh toán -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink billing_approval card_invi" title="Hủy bỏ" href="#confirm_payment_1pay" name="billing_approval"  rel="leanModal123"></a>
										    		<!-- /5.1pay xác nhận được thanh toán -->
										    		<!-- Thông tin đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink info_comparison_common card_invi" title="Hủy bỏ" href="#info_provider_comparison_common" name="info_comparison_common"  rel="leanModal123"></a>
										    		<!-- /Thông tin đối soát -->
										    	</div>
										    	
										    	<!-- 
										    	<a class="comparison_active yeucauduyetsobo" id="${list.id}" pname="${list.title}" title="Đã hỗ trợ đối soát"></a>
										    	 -->
										    	 
										    	<!-- Đề nghị đối soát -->
										    	<c:set var="requireComparisonIconKey" value="com${list.id}" />
												<a class="comparison_${model.statusIconRequireComparison[requireComparisonIconKey]} yeucauduyetsobo" id="${list.id}" pname="${list.title}"
												title="${model.statusRequirePreliminaryIcon[model.statusIconRequireComparison[requireComparisonIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.statusIconRequireComparison[requireComparisonIconKey]=='active' || model.statusIconRequireComparison[requireComparisonIconKey]=='reject' || model.statusIconRequireComparison[requireComparisonIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /Đề nghị đối soát -->
										    	<!-- Duyệt đối soát -->
										    	<c:set var="primaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.primaryStatusIcon[primaryIconKey]} duyetsobo" id="${list.id}" pname="${list.title}"
												title="${model.statusTitlePrimary[model.primaryStatusIcon[primaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.primaryStatusIcon[primaryIconKey]=='active' || model.primaryStatusIcon[primaryIconKey]=='reject' || model.primaryStatusIcon[primaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /Duyệt đối soát -->
										    	<!-- Provider xác nhận đối soát -->
										    	<c:set var="merchantIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmStatusIcon[merchantIconKey]} merchantxacnhan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleMerchantConfirm[model.merchantConfirmStatusIcon[merchantIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmStatusIcon[merchantIconKey]=='active' || model.merchantConfirmStatusIcon[merchantIconKey]=='reject' || model.merchantConfirmStatusIcon[merchantIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /Provider xác nhận đối soát -->
										    	<!-- Provider xác nhận hoàn thành thanh toán -->
										    	<c:set var="officalIconKey" value="com${list.id}" />
												<a class="comparison_${model.officalStatusIcon[officalIconKey]} duyetchinhthuc" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleOffical[model.officalStatusIcon[officalIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.officalStatusIcon[officalIconKey]=='active' || model.officalStatusIcon[officalIconKey]=='reject' || model.officalStatusIcon[officalIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /Provider xác nhận hoàn thành thanh toán -->
										    	<!-- 1Pay xác nhận đã nhận được thanh toán -->
										    	<c:set var="billingIconKey" value="com${list.id}" />
												<a class="comparison_${model.billingStatusIcon[billingIconKey]} thanhtoan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleBilling[model.billingStatusIcon[billingIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.billingStatusIcon[billingIconKey]=='active' || model.billingStatusIcon[billingIconKey]=='reject' || model.billingStatusIcon[billingIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /1Pay xác nhận đã nhận được thanh toán -->
										    	
										    	<!-- merchant xác nhận thanh toán
										    	<c:set var="merchantBillIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmBillStatusIcon[merchantBillIconKey]} merchantxacnhanthanhtoan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleMerchantConfirmBill[model.merchantConfirmBillStatusIcon[merchantBillIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmBillStatusIcon[merchantBillIconKey]=='active' || model.merchantConfirmBillStatusIcon[merchantBillIconKey]=='reject' || model.merchantConfirmBillStatusIcon[merchantBillIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	-->
										    	<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
										    </display:column>
										    
											<display:column title="Actions" headerClass="transhead width80" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a href="detail_provider_comparison.html?id=${list.id}" class="act_detail" title="Xem chi tiết đối soát" target="blank"></a>
										    	<c:if test="${list.status==0||list.status==2}">
										    		<a href="edit_provider_comparison.html?id=${list.id}" class="link_denghi" title="Sửa đối soát"></a>
										    	</c:if>
										    	
												<!-- list hiden for popup -->
												<input type="hidden" id="hd_title-${list.id}" value="${list.title}"/>
												<input type="hidden" id="hd_merchant-${list.id}" value="${list.provider}"/>
												<input type="hidden" value="${list.status}" class="status_hidden" id="status_hidden_${list.id}"/>
												<input type="hidden" class="amount_total" id="amount_total_${list.id}" value="<c:out value="${amount_3}"></c:out> đ"/>
												<fmt:formatNumber value="${amount_group_card}" var="amount_group_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_sms}" var="amount_group_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_wap}" var="amount_group_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_iac}" var="amount_group_iac" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" class="amount_services" id="amount_services_${list.id}" value="<br> - CARD:&nbsp;<c:out value="${amount_group_card}"></c:out> đ <br>  - SMS&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_sms}"></c:out> đ <br>  - WAP&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_wap}"></c:out>  đ<br>  - SMS Plus&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_iac}"></c:out>  đ"/>
												<input type="hidden" value="${list.payment_policy}" class="paymentPolicy" id="payment_policy_${list.id}"/>
												
												<input type="hidden" value="${list.contract_type}" class="contract_type" id="contract_type_${list.id}"/>
												<!-- list hiden for popup -->
												
												<a href="<%=request.getContextPath() %>/protected/export_provider_comparison.html?id=${list.id}" class="act_export" ></a>
												<c:if test="${list.status > 0 && (list.status%2) != 0}">
													<c:choose>
														<c:when test="${ empty list.copyId }">
															<a href="clone_provider_comparison.html?id=${list.id}" class="link_clone" title="Copy đối soát" target="blank"></a>
														</c:when>
														<c:otherwise>
															<a href="detail_provider_comparison.html?id=${list.copyId}" class="link_clone_done" title="Đã có bản copy đối soát" target="blank"/>
														</c:otherwise>
													</c:choose>
										    	</c:if>
												<!-- reference -->
										    	<c:if test="${list.reference!=null}">
										    		<a href="detail_provider_comparison.html?id=${list.reference}" class="link_reference" title="Xem đối soát gốc" target="blank"></a>
										    	</c:if>
										    	<input type="hidden" value="${list.rejectLog}" class="rejectLog" id="rejectLog_${list.id}"/>
										    	<input type="hidden" value="${list.reference}" class="reference" id="reference_${list.id}"/>
										    	<input type="hidden" value="${list.refRejectLog}" class="refRejectLog" id="refRejectLog_${list.id}"/>
										    	<!-- /reference -->
										    </display:column>				
										</display:table>
										<div id="product_active_change" style="display: none;"></div>
										
												
												<script type="text/javascript">
													$(document).ready(function() {
														$('.link_denghidoisoat').live('click', function() {
															var alertMess = 'Bạn muốn đề nghị duyệt sơ bộ?';
															if(confirm(alertMess)) {
																var chkId = $(this).attr('id')+'';
																var pid = chkId.replace(/svr_/gi, '');
																var active = $('#status_hidden_'+pid).val();
																var url = '<%=request.getContextPath()%>/protected/provider_comparison_app_ajax.html?a=bookkeeper_submit&pid='+pid+'&status='+active;
																$('#product_active_change').load(url, function(responseTxt,statusTxt,xhr){
																	if(responseTxt == "2") {
																		$('#' + chkId).val(responseTxt);	
																		window.location.replace(window.location.pathname);
																	}
																});
															} else {
																return false;
															}
														});
													});
												</script>
										<div id="charging_data_temp" style="display: none;"></div>
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
	
	<jsp:include page="include_comparision_provider_popup.jsp"></jsp:include>
</body>
</html>
