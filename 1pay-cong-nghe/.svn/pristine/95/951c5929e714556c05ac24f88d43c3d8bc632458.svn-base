<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="<%=request.getContextPath() %>/protected/dashboard.html" class="cat_head">Trang chủ</a></li>
		<li><a href="#" class="qtr_svr">Quản trị sản phẩm</a>
			<ul>
				<li><a href="#">Tổng quát</a></li>
				<li><a href="<%=request.getContextPath() %>/console/manager.wss" class="${productNavMenu?'slc_link':''}">Sản phẩm </a></li>
				<li><a href="#">API Access</a></li>
				<li><a href="<%=request.getContextPath() %>/merchant-support.html">Công cụ hỗ trợ</a></li>
				<li><a href="#">Báo cáo </a></li>
				<li><a href="#">Hạn mức </a></li>
				<li><a href="<%=request.getContextPath() %>/protected/comparison_index.html" class="${comparisonNavMenu?'slc_link':''}">Đối soát & thanh toán </a></li>
				<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_BOOK_KEEPER_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_BILLING_ROLE})){ %>
				<li><a href="<%=request.getContextPath() %>/protected/provider_comparison.html" class="${providerComparisonNavMenu?'slc_link':''}">Đối soát Provider </a></li>
				<%} %>
				<li><a href="<%=request.getContextPath() %>/console/eConstract.wss" class="${constractNavMenu?'slc_link':''}">E-Contract</a></li>
				<c:if test="${ model.isStaff }">
					<li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Quản trị profile</a></li>
				</c:if>
				<c:if test="${ !model.isStaff }">
					<li><a href="<%=request.getContextPath() %>/protected/profile.html" class="${accountProfile?'slc_link':''}">Thông tin profile</a></li>
				</c:if>
				<c:if test="${ model.isStaff }">
				<li><a href="<%=request.getContextPath() %>/console/sms-command-code-report.wss" class="${smsCmdNavMenu?'slc_link':''}">Quản lý kho mã SMS</a></li>
				</c:if>
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
		<a href="<%=request.getContextPath() %>/nha-phat-trien.html" class="banner_sdk"></a>
		<a href="<%=request.getContextPath() %>/nha-phat-trien.html" class="banner_api"></a>
	</div>

</div>