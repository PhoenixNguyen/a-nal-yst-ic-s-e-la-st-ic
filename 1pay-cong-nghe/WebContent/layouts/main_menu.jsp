<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>

<!-- BEGIN HORIZANTAL MENU -->
<c:set var="menuTrangChu" value="${menuTrangChu || dashboard }" />
<c:set var="menuDichVu" value="${menuDichVu }" />
<c:set var="menuNhaPhatTrien" value="${menuNhaPhatTrien }" />
<c:set var="menuCongDong" value="${menuCongDong }" />
<c:set var="menuTinTuc" value="${menuTinTuc }" />
<c:set var="menuHoTro" value="${menuHoTro }" />

<div class="hor-menu hidden-sm hidden-xs">
	<ul class="nav navbar-nav">
		<li class="classic-menu-dropdown ${menuTrangChu ? 'active' : '' }">
			<a href="<%=request.getContextPath() %>/trang-chu.html">
				Trang chủ
				<c:if test="${menuTrangChu}"> 
					<span class="selected"></span>
				</c:if>
			</a>
		</li>

		<li class="classic-menu-dropdown ${menuDichVu ? 'active' : '' }">
			<a data-toggle="dropdown" data-hover="dropdown" data-close-others="true" href=""> 
				Dịch vụ 
				<i class="fa fa-angle-down"></i>
				<c:if test="${menuDichVu}"> 
					<span class="selected"></span>
				</c:if>
			</a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=sms"> SMS Charging </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=card"> Card Charging </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=wap"> Wap Charging </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=iac"> In-App Charging </a></li>
			</ul>
		</li>
		
		<li class="classic-menu-dropdown  ${menuNhaPhatTrien ? 'active' : '' }">
			<a href="<%=request.getContextPath() %>/">
				Nhà phát triển
				<c:if test="${menuNhaPhatTrien}"> 
					<span class="selected"></span>
				</c:if>
			</a>
		</li>
		
		<li class="classic-menu-dropdown ${menuCongDong ? 'active' : '' }">
			<a data-toggle="dropdown" data-hover="dropdown" data-close-others="true" href=""> 
				Cộng đồng
				<i class="fa fa-angle-down"></i>
				<c:if test="${menuCongDong}"> 
					<span class="selected"></span>
				</c:if>
			</a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=sms"> Diễn đàn </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=card"> Facebook </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=wap"> Twitter</a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=iac"> Google+ </a></li>
			</ul>
		</li>
		
		<li class="classic-menu-dropdown ${menuTinTuc ? 'active' : '' }">
			<a data-toggle="dropdown" data-hover="dropdown" data-close-others="true" href=""> 
				Tin tức
				<i class="fa fa-angle-down"></i>
				<c:if test="${menuTinTuc}"> 
					<span class="selected"></span>
				</c:if>
			</a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=sms"> Tin hoạt động </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=card"> Sự kiện </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=wap"> Bản tin ngành nội dung số </a></li>
			</ul>
		</li>
		
		<li class="classic-menu-dropdown ${menuHoTro ? 'active' : '' }">
			<a data-toggle="dropdown" data-hover="dropdown" data-close-others="true" href=""> 
				Hỗ trợ
				<i class="fa fa-angle-down"></i>
				<c:if test="${menuHoTro}"> 
					<span class="selected"></span>
				</c:if>
			</a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=sms"> Help center </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=card"> Điều khoản sử dụng </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=wap"> Chính sách thanh toán </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=iac"> Bản quyển </a></li>
				<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=iac"> Liên hệ </a></li>
			</ul>
		</li>
	</ul>
</div>
<!-- END HORIZANTAL MENU -->