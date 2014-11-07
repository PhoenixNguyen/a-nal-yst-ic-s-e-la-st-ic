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
<%
	request.setAttribute("hideZopim", "hide");
%>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
</head>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED); 
%>
<body>
	<h1 class="srv_title">Thông tin Đối soát</h1>
	<div>
		<jsp:include page="include_box_filter_comparison_all.jsp"></jsp:include>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#filter_locketqua h3 a').click();
				$('#filter_locketqua h3 a').html('Điều kiện lọc kết quả');
				$('.box_locketqua #status').parent().remove();
				$('.box_locketqua .filter_row:last-child').remove();
				$('.box_locketqua').find(':input').each(function() {
			        switch(this.type) {
			            case 'password':
			            case 'select-multiple':
			            case 'select-one':
			            case 'text':
			            case 'textarea':
			            case 'checkbox':
			            case 'radio':
			                $(this).attr('disabled', 'disabled');
			                break;
			        }
			    });
			});
		</script>
	             	
      	<!-- Danh sach gan tt -->
      	<c:if test="${model.total >0 }">
		<div class="srv_row">
			<fmt:formatNumber var="totalItems" value="${model.total}" currencyCode="vnd" />
       		<strong>Kết quả tìm kiếm có <c:out value="${totalItems}" /> đối soát</strong>
       		<c:if test="${model.list != null && fn:length(model.list) > 0}">
				<a href="#" class="export_link"><span>Tải file Excel</span></a>
				<script type="text/javascript">
					$(document).ready(function() {
						$('.export_link').attr('href', window.location + '&export=1');
					});
				</script>
			</c:if>  
       	</div>
       	</c:if>
       	<div class="srv_row">
			<input type="hidden" value="${model.isPreliminary}" id="isPreliminary"/>
			<input type="hidden" value="${model.isMerchant}" id="isMerchant"/>
			<input type="hidden" value="${model.isOffical}" id="isOffical"/>
			<input type="hidden" value="${model.isBilling}" id="isBilling"/>
			<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
			<display:table name="model.list" id="list" 
							requestURI="comparison_app_ajax.html" 
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
			    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
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
			    		<a title="SMS Plus: <c:out value="${amount_iac}"></c:out> đ"><img src="../images/iac_invi.png" alt="Chưa sử dụng" class="iac_invi"/></a>
			    	</c:if>
			    	<c:if test="${has_iac==0}">
			    		<img src="../images/iac_active2.png" alt="" class="wap_invi"/>
			    	</c:if>
			    </display:column>
			    <display:column title="DT chia sẻ (đ) &nbsp;<img id='myTip' src='../images/question.png' title='Chú thích' style='vertical-align: bottom; margin-right: 5px;' width='16px'/>" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;text-align:right; width:85px">
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
			    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
			    			<c:set var="amount_group_sms" value="${chargingComparisonGroup.revenue}" />
			    		</c:if>
			    		<c:if test="${chargingComparisonGroup.chargingService=='WAP'}">
			    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
			    			<c:set var="amount_group_wap" value="${chargingComparisonGroup.revenue}" />
			    		</c:if>
			    		<c:if test="${chargingComparisonGroup.chargingService=='IAC'}">
			    			<fmt:formatNumber value="${chargingComparisonGroup.revenue}" var="amount_g_iac" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
			    			<c:set var="amount_group_iac" value="${chargingComparisonGroup.revenue}" />
			    		</c:if>
			    	</c:forEach>
			    </display:column>
				
				<display:column title="Thông tin thanh toán" headerClass="transhead width300" class="svr_data1" style="border: 1px solid #CCC;">
					<c:set var="key1" value="${list.merchant}_account" />
					<c:set var="key2" value="${list.merchant}_identity" />
					<c:set var="key3" value="${list.merchant}_billInfo" />
					
					<div>
						<strong>Đối tác: </strong>${list.merchant_name}
					</div>
					<div>
						<strong>Số tài khoản: </strong>${model.billingInfo[key3].bank_account_number}
					</div>
					<div>
						<strong>Ngân hàng: </strong>${model.billingInfo[key3].bank_name}, ${model.billingInfo[key3].bank_branch}
					</div>
					<div>
						<strong>CMT / MST: </strong>${model.billingInfo[key2].identity}
					</div>
					<div>
						<strong>Điện thoại: </strong>${model.billingInfo[key1].phone}
					</div>
			    </display:column>
			</display:table>
		</div>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#myTip").qtip({
				content: 'Doanh thu chia sẻ (Ký hiệu DT): là doanh thu 1PAY bắt đầu dùng để chia sẻ từ các dịch vụ hai bên hợp tác sau khi trừ đi thuế VAT (10%). Phần thuế VAT 10% 1PAY phải nộp vào ngân sách nhà nước.',										
				position : {
					corner : {
						target : 'topRight',
						tooltip : 'bottomMiddle'
					}
				},
				style : {
					name : 'cream',
					tip : 'bottomMiddle',
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
		<!-- /Danh sach gan tt -->
	</div>
</body>
</html>