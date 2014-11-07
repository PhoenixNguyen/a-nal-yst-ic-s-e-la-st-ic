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
<!--   Insert Subject  --> 
<h1 class="srv_title" align="center">Thêm chủ đề</h1>
<div class="newsubject" style="padding: 2px;" >
<form name="insertsubjectForm" method="post" action="temp_mng.html">
	<input type="hidden" name="action" value="insertsubject" />
	<table align="center" >
    	<tr>
			<td style="text-align:right;padding-right: 5px"><strong>Chủ đề</strong></td>
		   	<td><input type="text" name="insert_subject" class="dashboard_filter" /></td>
		</tr>
    	<tr>
			<td style="text-align:right;padding-right: 5px"><strong>Mô tả</strong></td>
		   	<td>
		   	    <textarea id="business_info" class="dashboard_filter" cols='10' rows='5' name="insert_description">
		   	    </textarea>
		   	</td>
		   	
		</tr>		
	</table>
	<table align="center">
	 	<tr>
	 		<td>
				<input type="submit" class="btn_greensmall" name="submitBtn" value="Thêm chủ đề" />
				<input type="reset" class="btn_graysmall modal_close" name="reset" value="Bỏ qua" />
			</td>
		</tr>
	</table>
</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.newsubject form[name=insertsubjectForm]').submit(function(){
				$.post($(this).attr('action'), $(this).serialize(), function(json) {alert(json);
				window.location = document.URL;
				}, 'text');
			return false;
		});
	});
</script>
</body>
</html>
