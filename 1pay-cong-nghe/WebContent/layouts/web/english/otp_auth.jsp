<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function clear(x) {
		x.val = '';
	}
	
	$(document).ready(function() {
		$('form[name=otpAuth] input[name=otp]').focus();
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
						<div class="right_content">
							<h1 class="srv_title">OTP Authenticate</h1>
							<div class="srv_row">
								<form:form name="otpAuth" commandName="otpAuth" method="post">
								<table cellpadding="5" cellspacing="0" border="0">
									<tbody>
										<tr>
											<td>
												<span class="profile_label">OTP Code:</span><br/>
												<form:input path="otp" cssClass="txt_reglog" showPassword="true" onfocus="clear(this)" title="OTP Code" placeholder="OTP Code" />
												<form:hidden path="backUrl" />
											</td>
										</tr>
									</tbody>
								</table>
								<div>
									<form:errors path="*" cssStyle="color:#f00;" />
								</div>
								<input value="Submit" class="btn_greensmall" type="submit" />
								<input value="Cancel" class="btn_graysmall" type="reset" />
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

</body>
</html>