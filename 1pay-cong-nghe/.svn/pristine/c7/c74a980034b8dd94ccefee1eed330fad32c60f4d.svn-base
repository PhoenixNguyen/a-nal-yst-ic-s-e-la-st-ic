<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
<div id="w_body">
	<div class="row_sub">
		<%request.setAttribute("iacCharging", true);%>
		<jsp:include page="include_dichvu_menu.jsp"></jsp:include>
		
		<div class="right_content">
			<div class="srv_details_box">
				<div class="srv_img_thumb">
					<img src="images/iac-charging-logo.jpg" border="0" />
					<c:set var="iac_charging_code" value="<%=SharedConstants.IAC_CHARGING_SERVICE_CODE %>" scope="page"/> 
					<c:choose>
						<c:when test="${account_activated_chargings!=null && account_activated_chargings[iac_charging_code]}">
							<a href="<%=request.getContextPath() %>/console/index.wss" class="btn_dangkysrv">Quản lý sản phẩm</a>
						</c:when>
						<c:otherwise>
							<a href="<%=request.getContextPath() %>/protected/iac_contract.html" class="btn_dangkysrv">Kích hoạt dịch vụ</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="srv_details">
					<h1 class="srv_title">SMS Plus Charging</h1>
		
					<div class="srv_detail_des">SMS Plus Charging là hình thức thanh toán đặc biệt dành cho các sản phẩm Game và ứng dụng. Dịch vụ cho phép người dùng có thể thanh toán các giao dịch với mệnh giá lớn theo phương pháp đơn giản, tiện lợi tương tự như dịch vụ SMS đơn thuần với tỷ lệ chiết khấu rất cao từ nhà mạng, có thể lên đến 65% trên mệnh giá giao dịch.</div>
					<div class="srv_mainfeature">
						<a href="<%= request.getContextPath() %>/iac/chinh-sach.html" class="srv_feature_link"><img
							src="images/document_icon.png" border="0" hspace="5"
							align="absmiddle" />Chính sách</a> · 
							<c:choose>
								<c:when test="${account_activated_chargings!=null && account_activated_chargings[iac_charging_code]}">
									<a href="<%=request.getContextPath() %>/protected/iac_contract.html" class="srv_feature_link">
								</c:when>
								<c:otherwise>
									<a href="<%=request.getContextPath() %>/hop-dong-mau.html" class="srv_feature_link" target="_blank">
								</c:otherwise>
							</c:choose><img src="images/doc_hopdong.png"
							border="0" hspace="5" align="absmiddle" />Hợp đồng điện tử</a> · <a
							href="http://dev.1pay.vn" class="srv_feature_link"><img
							src="images/apis_icon.png" border="0" hspace="5" align="absmiddle" />Tài
							liệu kết nối (APIs)</a>
					</div>
		
					<div class="srv_sdk_holder">
						<div class="sdk_col">
							<div class="sdk_row">IOS</div>
							<div class="sdk_row">
								<a href="#"><strong>Download SDK</strong></a>
							</div>
							<div class="sdk_row">
								<a href="#">Tutorial</a> &nbsp;&nbsp;&nbsp; <a href="#">Documentation</a>
							</div>
		
						</div>
						<div class="sdk_col_end">
							<div class="sdk_row">Android</div>
							<div class="sdk_row">
								<a href="#"><strong>Download SDK</strong></a>
							</div>
							<div class="sdk_row">
								<a href="#">Tutorial</a> &nbsp;&nbsp;&nbsp; <a href="#">Documentation</a>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		
			<div class="srv_row">
				<div class="srv_content_col">
					<div class="key_title">Khai báo mã trực tuyến</div>
					<div class="srv_des">Việc khai báo mở mã sẽ được thao tác trực
						tiếp ngay trên hệ thống 1PAY</div>
				</div>
				<div class="srv_content_col">
					<div class="key_title">Đối soát trực tuyến</div>
					<div class="srv_des">Nhanh gọn, chính xác, an toàn, bỏ qua các
						thủ tục hành chính rườm rà, gây cản trở về mặt đối soát.</div>
				</div>
				<div class="srv_content_col_end">
					<div class="key_title">Đề nghị thanh toán trực tuyến</div>
					<div class="srv_des">Người dùng có thể thực hiện thao tác đề
						nghị thanh toán trực tiếp ngày trên hê thống và sẽ nhận được thông
						báo tức thì.</div>
				</div>
			</div>
		</div>
	</div>
</div>