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
						<%request.setAttribute("cardReport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Báo cáo đối soát</h1>
								<h3 class="filter_label open"><a href="#">Lọc kết quả</a></h3>
								<form id="billingReport" action="billing-report.html" method="post">
								<div class="box_locketqua">
									<div class="dash_row">
									<!-- 
									<div class="other_filter">
										<select class="dashboard_filter" id="charging" name="charging" style="float: left;">
											<option value="" ${(param.charging == null || param.charging=='')?'selected="selected"':''}>Loại thanh toán</option>
											<c:forEach var="charging" items="${model.chargings}">
												<option ${param.charging == charging.key?'selected="selected"':''} value="${charging.key}"><c:out value="${charging.value}" /></option>
											</c:forEach>
										</select> 
									</div>
										<script type="text/javascript">
											$(document).ready(function() {
												$("#charging").change(function(){
													$('.chck_svr').prop('checked',false);
													$("#billingReport").submit();
													return false;
												});
											});
										</script>
									 -->
									<c:if test="${model.isAdmin}">
									<div class="other_filter">
										<select class="dashboard_filter" id="merchant" name="merchant" style="float: left;">
											<option value="" ${(param.merchant == null || param.merchant=='')?'selected="selected"':''}>Merchants</option>
											<c:forEach var="mer" items="${model.merchants}">
												<option ${param.merchant == mer?'selected="selected"':''} value="${mer}"><c:out value="${mer}" /></option>
											</c:forEach>
										</select> 
										<!-- 
										<input type="submit" value="Run" name="btnSubmit" class="btn_greensmall" style="height: 100%;margin: 0;width: 50px;margin-left: 5px;" />
										 -->
									</div>
										<script type="text/javascript">
											$(document).ready(function() {
												$("#merchant").change(function(){
													$('.chck_svr').prop('checked',false);
													$("#billingReport").submit();
													return false;
												});
											});
										</script>
									</c:if>
									<div class="input-prepend">
										<span class="add-on">Chọn ngày:</span><input type="text"
															name="reservation" id="reservation" class="txt_calendar"
															value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}" />
									</div>
									<script type="text/javascript">
										$(document).ready(function() {
											$('#reservation').daterangepicker({
												format : 'dd/MM/yyyy',
												ranges: {
												'Hôm nay': ['today', 'today'],
												'Hôm qua': ['yesterday', 'yesterday'],
												'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
												'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
												'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
												'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
												}
											},
											function(start, end) {
												val = start.toString('MM/dd/yyyy') + ' - ' + end.toString('MM/dd/yyyy');
												$("#form_daterange").val(val);
												$("#billingReport").submit();
											});
										});
									</script>
									<c:if test="${model.chargings != null && fn:length(model.chargings)>1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="chargChkAll" name="chargChkAll" value="chargChkAll" /> Charging
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#chargChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allChargs" value="," />
														<c:forEach var="charg" items="${paramValues.charging}">
															<c:set var="allChargs" value="${allChargs}${charg}," />
														</c:forEach>
														<c:forEach var="charging" items="${model.chargings}">
															<c:set var="charging2" value=",${charging.key}," />
															<input type="checkbox" name="charging" class="chck_filter" value="${charging.key}" 
																				title="${charging.key}" 
																				${fn:contains(allChargs, charging2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${charging.value}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											</c:if>
										 <div class="filter_row">	
											<input type="submit" value="Lọc kết quả" name="btnSubmit" class="btn_greensmall" />
										</div>
								</div>
								</div>
								</form>
								
               				<div class="srv_row">
								<script>var rownum = 1;</script>
								<display:table name="model.list" id="list" 
												requestURI="-report.html" 
												pagesize="${model.pagesize}" partialList="true" size="model.total"
												style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
												sort="list">
									<%@ include file="display_table.jsp" %>
									<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
											<c:out value="${model.offset + list_rowNum }" />
								    </display:column>
								    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
								    <display:column title="Charging" headerClass="transhead" class="transdata" property="chargingService" style="border: 1px solid #CCC;" />
								    <display:column title="Telco" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
								    	<c:out value="${onepay:getOperatorName(list.telco)}"></c:out>
								    </display:column>
								    <display:column title="Giao dịch" headerClass="transhead" class="transdata" property="totalSuccess" style="border: 1px solid #CCC;text-align:right;" />
								    <display:column title="Số tiền" headerClass="transhead" class="transdata" property="totalRevenue" style="border: 1px solid #CCC;text-align:right;" format="{0,number,0,000} đ" />
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
