<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
	 			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
	});
</script>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
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
						<%request.setAttribute("accountConsole", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
			              <div id="khoitao_box">
			            	<h1>Bạn chưa có sản phẩm nào, xin vui lòng khởi tạo sản phẩm mới	</h1>
			                <div class="khoitao_icon">
			                	<img border="0" src="<%=request.getContextPath() %>/images/api-g.png">
			                </div>
			                
			                <div class="content">
			                    Khởi tạo <strong>sản phẩm </strong>mới, cho phép bạn thực hiện:
			                    <ul>
			               		<li>Quản trị <strong>sản phẩm</strong></li>
			                    	<li>Theo dõi thông tin, sản lượng từng sản phẩm</li>
			                    	<li>Chia sẻ API, quản lý Teamwork.</li>
			                    </ul>
			            	</div>
			            	<div><a class="btn_khoitaosp" href="<%=request.getContextPath() %>/console/create.wss">Khởi tạo sản phẩm</a></div> 
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
	
	<jsp:include page="include_charging_popup.jsp" />
	
	<!-- / 1PAY WEB -->
	<script type="text/javascript">
		/*         */
		jQuery(function($) {

			$(function() {
				$('#hot_productslides').slides({
					preload : true,
					preloadImage : 'images/loading.gif',
					play : 5000,
					pause : 2500,
					hoverPause : true
				});
			});

		});
		/*   */
	</script>
	<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">
		qm_create(0, false, 0, 250, false, false, false, false, false);
	</script>
	<!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->
	
</body>
</html>
