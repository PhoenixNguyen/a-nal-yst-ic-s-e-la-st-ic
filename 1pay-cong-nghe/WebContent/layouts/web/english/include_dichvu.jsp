<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="w_body">
	<div class="row_sub">
		<%request.setAttribute("catCharging", true);%>
		<jsp:include page="include_dichvu_menu.jsp"></jsp:include>
		
		<div class="right_content">
			<div class="home_srv_title">Quick Connect, Pay Flexible</div>
			<div class="home_srv_img"></div>
			<div class="srv_row">
				<div class="srv_col">
					<a href="#" class="link_srv">SMS Charging</a>
					<div class="srv_des">Provide SMS Payment connectivity for developers and content providers to process charging via SMS.</div>
					<a href="<%=request.getContextPath() %>/dich-vu.html?n=sms" class="btn_khampha">Explore sevice</a>
				</div>
				<div class="srv_col">
					<a href="#" class="link_srv">Card Charging</a>
					<div class="srv_des">Provide telco's prepaid phone-card payment for your product services and applications,... on mobile internet.</div>
					<a href="<%=request.getContextPath() %>/dich-vu.html?n=card" class="btn_khampha">Explore sevice</a>
				</div>
				<div class="srv_col_end">
					<a href="#" class="link_srv">Wap Charging</a>
					<div class="srv_des">Provide online charging on WAP with single click instead of taking your time and effort to send sms to process payment.</div>
					<a href="<%=request.getContextPath() %>/dich-vu.html?n=wap" class="btn_khampha">Explore sevice</a>
				</div>
			</div>
			<div class="home_srv_img_1"></div>
			<div class="srv_row">
				<div class="srv_col">
					<a href="#" class="link_srv">In-App Charging</a>
					<div class="srv_des" style="height:120px; padding-bottom:0px;">In-App Charging is the special payment method through SMS applied for Games and Application products with high commission from network operators (60-65%).</div>
					<a href="<%=request.getContextPath() %>/dich-vu.html?n=iac" class="btn_khampha">Explore sevice</a>
				</div>
				<div class="srv_col">
					<a href="#" class="link_srv">Direct Charging</a>
					<div class="srv_des" style="height:120px; padding-bottom:0px;">Provide direct payment service with single click instead of taking your time and effort to send sms to process payment can make the scenario of a user charge cycles..</div>
					<a href="#" class="btn_sapramat">Coming Soon</a>
				</div>
				<div class="srv_col_end">
					<a href="#" class="link_srv">Sub Charging</a>
					<div class="srv_des" style="height:120px; padding-bottom:0px;">Procide payment method in which individuals and enterprises selling products, services, and applications can process payment due to periods (monthly, weekly, daily).</div>
					<a href="#" class="btn_sapramat">Coming Soon</a>
				</div>
				
			</div>
		</div>
	</div>
</div>