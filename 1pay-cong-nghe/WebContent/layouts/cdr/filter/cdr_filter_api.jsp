<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%-- <jsp:include page="head.jsp"></jsp:include> --%>
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/personal.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.multiselect.js"></script>
<style>
.filter_row fieldset {
	border: solid 1px #ccc;
	width: 95%;
}

.filter_row .product_slc_filter {
	width: 100%;
}

#sms_command_code_merchant {
	width: 680px;
	display: none;
	background: #FFF;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.7);
	-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.7);
	-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.7);
	padding: 20px
}

#top_sms_cdr table {
	width: 49%;
	cellspacing: 0;
	cellpadding: 0;
	border: 1px solid #CCC;
	table-layout: fixed;
	float: left;
}

#top_sms_cdr table tr:hover {
	background-color: #eee
}
</style>
</head>
<body>
	<div class="srv_row">
		<c:if test="${model.total>0 }">
			<div>
				<span class="pagebanner" style="float: left;"> ${model.total}
					kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới
					${(model.offset + model.pagesize) > model.total ? model.total :
					(model.offset + model.pagesize) }. </span>
			</div>
		</c:if>
		<display:table name="model.list" id="list"
			requestURI="cdr-filter-api.cdr" pagesize="${model.pagesize}"
			partialList="true" size="model.total"
			style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;"
			sort="list">
			<%@ include file="display_table.jsp"%>
			<display:column title="STT" headerClass="transhead fit_to_content"
				class="transdata" style="text-align:right;border: 1px solid #CCC;">
				<c:out value="${model.offset + list_rowNum }" />
			</display:column>

			<display:column property="msisdn" title="MSISDN" headerClass="transhead"
				class="svr_data1" style="border: 1px solid #CCC;" />
			<display:column property="merchant" title="Merchant" headerClass="transhead"
				class="svr_data1" style="border: 1px solid #CCC;" />
			<display:column title="Sản phẩm" headerClass="transhead"
				class="svr_data1" style="border: 1px solid #CCC;">
				<a target="_blank" href="<%=request.getContextPath()%>/console/details.wss?code=${list.contentService }"><strong><c:out value="${onepay:getContentName(list.contentService, pageContext.request) }"/></strong></a>				
			</display:column>
			<display:column property="paymentProvider" title="Provider" headerClass="transhead"
				class="svr_data1" style="border: 1px solid #CCC;text-align:center;" />
			<display:column property="serviceNumber" title="Short Code" headerClass="transhead"
				class="svr_data1" style="border: 1px solid #CCC;text-align:center;" />
			<display:column property="commandCode" title="CMD" headerClass="transhead" class="svr_data1"
				style="border: 1px solid #CCC;font-weight:bold;text-transform: uppercase;" />
			<display:column property="chargingTime" title="Charging Time" sortable="true"
				headerClass="transhead" class="transdata"
				format="{0,date,yyyy-MM-dd HH:mm:ss}"
				style="border: 1px solid #CCC;text-align:center;" />
		</display:table>
	</div>
</body>
</html>