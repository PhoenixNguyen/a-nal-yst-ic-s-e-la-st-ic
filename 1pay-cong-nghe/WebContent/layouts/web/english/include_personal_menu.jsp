<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);

	boolean is_admin = false;
	if(account != null)
		is_admin = account.checkRole("admin");
	request.setAttribute("is_admin", is_admin);
	
	boolean isAdmin = account.isAdmin();
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
%>
<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="<%=request.getContextPath() %>/protected/dashboard.html" class="cat_head">Home</a></li>
		
		<li><a href="#" class="user_normal">Merchant</a>
			<ul>
				<li><a href="#">Activities </a></li>
				<li><a href="<%=request.getContextPath()%>/protected/profile.html" class="${accountProfile?'slc_link':''}">User Profile </a></li>
				<li><a href="<%=request.getContextPath()%>/protected/message.html" class="${accountMesage?'slc_link':''}">Message <span class="cat_no"><c:out value="${accountMesageCount}" /></span></a></li>
				<li><a href="<%=request.getContextPath()%>/protected/alert.html" class="${accountAlert?'slc_link':''}">Notification <span class="cat_no"><c:out value="${accountAlertCount}" /></span></a></li>
				<li><a href="<%=request.getContextPath()%>/protected/api.html" class="${accountApi?'slc_link':''}">Developer APIs </a></li>
				<!-- 
				<li><a href="<%=request.getContextPath()%>/protected/card-sand-box.html" class="${sandBox?'slc_link':''}">1Pay Sandbox </a></li>
				 -->
				
			</ul>
		</li>
	</ul>
	<c:if test="${!MBIZ}">
	<ul class="sub_cat">
		<li><a href="#" class="qtr_svr">Operation & Management</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/console/index.wss" class="${accountConsole?'slc_link':''}">Product Management</a></li>
				<li><a href="<%=request.getContextPath() %>/protected/comparison.html" class="${comparisonNavMenu?'slc_link':''}">Payment & Report </a></li>
				<%if(account.isOperator() || account.isBookKeeper() || account.isBilling()){ %>
				<li><a href="<%=request.getContextPath() %>/protected/provider_comparison.html" class="${providerComparisonNavMenu?'slc_link':''}">Report Provider </a></li>
				<%} %>				
				<li><a href="<%=request.getContextPath() %>/protected/merchant_contract_manager.html" class="${constractNavMenu?'slc_link':''}">E-Contract </a></li>
				<%if(account.isStaff()){ %>
					<li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Profile Management</a></li>
				<%} else{%>
					 <li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Profile Information</a></li>
				<%} %>	
				
				<%if(account.isOperator() || account.isBizSupporter()){ %>
					<li><a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss" class="${smsCmdNavMenu?'slc_link':''}">Manager Codes SMS</a></li>
				<%}%>
			</ul>
		</li>
	</ul>
	</c:if>
	<ul class="sub_cat">
		<c:set var="card_charging_code" value="<%=SharedConstants.CARD_CHARGING_SERVICE_CODE %>" scope="page"/>
		<c:set var="sms_charging_code" value="<%=SharedConstants.SMS_CHARGING_SERVICE_CODE %>" scope="page"/>
		<c:set var="wap_charging_code" value="<%=SharedConstants.WAP_CHARGING_SERVICE_CODE %>" scope="page"/>
		<c:set var="iac_charging_code" value="<%=SharedConstants.IAC_CHARGING_SERVICE_CODE %>" scope="page"/>
		<li><a href="<%=request.getContextPath()%>${((account_logined != null && is_admin) || (account_activated_chargings !=null)) ?'/protected/dashboard.html':'/dich-vu.html'}" class="cat_head">My Services</a>
			<ul>
				<li>
					<c:choose>
						<c:when test="${(account_logined != null && is_admin)||(account_activated_chargings!=null && account_activated_chargings[sms_charging_code])}">
							<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=SMS" class="sms_${(param.chargingService!=null && fn:length(param.chargingService) >0 && param.chargingService=='SMS')?'active':'normal'}">SMS Charging</a>
						</c:when>
						<c:otherwise>
							<a class="sms_invi" data-reveal-id="smsModal" data-dismissmodalclass="modal_close">SMS Charging</a>
							<div id="smsModal" class="reveal-modal">
								<div class="srv_row">
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=sms">Please sign e-contract on SMS charging before using this service!</a>
								</div>
								<div>
									<input type="button" name="cancel" value="Đóng" class="btn_greensmall modal_close" />
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${(account_logined != null && is_admin) || (account_activated_chargings!=null && account_activated_chargings[card_charging_code])}">
							<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=CARD" class="card_${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'card'))?'active':'normal'}">Card Charging</a>
						</c:when>
						<c:otherwise>
							<a class="card_invi" data-reveal-id="cardModal" data-dismissmodalclass="modal_close">Card Charging</a>
							<div id="cardModal" class="reveal-modal">
								<div class="srv_row">
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=card">Please sign e-contract on Card charging before using this service!</a>
								</div>
								<div>
									<input type="button" name="cancel" value="Đóng" class="btn_greensmall modal_close" />
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${(account_logined != null && is_admin) || (account_activated_chargings!=null && account_activated_chargings[wap_charging_code])}">
							<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=WAP" class="wap_${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'wap'))?'active':'normal'}">WAP Charging</a>
						</c:when>
						<c:otherwise>
							<a class="wap_invi" data-reveal-id="wapModal" data-dismissmodalclass="modal_close">Wap Charging</a>
							<div id="wapModal" class="reveal-modal">
								<div class="srv_row">
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=wap">Please sign e-contract on WAP charging before using this service!</a>
								</div>
								<div>
									<input type="button" name="cancel" value="Đóng" class="btn_greensmall modal_close" />
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${(account_logined != null && is_admin) || (account_activated_chargings!=null && account_activated_chargings[iac_charging_code])}">
							<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=IAC" class="iac_${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'iac'))?'active':'normal'}">In-App Charging</a>
						</c:when>
						<c:otherwise>
							<a class="iac_invi" data-reveal-id="iacModal" data-dismissmodalclass="modal_close">In-App Charging</a>
							<div id="iacModal" class="reveal-modal">
								<div class="srv_row">
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=iac">Please sign e-contract on In-App charging before using this service!</a>
								</div>
								<div>
									<input type="button" name="cancel" value="Đóng" class="btn_greensmall modal_close" />
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
				<li><a class="sub_invi">Sub Charging</a></li>
				<li><a class="direct_invi">Direct Charging</a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html" class="more_normal">Activate</a></li>
			</ul>
		</li>
	</ul>
	<ul class="sub_cat">
		<li><a href="#" class="tool_normal">Tools</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/merchant-support.html" class="${merchantSupport?'slc_link':''}">Connection Support</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/tra-cuu.html" class="${cardReport?'slc_link':''}">Search Merchant</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/dashboard.html" class="${cardSummary?'slc_link':''}">Statistic</a></li>
				<!-- 
				<li><a href="#" class="${cardChartByDay?'slc_link':''}">Biểu đồ doanh thu</a></li>
				 -->
				<li><a href="<%=request.getContextPath() %>/protected/merchant-profile-manager.html" class="${cardChartByHour?'slc_link':''}">Intelligent Analysis</a></li>
			</ul>
		</li>
	</ul>

	<ul class="sub_cat">
		<li><a href="#" class="money_normal">Wallet</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/protected/wallet.html" class="${wallet?'slc_link':''}">Account Balance</a></li>
				<li><a href="#">Cash Out</a></li>
				<li><a href="#">Payment Limit</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/billing_info.html" class="${billingInfo?'slc_link':''}">Payment Config</a></li>
			</ul></li>
	</ul>
	<ul class="sub_cat">
		<li><a href="#" class="help_normal">Help center</a>
			<ul>
				<li><a href="<%=request.getContextPath() %>/lien-he.html">Quick Contact</a></li>
				<li><a href="http://help.1pay.vn">Support Center</a></li>
			</ul></li>
	</ul>
</div>