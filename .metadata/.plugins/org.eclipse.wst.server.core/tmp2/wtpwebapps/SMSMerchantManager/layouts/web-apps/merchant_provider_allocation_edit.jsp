<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.*" %>

<!--   Chức Năng Chỉnh Sửa 1 Merchant  --> 

<h1 class="srv_title">Thay đổi phân bổ đầu số cho Merchant</h1>
<div class="editmc" style="padding: 2px;">
<form name="editmcForm" method="post" action="merchant-provider-allocation.wss">
    <input type="hidden" name="action" value="edit" />
    <input type="hidden" name="e_id" value="${model.sm.id}" size="30"/>

    <!--/ Edit Merchant -->
    <div class="filter_row">
		<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
			<c:set var="allMcs" value="," />
			<c:forEach var="mc" items="${paramValues.merchant}">
				<c:set var="allMcs" value="${allMcs}${mc}," />
			</c:forEach>          	
			  <div class="field" style="width:auto; float:left;">
				<div style="padding-bottom: 5px; overflow: hidden;">
					<label class="product_lbl_filter" style="margin-right: 38px;"><strong>Merchant</strong></label>
					<input id="searchMerchant" list="listForSearchMc" name="ename" value="${param.searchMerchant }" class="dashboard_filter"/>
					<c:set var="listForSearchMc" value="<datalist id='listForSearchMc'>" />
				</div>
			</div>
		</c:if>			
    </div>							
    <!--/ Edit Merchant -->
    
    <!-- Edit đầu số  -->
	<div class="product_slc_filter filter_row" style="margin-right: 5px;width:450px;">
		<fieldset class="short_codes_fs">
			<legend><strong>Provider</strong></legend>
			<div style="padding: 2px;">
				<c:forEach items="${model.allsv_number}" var ="svnumber">
					<div style="display: inline-block;width:120px;">
						<input type="radio" class="chck_filter" name="esv_number" title="${svnumber}" value="${svnumber}" /><label class="lbl_chcksub">${svnumber}</label>
					</div>
				</c:forEach>
			</div>
		</fieldset>
	</div>
    <!--/ Edit đầu số  -->		

    <!-- Edit Trạng thái và Loại -->							
	<div style="float: right;width:auto;">
		<div class="product_slc_filter" style="float:right;">
			<label class="product_lbl_filter"><strong>Loại</strong></label> 
		    <select class="product_filter" name="etypemc">
		        <option value="accept">${typeTitle['accept']}</option>
		        <option value="reject">${typeTitle['reject']}</option>
		    </select>							
		</div>
		<br /><br />
		<div class="product_slc_filter" style="margin-top: 10px;">
	        <label class="product_lbl_filter"><strong>Trạng thái</strong></label> 
		    <select class="product_filter" name="estatussv_number">
		        <option value="ON">ON</option>
		        <option value="OFF">OFF</option>
		    </select>
		</div>
	</div>
    <!--/ Edit Trạng thái và Loại -->		
	
    <div class="clear"></div>							
	
	<div class="filter_row">
		<input type="submit" class="btn_greensmall" name="submitBtn" value="Cập nhật" />
		<input type="reset" class="btn_graysmall modal_close" name="reset" value="Bỏ qua" />
	</div>				
</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.editmc form[name=editmcForm]').submit(function(){
			var ename = $('form[name=editmcForm] select[name=ename]').val();
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					alert(json);
					window.location = document.URL;
				}, 'text');
			
			return false;
		});
	});
</script>


