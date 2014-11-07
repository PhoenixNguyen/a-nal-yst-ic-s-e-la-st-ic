<%@page import="vn.onepay.dev.model.DevCategory"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>

<!-- BEGIN SIDEBAR -->
<%
	request.setAttribute("CATEGORY_TYPE_NORMAL", DevCategory.CATEGORY_TYPE_NORMAL);
	request.setAttribute("CATEGORY_TYPE_POPULATION", DevCategory.CATEGORY_TYPE_POPULATION);
%>
<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<style>
			.add-button {position:absolute; top:1px; right:-20px;cursor: pointer;color:#ccc;z-index:1;${account_logined != null && model.isDevManager ? '':'display:none !important;'}}
			.update-button {position:absolute; top:16px; right:-20px;cursor: pointer;color:#ccc;z-index:1;${account_logined != null && model.isDevManager ? '':'display:none !important;'}}
			.fan-page {margin-top: 10px; overflow: hidden;text-align: center;height:385px;}
			@media (min-width: 992px) {
				.fan-page {max-width: 230px;margin-left: -5px;}
				.fan-page .list-group-item {margin-left: 5px;}
			}
			@media (min-width: 320px) and (max-width:992px) {
				.fan-page {width: 100%;}
			}
		</style>
		<ul class="page-sidebar-menu" data-auto-scroll="true"
			data-slide-speed="200">
			<!-- <li class="sidebar-toggler-wrapper">
				BEGIN SIDEBAR TOGGLER BUTTON
				<div class="sidebar-toggler hidden-phone"></div> 
				END SIDEBAR TOGGLER BUTTON
			</li> -->
			<!-- <li class="sidebar-search-wrapper">
				BEGIN RESPONSIVE QUICK SEARCH FORM
				<form class="sidebar-search" action="extra_search.html"
					method="POST">
					<div class="form-container">
						<div class="input-box">
							<a href="javascript:;" class="remove"> </a> <input type="text"
								placeholder="Search..." /> <input type="button" class="submit"
								value=" " />
						</div>
					</div>
				</form> 
				END RESPONSIVE QUICK SEARCH FORM
			</li> -->
			<c:if test="${model.allCates == null || fn:length(model.allCates) == 0}">
			<li class="start ${(menuNhaPhatTrien && empty(param.cid))?'active':'' }" style="position: relative;">
				<a href="<%=request.getContextPath() %>/dev/home.dev"> 
					<i class="fa fa-code"></i> <span class="title"> Nhà phát triển </span>
					<c:if test="${menuNhaPhatTrien}"><span class="selected"></span></c:if>
				</a>
				<span class="fa fa-plus-circle add-button" style="top:12px;" data-toggle="modal" href="#add-cate"></span>
			</li>
			</c:if>
			<c:forEach var="cate" items="${model.allCates}">
			<li class="${(param.cid == cate.id || param.sid == cate.id)?'active':'' }" style="position: relative;">
				<span class="fa fa-plus-circle add-cate add-button" data-toggle="modal" href="#add-cate"
						cate_id="${cate.id}"
						cate_type="${cate.category_type}"
						></span>
				<span class="fa fa-pencil edit-cate update-button" data-toggle="modal" href="#add-cate"
					cate_id="${cate.id}"
					cate_icon="${cate.icon}"
					cate_title="${fn:escapeXml(cate.title)}"
					cate_type="${cate.category_type}"
					cate_pid="${cate.parent != null?cate.parent.id:''}"
					cate_order="${cate.order}"
					cate_status="${cate.status}"
					cate_url="${cate.url}"
					cate_description="${fn:escapeXml(cate.description)}"
					></span>
				<c:set var="cateUrl"><%=request.getContextPath() %>/dev/${cate.category_type == CATEGORY_TYPE_NORMAL? 'home':'support'}.dev?cid=${cate.id}</c:set>
				<a href="${(cate.url != null && fn:length(cate.url) > 0) ? (cate.url=='#'?'javascript:;':cate.url) : cateUrl }"> 
					<i class="fa ${cate.icon }"></i> <span class="title"> ${cate.title } </span>
					<c:if test="${param.cid == cate.id || param.sid == cate.id}"><span class="selected"></span></c:if>
				</a>
				
				<c:if test="${cate.childs != null && fn:length(cate.childs) > 0}">
					<ul class="sub-menu">
					<c:forEach var="child" items="${cate.childs}">
						<li class="${(param.cid == child.id || param.sid == child.id)?'active':''}" style="position: relative;">
							<span class="fa fa-plus-circle add-cate add-button" data-toggle="modal" href="#add-cate"
								cate_id="${child.id}"
								cate_type="${child.category_type}"
								></span>
							<span class="fa fa-pencil edit-cate update-button" data-toggle="modal" href="#add-cate"
								cate_id="${child.id}"
								cate_icon="${child.icon}"
								cate_title="${fn:escapeXml(child.title)}"
								cate_type="${child.category_type}"
								cate_pid="${child.parent != null?child.parent.id:''}"
								cate_order="${child.order}"
								cate_status="${child.status}"
								cate_url="${child.url}"
								cate_description="${fn:escapeXml(child.description)}"
								></span>
							<c:set var="childUrl"><%=request.getContextPath() %>/dev/${cate.category_type == CATEGORY_TYPE_NORMAL? 'home':'support'}.dev?cid=${cate.id}&sid=${child.id}</c:set>
							<a href="${(child.url != null && fn:length(child.url) > 0) ? (child.url=='#'?'javascript:;':child.url) : childUrl }">
								<i class="fa ${child.icon }"></i> <span> ${child.title } </span>
								<c:if test="${(param.cid == child.id || param.sid == child.id)}">
									<span class="arrow right"></span>
								</c:if>
							</a>
						</li>
					</c:forEach>
					</ul>
				</c:if>
			</li>
			</c:forEach>
			
		</ul>
		<!-- END SIDEBAR MENU -->
		<!-- <facebook comment> -->
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=1481883285387935&version=v2.0";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<div class="fan-page">
			<div class="list-group-item bg-blue"><strong>Facebook 1PAY</strong></div>
			<div class="fb-like-box" data-href="https://www.facebook.com/1pay.vn" data-width="235" data-height="350" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>
		</div>
	</div>
</div>
<!-- END SIDEBAR -->