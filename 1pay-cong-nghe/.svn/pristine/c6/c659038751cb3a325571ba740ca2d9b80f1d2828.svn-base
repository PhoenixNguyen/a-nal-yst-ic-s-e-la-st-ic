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
		<li><a href="<%=request.getContextPath() %>/protected/dashboard.html" class="cat_head">Trang chủ</a></li>
		
		<li><a href="#" class="user_normal">Cá nhân</a>
			<ul>
				<li><a href="#">Hoạt động </a></li>
				<li><a href="<%=request.getContextPath()%>/protected/profile.html" class="${accountProfile?'slc_link':''}">Thông tin cá nhân </a></li>
				<li><a href="<%=request.getContextPath()%>/protected/message.html" class="${accountMesage?'slc_link':''}">Tin nhắn <span class="cat_no"><c:out value="${accountMesageCount}" /></span></a></li>
				<li><a href="<%=request.getContextPath()%>/protected/alert.html" class="${accountAlert?'slc_link':''}">Thông báo <span class="cat_no"><c:out value="${accountAlertCount}" /></span></a></li>
				<li><a href="<%=request.getContextPath()%>/protected/api.html" class="${accountApi?'slc_link':''}">Developer APIs </a></li>
				<!-- 
				<li><a href="<%=request.getContextPath()%>/protected/card-sand-box.html" class="${sandBox?'slc_link':''}">1Pay Sandbox </a></li>
				 -->
				
			</ul>
		</li>
	</ul>
	<c:if test="${!MBIZ}">
	<ul class="sub_cat">
		<li><a href="#" class="qtr_svr">Quản trị & vận hành</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/console/index.wss" class="${accountConsole?'slc_link':''}">Quản trị sản phẩm</a></li>
				<li><a href="<%=request.getContextPath() %>/protected/comparison.html" class="${comparisonNavMenu?'slc_link':''}">Đối soát & thanh toán </a></li>
				<%if(account.isOperator() || account.isBookKeeper() || account.isBilling()){ %>
				<li><a href="<%=request.getContextPath() %>/protected/provider_comparison.html" class="${providerComparisonNavMenu?'slc_link':''}">Đối soát Provider </a></li>
				<%} %>				
				<li><a href="<%=request.getContextPath() %>/protected/merchant_contract_manager.html" class="${constractNavMenu?'slc_link':''}">Hợp đồng điện tử</a></li>
				<%if(account.isStaff()){ %>
					<li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Quản lý Profile</a></li>
				<%} else{%>
					 <li><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="${merchantProfileNavMenu?'slc_link':''}">Thông tin Profile</a></li>
				<%} %>	
				
				<%if(account.isOperator() || account.isBizSupporter()){ %>
					<li><a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss" class="${smsCmdNavMenu?'slc_link':''}">Quản lý mã SMS</a></li>
				<%}%>
				
				<%if(account.isOperator() || account.isBizSupporter() || account.isCustomerCare()){ %>
					<li><a href="<%=request.getContextPath() %>/protected/merchant-refund.html" class="${mcRefundNavMenu?'slc_link':''}">Hỗ trợ CSKH</a></li>
				<%}%>
				
				<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_MARKETING_MANAGER_ROLE, Account.ACCOUNT_MERCHANT_MANAGER_ROLE})){%>
					<li><a href="<%=request.getContextPath() %>/protected/manage-email-marketing.html" class="${emailMarketingMenu?'slc_link':''}">Email Marketing</a></li>
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
		<li><a href="<%=request.getContextPath()%>${((account_logined != null && is_admin) || (account_activated_chargings !=null)) ?'/protected/dashboard.html':'/dich-vu.html'}" class="cat_head">Dịch vụ của tôi</a>
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
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=sms">Vui lòng ký hợp đồng điện tử SMS Charging tại đây để truy cập mục này!</a>
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
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=card">Vui lòng ký hợp đồng điện tử Card Charging tại đây để truy cập mục này!</a>
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
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=wap">Vui lòng ký hợp đồng điện tử Wap Charging tại đây để truy cập mục này!</a>
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
							<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=IAC" class="iac_${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'iac'))?'active':'normal'}">SMS Plus Charging</a>
						</c:when>
						<c:otherwise>
							<a class="iac_invi" data-reveal-id="iacModal" data-dismissmodalclass="modal_close">SMS Plus Charging</a>
							<div id="iacModal" class="reveal-modal">
								<div class="srv_row">
									<a href="<%=request.getContextPath() %>/dich-vu.html?n=iac">Vui lòng ký hợp đồng điện tử SMS Plus Charging tại đây để truy cập mục này!</a>
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
				<li><a href="<%=request.getContextPath() %>/dich-vu.html" class="more_normal">Kích hoạt dịch vụ...</a></li>
			</ul>
		</li>
	</ul>
	<ul class="sub_cat">
		<li><a href="#" class="tool_normal">Công cụ</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/merchant-support.html" class="${merchantSupport?'slc_link':''}">Hỗ trợ kết nối</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/tra-cuu.html" class="${cardReport?'slc_link':''}">Tra cứu</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/dashboard.html" class="${cardSummary?'slc_link':''}">Thống kê</a></li>
				<!-- 
				<li><a href="#" class="${cardChartByDay?'slc_link':''}">Biểu đồ doanh thu</a></li>
				 -->
				<li><a href="<%=request.getContextPath() %>/protected/merchant-profile-manager.html" class="${cardChartByHour?'slc_link':''}">Phân tích thông minh</a></li>
			</ul>
		</li>
	</ul>

	<ul class="sub_cat">
		<li><a href="#" class="money_normal">Ví tiền</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/protected/wallet.html" class="${wallet?'slc_link':''}">Số dư tài khoản</a></li>
				<li><a href="#">Rút tiền</a></li>
				<li><a href="#">Hạn mức thanh toán</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/billing_info.html" class="${billingInfo?'slc_link':''}">Cấu hình thanh toán</a></li>
			</ul></li>
	</ul>
	<ul class="sub_cat">
		<li><a href="#" class="help_normal">Help center</a>
			<ul>
				<li><a href="<%=request.getContextPath() %>/lien-he.html">Liên hệ nhanh</a></li>
				<li><a href="http://help.1pay.vn">Trung tâm hỗ trợ</a></li>
			</ul></li>
	</ul>
</div>