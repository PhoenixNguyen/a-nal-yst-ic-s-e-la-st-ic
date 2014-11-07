<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<script>
	var url = "<%=request.getContextPath()%>/lucky.html?t=${model.type}&u=${model.lucky_merchant}&c=${model.lucky_gift_code}";
	//5000 is the number of milliseconds (or 5 seconds) that you want to wait before redirection.
	var delay = 5000;
	setTimeout(function() {
	window.location.href = url;
	}, delay);
</script>   
</head>

<body>
<!-- 1PAY WEB -->
<div id=""wrapper>
	<!-- Web Top -->
	<div id="w_top">
    	<div class="layout_1000">
        	<!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>
        	<!-- / Header -->
            <!-- Body -->
          	<div id="w_body">
				<center>
					<c:choose>
						<c:when test="${fn:contains(model.type, 'card')==true}">
							<img alt="" src="<%=request.getContextPath()%>/images/lucky_draw_card.gif" border="0"/>					
						</c:when>
						<c:otherwise>
							<img alt="" src="<%=request.getContextPath()%>/images/lucky_draw.gif" border="0"/>
						</c:otherwise>
					</c:choose>
				</center>    
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
</body>
</html>