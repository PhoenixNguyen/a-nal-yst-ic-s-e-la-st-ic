<%@page import="vn.onepay.cdr.filter.model.SmsMerchantProductVerify"%>
<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<div class="srv_row">
	<style>
		form[name=verify_post] input[type=radio] {margin-top: 3px;}
	</style>
	<form action="sms-verify-api.cdr" method="post" name="verify_post">
		<input type="hidden" name="id" />
		<input type="hidden" name="provider" />
		<input type="hidden" name="commandCode" />
		<h1 class="srv_title">Xác thực merchant: <span class="merchant_name"></span></h1>
		<div class="filter_row">
			<div class="product_slc_filter">
				<label class="product_lbl_filter" style="margin-right: 70px;"><strong>Xác thực</strong></label>
				<div class="product_lbl_filter">
					<input type="radio" id="status_1" name="status" value="<%=SmsMerchantProductVerify.PENDING_STATUS%>" class="chck_filter" title="Chờ duyệt" />
					<label class="lbl_chcksub"><img src="<%=request.getContextPath()%>/images/invalid.png" border="0" style="vertical-align:middle" />Chờ duyệt</label>
				</div>
				<div class="product_lbl_filter">
					<input type="radio" id="status_2" name="status" value="<%=SmsMerchantProductVerify.APPROVED_STATUS%>" class="chck_filter" title="Xác thực" />
					<label class="lbl_chcksub"><img src="<%=request.getContextPath()%>/images/check.png" border="0" style="vertical-align:middle" /> Xác thực</label>
				</div>
				<div class="product_lbl_filter">
					<input type="radio" id="status_3" name="status" value="<%=SmsMerchantProductVerify.REJECT_STATUS%>" class="chck_filter" title="Hủy xác thực" />
					<label class="lbl_chcksub"><img src="<%=request.getContextPath()%>/images/huy.png" border="0" style="vertical-align:middle" /> Hủy xác thực</label>
				</div> 
			</div>
			<div class="clear"></div>
		</div>
		<div class="filter_row">
			<div class="product_slc_filter">
				<label class="product_lbl_filter" style="margin-right: 45px;"><strong>Lý do thay đổi</strong></label>
				<textarea class="txtarea_reglog" rows="3" name="comment"></textarea>
			</div>
		</div>
		<div class="filter_row">
			<input type="submit" class="btn_greensmall" value="Cập nhật" name="submit" />
			<input type="reset" name="reset" value="Đóng" class="btn_graysmall modal_close" />
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.sms_verify').live('click', function() {
				if($("form[name=verify_post]").length > 0) {
					var status = $(this).attr('status');
					if(status == '<%=SmsMerchantProductVerify.INIT_STATUS%>')
						status = '<%=SmsMerchantProductVerify.PENDING_STATUS%>';
					var comment = $(this).attr('title');
					
					$("form[name=verify_post] .merchant_name").html($(this).attr('mname'));
					$("form[name=verify_post] input[name=id]").val($(this).attr('id'));
					$("form[name=verify_post] input[name=provider]").val($(this).attr('provider'));
					$("form[name=verify_post] input[name=commandCode]").val($(this).attr('commandCode'));
					
					$("form[name=verify_post] input[name=status]").removeAttr('checked');
					$("form[name=verify_post] input[name=status]").each(function() {
						if($(this).val() == status)
							$(this).attr('checked', 'checked');
					});
					$("form[name=verify_post] textarea[name=comment]").val(comment);
				}
			});
			
			$('form[name=verify_post]').submit(function() {
				var status = $("form[name=verify_post] input[name=status]:checked").val();
				var comment = $("form[name=verify_post] textarea[name=comment]").val();
				var id = $("form[name=verify_post] input[name=id]").val();
				
				if(comment.trim().length <= 0) {
					alert('Lý do không được để trống');
					return false;
				}
				
				if(!confirm('Bạn có chắc chắn cập nhật xác nhận?'))
					return false;
				
				$.post($(this).attr('action'), $(this).serialize(), function(result) {
					if (result == '1') {
						var mess ='Cập nhật thành công';
						alert(mess);
						
						$('#' + id).attr('title', comment);
						$('#' + id).attr('status', status);
						var icon_name = 'invalid';
						if(status == '<%=SmsMerchantProductVerify.APPROVED_STATUS%>')
							icon_name = 'check';
						else if(status == '<%=SmsMerchantProductVerify.REJECT_STATUS%>')
							icon_name = 'huy';
						
						var img = '<img src="<%=request.getContextPath()%>/images/'+icon_name+'.png" border="0" />';
						$('#' + id).html(img);
						
						$('.modal_close').click();
					} else {
						alert('Cập nhật không thành công\n' + result);
					}
				}, 'text');
				return false;
			});
		});
	</script>
</div>