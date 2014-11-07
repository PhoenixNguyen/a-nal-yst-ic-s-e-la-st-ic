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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css" />
<script src="<%=request.getContextPath()%>/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 <script type="text/javascript">
   google.load("visualization", "1", {packages:["corechart"]});
   google.setOnLoadCallback(drawChart);
   function drawChart() {
     var data = google.visualization.arrayToDataTable([
		[
				<c:forEach var="axis" items="${model.chartAxis}">
					'<c:out value="${axis}"/>',	 	
				</c:forEach>
		],
		<c:forEach var="row" items = "${model.charts}">
		[
				<c:forEach var="item" items="${row}" varStatus="status">
				  <c:if test="${status.first}">'</c:if>
					<c:out value="${item}"/>
					<c:if test="${status.first}">'</c:if>
					,	 	
				</c:forEach>
		],
		</c:forEach>
     ]);

     var options = {
       title: 'Daily Chart'
     };

     var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
     chart.draw(data, options);
   }
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
						<%request.setAttribute("cardChartByHour", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Phân tích thông minh</h1>
							<form action="<%=request.getContextPath() %>/protected/card-chart-by-hour.html" method="post">
								<div>
									<div id="dash_tab">
											<a id="cont" href="#" class="tab_slc"><span>Card Charging</span></a> 
											<a id="telco" href="#" class="tab"><span>SMS Charging</span></a> 
											<a id="price" href="#" class="tab"><span>WAP Charging</span></a>
											<div class="clear"></div>
									</div>
									<div id="filter_locketqua">
										<h3 class="filter_label close box_locketqua_hide"><a href="#">Lọc kết quả</a></h3>
										<!-- .widget-header -->
										<div class="box_locketqua">
											<!-- .field-group -->
											<c:if test="${model.providers != null && fn:length(model.providers)>1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="prvChkAll" name="prvChkAll" value="prvChkAll" /> Payment Provider
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#prvChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.provider}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<c:forEach var="provider" items="${model.providers}">
															<c:set var="provider2" value=",${provider}," />
															<input type="checkbox" name="provider" class="chck_filter" value="${provider}" 
																				title="${provider}" 
																				${fn:contains(allPrs, provider2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${provider}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											</c:if>
											<!-- .field-group -->
											<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="mcChkAll" name="mcChkAll" value="mcChkAll" /> Merchant
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#mcChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.merchant}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<c:forEach var="merchant" items="${model.merchants}">
															<c:set var="merchant2" value=",${merchant}," />
															<input type="checkbox" name="merchant" class="chck_filter" value="${merchant}" 
																				title="${merchant}" 
																				${fn:contains(allPrs, merchant2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${merchant}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											</c:if>
											<!-- .field-group -->
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="ctChkAll" name="ctChkAll" value="ctChkAll" /> Card Type
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#ctChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.type}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<c:forEach var="type" items="${model.types}">
															<c:set var="type2" value=",${type}," />
															<input type="checkbox" name="type" class="chck_filter" value="${type}" 
																				title="${type}" 
																				${fn:contains(allPrs, type2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${type}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											<!-- .field-group -->
											
											<!-- .field-group -->
											<div class="field-group">
												<label for="inv_defaultchannel" class="label">Date Range</label>&nbsp;&nbsp;&nbsp;
												<a href="#" class="btn_add_date">Thêm ngày</a> | <a href="#" class="btn_remove_date">Xóa ngày cuối</a>
												<div class="field">
													<!-- <input type="text" value="01/05/2013" name="reportDate" id="reportDate" size="10" />
													<input type="text" value="05/05/2013" name="reportDate" id="reportDate" size="10" /> -->
													<c:choose>
														<c:when test="${model.strDates != null && fn:length(model.strDates)>0}">
															<c:forEach var="strDate" items="${model.strDates}">
																<input type="text" value="${strDate}" name="reportDate" class="reportDate" size="10" />
															</c:forEach>
														</c:when>
														<c:otherwise>
															<input type="text" value="" name="reportDate" class="reportDate" size="10" />
															<input type="text" value="" name="reportDate" class="reportDate" size="10" /> 
														</c:otherwise>
													</c:choose>
													<!-- class="dateselection hasDatepicker" --> 
												</div>
												<script type="text/javascript">
													$(document).ready(function() {
													    $( ".reportDate" ).datepicker({
													    	dateFormat : 'dd/mm/yy'
													    });
													    /* if($( "#startDate" ).val() == '') {
													    	var now = new Date();
													    	$( "#startDate" ).datepicker('setDate', new Date(now.setDate(now.getDate() - now.getDay() + 1)));
													    } */
												    	var i = 0;
													    $( ".reportDate" ).each(function() {
													    	var now = new Date();
												    		if($( this ).val() == '') {
														    	$( this ).datepicker('setDate', new Date(now.setDate(now.getDate() - i)));
														    	i++;
														    }
												    	});
													    
													    $('.btn_add_date').click(function() {
													    	$(this).parent().find('.field').append('<input type="text" value="" name="reportDate" class="reportDate" size="10" />');
													    	$( ".reportDate" ).datepicker({
														    	dateFormat : 'dd/mm/yy'
														    });
													    	$( ".reportDate" ).each(function() {
													    		if($( this ).val() == '') {
															    	$( this ).datepicker('setDate', new Date());
															    }
													    	});
													    	return false;
													    });
													    
													    $('.btn_remove_date').click(function() {
													    	if($(this).parent().find('.field input').length<=2) {
													    		alert('Không thể xóa tiếp');
													    		return false;
													    	}
													    	$(this).parent().find('.field input:last').remove();
													    	return false;
													    });
													});
												</script>
											<!-- .field-group -->
											</div>
											<div class="filter_row">
												<input class="btn_greensmall" type="submit" name="submit" value="Vẽ biểu đồ" />
											</div>
											<!-- .actions -->
										<!-- .widget-content -->
									</div>
									<c:choose>
										<c:when test="${param.submit==null || fn:length(param.submit) == 0 }">
										<script type="text/javascript">
											$(document).ready(function() {
												$('#filter_locketqua').find('.field').each(function() {
													$(this).find('input[type=checkbox]').prop('checked', true);
												});
											});
										</script>
										</c:when>
										<c:otherwise>
											<c:if test="${param.prvChkAll == 'prvChkAll' }">
											<script type="text/javascript">
											$(document).ready(function() {
												$('#prvChkAll').attr('checked', 'checked');
											});
											</script>									
											</c:if>
											<c:if test="${param.mcChkAll == 'mcChkAll' }">
											<script type="text/javascript">
											$(document).ready(function() {
												$('#mcChkAll').attr('checked', 'checked');
											});
											</script>									
											</c:if>
											<c:if test="${param.ctChkAll == 'ctChkAll' }">
											<script type="text/javascript">
											$(document).ready(function() {
												$('#ctChkAll').attr('checked', 'checked');
											});
											</script>									
											</c:if>
										</c:otherwise>
									</c:choose>
								</div>
							<!--
							<div>
								[
										<c:forEach var="axis" items="${model.chartAxis}">
											'<c:out value="${axis}"/>',	 	
										</c:forEach>
								],
								<c:forEach var="row" items = "${model.charts}">
								[
										<c:forEach var="item" items="${row}" varStatus="status">
										  <c:if test="${status.first}">'</c:if>
											<c:out value="${item}"/>
											<c:if test="${status.first}">'</c:if>
											,	 	
										</c:forEach>
								],
								</c:forEach>
							</div>
							-->
								<div id="chart_div" style="width: 800px; height: 400px;"></div>
							</div>
						</form>
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