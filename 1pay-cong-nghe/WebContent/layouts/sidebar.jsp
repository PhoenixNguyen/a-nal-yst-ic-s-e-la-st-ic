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
	
	boolean isAdmin = (account != null? account.isAdmin() : false);
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
%>

<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<ul class="page-sidebar-menu" data-auto-scroll="true"
			data-slide-speed="200">
			<!-- <li class="sidebar-toggler-wrapper">
				BEGIN SIDEBAR TOGGLER BUTTON
				<div class="sidebar-toggler hidden-phone"></div> 
				END SIDEBAR TOGGLER BUTTON
			</li> -->
			<!-- <li class="sidebar-search-wrapper">
				BEGIN RESPONSIVE QUICK SEARCH FORM
				<form class="sidebar-search" action="extra_search.html"
					method="POST">
					<div class="form-container">
						<div class="input-box">
							<a href="javascript:;" class="remove"> </a> <input type="text"
								placeholder="Search..." /> <input type="button" class="submit"
								value=" " />
						</div>
					</div>
				</form> 
				END RESPONSIVE QUICK SEARCH FORM
			</li> -->
			<li class="start ${dashboard?'active':'' }">
				<a href="<%=request.getContextPath() %>/trang-chu.html"> 
					<i class="fa fa-home"></i> <span class="title"> Trang chủ </span>
					<c:if test="${dashboard}"><span class="selected"></span></c:if>
				</a>
			</li>
			
			<li>
				<a href="javascript:;">
					<i class="fa fa-user"></i>
					<span class="title"> Cá nhân </span> <span class="arrow "></span> 
				</a>
				<ul class="sub-menu">
					<li><a href="#"> Hoạt động </a></li>
					<li class="${accountProfile?'active':''}"><a href="<%=request.getContextPath()%>/protected/profile.html"> Thông tin cá nhân </a></li>
					<li class="${accountMesage?'active':''}"><a href="<%=request.getContextPath()%>/protected/message.html"> Tin nhắn <span class="badge"><c:out value="${accountMesageCount}" /></span></a></li>
					<li class="${accountAlert?'active':''}"><a href="<%=request.getContextPath()%>/protected/alert.html"> Thông báo <span class="badge"><c:out value="${accountAlertCount}" /></span></a></li>
					<li class="${accountApi?'active':''}"><a href="<%=request.getContextPath()%>/protected/api.html"> Developer APIs </a></li>
					<!-- 
					<li class="${sandBox?'active':''}"><a href="<%=request.getContextPath()%>/protected/card-sand-box.html"> 1Pay Sandbox </a></li>
					 -->
				</ul>
			</li>
			
			<c:if test="${!MBIZ}">
			<li>
				<a href="javascript:;">
					<i class="fa fa-folder-open"></i>
					<span class="title"> Quản trị & vận hành </span> <span class="arrow "></span> 
				</a>
				<ul class="sub-menu">
					<li class="${accountConsole?'active':''}"><a href="<%=request.getContextPath()%>/console/index.wss"> Quản trị sản phẩm</a></li>
					<li class="${comparisonNavMenu?'active':''}"><a href="<%=request.getContextPath() %>/protected/comparison.html"> Đối soát & thanh toán </a></li>
					<%if(account != null && (account.isOperator() || account.isBookKeeper() || account.isBilling())){ %>
					<li class="${providerComparisonNavMenu?'active':''}"><a href="<%=request.getContextPath() %>/protected/provider_comparison.html"> Đối soát Provider </a></li>
					<%} %>				
					<li class="${constractNavMenu?'active':''}"><a href="<%=request.getContextPath() %>/protected/merchant_contract_manager.html"> Hợp đồng điện tử</a></li>
					<%if(account != null && account.isStaff()){ %>
					<li class="${merchantProfileNavMenu?'active':''}"><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html"> Quản lý Profile</a></li>
					<%} else{%>
					<li class="${merchantProfileNavMenu?'active':''}"><a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html"> Thông tin Profile</a></li>
					<%} %>	
					<%if(account != null && (account.isOperator() || account.isBizSupporter())){ %>
					<li class="${smsCmdNavMenu?'active':''}"><a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss"> Quản lý mã SMS</a></li>
					<%}%>
				</ul>
			</li>
			</c:if>
			
			<c:set var="card_charging_code" value="<%=SharedConstants.CARD_CHARGING_SERVICE_CODE %>" scope="page"/>
			<c:set var="sms_charging_code" value="<%=SharedConstants.SMS_CHARGING_SERVICE_CODE %>" scope="page"/>
			<c:set var="wap_charging_code" value="<%=SharedConstants.WAP_CHARGING_SERVICE_CODE %>" scope="page"/>
			<c:set var="iac_charging_code" value="<%=SharedConstants.IAC_CHARGING_SERVICE_CODE %>" scope="page"/>
			<li>
				<a href="<%=request.getContextPath()%>${((account_logined != null && is_admin) || (account_activated_chargings !=null)) ?'/protected/dashboard.html':'/dich-vu.html'}">
					<i class="fa fa-cogs"></i>
					<span class="title"> Dịch vụ của tôi </span> <span class="arrow "></span> 
				</a>
				<ul class="sub-menu">
					<li class="${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'card'))?'active':''}">
						<c:choose>
							<c:when test="${(account_logined != null && is_admin) || (account_activated_chargings!=null && account_activated_chargings[card_charging_code])}">
								<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=CARD">Card Charging</a>
							</c:when>
							<c:otherwise>
								<a data-toggle="modal" href="#cardModal" class="card_invi">
									<i class="fa fa-credit-card"></i>
									Card Charging
								</a>
								<div class="modal fade bs-modal-sm" id="cardModal" tabindex="-1" role="dialog" aria-hidden="true" style="color:#000;">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Card Charging</h4>
											</div>
											<div class="modal-body">
												<a href="<%=request.getContextPath() %>/dich-vu.html?n=card">Vui lòng ký hợp đồng điện tử Card Charging tại đây để truy cập mục này!</a>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Đóng</button>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="${(param.chargingService!=null && fn:length(param.chargingService) >0 && param.chargingService=='SMS')?'active':''}">
						<c:choose>
							<c:when test="${(account_logined != null && is_admin)||(account_activated_chargings!=null && account_activated_chargings[sms_charging_code])}">
								<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=SMS">SMS Charging</a>
							</c:when>
							<c:otherwise>
								<a data-toggle="modal" href="#smsModal" class="sms_invi">
									<i class="fa fa-envelope-o"></i>
									SMS Charging
								</a>
								<div class="modal fade bs-modal-sm" id="smsModal" tabindex="-1" role="dialog" aria-hidden="true" style="color:#000;">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">SMS Charging</h4>
											</div>
											<div class="modal-body">
												<a href="<%=request.getContextPath() %>/dich-vu.html?n=sms">Vui lòng ký hợp đồng điện tử SMS Charging tại đây để truy cập mục này!</a>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Đóng</button>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'wap'))?'active':''}">
						<c:choose>
							<c:when test="${(account_logined != null && is_admin) || (account_activated_chargings!=null && account_activated_chargings[wap_charging_code])}">
								<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=WAP">WAP Charging</a>
							</c:when>
							<c:otherwise>
								<a data-toggle="modal" href="#wapModal" class="wap_invi">
									<i class="fa fa-globe"></i>
									Wap Charging
								</a>
								<div class="modal fade bs-modal-sm" id="wapModal" tabindex="-1" role="dialog" aria-hidden="true" style="color:#000;">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Wap Charging</h4>
											</div>
											<div class="modal-body">
												<a href="<%=request.getContextPath() %>/dich-vu.html?n=wap">Vui lòng ký hợp đồng điện tử Wap Charging tại đây để truy cập mục này!</a>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Đóng</button>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="${(param.chargingService!=null && fn:length(param.chargingService) >0 && fn:containsIgnoreCase(param.chargingService,'iac'))?'active':''}">
						<c:choose>
							<c:when test="${(account_logined != null && is_admin) || (account_activated_chargings!=null && account_activated_chargings[iac_charging_code])}">
								<a href="<%=request.getContextPath()%>/protected/dashboard.html?chargingService=IAC">In-App Charging</a>
							</c:when>
							<c:otherwise>
								<a data-toggle="modal" href="#iacModal" class="iac_invi">
									<i class="fa fa-mobile"></i>
									In-App Charging
								</a>
								<div class="modal fade bs-modal-sm" id="iacModal" tabindex="-1" role="dialog" aria-hidden="true" style="color:#000;">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">In-App Charging</h4>
											</div>
											<div class="modal-body">
												<a href="<%=request.getContextPath() %>/dich-vu.html?n=iac">Vui lòng ký hợp đồng điện tử In-App Charging tại đây để truy cập mục này!</a>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Đóng</button>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</li>
					<!-- <li><a class="sub_invi">Sub Charging</a></li>
					<li><a class="direct_invi">Direct Charging</a></li> -->
					<li>
						<a href="<%=request.getContextPath() %>/dich-vu.html" class="more_normal">
							<i class="fa fa-ellipsis-h"></i>
							Kích hoạt dịch vụ...
						</a>
					</li>
				</ul>
			</li>
			
			<li>
				<a href="javascript:;">
					<i class="fa fa-wrench"></i>
					<span class="title"> Công cụ </span> <span class="arrow "></span> 
				</a>
				<ul class="sub-menu">
					<li class="${merchantSupport?'active':''}"><a href="<%=request.getContextPath()%>/merchant-support.html">Hỗ trợ kết nối</a></li>
					<li class="${cardReport?'active':''}"><a href="<%=request.getContextPath()%>/protected/tra-cuu.html">Tra cứu</a></li>
					<li class="${cardSummary?'active':''}"><a href="<%=request.getContextPath()%>/protected/dashboard.html">Thống kê</a></li>
					<!-- 
					<li><a href="#" class="${cardChartByDay?'active':''}">Biểu đồ doanh thu</a></li>
					 -->
					<li class="${cardChartByHour?'active':''}"><a href="<%=request.getContextPath() %>/protected/merchant-profile-manager.html">Phân tích thông minh</a></li>
				</ul>
			</li>
			
			<li>
				<a href="javascript:;">
					<i class="fa fa-money"></i>
					<span class="title"> Ví tiền </span> <span class="arrow "></span> 
				</a>
				<ul class="sub-menu">
					<li class="${wallet?'active':''}"><a href="<%=request.getContextPath()%>/protected/wallet.html">Số dư tài khoản</a></li>
					<li><a href="#">Rút tiền</a></li>
					<li><a href="#">Hạn mức thanh toán</a></li>
					<li class="${billingInfo?'active':''}"><a href="<%=request.getContextPath()%>/protected/billing_info.html">Cấu hình thanh toán</a></li>
				</ul>
			</li>
			
			<li>
				<a href="javascript:;">
					<i class="fa fa-question"></i>
					<span class="title"> Help center </span> <span class="arrow "></span> 
				</a>
				<ul class="sub-menu">
					<li><a href="<%=request.getContextPath() %>/lien-he.html">Liên hệ nhanh</a></li>
					<li><a href="http://help.1pay.vn">Trung tâm hỗ trợ</a></li>
				</ul>
			</li>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>
<!-- END SIDEBAR -->