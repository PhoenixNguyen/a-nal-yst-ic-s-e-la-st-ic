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
						<%request.setAttribute("merchantSupport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">1Pay Sandbox</h1>
							<div>
								<form id="smsSandBox" action="sms-sand-box.html" method="post">
									<div id="dash_tab">
											<a id="cont" href="<%=request.getContextPath() %>/protected/card-sand-box.html" class="tab"><span>Card Charging</span></a> 
											<a id="telco" href="<%=request.getContextPath() %>/protected/sms-sand-box.html" class="tab_slc"><span>SMS Charging</span></a> 
											<a id="telco" href="<%=request.getContextPath() %>/protected/iac-sand-box.html" class="tab"><span>SMS Plus Charging</span></a>
											<!--  
											<a id="price" href="<%=request.getContextPath() %>/protected/wap-sand-box.html" class="tab"><span>WAP Charging</span></a>
											 -->
											<div class="clear"></div>
									</div>
									<div id="filter_locketqua">
										<!-- .widget-header -->
										<form:form name="smsSandBox" commandName="smsSandBox" method="post">
										<div>
											<div class="filter_row">
							                 	<span class="add-on">Access Key:</span>
							                 	<form:input path="accessKey"  class="txt_filter"/>
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">Secret Key:</span>
							               		<form:input path="secretKey"  class="txt_filter"/>
							                </div>
											<div class="filter_row">
							                 	<span class="add-on">MSISDN:</span>
							               		<form:input path="msisdn"  class="txt_filter"/>
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">Short Code:</span>
							               		<form:input path="shortCode"  class="txt_filter"/>
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">MO:</span>
							               		<form:input path="moMessage"  class="txt_filter"/>
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">RequestID:</span>
							               		<form:input path="requestId"  class="txt_filter"/>
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">RequestTime:</span>
							               		<form:input path="requestTime"  class="txt_filter"/>
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">Received URL:</span>
							               		<form:input path="moUrl"  class="txt_filter"/>
							                </div>
											<div><form:errors path="*" cssStyle="color:#f00;" /></div>
											<!-- .field-group -->
											<div class="filter_row">
												<input class="btn_greensmall" type="submit" name="submit" value="Thực hiện" />
												<input class="btn_graysmall" type="reset" name="reset" value="Huỷ" />
											</div>
											<!-- .actions -->
										</div>
										<!-- .widget-content -->
										<c:if test="${ smsSandBox.signature!=null && smsSandBox.signature!=''}">
											<h3>Kết quả</h3>
											<div>
											<div class="filter_row">
												<span class="add-on">Data:</span>
												<form:textarea path="data" rows="3" cols="80"/>
							                </div>
											<div class="filter_row">
												<span class="add-on">Signature:</span>
												<form:textarea path="signature" rows="3" cols="80"/>
							                </div>
							                <div class="filter_row">
												<span class="add-on">Request:</span>
												<form:textarea path="apiRequest" rows="3" cols="80"/>
							                </div>
											<div class="filter_row">
												<span class="add-on">Response:</span>
												<form:textarea path="apiResponse" rows="3" cols="80"/>
												<c:choose>
													<c:when test="${smsSandBox.isSuccess }">
														<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Thành công!" />		
													</c:when>
													<c:otherwise>
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="Nội dung trả về chưa đúng!" />
													</c:otherwise>
												</c:choose>
												<br/>
												<strong>Ví dụ đúng:</strong><br/>
												{"status":1, "sms":"Xin chao ban", "type":"text"}
							                </div>
							             	</div>
										</c:if>
										</form:form>
									</div>
								</form>
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
