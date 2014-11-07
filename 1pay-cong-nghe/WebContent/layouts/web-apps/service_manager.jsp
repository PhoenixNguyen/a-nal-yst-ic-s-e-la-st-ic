<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
					<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<div class="left_cat">
							<ul class="sub_cat">

								<li><a href="#" class="qtr_svr">Quản trị dịch vụ</a>
									<ul>
										<li><a href="#">Tổng quát</a>
										</li>
										<li><a href="manage_svr.html" class="slc_link">Sản
												phẩm </a>
										</li>
										<li><a href="#">API Access</a>
										</li>


										<li><a href="#">Báo cáo </a>
										</li>
										<li><a href="#">Hạn mức </a>
										</li>
										<li><a href="manage_svr_doisoatthanhtoan.html">Đối
												soát & thanh toán </a>
										</li>
										<li><a href="manage_svr_hopdongdientu.html">Hợp đồng
												điện tử</a>
										</li>

									</ul></li>

							</ul>








							<ul class="sub_cat">
								<li><a href="#" class="help_normal">Help center</a>
									<ul>
										<li><a href="#">Liên hệ nhanh</a>
										</li>
										<li><a href="#">Trung tâm hỗ trợ</a>
										</li>

									</ul></li>


							</ul>
							<div>
								<a href="#" class="banner_sdk"></a> 
								<a href="#" class="banner_api"></a>
							</div>

						</div>
						<div class="right_content">
							<h1 class="srv_title">Sản phẩm</h1>


							<div class="dash_row">
								<div id="dash_tab">
									<a href="#" class="tab_slc"><span>Tất cả</span>
									</a> <a href="#" class="tab"><span>Đã kích hoạt (4)</span>
									</a> <a href="#" class="tab"><span>Chưa kích hoạt (4)</span>
									</a><a href="#" class="export_link"><span>Export files</span>
									</a><a href="#" class="addproduct_link"><span>Thêm sản
											phẩm</span>
									</a>
									<div class="clear"></div>
								</div>

							</div>
							<div id="filter_locketqua">

								<h3 class="filter_label open">
									<a href="#">Lọc kết quả</a>
								</h3>

							</div>

							<div class="box_locketqua">

								<div class="filter_row">

									<div class="input-prepend">
										<span class="add-on">Chọn ngày:</span> <input type="text"
											name="reservation" id="reservation" class="txt_calendar"
											value="05/22/2013 - 05/23/2013">
									</div>
									<script type="text/javascript">
										$(document)
												.ready(
														function() {
															$('#reservation')
																	.daterangepicker(
																			{
																				startDate : Date
																						.today()
																						.moveToFirstDayOfMonth()
																						.add(
																								6)
																						.days(),
																				endDate : Date
																						.today()
																						.moveToFirstDayOfMonth()
																						.add(
																								13)
																						.days()
																			});
														});
									</script>
								</div>



								<div class="filter_row">
									<div class="product_slc_filter">
										<label class="product_lbl_filter">Status:</label> <select
											class="product_filter">
											<option>Tất cả</option>
											<option>Bật</option>
											<option>Tắt</option>
										</select>

									</div>
									<div class="product_slc_filter">
										<label class="product_lbl_filter">Charging Status:</label> <select
											class="product_filter">
											<option>Tất cả</option>
											<option>Đã kích hoạt</option>
											<option>Đang chờ duyệt</option>
											<option>Reject</option>
											<option>Chưa kích hoạt</option>
										</select>

									</div>

									<div class="product_slc_filter">
										<label class="product_lbl_filter">Loại charging:</label> <select
											class="product_filter">
											<option>Tất cả</option>
											<option>Card charging</option>
											<option>Sms charging</option>
											<option>Wap charging</option>
											<option>Direct charging</option>
											<option>Sub charging</option>
										</select>
									</div>

								</div>




								<div class="filter_row">
									<div class="field">
										<div style="padding-bottom: 5px; overflow: hidden;">
											<input type="checkbox" value="prvChkAll" name="prvChkAll"
												id="prvChkAll" class="chck_filter"> <label
												class="lbl_chcksub_admin" for="prvChkAll"> Merchant
													<script type="text/javascript">
														$(document)
																.ready(
																		function() {
																			$(
																					'#prvChkAll')
																					.click(
																							function() {
																								$(
																										this)
																										.closest(
																												'.field')
																										.find(
																												'input[type=checkbox]')
																										.prop(
																												'checked',
																												this.checked);
																							});
																		});
													</script> </label>
										</div>
										<div class="clear"></div>
										<div>
											<input type="checkbox" title="nganluong" value="nganluong"
												name="provider" class="chck_filter" id="chck_cmn"> <label
												for="chck_cmn" class="lbl_chcksub"> cmn</label> <input
												type="checkbox" title="fpt" value="fpt" name="provider"
												class="chck_filter" id="chck_icom"> <label
													for="chck_icom" class="lbl_chcksub">icom</label> <input
													type="checkbox" title="viettel_telecom"
													value="viettel_telecom" name="provider" class="chck_filter"
													id="chck_minhnhb"> <label for="chck_minhnhb"
														class="lbl_chcksub">minhnhb</label> <input type="checkbox"
														title="abc" value="abc" name="provider"
														class="chck_filter" id="chck_mwork"> <label
															for="chck_mwork" class="lbl_chcksub"> mwork</label>
										</div>
									</div>

								</div>



								<div class="filter_row">
									<a href="#" class="btn_greensmall">Lọc kết quả</a>
								</div>

							</div>
							<div class="srv_row">
								<table width="100%" cellspacing="0" cellpadding="0" border="1"
									style="border-color: #CCC">
									<tbody>
										<tr>
											<td class="transhead" width="250">Tên sản phẩm</td>
											<td class="transhead" width="230">Mô tả</td>
											<td class="transhead">Charging</td>
											<td class="transhead" width="105">Actions</td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_01" checked>
														<label class="onoffswitch-label" for="svr_01">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_02"> <label
														class="onoffswitch-label" for="svr_02">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_03"> <label
														class="onoffswitch-label" for="svr_03">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_04" checked>
														<label class="onoffswitch-label" for="svr_04">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_05" checked>
														<label class="onoffswitch-label" for="svr_05">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_06" checked>
														<label class="onoffswitch-label" for="svr_06">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_07"> <label
														class="onoffswitch-label" for="svr_07">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>
										<tr>
											<td class="svr_data_name"><img src="images/boxvideo.gif"
												border="0" align="absmiddle" /> Tuyển chọn CLIP Nóng Bỏng
												Mắt</td>
											<td class="svr_data">Tuyển tập 50.000 CLIP nóng Bỏng
												Mắt.</td>
											<td class="svr_data"><a class="card_normal"
												title="Đã kích hoạt dịch vụ Card charging"
												href="#cardchar_pop" name="cardchar_pop" id="go"
												rel="leanModal"></a> <a class="sms_active"
												title="Đang chờ duyệt" href="#smschar_pop"
												name="smschar_pop" id="go" rel="leanModal"></a> <span
												class="wap_invi" title="Chưa kích hoạt"></span> <span
												class="direct_invi" title="Chưa kích hoạt"></span> <span
												class="sub_invi" title="Chưa kích hoạt"></span> <a
												class="more_normal" title="Kích hoạt dịch vụ" href="5.html"></a>
											</td>
											<td class="svr_data"><a href="manage_svr_details.html"
												class="act_edit" title="Cấu hình"></a>
												<div class="onoffswitch">
													<input type="checkbox" name="onoffswitch"
														class="onoffswitch-checkbox" id="svr_08"> <label
														class="onoffswitch-label" for="svr_08">
															<div class="onoffswitch-inner"></div>
															<div class="onoffswitch-switch"></div> </label>
												</div></td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="srv_row">
								<a class="split_slc" href="#">1</a> <a class="split_no" href="#">2</a><a
									class="split_no" href="#">3</a><a class="split_no" href="#">4</a><a
									style="margin-left: 5px;" class="link_green" href="#"><strong>Xem
										tiếp...</strong>
								</a>
							</div>
						</div>


					</div>


				</div>


				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
			<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>

	<jsp:include page="include_popup.jsp" />
	
</body>

</html>