<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
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
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<form:form name="/protected/profile/edit" commandName="account_profile_edit" method="post">
						<div class="right_content">
							<h1 class="srv_title">Thông tin cá nhân</h1>
							<div class="srv_row">
								<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="edit_profile_label">Họ và Tên:</td>
											<td>
												<c:if test="${merchantContract.status!=1 || merchantContract.merchantName==null || merchantContract.merchantName==''}">
													<form:input path="fullName" cssClass="txt_edit_profile" title="Họ và tên" placeholder="Họ và tên" onfocus="clear(this)"/>
												</c:if>
												<c:if test="${merchantContract.status==1 && merchantContract.merchantName!=null && merchantContract.merchantName!=''}">
													${merchantContract.merchantName}
													<input type="hidden" id="fullName" value="${merchantContract.merchantName}"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="edit_profile_label">Email:</td>
											<td>
												<c:if test="${merchantContract.status!=1 || merchantContract.email==null || merchantContract.email==''}">
													<form:input path="email" cssClass="txt_edit_profile" title="Email" placeholder="Email" onfocus="clear(this)" readonly="${ account_logined.email!=null?'true':'false' }"/>
													<c:if test="${account.verify_email=='false'}">
														[<a href="<%=request.getContextPath()%>/protected/verify_email.html" class="link_feature" title="Sửa email" style="color: #0066cc">Sửa</a>]
													</c:if>
													<c:if test="${account.verify_email=='true'}">
														<img src="<%= request.getContextPath()%>/images/tick.png" title="Email đã xác thực"/>
													</c:if>
												</c:if>
												<c:if test="${merchantContract.status==1 && merchantContract.email!=null && merchantContract.email!=''}">
													${merchantContract.email}
													<input type="hidden" id="email" value="${merchantContract.email}"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="edit_profile_label">Số ĐT:</td>
											<td>
												<c:if test="${merchantContract.status!=1 || merchantContract.phone==null || merchantContract.phone==''}">
													<form:input path="phone" cssClass="txt_edit_profile" title="Số ĐT" placeholder="Số ĐT" onfocus="clear(this)" readonly="${account.verify_phone=='true'?'true':'false' }"/>
													<c:if test="${account.phone==null && account.verify_phone=='false'}">
														<a href="<%=request.getContextPath()%>/protected/verify_phone.html" class="link_feature" title="Sửa sđt" style="color: #0066cc">
														<img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
														[Xác thực]</a>
													</c:if>
													<c:if test="${account.verify_phone=='true'}">
														<img src="<%= request.getContextPath()%>/images/tick.png" title="Số điện thoại đã xác thực"/>
													</c:if>
												</c:if>
												<c:if test="${merchantContract.status==1 && merchantContract.phone!=null && merchantContract.phone!=''}">
													${merchantContract.phone}
													<input type="hidden" id="phone" value="${merchantContract.phone}"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="edit_profile_label">CMND:</td>
											<td>
												<c:if test="${merchantContract.status!=1 || merchantContract.identity==null || merchantContract.identity==''}">
													<form:input path="cmnd" cssClass="txt_edit_profile" title="Số CMND" placeholder="Số CMND" onfocus="clear(this)"/>
												</c:if>
												<c:if test="${merchantContract.status==1 && merchantContract.identity!=null && merchantContract.identity!=''}">
													${merchantContract.identity}
													<input type="hidden" id="cmnd" value="${merchantContract.identity}"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="edit_profile_label">Address:</td>
											<td>
												<c:if test="${merchantContract.status!=1 || merchantContract.address==null || merchantContract.address==''}">
													<form:input path="address" cssClass="txt_edit_profile" title="Địa chỉ" placeholder="Địa chỉ" onfocus="clear(this)" />
												</c:if>
												<c:if test="${merchantContract.status==1 && merchantContract.address!=null && merchantContract.address!=''}">
													${merchantContract.address}
													<input type="hidden" id="address" value="${merchantContract.address}"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="edit_profile_label">Ngôn ngữ:</td>
											<td>
												<form:select path="language" style="width: 265px; height: 34px; font-size: 14px; padding: 5px;" title="Ngôn ngữ sử dụng">
												   <form:options items="${languages}" />
												</form:select>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<form:errors path="*" cssStyle="color:#f00;" />
											</td>
										</tr>
										<tr>
											<td class="edit_profile_label"></td>
											<td>
												<input value="Cập nhật" class="btn_greensmall" type="submit"/>
												<a href="<%=request.getContextPath()%>/protected/profile.html" class="btn_graysmall">Huỷ</a>
											</td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div>
						</form:form>
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
