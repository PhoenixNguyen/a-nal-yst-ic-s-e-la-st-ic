<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<style>
	.filter_row .fieldset_filter {border: solid 1px #ccc;margin-left:40px; width: auto;}
</style>

<script type="text/javascript">
$(function(){
	$('#filterPermission').click(function(){
		if($('#filterPermission').is(':checked')){
			<c:forEach items="${model.roleMap}" var="roleOrigin" varStatus="index">
				$('input[name='+ '<c:out value="${roleOrigin.key}"/>' +']').attr('checked', true);
			</c:forEach>
		}
		else{
			<c:forEach items="${model.roleMap}" var="roleOrigin" varStatus="index">
				$('input[name='+ '<c:out value="${roleOrigin.key}"/>' +']').attr('checked', false);
			</c:forEach>
		}
	});
});	
</script>

<script type="text/javascript">
$(function(){

	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	
});
</script>

<div id="filter_locketqua">
	<h3 class="filter_label">
		<a href="javascript: void(0);">Lọc kết quả</a>
	</h3>
</div>
		
<!-- .widget-header -->
<div class="box_locketqua">
	<div class="filter_row">
		<span style="padding-left:40px; display:inline-block; width:100px;"><b>Tên Merchant </b></span>
		<input id="searchMerchant" list="listForSearchMc" maxlength="100" 
			name="searchMerchant" value="${param.searchMerchant }" 
			class="product_filter drop_menu_text_box" style="width:200px;" 
			placeholder="Nhập tài khoản merchant"/>
		<c:set var="listForSearchMc" value="<datalist id='listForSearchMc'>" />
		<c:forEach var="merchant" items="${model.merchants}">
			<c:set var="listForSearchMc" value="${listForSearchMc}<option value='${merchant}'>${merchant}</option>" />
		</c:forEach>
		<c:out value="${listForSearchMc}</datalist>" escapeXml="false" />
		<%-- <select id="filter_merchant" name="merchants" multiple="multiple" style="width:300px;">
			<c:forEach var="merchant" items="${model.merchants}">
				<c:set var="merchant2" value=",${merchant}," />
				<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
					<c:out value="${merchant}"/>
				</option>
			</c:forEach>
		</select> --%>
		
		<div class="input-prepend" style="float:right;margin-left: 50px;">
			<label class="product_lbl_filter"><strong>Chọn ngày khởi tạo</strong></label> <input type="text"
				name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="Toàn thời gian"
				value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:''}" />
				<a href="javascript:void(0)" 
					onclick="$('#reservation').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" 
					style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				/* $('#reservation').daterangepicker({
					format : 'dd/MM/yyyy',
				}); */
				$('#reservation').daterangepicker({
					format : 'dd/MM/yyyy',
					ranges: {
					'Hôm nay': ['today', 'today'],
					'Hôm qua': ['yesterday', 'yesterday'],
					'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
					'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
					'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
					'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
					}
				});
			});
		</script>
		<div class="clear"></div>
	</div>
	
	<c:if test="${model.allSues != null && fn:length(model.allSues) > 1}">
	<div class="filter_row">
		<fieldset class="fieldset_filter">
			<legend>
				<input type="checkbox" name="suChkAll" value="suChkAll" id="suChkAll" class="chck_filter" /> <strong>SU</strong>
				<script type="text/javascript">
					$(document).ready(function(){
						$('#suChkAll').click(function() {
							if(this.checked) {
								$(this).closest('.filter_row').find('input[type=checkbox]').attr('checked', 'checked');
							} else {
								$(this).closest('.filter_row').find('input[type=checkbox]').removeAttr('checked');
							}
						});
					});
				</script>
			</legend>
			
			<div style="padding: 2px;">
				<c:set var="allSu" value="," />
				<c:forEach var="su" items="${paramValues.su}">
					<c:set var="allSu" value="${allSu}${su}," />
				</c:forEach>
				<c:forEach var="su" items="${model.allSues}">
					<div style="display: inline-block;">
						<c:set var="_su" value=",${su}," />
						<input type="checkbox" class="chck_filter" name="su" title="${su}" value="${su}" 
							${fn:contains(allSu,_su)?'checked="checked"':'' } />
						<label class="lbl_chcksub">${su}</label>
					</div>
				</c:forEach>
			</div>
		</fieldset>
	</div>
	</c:if>
	
	<div class="filter_row">
            	<c:set var="allPermission" value="," />
		<c:forEach var="cs" items="${model.allPermissions}">
			<c:set var="allPermission" value="${allPermission}${cs}," />
		</c:forEach> 
		<fieldset class="fieldset_filter">
			<legend>
               	<span style="display:block; width:120px; margin-left: -2px;">
               		<input type="checkbox" name="filterPermission" id="filterPermission" value="permissionChkAll">
               		<b>Quyền merchant</b>
               	</span>
			</legend>
			
			<c:forEach items="${model.roleMap}" var="roleOrigin" varStatus="index">
			<c:set var="_role" value=",${roleOrigin.key },"/>
			<div style="display: block; width: 150px; float: left;">
				<input type="checkbox" ${fn:contains(allPermission, _role)?'checked="checked"':'' } title="${roleOrigin.value }" name="${roleOrigin.key }" class="chck_filter chargings" >
                   <label for="chck_thecao" class="lbl_chcksub">${roleOrigin.value }</label>
                  </div>
                  </c:forEach>
                   
		</fieldset>
	</div>
	<div class="filter_row">
		<span class="add-on" style="padding-left:40px; display:block; width:100px;">
			<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Lọc kết quả" />
		</span>
	</div>
	<!-- .actions -->
	<!-- .widget-content -->
	<c:choose>
		<c:when test="${param.submit==null || fn:length(param.submit) == 0 }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('.box_locketqua').find('fieldset').each(function() {
					$(this).find('input[type=checkbox]').attr('checked', 'checked');
				});
			});
		</script>
		</c:when>
		<c:otherwise>
			<c:if test="${param.suChkAll == 'suChkAll' }">
			<script type="text/javascript">
			$(document).ready(function() {
				$('#suChkAll').attr('checked', 'checked');
			});
			</script>									
			</c:if>
			<c:if test="${param.filterPermission == 'permissionChkAll' }">
			<script type="text/javascript">
			$(document).ready(function() {
				$('#filterPermission').attr('checked', 'checked');
			});
			</script>									
			</c:if>
		</c:otherwise>
	</c:choose>
</div>