<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.*" %>

<!--   Chức Năng Thêm Mới 1 Merchant  --> 
<style>
.ui-multiselect-menu {z-index:999999;}
</style>
<h1 class="srv_title">Thực hiện phân bổ đầu số cho Merchant</h1>
<div class="newmc" style="padding: 2px;" >
<form name="insertmcForm" method="post" action="merchant-provider-allocation.wss">
	<input type="hidden" name="action" value="insert" />

    <!-- Tạo danh sách lọc Merchant -->	
	<div class="filter_row">
		<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
			<c:set var="allMcs" value="," />
			<c:forEach var="mc" items="${paramValues.merchant}">
				<c:set var="allMcs" value="${allMcs}${mc}," />
			</c:forEach>          	
			  <div class="field" style="width:auto; float:left;">
				<div style="padding-bottom: 5px; overflow: hidden;">
					<label class="product_lbl_filter" style="margin-right: 38px;"><strong>Merchant</strong></label>
					<input id="searchMerchant" list="listForSearchMc" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
					<c:set var="listForSearchMc" value="<datalist id='listForSearchMc'>" />
					<select class="filter_merchant" name="merchant" multiple="multiple">
						<c:forEach var="merchant" items="${model.merchants}">
							<c:set var="merchant2" value=",${merchant}," />
							<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }><c:out value="${merchant}"/></option>
							<c:set var="listForSearchMc" value="${listForSearchMc} <option value='${merchant}'>${merchant}</option>" />
						</c:forEach>
					</select>
					<c:out value="${listForSearchMc}" escapeXml="false" />
				</div>
			</div>
		</c:if>			
	</div>	
	<!--/ Tạo danh sách lọc Merchant -->
	
	<!-- Check đầu số  -->
	<div class="product_slc_filter filter_row" style="margin-right: 5px;width:450px;">
		<fieldset class="short_codes_fs">
			<legend>
				<input type="checkbox" name="prChkAll" value="prChkAll" id="prChkAll2" class="chck_filter2" /> <strong>Provider</strong>
				<script type="text/javascript">
					$(document).ready(function(){
						$('.chck_filter2').click(function() {
							if(this.checked) {
								$(this).closest('.product_slc_filter').find('input[type=checkbox]').attr('checked', 'checked');
							} else {
								$(this).closest('.product_slc_filter').find('input[type=checkbox]').removeAttr('checked');
							}
						});
					});
				</script>
			</legend>
			<div style="padding: 2px;">
			    <c:forEach items="${model.allsv_number}" var ="svnumber">
					<div style="display: inline-block;width:120px;">
						<input type="checkbox" class="chck_filter" name="sv_numbers" title="${svnumber}" value="${svnumber}" /><label class="lbl_chcksub">${svnumber}</label>						
					</div>
				</c:forEach>
			</div>
		</fieldset>
	</div>
	<!--/ Check đầu số  -->
	
	<!-- Trạng thái và Loại -->
	<div style="float: right;width:auto;">
		<div class="product_slc_filter" style="float:right;">
			<label class="product_lbl_filter"><strong>Loại</strong></label> 
			    <select class="product_filter" name="typemc">
			        <option value="accept">${typeTitle['accept']}</option>
					<option value="reject" ${param.tab=='reject'?'selected':''}>${typeTitle['reject']}</option>
			    </select>	
		</div>
		<br /><br />
		<div class="product_slc_filter" style="margin-top: 10px;">
	        <label class="product_lbl_filter"><strong>Trạng thái</strong></label> 
			    <select class="product_filter" name="statussv_number">
			        <option value="ON">ON</option>
			        <option value="OFF">OFF</option>
			    </select>
		</div>
	</div>
    <!-- /Trạng thái và Loại -->
	   
	<div class="clear"></div>
	
	<div class="filter_row">
		<input type="submit" class="btn_greensmall" name="submitBtn" value="Thêm mới" />
		<input type="reset" class="btn_graysmall modal_close" name="reset" value="Bỏ qua" />
	</div>
</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.newmc form[name=insertmcForm]').submit(function(){
			var status = $('form[name=insertmcForm] select[name=statussv_number]').val();
			//alert(status);
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					alert(json);
					if(confirm('Bạn có đồng ý refresh lại trang danh sách phân bổ Provider cho Merchant?'))
						window.location = document.URL;
				}, 'text');
			return false;
		});
	});
</script>
