<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>

<!-- Header -->
<div id="w_header">
	<a href="<%=request.getContextPath()%>/console/manager.wss" class="logo_1pay_small"></a>

	<div id="account-header">
		<ul class="nav">
			<c:choose>
			<c:when test="${account_logined != null}">
				<li class="ui-button">
					<a href="#" class="header-nav-link" onclick="return false;">
						<span id="emsnippet-100eb3184c1c497f"><c:out value="${account_logined.username}" /></span>
						<span class="lbl_gray">L${account_logined_level}</span>
					</a>
					<div class="sub-nav chat-bubble" align="left">
						<ul>
							<li>
								<a href="<%= request.getContextPath()%>/protected/profile.html">
									<div class="ava_box">
										<img src="<%= request.getContextPath()%>/images/avatar.png" border="0" />
									</div>
									<div>
										<strong>${account_logined.username}</strong><br/>
										<img alt="level" src="<%=request.getContextPath()%>/images/level_chart.png"><span style="color:#2C8F39;"><strong>Level:</strong> ${account_logined_level}<br/>
										<img alt="exp" src="<%=request.getContextPath()%>/images/exp_point.png"><strong>Exp:</strong> ${account_logined_exp}</span>
									</div>
								</a>
							</li>
							<div class="clear"></div>
							<div class="clear"></div>
							<%
								Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
								if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE})){
							%>
							<li><a href="<%= request.getContextPath()%>/protected/revenue-dashboard.html">Quản lý dòng tiền</a></li>
							<li><a href="<%= request.getContextPath()%>/protected/merchant-manager.html">Quản lý Merchant</a></li>
							<%} %>
							<%
								if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE})){
							%>
							<li><a href="<%= request.getContextPath()%>/protected/email-announcement.html">Thông báo Email</a></li>
							<li><a href="<%= request.getContextPath()%>/protected/email-marketing.html">Email Marketing</a></li>
							<%} %>
							<li><a href="<%= request.getContextPath()%>/protected/profile.html">Cấu hình</a></li>
							<li><a href="<%= request.getContextPath()%>/logout.html">Sign out</a></li>
						</ul>
						<div class="chat-bubble-arrow-border"></div>
						<div class="chat-bubble-arrow"></div>
					</div>
				</li>
				
			</c:when>
			<c:otherwise>
			<li>
				<div class="down" id="top-login-wrapper" style="padding-top:10px;">
				<a href="<%= request.getContextPath()%>/protected/dashboard.html"><img
						src="<%=request.getContextPath()%>/images/door-open-in.png"
						border="0" align="absmiddle" hspace="5" /> Đăng nhập</a>
				</div>
			</li>
			</c:otherwise>
			</c:choose>
			<script type="text/javascript">
					$(document).ready(function() {
						$('.ui-button').live('click', function() {
							var newClass= $(this).attr('class') + '';
							if(newClass.indexOf(' active') > 0) {
								newClass = newClass.replace(/ active/gi,'');
							} else {
								newClass = newClass.replace(/ active/gi,'') + ' active';
							}
							$(this).attr('class',newClass);
						});
					});
				</script>
		</ul>
	</div>
	<div class="clear"></div>
</div>
<!-- / Header -->