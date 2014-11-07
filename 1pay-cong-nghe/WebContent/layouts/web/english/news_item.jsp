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
								<c:if test="${model.article!= null }">
									<div class="srv_row">
										<div class="product_dt_title">
											<h1><c:out value="${model.article.title}" /></h1>
										</div>
										<div class="product_dt_type">
											<span><c:out value="${onepay:date(model.article.timestamp) }"/></span>
											<c:set var="inewsShareLinkEncode" value="https://1pay.vn/news/item.html?i=${model.article.articleId }"/>
											<c:set var="fbLink" value="http://www.facebook.com/sharer.php?u=${onepay:urlEncode(inewsShareLinkEncode)}&src=sp" />
									       <a target="_blank" title="Chia sẻ Facebook" name="fb_share" href="${ fbLink}">
									      		<img src="<%=request.getContextPath()%>/images/icon_fb.png" /> 
									      	</a>
										</div>
										<div class="product_dt_des">
											<c:out value="${model.article.body}" escapeXml="false" />
										</div>
										<br />
									</div>
								</c:if>
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
