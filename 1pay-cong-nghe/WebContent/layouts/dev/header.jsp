<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>

<!-- BEGIN HEADER -->
<div class="header navbar navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="header-inner container">
		<!-- BEGIN LOGO -->
		<div style="width:195px; float:left">
			<c:if test="${!hideSidebar}">
			<div style="float: left;">
				<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				<div class="sidebar-toggler hidden-phone" style="margin-left: 1px;margin-right: 4px;"></div>
				<!-- END SIDEBAR TOGGLER BUTTON -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
					<img src="<%=request.getContextPath()%>/assets/img/menu-toggler.png" alt="" />
				</a>
				<!-- END RESPONSIVE MENU TOGGLER -->
			</div>
			</c:if>
			<a href="<%=request.getContextPath()%>/" style="padding: 2px;"> 
				<img align="left" src="<%=request.getContextPath()%>/images/logo_1pay.png" width="65" alt="logo" class="img-responsive" style="margin-left: 0;border-radius: 40px !important;height: 40px;" />
				<span style=" font-size: 12px; color: #fff; line-height: 14px; padding-left: 8px; font-style: italic; width: 90px; display: inline-block; height: 30px; margin-top: 12px; "> Developer </span>
			</a>
			
		</div>
		<div class="hidden-xs" style="width:31px;height:42px;float:left;"></div>
		<!-- END LOGO -->
		<jsp:include page="main_menu.jsp" />
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div  style="float: right;">
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN LANGUAGE DROPDOWN -->
				<li class="dropdown language">
					<c:set var="language" value="VI" />
					<c:set var="flag" value="vn" />
					<c:if test="${cookie['ver'] == 'en' }">
						<c:set var="language" value="EN" />
						<c:set var="flag" value="england" />
					</c:if>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img alt="" src="<%=request.getContextPath()%>/assets/img/flags/${flag}.png"/>
						<span class="username">
							 ${language}
						</span>
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="<%=request.getContextPath() %>?ver=vi">
								<img alt="" src="<%=request.getContextPath()%>/assets/img/flags/vn.png"/> Tiếng Việt
							</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>?ver=en">
								<img alt="" src="<%=request.getContextPath()%>/assets/img/flags/england.png"/> English
							</a>
						</li>
					</ul>
				</li>
				<!-- END LANGUAGE DROPDOWN -->
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<c:choose>
					<c:when test="${account_logined != null}">
						<li class="dropdown user">
							<a href="${homeServer}/protected/profile.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 
								<img alt="" src="<%= request.getContextPath()%>/images/avatar.png" width="29" /> 
								<span class="username"> ${account_logined.username} </span> 
								<i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu">
								<%
								Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
								%>
								<%if(account.isAdmin() || account.isOperator() || account.isShareHolder() || account.isReporter() || account.isBizManager() || account.isBizStaff()){%>
								<li><a href="${homeServer}/protected/cash-flow.html"><i class="fa fa-money"></i> Báo cáo LNG</a></li>
								<%} %>
								<%if(!SharedConstants.MBIZ && (account.isAdmin() || account.isOperator() || account.isBizManager())){%>
								<li><a href="${homeServer}/protected/kpi_chart.html"><i class="fa fa-tasks"></i> Theo dõi kế hoạch</a></li>
								<%} %>
								<%if(!SharedConstants.MBIZ && (account.isAdmin() || account.isOperator() || account.isBizSupportManager())){%>
								<li><a href="${homeServer}/cdr/sms-cdr-filter.cdr"><i class="fa fa-sitemap"></i> Thử nghiệm nội bộ</a></li>
								<%} %>
								<%
								if(!SharedConstants.MBIZ && account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE, Account.ACCOUNT_CUSTOMER_CARE_ROLE})){
								%>
								<li><a href="${homeServer}/protected/accounts.html"><i class="fa fa-users"></i> Quản lý Merchant</a></li>
								<%} else if(!SharedConstants.MBIZ && account.checkRole(Account.ACCOUNT_MERCHANT_MANAGER_ROLE)){%>
								<li><a href="${homeServer}/protected/merchant-manager.html"><i class="fa fa-users"></i> Quản lý Merchant</a></li>
								<%} %>
								<%if(!SharedConstants.MBIZ && account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_MERCHANT_MANAGER_ROLE, Account.ACCOUNT_BIZ_SUPPORTER_ROLE})){ %>
								<li><a href="${homeServer}/protected/merchant_profile_manager.html"><i class="fa fa-user"></i> Quản lý Merchant Profile</a></li>
								<%} %>
								<%if(!SharedConstants.MBIZ && account.checkRoles(new String[]{Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_BIZ_SUPPORTER_ROLE})){%>
								<li><a href="${homeServer}/protected/provider_profile_manager.html"><i class="fa fa-list-alt"></i> Quản lý Provider's Profile</a></li>
								<%} %>
								<%if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE})){%>
								<li><a href="${homeServer}/protected/email-announcement.html"><i class="fa fa-envelope-o"></i> Thông báo Email</a></li>
								<%} %>
								<%if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE})){%>
								<li><a href="${homeServer}/protected/manage-email-marketing.html"><i class="fa fa-envelope"></i> Email Marketing</a></li>
								<%} %>
								<%if(account.checkRole( Account.ACCOUNT_MARKETING_MANAGER_ROLE)){%>
								<li><a href="${homeServer}/protected/email-marketing.html"><i class="fa fa-envelope"></i> Email Marketing</a></li>
								<%} %>
								<li><a href="${homeServer}/protected/profile.html"><i class="fa fa-cog"></i> Cấu hình</a></li>
								<li><a href="<%=request.getContextPath()%>/logout.html"><i class="fa fa-key"></i> Sign out</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<div>
								<a style="line-height: 42px;color: #ccc;text-decoration: none;" href="<%=request.getContextPath()%>/login.html"><i class="fa fa-key"></i> Đăng nhập</a>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>