<%@page import="org.springframework.ui.ModelMap"%>
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
</head>
<body>
	<div class="box_locketqua">
		<form action="#" method="get" name="filterForm">
			<input type="hidden" name="action" value="filtertemplate" />
								
			<table width="100%">
			    <tr>
				    <td>
				    	<div class="product_slc_filter" style="margin-top: 10px;">
						    <label><strong>Chủ đề</strong></label>
						    <select class="dashboard_filter" name="filtersubject">
						        <option value="" >Tất cả</option>
						        <c:forEach items="${model.allsubject}" var ="subject">
						       		<option value="${subject}" ${param.filtersubject==subject?'selected':''}>${subject}</option>
						   		</c:forEach>
						    </select>												    
			            </div>
		            </td>
	            </tr> 
			</table> 
			
			<div class="clear"></div>
			<div class="filter_row">
				<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submitBtn" />
			</div>
		</form>   
	</div>   
	
	<c:if test="${model.size > 0}">
		<span class="pagebanner"> ${model.size} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pageSize) > model.size ? model.size : (model.offset + model.pageSize) }. </span>
	</c:if>							
</body>
</html>
