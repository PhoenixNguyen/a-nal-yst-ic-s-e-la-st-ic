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
						<%request.setAttribute("comparisonNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title">Tổng hợp thanh toán</h1>
								<div>
									<div id="dash_tab">
										<a href="<%=request.getContextPath() %>/protected/comparison.html" class="tab"><span>Tất cả</span></a>
										<a href="<%=request.getContextPath() %>/protected/comparison_active.html" class="tab"><span>Đối soát</span></a>
										<a href="<%=request.getContextPath() %>/protected/comparison_reject.html" class="tab"><span>Đối soát bị hủy</span></a>
										<a href="<%=request.getContextPath() %>/protected/comparison_export_billing.html" class="tab_slc"><span>TH thanh toán</span></a>
										<%if(account.isBizSupporter()) {%>
											<a href="<%=request.getContextPath() %>/protected/biz_support_comparison.html"" class="tab"><span>Hỗ trợ đối soát</span></a>
										<%} %>
										<div class="clear"></div>
									</div>
									<form id="list-sms-scenario" action="comparison_export_billing.html" method="get">
										<jsp:include page="include_box_filter_comparison_export.jsp"></jsp:include>
									</form>
				                 	
				                 	<!-- Danh sach gan tt -->
				                 	<c:if test="${model.total >0 }">
									<div class="srv_row">
				                 		<span>Có tất cả <strong><fmt:formatNumber value="${model.total}" currencyCode="vnd" /></strong> đối soát</span>
				                 		<span style="margin-left: 20px;">Tổng DT chia sẻ: <strong><fmt:formatNumber value="${model.totalMcReceived}" maxFractionDigits="0" minFractionDigits="0" currencyCode="vnd" />đ</strong></span>
				                 		<span style="margin-left: 20px;">Tổng ST Merchant hưởng: <strong><fmt:formatNumber value="${model.finalTotalMcReceived}" maxFractionDigits="0" minFractionDigits="0" currencyCode="vnd" />đ</strong></span>
				                 		<%if(account.isBilling() || account.isOperator()) {%>
											<%-- <a href="<%=request.getContextPath() %>/protected/comparison_export_billing_to_excel.html" class="export_link" target="blank" style="padding-left:20px; margin-right: 5px;"><span>Xuất đối soát</span></a> --%>
											<c:if test="${model.list != null && fn:length(model.list) > 0}">
												<a href="#" class="export_link"><span>Tải file đối soát</span></a>
												<script type="text/javascript">
													$(document).ready(function() {
														var href = window.location + '';
														if(href.indexOf('?') > 0)
															href += '&export=1';
														else
															href += '?export=1';
														$('.export_link').attr('href', href);
													});
												</script>
											</c:if> 
										<%} %>
										
										
				                 	</div>
				                 	</c:if>
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
											<display:column title="#" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <c:if test="${model.isStaff }">
										    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
										    </c:if>
										    <display:column title="Title" headerClass="transhead" class="transdata" property="title" style="border: 1px solid #CCC;" />
										    
											<display:column title="Status" headerClass="transhead width160" class="svr_data1" style="border: 1px solid #CCC;">
										    	<div style="display:none">
										    		<!-- Duyet so bo -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink require_preliminary_approval card_invi" title="Hủy bỏ" href="#require_preliminary_approval" name="require_preliminary_approval"  rel="leanModal123"></a>
										    		<!-- Duyet so bo -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink preliminary_approval card_invi" title="Hủy bỏ" href="#preliminary_approval" name="preliminary_approval"  rel="leanModal123"></a>
										    		
										    		<a id="${list.id}" class="sms_avai1 act_copylink comparison_info_pop card_invi" title="Hủy bỏ" href="#smschar_pop" name="smschar_pop"  rel="leanModal123"></a>
										    		
										    		<!-- Merchant xác nhận -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_approval card_invi" title="Hủy bỏ" href="#merchant_approval" name="merchant_approval"  rel="leanModal123"></a>
										    		<!-- /Merchant xác nhận -->
										    		<!-- Duyet chinh thuc -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink offical_approval card_invi" title="Hủy bỏ" href="#offical_approval" name="offical_approval"  rel="leanModal123"></a>
										    		<!-- /Duyet chinh thuc -->
										    		<!-- Thanh toán -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink billing_approval card_invi" title="Hủy bỏ" href="#billing_approval" name="billing_approval"  rel="leanModal123"></a>
										    		<!-- /Thanh toán -->
										    		<!-- Merchant xác nhận thanh toán-->
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_approval_bill card_invi" title="Hủy bỏ" href="#merchant_approval_bill" name="merchant_approval_bill"  rel="leanModal123"></a>
										    		<!-- /Merchant xác nhận thanh toán-->
										    		<!-- Thông tin đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink info_comparison_common card_invi" title="Hủy bỏ" href="#info_comparison_common" name="info_comparison_common"  rel="leanModal123"></a>
										    		<!-- /Thông tin đối soát -->
										    	</div>
										    	
										    	<a class="comparison_active yeucauduyetsobo" id="${list.id}" pname="${list.title}" title="Đã hỗ trợ đối soát"></a>
										    	
										    	<!-- yeu cau duyet so bo -->
										    	<c:set var="requirePrimaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.requirePreliminaryStatusIcon[requirePrimaryIconKey]} yeucauduyetsobo" id="${list.id}" pname="${list.title}"
												title="${model.statusRequirePreliminaryIcon[model.requirePreliminaryStatusIcon[requirePrimaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.requirePreliminaryStatusIcon[requirePrimaryIconKey]=='active' || model.requirePreliminaryStatusIcon[requirePrimaryIconKey]=='reject' || model.requirePreliminaryStatusIcon[requirePrimaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- duyet so bo -->
										    	<c:set var="primaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.primaryStatusIcon[primaryIconKey]} duyetsobo" id="${list.id}" pname="${list.title}"
												title="${model.statusTitlePrimary[model.primaryStatusIcon[primaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.primaryStatusIcon[primaryIconKey]=='active' || model.primaryStatusIcon[primaryIconKey]=='reject' || model.primaryStatusIcon[primaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- merchant -->
										    	<c:set var="merchantIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmStatusIcon[merchantIconKey]} merchantxacnhan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleMerchantConfirm[model.merchantConfirmStatusIcon[merchantIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmStatusIcon[merchantIconKey]=='active' || model.merchantConfirmStatusIcon[merchantIconKey]=='reject' || model.merchantConfirmStatusIcon[merchantIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- chinh thuc -->
										    	<c:set var="officalIconKey" value="com${list.id}" />
												<a class="comparison_${model.officalStatusIcon[officalIconKey]} duyetchinhthuc" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleOffical[model.officalStatusIcon[officalIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.officalStatusIcon[officalIconKey]=='active' || model.officalStatusIcon[officalIconKey]=='reject' || model.officalStatusIcon[officalIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- thanh toan -->
										    	<c:set var="billingIconKey" value="com${list.id}" />
												<a class="comparison_${model.billingStatusIcon[billingIconKey]} thanhtoan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleBilling[model.billingStatusIcon[billingIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.billingStatusIcon[billingIconKey]=='active' || model.billingStatusIcon[billingIconKey]=='reject' || model.billingStatusIcon[billingIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- merchant xác nhận thanh toán-->
										    	<c:set var="merchantBillIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmBillStatusIcon[merchantBillIconKey]} merchantxacnhanthanhtoan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleMerchantConfirmBill[model.merchantConfirmBillStatusIcon[merchantBillIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmBillStatusIcon[merchantBillIconKey]=='active' || model.merchantConfirmBillStatusIcon[merchantBillIconKey]=='reject' || model.merchantConfirmBillStatusIcon[merchantBillIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
										    </display:column>
										    
										    <display:column title="Số tiền<br />Merchant hưởng" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;text-align:right; width:85px">
										    	<fmt:formatNumber value="${list.amount_merchant_final_received}" var="amount_3" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
						                        <c:out value="${amount_3}"></c:out>
										    </display:column>
										    
											<display:column title="Hình thức thanht toán" headerClass="transhead width100" class="svr_data1" style="border: 1px solid #CCC;">
										    	${list.billingInformation.billing_type}
										    </display:column>	
										    <display:column title="Thông tin thanh toán" headerClass="transhead width100" class="svr_data1" style="border: 1px solid #CCC;">
										    	<b>Chủ thẻ:</b> ${list.billingInformation.bank_account_holder}<br/>
										    	<b>Số tài khoản:</b> ${list.billingInformation.bank_account_number}<br/>
										    	<b>Tên NH:</b> ${list.billingInformation.bank_name}<br/>
										    	<b>Tỉnh/TP:</b> ${list.billingInformation.bank_city}<br/>
										    	<b>Chi nhánh:</b> ${list.billingInformation.bank_branch}
										    	<!-- 
										    	<a href="detail_comparison.html?id=${list.id}" class="act_detail" title="Xem chi tiết đối soát" target="blank"></a>
										    	<c:if test="${list.status==-1||list.status==0||list.status==2 || list.status==4 || list.status==6 || list.status==8}">
										    		<a href="edit_comparison.html?id=${list.id}" class="link_denghi" title="Sửa đối soát"></a>
										    	</c:if>
												<a href="<%=request.getContextPath() %>/protected/export_comparison.html?id=${list.id}" class="act_export" ></a>
												<c:if test="${list.status > 0 && (list.status%2) != 0}">
													<c:choose>
														<c:when test="${ empty list.copyId }">
															<a href="clone_comparison.html?id=${list.id}" class="link_clone" title="Copy đối soát" target="blank"></a>
														</c:when>
														<c:otherwise>
															<a href="detail_comparison.html?id=${list.copyId}" class="link_clone_done" title="Đã có bản copy đối soát" target="blank"/>
														</c:otherwise>
													</c:choose>
										    	</c:if>
										    	<c:if test="${list.reference!=null}">
										    		<a href="detail_comparison.html?id=${list.reference}" class="link_reference" title="Xem đối soát gốc" target="blank"></a>
										    	</c:if>
										    	 -->
										    	<!-- list hiden for popup -->
												<input type="hidden" id="hd_title-${list.id}" value="${list.title}"/>
												<input type="hidden" id="hd_merchant-${list.id}" value="${list.merchant}"/>
												<input type="hidden" value="${list.status}" class="status_hidden" id="status_hidden_${list.id}"/>
												<input type="hidden" class="amount_total" id="amount_total_${list.id}" value='<fmt:formatNumber value="${list.sum_total}" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" /> đ'/>
												<input type="hidden" class="amount_total_received" id="amount_total_received_${list.id}" value='<fmt:formatNumber value="${list.sum_total_received}" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" /> đ'/>
												<fmt:formatNumber value="${amount_group_card}" var="amount_group_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_sms}" var="amount_group_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_wap}" var="amount_group_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_iac}" var="amount_group_iac" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" class="amount_services" id="amount_services_${list.id}" value="<br> - CARD:&nbsp;<c:out value="${amount_group_card}"></c:out> đ <br>  - SMS&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_sms}"></c:out> đ <br>  - WAP&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_wap}"></c:out>  đ<br>  - IAC&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_iac}"></c:out>  đ"/>
												<input type="hidden" value="${list.payment_policy}" class="paymentPolicy" id="payment_policy_${list.id}"/>
												
												<input type="hidden" value="${list.contract_type}" class="contract_type" id="contract_type_${list.id}"/>
												<!-- list hiden for popup -->
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
														var url = '<%=request.getContextPath()%>/protected/comparison_app_ajax.html?a=bookkeeper_submit&pid='+pid+'&status='+active;
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
	<!-- / 1PAY WEB -->
	<jsp:include page="include_comparisons_popup.jsp"></jsp:include>	
	
</body>
</html>
