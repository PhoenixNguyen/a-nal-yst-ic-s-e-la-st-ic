<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){

	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
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
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("merchantNavMenu", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						<!--  -->
						<%
							Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
						%>
						<div class="right_content">
							<h1 class="srv_title">Phân bổ Merchant</h1>
							<div>
									<div class="srv_row">
									<form:form  method="post" id="fm1" commandName="assignMerchant" cssClass="fm-v clearfix" htmlEscape="true">
		       	    					<table cellpadding="5" cellspacing="0">
										<tbody>
											<tr>
												<td class="profile_label" width="200">
													Merchant:</td>
												<td>
											    	<form:select id="filter_merchant" path="merchant" items="${merchants}" multiple="multiple" style="width:300px"/>
			                                    </td>
											</tr>
											<tr>
												<td class="profile_label" width="200">
													Phân cho:</td>
												<td>
			                                        <form:select path="depertment" items="${managers}" class="slc_gl" style="text-align:right"/>
			                                    </td>
											</tr>
								   		</tbody>
								   		</table>
								   		<form:errors path="*" cssStyle="color:#f00;" />
			                            <div class="filter_row">
											<input class="btn_greensmall" type="submit" id="btnSubmit" name="submit" value="Phân bổ" accesskey="l"/>
											<%if(account.checkRole(Account.ACCOUNT_MERCHANT_MANAGER_ROLE)) {%>
												<a href="<%=request.getContextPath() %>/protected/merchant-manager.html" class="btn_graysmall">Hủy bỏ</a>
											<%}else{ %>
												<a href="<%=request.getContextPath() %>/protected/accounts.html" class="btn_graysmall">Hủy bỏ</a>
											<%} %>
										</div>
										</form:form>
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

</body>
</html>
