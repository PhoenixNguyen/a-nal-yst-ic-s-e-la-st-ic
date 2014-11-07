<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account"%>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	if(account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_REPORTER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE, Account.ACCOUNT_MERCHANT_MANAGER_ROLE})){
%>
	<div align="right">
		<a href="#nvkd_chitiet" name="nvkd_chitiet" rel="leanModal" title="Chi tiết nhân viên KD">
			<img src="<%=request.getContextPath() %>/images/user_help.png" alt="[NVKD]" width="24px">
		</a>
	</div>
	<style>
		#nvkd_chitiet table th {background-color: #eee;}
		#nvkd_chitiet table td {border-bottom: 1px solid #ccc;padding: 5px;}
		#nvkd_chitiet {width:680px;max-height:800px;min-height:400px;overflow-y:auto;display:none;background:#FFF;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;box-shadow:0 0 4px rgba(0,0,0,0.7);-webkit-box-shadow:0 0 4px rgba(0,0,0,0.7);-moz-box-shadow:0 0 4px rgba(0,0,0,0.7);padding: 20px;}
		#nvkd_chitiet .close {position:absolute;top:1px;right:1px;padding:3px 6px;display: block;border-radius: 10px;width: 10px;background-color: #2c8f39;color: #fff;}
	</style>		
	<div id="nvkd_chitiet" style="border-radius: 3px;">
		<h2>Chi tiết nhân viên kinh doanh</h2>
		<a  href="javascript:void(0);" onclick="$('#lean_overlay').click();" title="Đóng" class="close">X</a>
		<table cellpadding="0" cellspacing="0" width="100%" border="0" >
			<tr>
				<th width="50" align="center"><strong>STT</strong></th>
				<th width="100" align="center"><strong>Nhân viên</strong></th>
				<th width="150" height="40" align="center"><strong>DT phân chia (đ)</strong></th>
				<th width="100" align="center"><strong>Merchants</strong></th>
				<th width="100" align="center"><strong>Providers</strong></th>
				<th width="50" align="center"><strong>%LNG</strong></th>
				<th width="100" align="center"><strong>1Pay</strong></th>
			</tr>
			<c:forEach items="${model.mapMerchantManagerTotalRevenue}" var="mapMerchantManagerTotalRevenue" varStatus="status">
				<c:set var="merchantManager" value="${mapMerchantManagerTotalRevenue.key}" />
				<fmt:formatNumber value="${mapMerchantManagerTotalRevenue.value }" var="merchantManagerTotalRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
				<fmt:formatNumber value="${model.mapMerchantManagerTotalMerchantRevenue[merchantManager]}" var="merchantManagerTotalMerchantRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
				<fmt:formatNumber value="${model.mapMerchantManagerTotalProviderRevenue[merchantManager]}" var="merchantManagerTotalProviderRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
			    <fmt:formatNumber value="${model.mapMerchantManagerTotal1PayRevenue[merchantManager]}" var="merchantManagerTotal1PayRevenueFmt" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0"/>
			<tr>
				<td align="right">
					<strong>${status.index +1}.</strong>
				</td>
				<td style="padding-left: 10px;">
		         	<strong>${merchantManager}</strong>
				</td>
				<td align="right">
					<c:out value="${merchantManagerTotalRevenueFmt }" />
				</td>
				<td align="right">
					<c:out value="${merchantManagerTotalMerchantRevenueFmt }" />
				</td>
				<td align="right">
					<c:out value="${merchantManagerTotalProviderRevenueFmt }" />
				</td>
				<td align="right">
					<fmt:formatNumber var="onepayRevenuePercent" value="${(model.mapMerchantManagerTotal1PayRevenue[merchantManager]/mapMerchantManagerTotalRevenue.value) * 100}" maxFractionDigits="2" minFractionDigits="2" />
					<c:out value="${onepayRevenuePercent}" />%
				</td>
				<td align="right">
					<c:out value="${merchantManagerTotal1PayRevenueFmt}" />
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
<%}%>