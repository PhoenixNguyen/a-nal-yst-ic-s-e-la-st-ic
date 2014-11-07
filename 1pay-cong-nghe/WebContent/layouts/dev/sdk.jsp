<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<%
	request.setAttribute("menuNhaPhatTrien", true);
	request.setAttribute("colors", new String[] {"yellow", "green", "red", "blue", "purple"});
%>
<head>
	<jsp:include page="head.jsp" />
	<link href="<%=request.getContextPath()%>/assets/css/pages/timeline.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.share-box {background: #eee; border: 1px #ddd solid; padding: 10px; margin-bottom: 15px; min-height: 20px; border-radius: 2px; -webkit-border-radius: 2px; -moz-border-radius: 2px; -khtml-border-radius: 2px; border-radius: 2px;}
	</style>
</head>
<body class="page-boxed page-header-fixed">
	<jsp:include page="header.jsp" />
	
	<!-- BEGIN CONTAINER -->
	<div class="container">
		<div class="page-container">
			<jsp:include page="sidebar.jsp" />
			
			<!-- BEGIN CONTENT -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="col-md-8">
							<h2 id="art_title">
								Giới thiệu SDK
								<span class="pull-right" style="margin-left: 10px;">
									<span class="fb-like" data-href="" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></span>
								</span>
							</h2>
							<div style="line-height: 25px;">
								SDK giúp tích hợp các phương thức thanh toán của <a href="https://1pay.vn">1Pay.vn</a> vào Android Project, Windows Phone Project, iOS Project dễ dàng và đơn giản nhất.
								<ul>
									<li>Thanh toán thông qua thẻ cào (<a href="/mo-hinh-ket-noi?type=card#card">Card charging</a>).</li>
									<li>Thanh toán thông qua tin nhắn SMS (<a href="/mo-hinh-ket-noi?type=sms#sms">SMS Charging</a>).</li>
									<li>Thanh toán thông qua WAP (<a href="/mo-hinh-ket-noi?type=wap#wap">WAP Charging</a>).</li>
									<li>Thanh toán thông qua In-App (<a href="/mo-hinh-ket-noi?type=iac#iac">In-App Charging</a>).</li>
								</ul>
							</div>
							<br />
							<div align="center">
								<a href="#sdk-demo-download" data-toggle="modal" class="btn btn-lg green btn-download android-sdk-demo">
									 <i class="fa fa-android"></i> Android Demo 
								</a>
								<a href="#sdk-zip-download" data-toggle="modal" class="btn btn-lg green btn-download2 android-sdk-zip">
									 <i class="fa fa-download"></i> Source Project 
								</a>
								<br />
								<a href="#comming-soon" data-toggle="modal" class="btn btn-lg red btn-download android-sdk-demo">
									 <i class="fa fa-windows"></i> Windows Phone Demo 
								</a>
								<a href="#zip-comming-soon" data-toggle="modal" class="btn btn-lg red btn-download2 android-sdk-zip">
									 <i class="fa fa-download"></i> Source Project 
								</a>
								<br />
								<a href="#comming-soon" data-toggle="modal" class="btn btn-lg dark btn-download android-sdk-demo">
									 <i class="fa fa-apple"></i> IOs Demo 
								</a>
								<a href="#zip-comming-soon" data-toggle="modal" class="btn btn-lg dark btn-download2 android-sdk-zip">
									 <i class="fa fa-download"></i> Source Project 
								</a>
							</div>
							<br /><br />
							<div style="line-height: 25px;">
								<span class="pull-left"><i class="fa fa-book"></i> <strong>Tài liệu tích hợp SDK: </strong>&nbsp;</span>
								<span class="pull-left">
									<a class="green-text" href="/dev/home.dev?cid=53eb0a84e4b01b8087721425&sid=5407e533e4b004079097c45b"><i class="fa fa-android"></i> Android</a> |&nbsp;
								</span>
								<span class="pull-left">
									<a class="red-text" href="#"><i class="fa fa-windows"></i> Windows Phone</a> |&nbsp;
								</span>
								<span class="pull-left">
									<a class="dark-text" href="#"><i class="fa fa-apple"></i> IOs</a>
								</span>
							</div>
							
							<!-- POPUP -->
							<div class="modal fade" id="sdk-demo-download" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form name="sdk-demo-download" action="<%=request.getContextPath()%>/dev/sdk-api.dev">
											 <input type="hidden" name="a" value="sdk_demo" />
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Tải về SDK Demo</h4>
											</div>
											<div class="modal-body">
												<h5>Bạn đồng ý tải về phiên bản SDK Demo dành cho <span class="os">Android</span>?</h5>
											 	<c:if test="${account_logined != null && account_logined.isMerchant()}">
											 		<div class="form-group row">
														<label class="col-md-3 control-label">Chọn sản phẩm</label>
														<div class="col-md-9 products">
														</div>
													</div>
											 		<script type="text/javascript">
													$(document).ready(function() {
														var products_select_box = $('<select id="products" name="accesskey" class="form-control input-small select2me" data-placeholder="Sản phẩm..."></select>');
														$.getJSON("https://1pay.vn/console/get-products.wss?merchant=${model.merchantEncode}", function(data) {
															products_select_box.append('<option value=""></option>');
														    $.each(data, function (index, value) {
														    	products_select_box.append('<option value="'+value.access_key+'" secret="'+value.secret+'">'+value.title+'</option>');
														    });
															$('form[name=sdk-demo-download] .products').append(products_select_box);
															$('form[name=sdk-demo-download] .products select[name=accesskey]').select2({
													            placeholder: "Sản phẩm",
													            allowClear: true
													        });
														});
													});
													</script>
											 	</c:if>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Bỏ qua</button>
												<button type="submit" class="btn blue">Tải về</button>
											</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<div class="modal fade" id="sdk-zip-download" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form name="sdk-zip-download" action="<%=request.getContextPath()%>/dev/sdk-api.dev">
											 <input type="hidden" name="a" value="sdk_zip" />
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Tải về SDK Project</h4>
											</div>
											<div class="modal-body">
												<h5>Bạn đồng ý tải về project SDK Project dành cho <span class="os">Android</span>?</h5>
											 	<c:if test="${account_logined != null && account_logined.isMerchant()}">
											 		<div class="form-group row">
														<label class="col-md-3 control-label">Chọn sản phẩm</label>
														<div class="col-md-9 products">
														</div>
													</div>
											 		<script type="text/javascript">
													$(document).ready(function() {
														var products_select_box = $('<select id="products" name="accesskey" class="form-control input-small select2me" data-placeholder="Sản phẩm..."></select>');
														$.getJSON("https://1pay.vn/console/get-products.wss?merchant=${model.merchantEncode}", function(data) {
															products_select_box.append('<option value=""></option>');
														    $.each(data, function (index, value) {
														    	products_select_box.append('<option value="'+value.access_key+'" secret="'+value.secret+'">'+value.title+'</option>');
														    });
															$('form[name=sdk-zip-download] .products').append(products_select_box);
															$('form[name=sdk-zip-download] .products select[name=accesskey]').select2({
													            placeholder: "Sản phẩm",
													            allowClear: true
													        });
														});
													});
													</script>
											 	</c:if>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Bỏ qua</button>
												<button type="submit" class="btn blue">Tải về</button>
											</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<div class="modal fade" id="comming-soon" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form name="sdk-demo-download" action="<%=request.getContextPath()%>/dev/sdk-api.dev">
											 <input type="hidden" name="a" value="sdk_demo" />
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Tải về SDK Demo</h4>
											</div>
											<div class="modal-body">
												<h5>Comming soon!</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Đóng</button>
											</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<div class="modal fade" id="zip-comming-soon" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form name="sdk-demo-download" action="<%=request.getContextPath()%>/dev/sdk-api.dev">
											 <input type="hidden" name="a" value="sdk_zip" />
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Tải về SDK Project</h4>
											</div>
											<div class="modal-body">
												<h5>Comming soon!</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn default" data-dismiss="modal">Đóng</button>
											</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<br />
							<br />
						</div>
						<div class="col-md-4" align="center">
							<img src="<%=request.getContextPath()%>/images/sdk-galaxy-s6.png" alt="" style="max-width: 100%;">
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-md-12">
							<div class="share-box">
								<div class="fb-like" data-href="" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
							</div>
							<p></p>
							<div>
								<h3> Bình luận </h3>
								<div class="fb-comments" data-href="" data-numposts="5" data-colorscheme="light" data-width="100%"></div>
							</div>
							<script>
								$(document).ready(function() {
									$('.fb-comments').attr("data-href", document.URL);
									$('.fb-like').attr("data-href", document.URL);
								});
							</script>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h2 id="art_title">
								Các phiên bản SDK released
							</h2>
							<hr />
							<div style="float: right;">
								<span class="fa fa-plus-circle add-art add-button" data-toggle="modal" href="#add-art"
									art_cid="${(param.sid != null && fn:length(param.sid) > 0) ? param.sid : param.cid}"
									></span>
								<c:if test="${art != null}">
								<c:set var="tags" value="" />
								<c:forEach var="tag" items="${art.tags}" varStatus="status">
									<c:set var="tags" value="${tags}${fn:trim(tag)}${status.last?'':', '}" />
								</c:forEach>
								<span class="fa fa-pencil edit-art update-button" data-toggle="modal" href="#add-art"
									art_id="${art.id}"
									art_order="${art.order}"
									art_status="${art.status}"
									art_intro="${art.is_intro}"
									art_avatar="${art.avatar}"
									art_tags="${tags}"
									art_cid="${art.dev_category.id}"
									></span>
								</c:if>
							</div>
							<c:if test="${model.arts != null && fn:length(model.arts) > 0}">
								<br />
								<ul class="timeline">
								<c:forEach var="art" items="${model.arts}" varStatus="status">
									<li class="timeline-${colors[status.index mod fn:length(colors)]}">
										<div class="timeline-time">
											<span class="date"> <fmt:formatDate value="${art.created_time}" pattern="dd/MM/yyyy"/> </span> 
											<span class="time"> <fmt:formatDate value="${art.created_time}" pattern="HH:mm"/> </span>
										</div>
										<div class="timeline-icon"><i class="fa ${art.avatar}"></i></div>
										<div class="timeline-body">
											<h2>${art.title}</h2>
											<div class="timeline-content">
												${art.description}
											</div>
											<div class="timeline-footer">
												<a class="nav-link pull-right" href="<%=request.getContextPath()%>/dev/home.dev?cid=${art.dev_category.parent.id}&sid=${art.dev_category.id}&id=${art.id}"> Xem thêm <i class="m-icon-swapright m-icon-white">&nbsp;</i></a>
											</div>
										</div>
									</li>
								</c:forEach>
								</ul>
							</c:if>
						</div>
					</div>
					<!-- END PAGE CONTENT-->
				</div>
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END CONTAINER -->
	</div>
	
	<jsp:include page="footer.jsp" />
	
	<jsp:include page="include_popup.jsp" />
</body>
</html>