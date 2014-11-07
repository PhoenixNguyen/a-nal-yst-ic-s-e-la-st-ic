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
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

</head>

<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("menuTrangChu", true); %>
				<jsp:include page="embedded_charging_header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="dky_row">
				       	  <h1 class="srv_title">Quy định khởi tạo ứng dụng</h1>
				            <div class="quydinh_dichvu">
				              <strong>ĐIỀU 1:  CÁC THUẬT NGỮ</strong>
				              <ul>
				                <li><strong>Doanh thu  (ký hiệu là DT):</strong> là tổng số tiền mà người dùng đầu cuối chi trả cho  dịch vụ (đã bao gồm VAT).</li>
				                <li><strong>Doanh thu về  bên A (ký hiệu là </strong><strong>DTA</strong><strong>):</strong> là tổng số tiền người dùng đầu cuối  chi trả cho dịch vụ sau khi trừ đi chi phí của nhà mạng. </li>
				                <li><strong>Doanh thu  bên B (ký hiệu là </strong><strong>DTB</strong><strong>):</strong> là số tiền bên B sẽ được nhận sau  khi phân chia doanh thu và trừ đi mọi chi phí bắt buộc (nếu có). (Ví dụ: Thuế  thu nhập cá nhân đối với khách hàng cá nhân).</li>
				                <li><strong>Tỷ lệ phân  chia doanh thu bên B được hưởng (</strong><strong>ký hiệu là</strong><strong> TLB)  : </strong>là tỷ lệ phần trăm phân  chia Doanh thu Bên B được hưởng. </li>
				                <li><strong>Tỷ lệ phân  chia doanh thu bên A được hưởng (</strong><strong>ký hiệu là</strong><strong> TLA)  : </strong>là tỷ lệ phần trăm phân  chia Doanh thu Bên A được hưởng. </li>
				                <li><strong>Thanh  toán:</strong> là các đề nghị thanh toán theo từng đợt đề nghị thanh toán.</li>
				                <li><strong>Doanh thu  cuối kỳ:</strong> là số tiền bên B còn được nhận sau khi đã tiến hành đối soát xác nhận sản  lượng và doanh thu chưa thanh toán.</li>
				                <li><strong>Hạn mức  thanh toán:</strong> là doanh thu tối thiểu bên B cần đạt được để làm  thủ tục thanh toán. 1PAY quy định hạn mức doanh thu tối thiểu là 500.000đ (Năm  trăm ngàn đồng chẵn). Phần doanh thu chưa được thanh toán sẽ được cộng dồn vào  chu kỳ thanh toán kế tiếp.</li>
				                <li><strong>Chu kỳ đối  soát:</strong></li>
				              </ul>
				              <p>+ Đơn vị chu kỳ đối soát được tính theo tháng:  Tính từ 00 giờ 00 phút 00 giây ngày đầu tiên đến 23 giờ 59 phút 59 giây ngày cuối  cùng của tháng.  Đồng hồ đối soát lấy  theo đồng hồ hệ thống 1PAY.<br />
				                + Thời gian bắt đầu đối soát tính từ ngày ký hợp  đồng.<br />
				                + Thời gian kết thúc đối soát tính từ ngày kết  thúc hợp đồng.<br />
				                + Chu kỳ đối soát: tháng.<br />
				                + Chu kỳ lập biên bản xác nhận doanh thu:  tháng.</p>
				              <ul>
				                <li><strong>Số liệu gốc:</strong> là số liệu  ghi nhận tại hệ thống quản lý của 1PAY.</li>
				                <li><strong>Giao dịch  thành công:</strong> là giao dịch ghi nhận thành công tại hệ thống  1PAY.</li>
				                <li><strong>Số liệu đối  soát:</strong> là số liệu giao dịch thành công trên hệ thống 1PAY.</li>
				                <li><strong>Thuế giá  trị gia tăng (GTGT):</strong> Theo quy định hiện hành của Nhà nước.</li>
				                <li><strong>Thuế thu  nhập cá nhân (TNCN):</strong> Theo quy định hiện hành của Nhà nước.</li>
				              </ul>
				              <p><strong>ĐIỀU 2:  QUY ĐỊNH VỀ ĐỐI SOÁT</strong><br />
				                	<strong>Biên  bản đối soát:</strong> bên B có thể dùng nội dung trang lịch sử  giao dịch chính là số liệu để đối soát cập nhật trực tuyến, khi có nhu cầu có  thể in lại từ nội dung yêu cầu đối soát tương ứng. Số liệu đối soát để tạm ứng  và thanh toán lấy theo các chu kỳ sau:<br />
					                1. Quy định về số liệu đối  soát<br />
					                a) Đối soát  tạm ứng theo chu kỳ 15 ngày <br />
					                Số liệu đối soát được tính từ 00 giờ 00 phút  00 giây ngày 1 đến 23 giờ 59 phút 59 giây ngày 15 của tháng. <br />
					                b) Đối  soát thanh toán  theo chu kỳ tháng<br />
					                Số liệu đối soát được  tính từ 00 giờ 00 phút 00 giây ngày 1  đến  23 giờ 59 phút 59 giây ngày cuối cùng của tháng. <br />
				  					<strong>2. Quy trình đối soát</strong><br />
					                Người có  trách nhiệm của hai Bên phải ký Biên bản xác nhận sản lượng, doanh thu theo quy  trình: Bên B gửi số liệu gốc qua thư điện tử bản ghi chi tiết giao dịch theo  chu kỳ đối soát cho Bên A, Bên A tiến hành đối chiếu giữa số liệu Bên B và số  liệu ghi nhận trên hệ thống tính cước của Bên A:
					            </p>
						              <ul>
						                <li>Trường hợp không có sự chênh lệch trong số liệu đối chiếu,  Bên A xác nhận số liệu. Sau đó Bên B ký và gửi biên bản xác nhận sản lượng,  doanh thu cho Bên A. Bên A ký và gửi lại biên bản xác nhận sản lượng, doanh thu  cho bên B để làm thủ tục thanh toán.</li>
						                <li>Trong trường hợp chênh lệch số liệu đối soát nhỏ hơn Sai  lệch cho phép thì số liệu gốc là cơ sở phân chia doanh thu.</li>
						                <li>Trong trường hợp chênh lệch số liệu đối soát lớn hơn Sai  lệch cho phép thì hai bên phải tiến hành đối soát chi tiết số liệu. Nếu hai bên  đã đối soát chi tiết mà không tìm ra nguyên nhân thì tiến hành đàm phán, thống  nhất và quyết định số liệu cuối cùng dựa trên tinh thần thiện chí hợp tác.</li>
						              </ul>
				               <p><strong>ĐIỀU 3: QUY ĐỊNH VỀ CHU KỲ THANH TOÁN</strong><br />
				                	Doanh thu của  bên B được tính ngay sau khi dịch vụ hợp tác của bên B với 1PAY được phê duyệt.  Bên B có thể lựa chọn các chu kỳ thanh toán doanh thu trên rất linh hoạt như  sau:<br />
									  <strong>a) Thanh  toán tạm ứng theo chu kỳ 15 ngày</strong><br />
									                Để thanh toán tạm ứng doanh thu theo chu kỳ  thanh toán 15 ngày, doanh thu của bên B phải đạt được tối thiểu 10 triệu/1 kỳ  thanh toán. Vào ngày 16 hàng tháng khách hàng làm thủ tục đối soát số liệu với  1PAY trên website 1pay.vn , sau khi 2 bên thống nhất và xác nhận số liệu đối  soát thì 1PAY sẽ thanh toán cho bên B sau 02 ngày làm việc kể từ khi bên A nhận  được Hồ sơ đề nghị thanh toán từ bên B (Bao gồm: Biên bản đối soát sản  lượng, doanh thu, Hóa đơn GTGT và đề nghị thanh toán). Số tiền tạm ứng này sẽ  được 1PAY khấu trừ vào cuối kỳ thanh toán của bên B.<br />
									  <strong>b) Thanh  toán theo chu kỳ tháng</strong><br />
									                Vào ngày 1 đến ngày 5 hàng tháng, bên B làm  thủ tục đối soát số liệu với 1PAY trên website 1pay.vn. Số liệu đối soát được tính từ 00 giờ 00 phút 00 giây  ngày 1  đến 23 giờ 59 phút 59 giây ngày  cuối cùng của tháng. Để thanh toán doanh thu theo chu kỳ thanh toán 1 tháng,  doanh thu của bên B chỉ cần đạt được tối thiểu đúng bằng hạn mức thanh toán  500.000 ngàn/1 kỳ thanh toán. Sau khi 2 bên thống nhất và xác nhận số liệu đối  soát thì 1PAY sẽ thanh toán cho bên B sau 02 ngày làm việc kể từ khi bên A nhận  được Hồ sơ đề nghị thanh toán từ bên B (Bao gồm: Biên bản đối soát sản lượng,  doanh thu, Hóa đơn GTGT và đề nghị thanh toán). Số tiền bên B được thanh toán bằng  tổng doanh thu trong tháng trừ đi các khoản tạm ứng (nếu có) và các khoản giảm  trừ khác (nếu có).<br />
									  <strong>(Biểu mẫu đối soát và thanh toán doanh thu kèm theo  phụ lục)</strong>
								</p>
				            </div>
				            
				            <form:form method="post" id="fm1" commandName="term-service-apps" cssClass="fm-v clearfix" htmlEscape="true">
				            <div class="srv_row">
				            	<form:checkbox path="is_accept"/>
				            	<label for="chck_rule">&nbsp;Đồng ý quy định trên</label> 
				            </div>
				            <div class="btn_row">
								<input class="btn_greensmall" type="submit" id="btnSubmit" name="submit" value="Chấp nhận" accesskey="l"/>
								<input class="btn_graysmall" type="reset" name="reset" value="Hủy bỏ" />
				            </div>
				            </form:form>
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
