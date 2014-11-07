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
<script>
function fill_Cities() {
    var textb = $('#product').val();
    var current_access_key = $('#access_key').val();
    var hd_ma_nhung = $('#hd_ma_nhung').html();
    hd_ma_nhung = hd_ma_nhung.replace(current_access_key, textb);
    if('' != textb)
    {
    	$("#ma_nhung").val(hd_ma_nhung);
    	$("#demo_manhung").html(hd_ma_nhung);
    	$('#hd_ma_nhung').html(hd_ma_nhung);
	}  
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
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_menu.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("sandBox", true);%>
						
						<div class="right_content">
							<h1 class="srv_title">Create embed (Card) Recharge.</h1>
							<div>
									<div id="dash_tab">
											<a id="cont" href="" class="tab_slc"><span>Card Topup</span></a> 
											<div class="clear"></div>
									</div>
									<div id="filter_locketqua">
										<!-- .widget-header -->
										<form:form name="cardToupForm" commandName="cardToupForm" method="post">
										<div>
											<div class="filter_row">
												<c:if test="${ cardToupForm.ma_nhung!=null && cardToupForm.ma_nhung!=''}">
								                 	<span class="add-on">Product:</span>
								                 	<form:select path="product" onchange=" fill_Cities();">
														<!-- <form:option value="-1" label="Năm sinh"/> -->
														<c:forEach items="${products}" var="product" varStatus="stat">
														     <form:option value="${product.access_key}" label="${product.title}"/>
														</c:forEach>
												 	</form:select>
											 	</c:if>
											 	<c:if test="${ cardToupForm.ma_nhung==null || cardToupForm.ma_nhung==''}">
											 		Your product has not been created or not activated
											 	</c:if>
											 	<input type="hidden" name="merchantApiDeposit" id="merchantApiDeposit" value="${merchantApiDeposit}">
							                 </div>
										</div>
										<!-- .widget-content -->
										<c:if test="${ cardToupForm.ma_nhung!=null && cardToupForm.ma_nhung!=''}">
											<h3>Embed code:</h3>
											<div>
												<div class="filter_row">
													<form:textarea path="ma_nhung" rows="3" cols="80"/>
								                </div>
							             	</div>
										</c:if>
										</form:form>
										
										<!-- Demo ma nhung -->
										<c:if test="${ cardToupForm.ma_nhung!=null && cardToupForm.ma_nhung!=''}">
										<h3>Demo embed (Card) Recharge:</h3>
											<div style="margin: 0 auto;" id="demo_manhung">
												${manhung}
							             	</div>
							            </c:if>
							            <!-- /Demo ma nhung -->
							            <div id="hd_ma_nhung" style="display:none">${manhung}</div>
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
