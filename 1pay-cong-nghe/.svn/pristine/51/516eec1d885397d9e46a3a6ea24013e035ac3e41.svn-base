<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="left_cat">
	<ul class="sub_cat">
		<li><a href="#" class="news_normal">Tin tức</a>
			<ul>
			<c:if test="${model.rootCategory!=null }">
				<c:forEach var="category" items="${model.rootCategory.categories }">
					<li>
						<a href="<%=request.getContextPath() %>/news/category.html?cid=${category.categoryId}" class="${(category.categoryId==model.category.categoryId)?'slc_link':''}"">
							<c:out value="${category.title }"/>
						</a>
					</li>
				</c:forEach>
			</c:if>
			</ul>
	</ul>

	<ul class="sub_cat">
		 <li><a href="#" class="other_link">Blog dịch vụ</a></li>
         <li><a href="http://forum.1pay.vn" class="other_link">Diễn đàn</a></li>
	</ul>
</div>