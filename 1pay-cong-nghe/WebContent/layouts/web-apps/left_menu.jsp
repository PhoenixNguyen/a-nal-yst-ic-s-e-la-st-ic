<%@page import="vn.onepay.common.SharedConstants"%>
<%@page import="vn.onepay.account.model.Account"%>
<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>

<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="<%=request.getContextPath() %>/protected/dashboard.html" class="cat_head">Trang chủ</a></li>
		<li><a href="#" class="qtr_svr">Quản trị sản phẩm</a>
			<ul>
				<li><a href="<%=request.getContextPath() %>/console/about_product.wss">Tổng quát</a></li>
				<li><a href="<%=request.getContextPath() %>/console/manager.wss" class="${productNavMenu?'slc_link':''}">Sản phẩm </a></li>
				<%if(account.isOperator() || account.isBizSupporter()){ %>
					<li><a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss" class="${smsCmdNavMenu?'slc_link':''}">Quản lý mã SMS</a></li>
				<%}%>
				<%if(account.isOperator() || account.isBizSupportManager()){ %>
					<li><a href="<%=request.getContextPath() %>/console/merchant-provider-allocation.wss" class="${mpaNavMenu?'slc_link':''}">Phân bổ đầu số cho Merchant</a></li>
				<%}%>
				<li><a href="http://dev.1pay.vn/">API Access</a></li>
				<li><a href="<%=request.getContextPath() %>/merchant-support.html">Công cụ hỗ trợ</a></li>
				<li><a href="#">Báo cáo </a></li>
				<li><a href="#">Hạn mức </a></li>
				<li><a href="<%=request.getContextPath() %>/console/product-verify-manager.wss" class="${productVerify?'slc_link':''}">Hậu kiểm</a></li>
				<!-- 
				<li><a href="<%=request.getContextPath() %>/protected/comparison.html" class="${bookingNavMenu?'slc_link':''}">Đối soát &	thanh toán </a></li>				
				<li><a href="<%=request.getContextPath() %>/protected/merchant_contract_manager.html" class="${constractNavMenu?'slc_link':''}">Hợp đồng điện tử</a></li>
				<c:if test="${ model.isStaff }">
					<li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Quản trị profile</a></li>
				</c:if>
				<c:if test="${ !model.isStaff }">
					<li><a href="<%=request.getContextPath() %>/protected/profile.html" class="${accountProfile?'slc_link':''}">Thông tin profile</a></li>
				</c:if>
				<c:if test="${ model.isStaff }">
					<li><a href="<%=request.getContextPath() %>/console/sms-command-code-report.wss" class="${smsCmdNavMenu?'slc_link':''}">Quản lý kho mã SMS</a></li>
				</c:if>
				 -->
			</ul>
		</li>
	</ul>

	<ul class="sub_cat">
		<li><a href="#" class="help_normal">Help center</a>
			<ul>
				<li><a href="<%=request.getContextPath() %>/lien-he.html">Liên hệ nhanh</a></li>
				<li><a href="http://help.1pay.vn">Trung tâm hỗ trợ</a></li>
			</ul>
		</li>
	</ul>
	
	<div>
		<a href="http://dev.1pay.vn/sdk" target="_blank" class="banner_api"></a>
		<a href="http://dev.1pay.vn/mo-hinh-ket-noi" target="_blank" class="banner_api"></a>
	</div>

</div>