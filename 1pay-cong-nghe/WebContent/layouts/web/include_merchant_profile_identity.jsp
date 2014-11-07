<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<div class="product_slc_filter filter_row">
	<fieldset class="identity_verify_popup">
		<legend>
			<strong> CMND/ĐKKD &nbsp; <img
				class="popup_common_identity_verify" border="0"
				title="Chưa xác thực CMND/ĐKKD"
				src="<%=request.getContextPath()%>/images/invalid.png" /> </strong>
		</legend>
		<div style="padding: 2px;">
			<div class="contract_content">
				<label class="label_popup_edit_contact">CMND/MSTDN: </label> <span
					class="go_sms_product_name popup_common_identity__identity"></span>
			</div>
			<div class="contract_content">
				<label class="label_popup_edit_contact"> &nbsp; </label> <a
					class="popup_common_identity_image_a"
					href="<%=request.getContextPath()%>/images/identity_no.jpg"
					class="top_up"
					toptions="overlayClose = 1, width = 900, height = 600, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, effect=transform, shaded=1, ondisplay = open_win()">
					<img class="popup_common_identity_image" border="0" width="100"
					height="50"
					src="<%=request.getContextPath()%>/images/identity_no.jpg" /> </a>
			</div>
			<div class="contract_content">
				<label class="label_popup_edit_contact">Ngày cấp: </label> <span
					class="go_sms_product_name popup_common_identity_date_of_issue"></span>
			</div>
			<div class="contract_content">
				<label class="label_popup_edit_contact">Nơi cấp/Địa chỉ:</label> <span
					class="go_sms_product_name popup_common_identity_place_of_issue"></span>
			</div>
		</div>
	</fieldset>
</div>