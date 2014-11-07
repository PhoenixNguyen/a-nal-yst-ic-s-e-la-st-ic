<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<%
	request.setAttribute("menuNhaPhatTrien", true);
%>
<c:choose>
	<c:when test="${param.page == 'overview'}">
		<jsp:include page="overview.jsp" />
	</c:when>
	<c:when test="${param.cid == null || fn:length(param.cid) == 0}">
		<jsp:include page="intro.jsp" />
	</c:when>
	<c:otherwise>
		<head>
			<jsp:include page="head.jsp" />
		</head>
		<body class="page-boxed page-header-fixed">
			<jsp:include page="header.jsp" />
			
			<!-- BEGIN CONTAINER -->
			<div class="container">
				<div class="page-container">
					<jsp:include page="sidebar.jsp" />
					
					<!-- BEGIN CONTENT -->
					<div class="page-content-wrapper">
						<div class="page-content">
							<!-- BEGIN PAGE CONTENT-->
							<div class="row">
								<div class="col-md-12">
									<c:choose>
										<c:when test="${param.view == 'api'}">
										</c:when>
										<c:otherwise>
											<jsp:include page="detail.jsp" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<!-- END PAGE CONTENT-->
						</div>
					</div>
					<!-- END CONTENT -->
				</div>
				<!-- END CONTAINER -->
			</div>
			
			<jsp:include page="footer.jsp" />
			
			<jsp:include page="include_popup.jsp" />
		</body>
	</c:otherwise>
</c:choose>
</html>