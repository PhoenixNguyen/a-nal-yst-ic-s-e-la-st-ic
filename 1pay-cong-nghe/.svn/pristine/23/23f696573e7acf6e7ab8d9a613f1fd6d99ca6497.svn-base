<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="head.jsp"></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
	<script type="text/javascript">
		bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
	</script>
</head>

<body>
<!-- 1PAY WEB -->
<div id=""wrapper>
	<!-- Web Top -->
	<div id="w_top">
    	<div class="layout_1000">
        	<!-- Header -->
        	<%request.setAttribute("menuNhaPhatTrien",true); %>
            <jsp:include page="header.jsp"></jsp:include>
        	<!-- / Header -->
            
            <!-- Body -->
            <div id="w_body">
            	<div class="row_sub">
              		<div>
						<form:form name="article" commandName="article" method="post">
							<div><form:errors path="*" cssStyle="color:#f00;" /></div>
							<div class="form_row">
								<form:select path="category">
								   <form:option value="NONE" label="--- Select ---"/>
								   <form:options items="${categories}" />
								</form:select>
							</div>
							<div class="form_row">
								<form:input path="title" cssClass="txt_reglog" title="Tiêu đề" placeholder="Tiêu đề" onfocus="clear(this)" />
							</div>
							<div class="form_row">
								<form:textarea path ="content" name="txtContent" style="width: 600px; height: 400px;" />
							</div>
							<div class="form_row">
								<form:checkbox path="is_published" /> Published?
							</div>
							<div class="form_row">
								<input value="Cập nhật" class="btn_send" type="submit" />
							</div>
						</form:form>
						</div>
		                </div>
               		 </div>
            	</div>
            
            
            <!-- / Body -->
        	</div>
    </div>
	<!-- / Web Top -->
    
	<!-- Web Foot -->    
    <div id="w_foot">
    	<!-- Foot Menu -->
    	<jsp:include page="footer.jsp"></jsp:include>
		<!-- / Web Foot -->
</div>
<!-- / 1PAY WEB --><script>
$( "#accordion" ).accordion();
</script>
<script type="text/javascript">
/*<![CDATA[*/
jQuery(function($) {

$(function(){
	$('#hot_productslides').slides({
		preload: true,
		preloadImage: 'images/loading.gif',
		play: 5000,
		pause: 2500,
		hoverPause: true
	});
});

});
/*]]>*/
</script>
<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,250,false,false,false,false,false);</script>
</body>
</html>