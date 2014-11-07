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
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
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
						<%request.setAttribute("constractNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<!-- Right Content -->
						<form:form  enctype="multipart/form-data" method="post" id="fm1" commandName="edit_contract" cssClass="fm-v clearfix" htmlEscape="true">
						<div class="right_content">
							<h1 class="srv_title">Sửa thông tin hợp đồng</h1>
							<div>
								<span style="color: red"><form:errors path="*"/></span>
							</div>
                			<div class="srv_row">
                				<p class="title-box">Thông tin hợp đồng</p>
                				<c:if test="${isSupport || isOperator}">
                				<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="label_popup_profile" width="200">Đối tác:</td>
	                                        <td>
		                                        <b>${contractInfo.merchant}</b>
		                                        <input type="hidden" id="merchant" value="${contractInfo.merchant}"/>
	                                        </td>
										</tr>
										<tr>
										<td class="label_popup_profile">
											Tên đối tác:
										</td>
										<td>
											<form:input path="merchantName" value="${contractInfo.merchantName}" class="txt_reglog"/>
										</td>
									</tr>
										<tr>
											<td class="label_popup_profile">
												Email:
											</td>
											<td>
												<form:input path="email" value="${contractInfo.email}" class="txt_reglog"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Điện thoại:
											</td>
											<td>
												<form:input path="phone" value="${contractInfo.phone}" class="txt_reglog"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												CMND:
											</td>
											<td>
												<form:input path="identity" value="${contractInfo.identity}" class="txt_reglog"/>
											</td>
										</tr>
										
										<tr>
											<td class="label_popup_profile">
												CMND bản sao:
											</td>
											<td>
												<c:if test="${contractInfo.identityImage!=null}">
													<img border="0" width="250" height="167" src="<%=request.getContextPath()%>${path_identity_image}/${contractInfo.merchant}/${contractInfo.identityImage}"/>
												</c:if>
												<c:if test="${contractInfo.identityImage==null}">
													Chưa upload bản mềm CMND
												</c:if>
												<input type="file" name="file_icon" class="btn_browse"/>
											</td>
										</tr>
										
	                                <tr>
										<td class="label_popup_profile" width="140">
											Hợp đồng số:</td>
										<td>
											<form:input path="contractNo" class="txt_reglog"/>
	                                    </td>
									</tr>
	                                <tr>
										<td class="label_popup_profile" width="140">
											Ký ngày:</td>
										<td>
											<!-- 
											<input type="hidden" id="contract_date_fmt" value="${contractInfo.contract_date_fmt}"/>
											<script>
											  $(function() {
												  $('#contractDate').val($('#contract_date_fmt').val());
											  });
											</script>
											<form:input path="contractDate" class="txt_reglog" placeholder="dd/MM/yyyy" style="width: 100px; "/>
											<input type="text" id="contract_date_fmt" name="contract_date_fmt" value="" placeholder="dd/mm/yyyy" class="txt_reglog" style="width: 100px; " />
											 -->
											<form:input path="contract_date_fmt" placeholder="dd/mm/yyyy" class="txt_reglog" style="width: 100px; "/>
											Ví dụ: 28/08/2014
											&nbsp;&nbsp;&nbsp;<form:checkbox path="autoExtendedContract"/><b>Tự động gia hạn HĐ</b>
	                                    </td>
	                                    <!-- 
	                                    <script>
										  $(function() {
											  $('#contractDate').datepicker({
											        dateFormat: "dd/mm/yy",
											        altFormat: "dd/mm/yy"
											  });
										  });
										</script>
										 -->
									</tr>
									<tr>
										<td class="label_popup_profile">
											Chu kỳ thanh toán:
										</td>
										<td>
	                                        <form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
	                                    </td>
									</tr>
									<tr>
										<td class="label_popup_profile">
											Loại hợp đồng:
										</td>
										<td>
	                                        <form:select path="contractType" items="${contractType}" class="slc_gl"/>
	                                    </td>
									</tr>
									
									<tr>
										<td class="label_popup_profile">
											Trạng thái:
										</td>
										<td>
	                                        <form:radiobutton path="status" value="actived"/><b>Duyệt hợp đồng</b>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<form:radiobutton path="status" value="inactived"/><b>Hủy duyệt hợp đồng</b>
	                                    </td>
									</tr>
						   			</tbody>
						   		</table>
						   		
						   		<!-- Thông tin thanh toán -->
						   		<p class="title-box">Thông tin thanh toán</p>
						   		<table cellpadding="5" cellspacing="0">
									<tbody>
										<!-- 
										<tr>
											<td class="label_popup_profile">
												Mã số thuế:
											</td>
											<td>
												<form:input path="taxCode" value="${contractInfo.taxCode}" class="txt_reglog"/>
											</td>
										</tr>
										 -->
										<tr>
											<td class="label_popup_profile">
												Thông tin thanh toán:
											</td>
											<td>
												<textarea id="paymentInfo" name="paymentInfo" rows="4" cols="50" placeholder="- Thông tin tài khoản - Mã số thuế - Địa chỉ đăng ký kinh doanh">${contractInfo.paymentInfo}</textarea>
											</td>
										</tr>
										
						   			</tbody>
						   		</table>
                				</c:if>
                				
                           </div>
                    	
	                      <div>
	                      	<!-- 
	                      	<input type="button" id="preview_merchant_profile" class="btn_merchant_profile_preview" value="Xem trước"/>
	                      	 -->
	                      	<input type="submit" id="form_action_save" class="btn_greensmall" value="Cập nhật"/>
	                      	<a href="<%=request.getContextPath()%>/protected/merchant_contract_manager.html" class="btn_graysmall">Hủy bỏ</a>
	                      </div>
						</div>
						</form:form>
						<!-- /Right Conent -->
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
