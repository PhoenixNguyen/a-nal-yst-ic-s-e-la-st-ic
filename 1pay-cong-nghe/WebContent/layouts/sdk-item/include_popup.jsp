<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<div id="sdk_pop">
	<style>
		form[name=sdk_post] fieldset {border: solid 1px #ccc;width:330px;}
		form[name=sdk_post] .srv_row {padding-bottom: 0;}
		form[name=sdk_post] .download_link {color:#39b54a; font-weight: bold;margin-top: 10px;display: block; padding-left: 20px;}
		form[name=sdk_post] .download_link:HOVER {text-decoration: underline;}
	</style>
	<form action="<%=request.getContextPath()%>/console/product-api.wss"
		method="post" name="sdk_post" enctype="multipart/form-data">
		<input type="hidden" name="access_key" value="" /> 

		<div class="pop_box" style="width:400px;float: left;">
			<div class="product_title">
				Sản phẩm: <span class="go_sdk_product_name"></span>
			</div>
			<h1 class="srv_title">Tạo file cấu hình SDK</h1>
			<div class="srv_row">
				<label class="profile_label"><strong>Tiêu đề SDK</strong></label>
				<div class="li_row">
					<input type="text" class="txt_reglog" name="mainTitle" value="" placeholder="VD: Nạp tiền cho dịch vụ" maxlength="30" />
				</div>
				<div align="right" style="padding-right:45px; font-style:italic;">
					Không vượt quá 30 ký tự
				</div>
			</div>
			<div class="srv_row">
				<label class="profile_label"><strong>SDK Logo</strong></label>
				<div class="li_row">
					<input type="file" class="txt_reglog" name="logo" />
				</div>
			</div>
			<div class="srv_row">
				<label class="profile_label"><strong>Chọn màu nền</strong></label>
				<div class="li_row">
					<input type="color" id="mainBg" name="mainBg" value="#39b54a" onchange="javascript:document.getElementById('mainBgName').value = document.getElementById('mainBg').value;" />
					<input type="text" id="mainBgName" value="#39b54a" readonly="readonly" style="width: 70px;" />
				</div>
			</div>
			<div class="srv_row">
				<fieldset>
					<legend>
						<label class="profile_label"><strong>Ngôn ngữ mặc định</strong></label>
					</legend>
					<div class="li_row">
						<input type="radio" name="language" value="vi" checked="checked" /> Tiếng Việt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="language" value="en_US" /> Tiếng Anh
					</div>
				</fieldset>
			</div>
			<div class="srv_row">
				<label class="profile_label"><strong>Chuỗi xác nhận</strong></label>
				<div class="li_row">
					<input type="text" class="txt_reglog" name="confirmTitle" value="" placeholder="VD: Bạn có đồng ý thanh toán?" maxlength="50" />
				</div>
				<div align="right" style="padding-right:45px; font-style:italic;">
					Không vượt quá 50 ký tự
				</div>
			</div>
			<div class="srv_row">
				<fieldset>
					<legend>
						<label class="profile_label"><strong>Chọn loại dịch vụ thanh toán</strong></label>
					</legend>
					<div class="sdk_charging_choose"></div>
				</fieldset>
				<div align="right" style="padding-right:45px; font-style:italic;">
					Chọn ít nhất 1 dịch vụ thanh toán
				</div>
			</div>
			<div class="srv_row">
				<fieldset>
					<legend>
						<label class="profile_label"><strong>Chọn nội dung tải về</strong></label>
					</legend>
					<div class="li_row">
						<span title="Tải thư viện code của SDK bản Lite"><input type="radio" name="content" value="4" checked="checked" /> SDK Lite</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span title="Tải thư viện code của SDK bản Full"><input type="radio" name="content" value="3" /> SDK Full</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span title="Tải file cấu hình của sản phẩm cho SDK"><input type="radio" name="content" value="1" /> File cấu hình</span>
					</div>
				</fieldset>
			</div>
		</div>
		<div style="float: left; padding-top: 30px;width: 280px;">
			<img src="<%=request.getContextPath()%>/images/SDK_help.png" border="0" style="margin-left: 30px;" />
			<br /><br /><br />
			<a class="download_link" href="<%=request.getContextPath()%>/sdk/1PaySDK-Demo.zip" style="background: url(../images/archive_18.png) no-repeat top left;">Tải trọn bộ code của ứng dụng demo</a>
			<a class="download_link" href="<%=request.getContextPath()%>/sdk/1PaySDK-Demo.apk" style="background: url(../images/android_18.png) no-repeat top left;">Tải file .apk của ứng dụng mẫu</a>
			<a class="download_link" href="<%=request.getContextPath()%>/sdk/1PaySDK-documents.zip" style="background: url(../images/doc.png) no-repeat top left;">Tải tài liệu hướng dẫn chi tiết tích hợp SDK vào games/apps</a>
		</div>
		<div class="clear"></div>
		<div>
			<%--
				action:
					1: download config file
					2: download apk file
					3: download full
					4: download lite
					5: download documents
			--%>
			<input type="hidden" name="a" value="4" />
			<input type="submit" name="approve" value="Tải về" class="btn_greensmall" style="width:100px;" />
			<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall modal_close" />
		</div>
	</form>
	<script type="text/javascript">
		function clear_form_elements(ele) {
			
		    $(ele).find(':input').each(function() {
		        switch(this.type) {
		            case 'password':
		            case 'select-multiple':
		            case 'select-one':
		            case 'text':
		            case 'textarea':
		                $(this).val('');
		                break;
		            case 'checkbox':
		            case 'radio':
		                //this.checked = false;
		        }
		    });
		
		}
		$(document).ready(function() {
			$('.go_sdk').live('click', function() {
				if($("form[name=sdk_post]").length > 0) {
					//reset form
					clear_form_elements($("form[name=sdk_post]"));
					
					$('form[name=sdk_post] input[name=access_key]').val($(this).attr('accesskey'));
					$('form[name=sdk_post] .go_sdk_product_name').html($(this).attr('pname'));
					$('form[name=sdk_post] input[id=mainBgName]').val('#39b54a');
					$('form[name=sdk_post] input[name=mainBg]').val('#39b54a');
					$('form[name=sdk_post] .sdk_item_manager').attr('href', '<%=request.getContextPath()%>/console/sdk-item-manager.wss?access_key='+$(this).attr('accesskey'));
					
					var html = '';
					var len = $('form[name=sdk_item_manager] input[name=ct]').length;
					$('form[name=sdk_item_manager] input[name=ct]').each(function(index, element) {
						var chargingName = $(this).val().replace(/char_pop/gi, '').toLowerCase();
						html += '<div style="display: inline-block;">' + 
										'<input type="checkbox" value="'+chargingName+'" title="'+chargingName+' charging" name="ct" class="chck_filter" checked="checked">' +
									'<label class="lbl_chcksub" '+ (index == len - 1?'style="margin-right:0"':'') +'><img align="top" src="../images/'+chargingName+'_active2.png"> '+chargingName.toUpperCase()+'</label>' +
								'</div>';
					});
					
					if(html.length == 0) {
						alert('Bạn chưa có dịch vụ thanh toán nào được xác nhận.');
						$('.modal_close').click();
						return false;
					}
					
					$('form[name=sdk_post] .sdk_charging_choose').html(html);
				}
			});
			
			$('form[name=sdk_post] input[name=content]').live('click', function() {
				$('form[name=sdk_post] input[name=a]').val($(this).val());
			});
		
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
			$("form[name=sdk_post]").submit(function(e) {
			 
				if(!confirm('Bạn có chắc chắn muốn tạo file cấu hình SDK?'))
					return false;
				
				var action = $('form[name=sdk_post] input[name=a]').val();
				
				if(action != '2' && action != '5') {
					if($(this).find('input[name=mainTitle]').val().length > 15) {
						alert('Tiêu đề SDK không vượt quá 30 ký tự');
						return false;
					}
					
					if($(this).find('input[name=confirmTitle]').val().length > 50) {
						alert('Chuỗi xác nhận không vượt quá 50 ký tự');
						return false;
					}
					
					if($(this).find('input[name=ct]:checked').length == 0) {
						alert('Bạn phải chọn ít nhất 1 loại dịch vụ thanh toán');
						return false;
					}
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
			            },
			            error: function(jqXHR, textStatus, errorThrown) {
			            }           
			       	});
			        
			        //e.preventDefault();
			        //e.unbind();
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
			        iframe.load(function(e){
			        });
			    }     
			});
		});
	</script>
