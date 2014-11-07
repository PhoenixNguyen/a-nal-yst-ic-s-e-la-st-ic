<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
</head>

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
						<%request.setAttribute("merchantProfileNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<!-- Right Content -->
						<div class="right_content">
							<h1 class="srv_title">
								Profile của ${model.merchantProfile.merchant} 
								<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
									<c:if test="${onepay:viewEditMerchantProfile(model.merchantProfile.status) =='true'}">
										 <a class="link_edit" href="<%=request.getContextPath() %>/protected/edit_merchant_profile.html?id=${model.merchantProfile.id}&call_back_url=${model.callback_parameter}" style="float:right;">[Sửa]</a>
									</c:if>
									
									<c:if test="${model.callback_parameter !=''}">
										<a class="link_callback" href="${model.callback_parameter}" style="float:right; margin-right:10px;">[Quản lý profile]</a>
									</c:if>
								<%}%>
							</h1>
							<!-- Chỉ hiện thị khi role=staff -->
							<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
								<div id="dash_tab">
									<a class="tab_slc" href="<%=request.getContextPath() %>/protected/merchant_profile_detail.html?id=${model.merchantProfile.id}"><span>Chi tiết profile</span></a>
									<a class="tab" href="<%=request.getContextPath() %>/protected/merchant_profile_log.html?id=${model.merchantProfile.id}"><span>Log trạng thái</span></a>
									<div class="clear"></div>
								</div>
							<%}%>
                           
                           <jsp:include page="include_merchant_contract_detail.jsp"></jsp:include>
                           <c:if test="${model.isViewRate}">
                           <p class="title-box">
								<b>
									Tỷ lệ chia sẻ:
									<c:if test="${model.merchantProfile.merchantChargingRate.is_default}">
												<i><span style="color:red;">(Tỷ lệ mặc định)</span></i>
									</c:if>
									<c:if test="${!model.merchantProfile.merchantChargingRate.is_default}">
												<i><span style="color:red;">(Tỷ lệ riêng)</span></i>
									</c:if>
								</b>
						   </p>
                    		<!-- Telco of CARD service -->
                			<table width="100%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
	                       			<tr>
									    <th scope="col">Dịch vụ</th>
									    <th scope="col">#</th>
									    <th scope="col">Nhà mạng</th>
									    <th scope="col">Doanh thu(đ)</th>
									    <th scope="col">Tỷ lệ(%)</th>
									  </tr>
									
	                       			<!-- CARD -->
	                       			<c:if test="${model.ls_card_telco != null && fn:length(model.ls_card_telco) > 0 }">
	                       			<c:forEach items="${model.list_card_telco_df}" var="card_telco_df" varStatus="i" begin="1">
	                       				<c:set var="card_telco" value="${card_telco_df}"/>
	                       				<c:set var="is_df" value="true"/>
	                       				<c:forEach items="${model.ls_card_telco}" var="card_telco_">
	                       					<c:if test="${card_telco_.telco == card_telco_df.telco}">
	                       						<c:set var="card_telco" value="${card_telco_}"/>
	                       						<c:set var="is_df" value="false"/>
	                       					</c:if>
	                       				</c:forEach>
	                       				
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px;background-color: #fff;" align="center" rowspan="${fn:length(model.list_card_telco_df) - 1}">
													<span  id="td-stt-${i.index+1}">CARD</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</c:if>
									<!-- /CARD -->
									<!-- SMS -->
									<c:if test="${model.ls_sms_telco != null && fn:length(model.ls_sms_telco) > 0 }">
									<c:forEach items="${model.list_sms_telco_df}" var="card_telco_df" varStatus="i" begin="1">
	                       				<c:set var="card_telco" value="${card_telco_df}"/>
	                       				<c:set var="is_df" value="true"/>
	                       				<c:forEach items="${model.ls_sms_telco}" var="card_telco_">
	                       					<c:if test="${card_telco_.telco == card_telco_df.telco}">
	                       						<c:set var="card_telco" value="${card_telco_}"/>
	                       						<c:set var="is_df" value="false"/>
	                       					</c:if>
	                       				</c:forEach>
	                       				
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px;background-color: #fff;" align="center" rowspan="${fn:length(model.list_sms_telco_df) - 1}">
													<span  id="td-stt-${i.index+1}">SMS</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</c:if>
									<!-- /SMS -->
									<!-- WAP -->
									<c:if test="${model.ls_wap_telco != null && fn:length(model.ls_wap_telco) > 0 }">
									<c:forEach items="${model.list_wap_telco_df}" var="card_telco_df" varStatus="i" begin="1">
	                       				<c:set var="card_telco" value="${card_telco_df}"/>
	                       				<c:set var="is_df" value="true"/>
	                       				<c:forEach items="${model.ls_wap_telco}" var="card_telco_">
	                       					<c:if test="${card_telco_.telco == card_telco_df.telco}">
	                       						<c:set var="card_telco" value="${card_telco_}"/>
	                       						<c:set var="is_df" value="false"/>
	                       					</c:if>
	                       				</c:forEach>
	                       				
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px;background-color: #fff;" align="center" rowspan="${fn:length(model.list_wap_telco_df) - 1}">
													<span  id="td-stt-${i.index+1}">WAP</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</c:if>
									<!-- /WAP -->
									
									<!-- IAC -->
									<c:if test="${model.ls_iac_telco != null && fn:length(model.ls_iac_telco) > 0 }">
									<c:forEach items="${model.list_iac_telco_df}" var="iac_telco_df" varStatus="i" begin="1">
	                       				<c:set var="iac_telco" value="${iac_telco_df}"/>
	                       				<c:set var="is_df" value="true"/>
	                       				<c:forEach items="${model.ls_iac_telco}" var="iac_telco_">
	                       					<c:if test="${iac_telco_.telco == iac_telco_df.telco}">
	                       						<c:set var="iac_telco" value="${iac_telco_}"/>
	                       						<c:set var="is_df" value="false"/>
	                       					</c:if>
	                       				</c:forEach>
										
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px;background-color: #fff;" align="center" rowspan="${fn:length(model.list_iac_telco_df) - 1}">
													<span  id="td-stt-${i.index+1}">SMS Plus</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${iac_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${iac_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${iac_telco.rates}" var="iac_telco_" varStatus="i">
														${iac_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${iac_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${iac_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${iac_telco.rates}" var="iac_telco_" varStatus="i">
														${iac_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</c:if>
									<!-- /IAC -->
									<!-- BANK -->
									<c:if test="${model.ls_bank_telco != null && fn:length(model.ls_bank_telco) > 0 }">
									<c:forEach items="${model.list_bank_telco_df}" var="bank_telco_df" varStatus="i" begin="0">
	                       				<c:set var="bank_telco" value="${bank_telco_df}"/>
	                       				<c:set var="is_df" value="true"/>
	                       				<c:forEach items="${model.ls_bank_telco}" var="bank_telco_">
	                       					<c:if test="${bank_telco_.telco == bank_telco_df.telco}">
	                       						<c:set var="bank_telco" value="${bank_telco_}"/>
	                       						<c:set var="is_df" value="false"/>
	                       					</c:if>
	                       				</c:forEach>
										
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px;background-color: #fff;" align="center" rowspan="${fn:length(model.list_bank_telco_df) - 1}">
													<span  id="td-stt-${i.index+1}">BANK</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${bank_telco.telco == 'DEFAULT'?'Tỷ lệ':bank_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${bank_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${bank_telco.rates}" var="bank_telco_" varStatus="i">
														${bank_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" class="${is_df?'approved_row':''}" title="${is_df?'Tỷ lệ mặc định':''}">
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.count}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${bank_telco.telco == 'DEFAULT'?'Tỷ lệ':bank_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${bank_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${bank_telco.rates}" var="bank_telco_" varStatus="i">
														${bank_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</c:if>
									<!-- /BANK -->
                     		</table>
                    	<!-- /Telco of CARD service -->
                    	</c:if>
                    	
                    	<!-- TY LE DEFAULT NEU CO -->
                    	<c:if test="${model.haveChargingUsingDafaultRate}">
                    		<c:if test="${model.isViewRate}">
                    		<p class="title-box">
								<b>
									Tỷ lệ chia sẻ: <i><span style="color:red;">(Tỷ lệ mặc định)</span></i>
								</b>
						   </p>
                           
                    		<!-- Telco of CARD service -->
                			<table width="100%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
	                       			<tr>
									    <th scope="col">Dịch vụ</th>
									    <th scope="col">#</th>
									    <th scope="col">Nhà mạng</th>
									    <th scope="col">Doanh thu(đ)</th>
									    <th scope="col">Tỷ lệ(%)</th>
									  </tr>
	                       			<!-- CARD -->
	                       			<c:forEach items="${model.ls_card_telco_df}" var="card_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_card_telco_number_df}">
													<span  id="td-stt-${i.index+1}">CARD</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /CARD -->
									<!-- SMS -->
									<c:forEach items="${model.ls_sms_telco_df}" var="card_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_sms_telco_number_df}">
													<span  id="td-stt-${i.index+1}">SMS</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /SMS -->
									<!-- WAP -->
									<c:forEach items="${model.ls_wap_telco_df}" var="card_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_wap_telco_number_df}">
													<span  id="td-stt-${i.index+1}">WAP</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${card_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /WAP -->
									
									<!-- IAC -->
									<c:forEach items="${model.ls_iac_telco_df}" var="iac_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_iac_telco_number_df}">
													<span  id="td-stt-${i.index+1}">SMS Plus</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${iac_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${iac_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${iac_telco.rates}" var="iac_telco_" varStatus="i">
														${iac_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${iac_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${iac_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${iac_telco.rates}" var="iac_telco_" varStatus="i">
														${iac_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /IAC -->
									<!-- BANK -->
									<c:forEach items="${model.ls_bank_telco_df}" var="bank_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_bank_telco_number_df}">
													<span  id="td-stt-${i.index+1}">BANK</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${bank_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${bank_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${bank_telco.rates}" var="bank_telco_" varStatus="i">
														${bank_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${bank_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span>${bank_telco.amountRange}</span>
													<!-- 
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
													 -->
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${bank_telco.rates}" var="bank_telco_" varStatus="i">
														${bank_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /BANK -->
                     		</table>
                    	<!-- /Telco of CARD service -->
                    	</c:if>
                    	</c:if>
                    	<!-- TY LE DEFAULT NEU CO -->
                    	
						</div>
						<!-- /Right Conent -->
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
	<!-- / 1PAY WEB -->
	
</body>
</html>
