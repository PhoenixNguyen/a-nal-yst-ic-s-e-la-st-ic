<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- PIE CHART -->
    <h1 class="srv_title">Biểu đồ thống kê</h1>
    
    <div id="status_type">
        <fieldset class="fieldset_filter" style="width: 46%; float: left;">
            <legend >
                <label style="text-align: left;"><b>Trạng thái</b></label>
            </legend>
            <span class="pie">
                <svg id="status_chart" class="pie_child_inline" ></svg>
            </span>
        </fieldset>
        <fieldset class="fieldset_filter" style="width: 46%;">
            <legend>
                <b>Loại thẻ</b>
            </legend>
            <span class="pie">
                <svg id="type_chart" class="pie_child_inline"></svg>
            </span>
        </fieldset>
    </div>
    <c:if test="${isOperator ||  isBizSupporter || isCustomerCare}">
        <fieldset class="fieldset_filter">
            <legend style="text-align: left;"><b>Nhà cung cấp</b>
            </legend>
            <span class="pie">
                <svg id="provider_chart" class="pie_child"></svg>
            </span>
        </fieldset>
    </c:if>
    
    <c:if test="${model.displayMerchant }">
        <fieldset class="fieldset_filter">
            <legend><b>Merchant</b>
            </legend>
            <span class="pie">
                <svg id="merchant_chart" class="pie_child"></svg>
            </span>
        </fieldset>
    </c:if>
</body>
</html>