</div>

<div id="category_pop" class="_pop" style="width: 360px;height:150px;">
	<form action="<%=request.getContextPath()%>/console/sdk-add-or-edit-category.wss" method="post" name="category_form">
		<div class="srv_title"><span>Thêm mới</span> loại hàng hóa</div>
		<input type="hidden" name="access_key" value="${param.access_key}" />
		<input type="hidden" name="oldCategoryName" value="" />
		<label class="profile_label" style="margin-bottom: 10px;display: block">Loại hàng hóa</label>
		<input type="text" name="newCategoryName" value="" class="txt_reglog" />
		<div>
			<input type="submit" name="submitBtn" value="OK" class="btn_greensmall" style="width:100px;" />
			<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall modal_close" />
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.add_cat').live('click', function() {
				$('form[name=category_form] .srv_title span').html('Thêm mới');
				$('form[name=category_form] input[name=i]').val('');
				$('form[name=category_form] input[name=oldCategoryName]').val('');
				$('form[name=category_form] input[name=newCategoryName]').val('');
				$('form[name=category_form] input[name=submitBtn]').val('Thêm mới');
			});
			
			$('.edit_cat').live('click', function() {
				$('form[name=category_form] .srv_title span').html('Cập nhật');
				$('form[name=category_form] input[name=i]').val($(this).attr('sid'));
				$('form[name=category_form] input[name=oldCategoryName]').val($(this).attr('name'));
				$('form[name=category_form] input[name=newCategoryName]').val($(this).attr('name'));
				$('form[name=category_form] input[name=submitBtn]').val('Cập nhật');
			});
			
			$('form[name=category_form]').submit(function() {
				if(!confirm('Bạn có chắc chắn muốn cập nhật loại hàng hóa?'))
					return false;
				
				if($(this).find('input[name=newCategoryName]').val().trim().length == 0
					|| $(this).find('input[name=newCategoryName]').val().trim().length > 30) {
					alert('Loại hàng hóa không được bỏ trống và không vượt quá 30 ký tự');
					return false;
				}
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					alert(json);
					if(json.indexOf('thành công') > 0)
						$('form[name=sdk_item_manager]').submit();
				}, 'text');
				
				return false;
			});
		});
	</script>
</div>