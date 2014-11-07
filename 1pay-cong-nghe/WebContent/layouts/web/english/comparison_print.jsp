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
</head>
<body>
	<a href="javascript:window.print()" class="print_link"><span>Click to Print This Page</span></a>
	<div>
		<c:choose>
			<c:when test="${model.comparison.contract_type == 'A_B2B' }">
				<jsp:include page="include_comparison_a_b2b_detail.jsp" />
			</c:when>
			<c:when test="${model.comparison.contract_type == 'A_B2C' }">
				<jsp:include page="include_comparison_a_b2c_detail.jsp" />
			</c:when>
			<c:when test="${model.comparison.contract_type == 'B1_B2B' }">
				<jsp:include page="include_comparison_b1_b2b_detail.jsp" />
			</c:when>
			<c:when test="${model.comparison.contract_type == 'B1_B2C' }">
				<jsp:include page="include_comparison_b1_b2c_detail.jsp" />
			</c:when>
			<c:when test="${model.comparison.contract_type == 'B2_CN' }">
				<jsp:include page="include_comparison_b2_cn_detail.jsp" />
			</c:when>
			<c:when test="${model.comparison.contract_type == 'C_CN' }">
				<jsp:include page="include_comparison_c_cn_detail.jsp" />
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
