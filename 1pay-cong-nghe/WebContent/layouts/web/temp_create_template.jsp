<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<script type="text/javascript">
	bkLib.onDomLoaded(function() { new nicEditor().panelInstance('business_info'); });
</script>
<style>
.ui-multiselect-menu {z-index:999999;}
</style>
</head>
<body>
<!--   Insert Template  --> 
<h1 class="srv_title" align="center">Thêm Template</h1>
<div class="newemailtemp" style="padding: 2px;" >
<form name="insertemailtempForm" method="post" action="temp_mng.html">
	<input type="hidden" name="action" value="insertemailtemp" />
	<table align="center" >
    	<tr>
			<td style="text-align:right;padding-right: 5px"><strong>Tên template</strong></td>
		   	<td><input type="text" name="insert_template" class="dashboard_filter" /></td>
		</tr>
		<tr>
    		<td style="text-align:right;padding-right: 5px"><strong>Chủ đề</strong></td>
	    	<td>
		    	<select class="dashboard_filter" name="insert_subject">
					<c:forEach items="${model.allsubject}" var ="subject">
						<option value="${subject}"}>${subject}</option>
					</c:forEach>
			    </select>
	    	</td>
	    </tr>
		<tr>
    		<td style="text-align:right;padding-right: 5px"><strong>Trạng thái</strong></td>
	    	<td>
		    	<select class="dashboard_filter" name="insert_status">
			        <option value="draft" >		Chưa duyệt	</option>
			        <option value="approved" >	Đã duyệt	</option>
			        <option value="public" >	Công bố		</option>
			    </select>
	    	</td>
	    </tr>
	</table>
	<table align="center">
	 	<tr>
	 		<td>
				<input type="submit" class="btn_greensmall" name="submitBtn" value="Thêm Template" />
				<input type="reset" class="btn_graysmall modal_close" name="reset" value="Bỏ qua" />
			</td>
		</tr>
	</table>
</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.newemailtemp form[name=insertemailtempForm]').submit(function(){
				$.post($(this).attr('action'), $(this).serialize(), function(json) {alert(json);
				window.location = document.URL;
				}, 'text');
			return false;
		});
	});
</script>
</body>
</html>
