<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<center>
	<h1>TRA CỨU COMMAND CODE</h1>
	</center>
	<script>var rownum = 1;</script>
	<display:table name="model.list" id="list" 
					requestURI="export-sms-config.wss" 
					pagesize="${model.pagesize}" partialList="true" size="model.total"
					style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
					sort="list" export="true">
		<%@ include file="display_table.jsp" %>
		<display:column title="STT" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
				<c:out value="${model.offset + list_rowNum }" />
	    </display:column>
	    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
	    <display:column title="Product" headerClass="transhead" class="transdata" property="productName" style="border: 1px solid #CCC;" />
	    <display:column title="CommandCode" headerClass="transhead" class="transdata" property="commandCode" style="border: 1px solid #CCC;" />
	    <display:column title="ShortCode" headerClass="transhead" class="transdata" property="shortCode" style="border: 1px solid #CCC;" />
	    <display:column title="Category" headerClass="transhead" class="transdata" property="category" style="border: 1px solid #CCC;" />
	    <display:column title="MT" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
	    	1
	    </display:column>
	    <display:column title="Description" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
	    	MO: <c:out value="${list.mo }"/>. MT Trả về: <c:out value="${list.mt }"></c:out>
	    </display:column>
	    <display:column title="Provider" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
	    	MWORK
	    </display:column>
	    <display:column title="Submited Date" headerClass="transhead" class="transdata" property="submitedTime" format="{0,date,hh:mm:ss dd-MM-yyyy}" style="border: 1px solid #CCC;"/>
	    <display:column title="Approved Date" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" />
	    <display:column title="Modified Date" headerClass="transhead" class="transdata" property="submitedTime" format="{0,date,hh:mm:ss dd-MM-yyyy}" style="border: 1px solid #CCC;" />
	    <display:column title="Comment" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" />
	    <display:column title="Status (Not Approved = 0; Approved = 1; Reject = 2)" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >0</display:column>
	    <display:setProperty name="export.excel.filename" value="sms.xls"/>
	</display:table>
</body>
</html>