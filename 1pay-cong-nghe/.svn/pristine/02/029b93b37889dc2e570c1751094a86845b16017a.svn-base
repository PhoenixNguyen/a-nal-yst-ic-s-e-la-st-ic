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
		<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){%>
		<li><a href="#" class="qtr_svr">Quản trị & vận hành</a>
			<ul>
				<%if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE, Account.ACCOUNT_CUSTOMER_CARE_ROLE})){%>
					<li><a href="<%= request.getContextPath()%>/protected/merchant-manager.html" class="${merchantNavMenu?'slc_link':''}" >Quản lý Merchant</a></li>
				<%} else if(account.checkRole(Account.ACCOUNT_MERCHANT_MANAGER_ROLE)){%>
				<li><a href="<%= request.getContextPath()%>/protected/merchant-manager.html" class="${merchantNavMenu?'slc_link':''}" >Quản lý Merchant</a></li>
				<%} %>
				<li><a href="<%=request.getContextPath()%>/console/index.wss" class="${accountConsole?'slc_link':''}">Quản trị sản phẩm</a></li>
				<li><a href="<%=request.getContextPath() %>/protected/comparison.html" class="${comparisonNavMenu?'slc_link':''}">Đối soát & thanh toán </a></li>
				<%if(account.isOperator() || account.isBookKeeper() || account.isBilling()){ %>
				<li><a href="<%=request.getContextPath() %>/protected/provider_comparison.html" class="${providerComparisonNavMenu?'slc_link':''}">Đối soát Provider </a></li>
				<%} %>				
				<li><a href="<%=request.getContextPath() %>/protected/merchant_contract_manager.html" class="${constractNavMenu?'slc_link':''}">E-Contract</a></li>
				<%if(account.isStaff()){ %>
					<li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Quản lý Profile</a></li>
				<%} else{%>
					 <li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Thông tin Profile</a></li>
				<%} %>	
				
				<%if(account.isOperator() || account.isBizSupporter()){ %>
					<li><a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss" class="${smsCmdNavMenu?'slc_link':''}">Quản lý mã SMS</a></li>
				<%}%>
				<%if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE})){%>
					<li><a href="<%= request.getContextPath()%>/protected/cash-flow.html" class="${moneyFlowMenu?'slc_link':''}" >Quản lý dòng tiền</a></li>
				<%} %>
			</ul>
		</li>
		<%} %>
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