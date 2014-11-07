<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, vn.onepay.comparison.model.ComparisonInfo" %>
<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.go_sms').live('click', function() {
			var pid = $(this).attr('id');
			alert(pid);
			var title = $("#hd_title-"+pid).val();
			var merchant = $("#hd_merchant-"+pid).val();
			$("#popup_title").html(title);
			$("#popup_merchant").html(merchant);
			$("#popup_pid").val(pid);
		});
	});
</script>
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
						
						<div class="right_content">
							<h1 class="srv_title">Chi tiết log trạng thái</h1>
							<div>
								<div id="dash_tab">
									<a class="tab" href="<%=request.getContextPath() %>/protected/merchant_profile_detail.html?id=${model.profileId}"><span>Chi tiết profile</span></a>
									<a class="tab_slc"><span>Log trạng thái</span></a>
									<div class="clear"></div>
								</div>
								<div class="clear"></div>
								<div class="srv_row">
									<script>var rownum = 1;</script>
									<display:table name="model.merchantProfileLogs" id="list" 
													requestURI="merchant_profile_detail.html" 
													style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" >
										<%@ include file="display_table.jsp" %>
								    	<display:column title="Xử lý" headerClass="transhead" class="transdata" property="username" style="border: 1px solid #CCC;" />
								    	<display:column title="Thao tác" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
								    		<c:out value="${onepay:describeMerchantProfileAction(list.status_before, list.status_after)}"></c:out>
								    	</display:column>
								    	<display:column title="Lý do" headerClass="transhead" class="transdata" property="reason" style="border: 1px solid #CCC;" />
								    	<display:column title="Thời gian" headerClass="transhead" class="transdata" property="created_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
									 </display:table>
								</div>
							</div>
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
	</div>
	<!-- / 1PAY WEB -->
	<script type="text/javascript">
		/*         */
		jQuery(function($) {

			$(function() {
				$('#hot_productslides').slides({
					preload : true,
					preloadImage : 'images/loading.gif',
					play : 5000,
					pause : 2500,
					hoverPause : true
				});
			});

		});
		/*   */
	</script>
	<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">
		qm_create(0, false, 0, 250, false, false, false, false, false);
	</script>
	<!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->
	
	<!-- Comparison Popup -->
		<jsp:include page="include_comparison_popup.jsp"></jsp:include>
	<!-- /Comparison Popup -->
	
</body>
</html>
