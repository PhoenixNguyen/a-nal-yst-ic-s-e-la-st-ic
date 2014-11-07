<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>
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
			<a href="${homeServer}">
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
				<li><a href="${homeServer}/dich-vu.html?n=sms"> SMS Charging </a></li>
				<li><a href="${homeServer}/dich-vu.html?n=card"> Card Charging </a></li>
				<li><a href="${homeServer}/dich-vu.html?n=wap"> Wap Charging </a></li>
				<li><a href="${homeServer}/dich-vu.html?n=iac"> In-App Charging </a></li>
			</ul>
		</li>
		
		<li class="classic-menu-dropdown  ${menuNhaPhatTrien ? 'active' : '' }">
			<a data-hover="dropdown" data-close-others="true" href="<%=request.getContextPath() %>/">
				Nhà phát triển
				<c:if test="${menuNhaPhatTrien}"> 
					<span class="selected"></span>
				</c:if>
			</a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath()%>/gioi-thieu"> Tài liệu </a></li>
				<li><a href="<%=request.getContextPath()%>/support"> Trợ giúp </a></li>
				<c:if test="${model.isDevManager}">
				<li><a href="<%=request.getContextPath()%>/dev/file-manager.dev"> Quản lý files </a></li>
				</c:if>
			</ul>
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
				<li><a href="http://forum.1pay.vn"> Diễn đàn </a></li>
				<li><a href="http://facebook.com/1pay.vn"> Facebook </a></li>
				<li><a href="javascript:;"> Twitter</a></li>
				<li><a href="javascript:;"> Google+ </a></li>
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
				<li><a href="${homeServer}/news/category.html"> Tin hoạt động </a></li>
				<li><a href="${homeServer}/news/category.html"> Sự kiện </a></li>
				<li><a href="${homeServer}/news/category.html"> Bản tin ngành nội dung số </a></li>
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
				<li><a href="http://help.1pay.vn"> Help center </a></li>
				<li><a href="${homeServer}/dieu-khoan.html"> Điều khoản sử dụng </a></li>
				<li><a href="${homeServer}/chinh-sach-thanh-toan.html"> Chính sách thanh toán </a></li>
				<li><a href="${homeServer}/ban-quyen.html"> Bản quyển </a></li>
				<li><a href="${homeServer}/lien-he.html"> Liên hệ </a></li>
			</ul>
		</li>
	</ul>
</div>
<!-- END HORIZANTAL MENU -->