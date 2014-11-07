<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="http://dev.1pay.vn" class="dev_normal">Nhà phát triển</a>
			<ul>
				<li><a href="http://dev.1pay.vn/sdk" class="${developer_tools?'slc_link':''}">Công cụ</a></li>
				<li><a href="http://dev.1pay.vn/mo-hinh-ket-noi" class="${developer_apis?'slc_link':''}">Tài liệu & APIs </a></li>
				<%-- <li><a href="<%=request.getContextPath()%>/nha-phat-trien/huong-dan.html" class="${developer_guide?'slc_link':''}">Hướng dẫn</a></li> --%>
			</ul>
		</li>
	</ul>

	<ul class="sub_cat">
		 <li><a href="#" class="other_link">Blog dịch vụ</a></li>
         <li><a href="http://forum.1pay.vn" class="other_link">Diễn đàn</a></li>
	</ul>
</div>