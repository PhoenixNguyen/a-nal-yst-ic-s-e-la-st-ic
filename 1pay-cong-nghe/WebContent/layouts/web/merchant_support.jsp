<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

//Xoa Kich ban tren luoi kich ban
var deleteKichBan = function(id)
{
	var answer = confirm("Bạn có muốn xóa");
	if(answer){
		id = id.split('-')[1];
		window.location= ($('#baseURL').val()+"/protected/delete-scenario.html?id="+id); 
	}
};

//Sua Kich ban tren luoi kich ban->Redirect /protected/sua-kich-ban.html?id=5260163cb393628c065c46b1
var editKichBan = function(id)
{
	id = id.split('-')[1];
	window.location= ($('#baseURL').val()+"/protected/edit-sms-scenario.html?id="+id); 
};
</script>
</head>
<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("menuTrangChu", true); %>
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<%request.setAttribute("merchantSupport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<div class="home_srv_title">Tiện ích, công cụ hỗ trợ</div>
							<div class="home_srv_img"></div>
							<div class="srv_row">
								<div class="srv_col">
									<a href="<%=request.getContextPath() %>/protected/list-sms-scenario.html" class="link_srv">Sms - Tạo kịch bản</a>
									<div class="srv_des">Công cụ hỗ trợ developer tạo địa chỉ xử lý kịch bản SMS.</div>
									<a href="<%=request.getContextPath() %>/protected/list-sms-scenario.html" class="btn_khampha">Khám phá</a>
								</div>
								<div class="srv_col">
									<a href="<%=request.getContextPath() %>/protected/create-card-toup-form.html" class="link_srv">Card - Mã nhúng gạch thẻ </a>
									<div class="srv_des">Công cụ cho phép tạo mã nhúng form gạch thẻ cào.</div>
									<a href="<%=request.getContextPath() %>/protected/create-card-toup-form.html" class="btn_khampha">Khám phá</a>
								</div>
								<div class="srv_col_end">
									<a href="#" class="link_srv">Wap - Địa chỉ Test </a>
									<div class="srv_des">Địa chỉ mẫu để test Wap Charging dành cho developer.</div>
									<a href="#" class="btn_khampha">Khám phá</a>
								</div>
							</div>	
							<div class="home_srv_img"></div>
							<div class="srv_row">
								<div class="srv_col">
									<a href="<%=request.getContextPath() %>/protected/sms-sand-box.html" class="link_srv">Sms - Sandbox </a>
									<div class="srv_des">Công cụ cho phép kiểm tra API kết nối SMS Charging.</div>
									<a href="<%=request.getContextPath() %>/protected/sms-sand-box.html" class="btn_khampha">Khám phá</a>
								</div>
								<div class="srv_col">
									<a href="<%=request.getContextPath() %>/protected/card-sand-box.html" class="link_srv">Card - Sandbox </a>
									<div class="srv_des">Công cụ cho phép kiểm tra API kết nối Card Charging .</div>
									<a href="<%=request.getContextPath() %>/protected/card-sand-box.html" class="btn_khampha">Khám phá</a>
								</div>
								<div class="srv_col_end">
									<a href="<%=request.getContextPath() %>/protected/iac-sand-box.html" class="link_srv">IAC - Sandbox </a>
									<div class="srv_des">Công cụ cho phép kiểm tra API kết nối SMS Plus Charging .</div>
									<a href="<%=request.getContextPath() %>/protected/iac-sand-box.html" class="btn_khampha">Khám phá</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- / Web Foot -->
	</div>
	<!-- / 1PAY WEB -->
</body>
</html>
