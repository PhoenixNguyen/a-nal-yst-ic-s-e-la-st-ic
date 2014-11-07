<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
        	<%request.setAttribute("menuDichVu", true); %>
            <jsp:include page="header.jsp"></jsp:include>
        	<!-- / Header -->
            
            <!-- Body -->
            <c:choose>
				<c:when test="${param.n != null && fn:length(param.n)>0 }">
					<jsp:include page="include_dichvu_${param.n}_charging.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="include_dichvu.jsp" />
				</c:otherwise>
			</c:choose>
            <!-- / Body -->
        </div>
    </div>
	<!-- / Web Top -->
    	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Web Foot -->    
    	<!-- / Web Foot -->
</div>
<!-- / 1PAY WEB -->
<jsp:include page="include_java_script_footer.jsp"></jsp:include>
</body>
</html>