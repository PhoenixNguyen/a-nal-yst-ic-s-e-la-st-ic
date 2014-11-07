<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=no;" />
<head>
<title>1Pay.vn - Quick Connect, Pay Flexible | Quick Connect, Pay Flexible</title>
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon">

<link href="<%=request.getContextPath()%>/css/daterangepicker.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath()%>/css/home_slider.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div id="body">
		<div class="alert alert-i">
			Bạn đang dùng <strong>${model.browser}</strong>
		</div>
		<c:if test="${model.result==true}">
			<div class="alert_down_noti">
				Tải file tương ứng cho điện thoại của bạn:
			</div>
			<c:if test="${not empty model.info.path_wk_jar}">
			<div class="alert_down">
				<img src="<%= request.getContextPath()%>/images/app_java.png" border="0" />
				<a id="price" href="${model.baseUrl}/${model.workingfile}${model.info.path_wk_jar}" class="tab_slc"><span>${model.info.name_wk_jad}</span></a>,
				<a id="price" href="${model.baseUrl}/${model.workingfile}${model.info.path_wk_jad}" class="tab_slc"><span>${model.info.name_wk_jad}</span></a>
				 - <i>${model.info.size_java} MB</i><br>
				 <i>Dành cho các máy:</i> <br>
				 - <b>Hỗ trợ JAVA</b>
			</div>
			</c:if>
			<c:if test="${not empty model.info.path_wk_apk}">
			<div class="alert_down">
				<img src="<%= request.getContextPath()%>/images/app_android.png" border="0" />
				<a id="price" href="${model.baseUrl}${model.workingfile}/${model.info.path_wk_apk}" class="tab_slc"><span>${model.info.name_wk_apk}</span></a>
				 - <i>${model.info.size_android} MB</i><br>
				 <i>Dành cho các máy:</i> <br>
				 - <b>Hỗ trợ ANDROID</b>
			</div>
			</c:if>
		</c:if>
		<c:if test="${model.result==false}">
			<div class="alert_down_info">
				${model.info}
			</div>
		</c:if>
	</div>
</body>
</html>