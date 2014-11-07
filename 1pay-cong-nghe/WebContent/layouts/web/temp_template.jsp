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
				    <td width="36%">
				    	<div class="product_slc_filter" style="margin-top: 10px;">
						    <label class="product_lbl_filter" ><strong>Template</strong></label>
				            <input type="text" name="filtertemplate" class="dashboard_filter" value="${param.searchtemplate}"/>
			            </div>
		            </td>
				    <td width="33%">
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
				     
				    <td>
				    	<div class="product_slc_filter" style="margin-top: 10px;float: right;width:auto;">
					        <label><strong>Trạng thái</strong></label> 
						    <select class="dashboard_filter" name="filterstatus">
						        <option value="" >Tất cả</option>
						        <option value="draft" ${param.filterstatus=='draft'?'selected':''}>Chưa duyệt</option>
						        <option value="approved" ${param.filterstatus=='approved'?'selected':''}>Đã duyệt</option>
						        <option value="public" ${param.filterstatus=='public'?'selected':''}>Công bố</option>
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
<br />
						
						
							<!-- Phân trang -->
							<display:table name="model.EmailTemplates" id="list" 
								requestURI="merchant-provider-allocation.wss" 
								pagesize="${model.pageSize}" partialList="true" size="model.size"
								style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;margin-bottom:10px;border-top:none;text-align:center;"
								sort="list">
								<%@ include file="display_table.jsp" %>
							    <display:column title="Template" headerClass="transhead width200" class="svr_data_name" style="border: 1px solid #CCC;text-align:left;" >
							   		<strong>${list.title}</strong>
							   	</display:column>	
							    <display:column title="Chủ đề" headerClass="transhead" class="svr_data_name" style="border: 1px solid #CCC;" >
							   		${list.subject}
							   	</display:column>
							   	<display:column title="Ngày tạo <br/> <span style='color:#f00;'>Ngày cập nhật</span>" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
							   		<fmt:formatDate value="${list.created_time}" pattern="yyyy-MM-dd HH:mm:ss" /> <br />
							   		<span style="color:#f00;"><fmt:formatDate value="${list.updated_time}" pattern="yyyy-MM-dd HH:mm:ss" /></span>     		
							   	</display:column>
							    <display:column title="Trạng thái" headerClass="transhead width80" class="transdata" style="border: 1px solid #CCC;" >
                                    ${list.status}
							   	</display:column>
							</display:table>

<!-- 							<script type="text/javascript">
								$(document).ready(function(){
									$('.edit_record').live('click', function(){
										var id = $(this).attr('id');
										var name = $(this).attr('name');
										var service_number = $(this).attr('service_number');
										var type = $(this).attr('type');
										var status = $(this).attr('status');
										
										$('#edit_record input[name=e_id]').val(id);
										$('#edit_record input[name=ename]').val(name);
										$('#edit_record input[name=esv_number]').each(function() {
											if($(this).val() == service_number)
												$(this).attr('checked', 'checked');
											else
												$(this).removeAttr('checked');
										});
										$('#edit_record select[name=etypemc]').val(type);
										$('#edit_record select[name=estatussv_number]').val(status);
									});
									
									$('.delete_record').live('click', function(){
										if(!confirm('Bạn có đồng ý xóa không?'))
											return false;
										
										$.post($(this).attr('href'), $(this).serialize(), function(json) {
											alert(json);
										}, 'text');
										
										$(this).closest('tr').remove();
										
										return false;
									});
									
									$('.onoffswitch-checkbox').live('click', function() {
										if($(this).is(':checked')) {
											$(this).removeAttr('checked');	
										} else {
											$(this).attr('checked','checked');
										}
										$('.edit_record', $(this).closest('tr')).click();
									});
								});
							</script> -->
							<!-- /Phân trang -->		
							
</body>
</html>
