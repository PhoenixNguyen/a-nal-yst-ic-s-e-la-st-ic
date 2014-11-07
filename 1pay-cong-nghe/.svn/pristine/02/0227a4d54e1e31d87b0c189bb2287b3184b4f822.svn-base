<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<c:if test="${param.a == 'add_or_edit_item'}">
	<div class="srv_title">
		${(param.i == null || fn:length(param.i) == 0)?'Tạo mới':'Cập nhật' } hàng hóa
	</div>
	<style>
		.sdk_item_form td {padding: 5px 15px 5px 0}
		form[name=sdk_add_or_edit_item_form] .txt_reglog {width:367px;}
	</style>
	<form method="post" name="sdk_add_or_edit_item_form" action="<%=request.getContextPath()%>/console/sdk-add-or-edit-item.wss" enctype="multipart/form-data">
		<input type="hidden" name="i" value="${param.i}" />
		<input type="hidden" name="access_key" value="${param.access_key}" />
		<input type="hidden" name="btnSubmit" value="1" />
		<table class="sdk_item_form">
			<tr>
				<td class="profile_label">
					Tên hàng hóa
				</td>
				<td>
					<input type="text" name="title" id="title" class="txt_reglog" value="${sdkItem.title}" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Loại hàng hóa
				</td>
				<td>
					<input type="text" list="categories" name="category" id="category" class="txt_reglog" value="${(sdkItem.category!=null && fn:length(sdkItem.category) > 0) ? sdkItem.category : param.category}" maxlength="100" />
					<datalist id="categories">
						<c:forEach var="category" items="${categories}">
							<option value="${category}">${category}</option>
						</c:forEach>
					</datalist>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Icon
				</td>
				<td>
					<input type="file" name="icon" id="icon" class="txt_reglog" style="height: 30px;" />
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Giá
				</td>
				<td>
					<input type="text" name="price" id="price" class="txt_reglog" value="${sdkItem.price}" />
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Loại hình DV thanh toán
				</td>
				<td>
					<div class="product_slc_filter filter_row">
						<fieldset>
							<legend>
								<input type="checkbox" name="ctChkAll" value="ctChkAll" id="ctChkAllInForm" class="chck_filter" ${fn:length(sdkItem.charging_methods) == 4 ? 'checked="checked"' : ''} /> <strong>Chọn tất cả</strong>
								<script type="text/javascript">
									$(document).ready(function(){
										$('#ctChkAllInForm').click(function() {
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
								<c:set var="allCt" value="," />
								<c:forEach var="ct" items="${sdkItem.charging_methods}">
									<c:set var="allCt" value="${allCt}${ct}," />
								</c:forEach>
								<c:forEach var="charging" items="${allCharging }">
									<div style="display: inline-block;">
										<c:set var="ct" value=",${charging}," />
										<input type="checkbox" class="chck_filter" name="charging_methods" title="${charging} charging" value="${charging}" 
											${fn:contains(allCt, ct)?'checked="checked"':'' } />
										<label class="lbl_chcksub"><img src="../images/${fn:toLowerCase(charging)}_active2.png" align="top" /> ${charging}</label>
									</div>
								</c:forEach>
							</div>
						</fieldset>
					</div>
				</td>
			</tr>
			<tr>
				<td class="profile_label" valign="top">
					Mô tả
				</td>
				<td>
					<textarea rows="5" name="description" id="description" class="txtarea_reglog" style="width:367px;" maxlength="255">${sdkItem.description}</textarea>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Status
				</td>
				<td>
					<c:forEach var="st" items="${allStatus}">
						<input type="radio" name="status" id="status" value="${st}" ${(sdkItem.status == st || (sdkItem.status == 'init' && st=='pending'))?'checked="checked"':'' } /> ${st=='approved'?'<img src="../images/tick.png" /> Đã duyệt':'<img src="../images/invalid.png" /> Chưa duyệt'}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
		</table>
		<br />
		<input type="submit" class="btn_greensmall" value="${(param.i == null || fn:length(param.i) == 0)?'Tạo mới':'Cập nhật' }" />
		<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall" onclick="$('#lean_overlay').click();" />
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			function getDoc(frame) {
			     var doc = null;
			 
			     // IE8 cascading access check
			     try {
			         if (frame.contentWindow) {
			             doc = frame.contentWindow.document;
			         }
			     } catch(err) {
			     }
			 
			     if (doc) { // successful getting content
			         return doc;
			     }
			 
			     try { // simply checking may throw in ie8 under ssl or mismatched protocol
			         doc = frame.contentDocument ? frame.contentDocument : frame.document;
			     } catch(err) {
			         // last attempt
			         doc = frame.document;
			     }
			     return doc;
			 }
			$("form[name=sdk_add_or_edit_item_form]").submit(function(e) {
			 
				var label = "${(param.i == null || fn:length(param.i) == 0)?'Tạo mới':'Cập nhật'}";
				
				if(!confirm('Bạn có chắc chắn muốn '+label+' hàng hóa cho sản phẩm ${product.title}'+ '?'))
					return false;
				
				if(isNaN($("form[name=sdk_add_or_edit_item_form] input[name=price]").val())) {
					alert('Giá hàng hóa không hợp lệ');
					return false;
				}
					
			    var formObj = $(this);
			    var formURL = formObj.attr("action");
			 
			    if(window.FormData !== undefined)  // for HTML5 browsers
			    {
			 
			        var formData = new FormData(this);
			        $.ajax({
			            url: formURL,
			            type: 'POST',
			            data:  formData,
			            mimeType:"multipart/form-data",
			            contentType: false,
			            cache: false,
			            processData:false,
			            success: function(data, textStatus, jqXHR) {
			            	if(data == '1') {
								if(confirm(label + ' hàng hóa mới cho sản phẩm ${product.title} thành công.\n' +
										'Vui lòng refresh lại Kho hàng hóa để xem danh sách mới được cập nhật')) {
									var href = location.href;
									location.href = href;
								}
							} else {
								alert(data);
							}
			            },
			            error: function(jqXHR, textStatus, errorThrown) {
			 
			            }           
			       	});
			        
			        e.preventDefault();
			        e.unbind();
			   } else {  //for olden browsers
			        //generate a random id
			        var  iframeId = 'unique' + (new Date().getTime());
			 
			        //create an empty iframe
			        var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');
			 
			        //hide it
			        iframe.hide();
			 
			        //set form target to iframe
			        formObj.attr('target',iframeId);
			 
			        //Add iframe to body
			        iframe.appendTo('body');
			        iframe.load(function(e)
			        {
			            var doc = getDoc(iframe[0]);
			            var docRoot = doc.body ? doc.body : doc.documentElement;
			            var data = docRoot.innerHTML;
			            //data is returned from server.
			            if(data == '1') {
							if(confirm(label + ' hàng hóa mới cho sản phẩm ${product.title} thành công.\n' +
									'Vui lòng refresh lại Kho hàng hóa để xem danh sách mới được cập nhật')) {
								var href = location.href;
								location.href = href;
							}
						} else {
							alert(data);
						}
			        });
			 
			    }     
			});
		});
	</script>
</c:if>