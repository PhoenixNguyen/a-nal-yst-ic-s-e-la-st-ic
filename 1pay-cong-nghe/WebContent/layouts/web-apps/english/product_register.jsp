<%@page import="vn.onepay.merchant.product.model.MerchantProduct"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { new nicEditor().panelInstance('business_info'); });
</script>
</head>

<%
request.setAttribute("APPROVED_STATUS", 		MerchantProduct.APPROVED_STATUS);
request.setAttribute("REJECT_STATUS", 			MerchantProduct.REJECT_STATUS);
request.setAttribute("INIT_STATUS", 			MerchantProduct.INIT_STATUS);
request.setAttribute("PENDING_STATUS", 			MerchantProduct.PENDING_STATUS);
request.setAttribute("NOT_AVAIABLE_STATUS", 	MerchantProduct.NOT_AVAIABLE_STATUS);
%>

<c:set var="showBusiness" value="${account_logined.isBizSupporter()
																|| account_logined.isOperator()}" />
<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
					<%request.setAttribute("productNavMenu",true); %>
					<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="dky_row">
						<form:form method="post" name="product" commandName="product" enctype="multipart/form-data">
							<h1 class="srv_title">Fill product information</h1>
							<div class="srv_row">
								<form:select path="category" id="category" cssClass="product_filter" cssStyle="margin:0;width:auto;display:none;">
									<form:options items="${categories}"  />
								</form:select>
								<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="profile_label" width="140">Product name (*)</td>
											<td>
												<form:input path="title" id="title" cssClass="txt_reglog" placeholder="A product name" />
											</td>
										</tr>
										<%-- <tr>
											<td class="profile_label" width="140">Mã sản phẩm</td>
											<td>
												<form:input path="app_code" id="app_code" cssClass="txt_reglog" />
											</td>
										</tr> --%>
										<%-- <tr>
											<td class="profile_label">Thể loại</td>
											<td>
												<form:select path="category" id="category" cssClass="product_filter" cssStyle="margin:0;width:auto;">
													<form:options items="${categories}"  />
												</form:select>
											</td>
										</tr> --%>
										<%-- <tr>
											<td class="profile_label">Access key</td>
											<td>
												<form:input path="accessKey" id="accessKey" cssClass="txt_reglog" />
											</td>
										</tr> --%>
										<tr>
											<td class="profile_label" valign="top">Description (*)</td>
											<td valign="top">
												<form:textarea path="description" id="description" cssClass="txtarea_reglog" cssStyle="height: 50px;width:345px;" placeholder="Product description" />
												<img id="myTip" src="<%=request.getContextPath() %>/images/question.png" title="Chú thích" style="vertical-align: top; margin-left: 5px;" width="16px"/>
												<script type="text/javascript" language="javascript">
													$(document).ready(function() {
											
														$("#myTip").qtip({
															content: 'Follow form: <br/>'
																+'<div style="padding-left:10px;color:#fff;">Application on PC / mobile - OS?<br />'
																+'Payment through SMS with amount? download / charge / active / buy ...</div>',										
															position : {
																corner : {
																	target : 'rightMiddle',
																	tooltip : 'leftMiddle'
																}
															},
															style : {
																name : 'cream',
																tip : 'leftMiddle',
																border : {
																	width : 1,
																	radius : 12,
																	color : '#20942B'
																},
																color : '#fff',
																background : '#20942B'
															}
														});
													});
												</script>
											</td>
										</tr>
										<tr>
											<td class="profile_label">Product avatar</td>
											<td>
												<%-- <form:hidden path="icon" id="icon" /> --%>
												<input type="file" name="icon" id="icon" class="txt_reglog" style="height: 30px;" />&nbsp;
												<!-- <input type="button" value="Browse..." class="btn_browse" /> -->
											</td>
										</tr>
										<%-- <tr>
											<td class="profile_label">Tình trạng sản phẩm</td>
											<td>
												<form:radiobutton path="merchant_action" value="${APPROVED_STATUS}"/> Bật
												<form:radiobutton path="merchant_action" value="${INIT_STATUS}"/> Khoá
											</td>
										</tr> --%>
										<c:if test="${showBusiness}">
										<tr>
											<td class="profile_label" valign="top">Business channel information</td>
											<td valign="top">
												<form:textarea path="business_info" id="business_info" cssClass="txtarea_reglog" cssStyle="height: 50px;width:355px;" placeholder="Mô tả thông tin kinh doanh" />
											</td>
										</tr>
										</c:if>
										<tr>
											<td class="profile_label">&nbsp;</td>
											<td>
												<label for="tos_agree"><input type="checkbox" id="tos_agree" value="agree" name="tos_agree" tabindex="5" /> I agree <a href="<%=request.getContextPath() %>/dieu-khoan.html" target="_blank" class="link_terms">terms of 1Pay!</a></label>
												<div style="color:#f00;">(*) Required Information</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="error">
									<form:errors path="*" cssStyle="color:#f00;" />
								</div>
								<input type="submit" class="btn_greensmall" value="Add" />&nbsp;
								<input type="reset" class="btn_graysmall" value="Cancel" onclick="history.back();" />
							</div>
						</form:form>
					</div>
				</div>

				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
			<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>
</body>

</html>