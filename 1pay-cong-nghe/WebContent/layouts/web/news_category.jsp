<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
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
				<%request.setAttribute("menuTinTuc", true); %>
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<%request.setAttribute("intro_1pay_recruitment", true); %>							
						<jsp:include page="include_news_menu.jsp" />
						
						<div class="right_content">
							<div class="subpage_content">
								<c:forEach var ="article" items="${model.articles }">
									<div class="srv_row">
										<div class="product_thumb">
											<img src="${article.image }"
												width="150" height="150" style="border-radius: 15px;-moz-border-radius:15px;-webkit-border-radius:15px;"
												border="0" /> 
										</div>
		
										<div class="product_dt_title">
											<span><a style="font-size: 20px;" href ="<%= request.getContextPath()%>/news/item.html?i=${article.articleId}"><c:out value="${article.title}" /></a></span>
										</div>
										<div class="product_dt_type">
											<span><c:out value="${onepay:date(article.timestamp) }"/></span>
										</div>
										<c:if test="${model.category==null }">
										<div class="product_dt_type">
											<a href ="<%= request.getContextPath()%>/news/category.html?cid=${article.category.categoryId}"><strong><c:out value="${article.category.title}" /></strong></a>
										</div>
										</c:if>
										<div class="product_dt_des">
											<c:out value="${article.description}" />
										</div>
										<br />
									</div>
								</c:forEach>
								<span class="pagebanner"></span>
								<span class="pagelinks">
									<c:if test="${model.prev!=null }">
									<a class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;" href="<%=request.getContextPath() %>/news/category.html?cid=${model.category.categoryId }&amp;p=${model.prev}">< Trước</a>
									</c:if>
									<c:if test="${model.prev!=null && model.next!=null }">
									 |
									 </c:if>
									 <c:if test="${model.next!=null }">
									<a class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;" href="<%=request.getContextPath() %>/news/category.html?cid=${model.category.categoryId }&amp;p=${model.next}">Tiếp ></a>
									</c:if>
								</span>
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
