<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>

<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="<%=request.getContextPath() %>/protected/home.html" class="cat_head">Trang chủ</a></li>
		
		<li><a href="#" class="qtr_svr">Quản lý Sản phẩm</a>
			<ul>
				<li><a href="<%=request.getContextPath() %>/console/merchant-provider-allocation.wss" class="${merchantProviderAllocation?'slc_link':''}" >Phân bổ đầu số cho Merchant</a></li>
			</ul>
		</li>
	</ul>

</div>