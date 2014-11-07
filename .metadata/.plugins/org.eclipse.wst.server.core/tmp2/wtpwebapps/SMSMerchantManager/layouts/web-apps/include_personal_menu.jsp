<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="#" class="tool_normal">Công cụ</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/protected/tra-cuu.html" class="${cardReport?'slc_link':''}">Tra cứu</a></li>
				<li><a href="<%=request.getContextPath()%>/protected/dashboard.html" class="${cardSummary?'slc_link':''}">Thống kê</a></li>
			</ul>
		</li>
	</ul>
</div>