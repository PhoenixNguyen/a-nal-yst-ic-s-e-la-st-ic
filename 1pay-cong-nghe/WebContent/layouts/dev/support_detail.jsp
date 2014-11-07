<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>

<c:set var="art" value="${model.art}" />
<c:if test="${art == null && model.arts != null && fn:length(model.arts) > 0}">
	<c:forEach var="_art" items="${model.arts}">
		<c:if test="${art == null && _art.is_intro}">
			<c:set var="art" value="${_art}" />
		</c:if>
	</c:forEach>
	<c:if test="${art == null}">
		<c:set var="art" value="${model.arts[0]}" />
	</c:if>
</c:if>
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

<c:if test="${art != null}">
<style>
	.share-box {background: #eee; border: 1px #ddd solid; padding: 10px; margin-bottom: 15px; min-height: 20px; border-radius: 2px; -webkit-border-radius: 2px; -moz-border-radius: 2px; -khtml-border-radius: 2px; border-radius: 2px;}
</style>
<div class="row">
	<div class="col-md-12">
		<h2 id="art_title">
			${art.title}
			<span class="pull-right" style="margin-left: 10px;">
				<span class="fb-like" data-href="" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></span>
			</span>
		</h2>
		<div class="clearfix"></div>
		<div>
			<strong id="art_description">${art.description}</strong>
		</div>
		<br />
		<c:if test="${account_logined != null && account_logined.isMerchant() && param.cid == '53e9e0c3e4b0f1a79cb19e0e'}">
		<script type="text/javascript">
		$(document).ready(function() {
			var products_select_box = $('<select id="products" name="products" class="form-control input-small select2me" data-placeholder="Sản phẩm..."></select>');
			$.getJSON("https://1pay.vn/console/get-products.wss?merchant=${model.merchantEncode}", function(data) {
				products_select_box.append('<option value=""></option>');
			    $.each(data, function (index, value) {
			    	products_select_box.append('<option value="'+value.access_key+'" secret="'+value.secret+'">'+value.title+'</option>');
			    });
				$('#art_title').append($('<div class="form-group" style="width:auto; float: right;"></div>').append(products_select_box));
				$('#art_title select[name=products]').select2({
		            placeholder: "Sản phẩm",
		            allowClear: true
		        });
			});
			
			$('#art_title select[name=products]').live('change', function() {
				var content = $('#art_content').html();
				var access_key = $(this).val();
				var secret_key = $('option:selected', $(this)).attr('secret');
				
				if(access_key == undefined) access_key = '';
				if(secret_key == undefined) secret_key = '';
				
				content = content.replace(/access_key = \'(.*?)\';/, "access_key = '"+access_key+"';")
									.replace(/access_key = \"(.*?)\";/, "access_key = \""+access_key+"\";")
									.replace(/secret = \'(.*?)\';/, "secret = '"+secret_key+"';")
									.replace(/secret = \"(.*?)\";/, "secret = \""+secret_key+"\";");
				$('#art_content').html(content);
			});
		});
		</script>
		</c:if>
		<div id="art_content">
			${art.content}
		</div>
	
		<div class="clearfix"></div>
		<br />
		<div class="share-box">
			<div class="fb-like" data-href="" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
		</div>
		<!-- <div class="share-box" align="right"></div> -->
		<!-- <script>
			$(document).ready(function() {
				$('.share-box').sharebox({
					services : "facebook twitter google+ linkedin"
				});
			});
		</script> -->
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
	
	<c:set var="key" value="cate_relate" />
	<c:if test="${model[key] != null && fn:length(model[key]) > 0}">
	<div class="clearfix"></div>
	<hr />
	<div class="col-md-12">
		<h4>
			<strong>Các câu hỏi khác</strong>
		</h4>
		<br />
		<c:forEach var="art" items="${model[key]}" end="4">
		<p>
			<a href="<%=request.getContextPath() %>/dev/support.dev?cid=${art.dev_category.parent.id}&sid=${art.dev_category.id}&id=${art.id}">${art.title}</a>
		</p>
		</c:forEach>
	</div>
	</c:if>
</div>
</c:if>
