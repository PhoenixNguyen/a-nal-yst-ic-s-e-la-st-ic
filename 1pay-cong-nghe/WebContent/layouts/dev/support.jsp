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
%>
<head>
	<jsp:include page="head.jsp" />
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
					<jsp:include page="support_search_form.jsp" />
					<!-- BEGIN PAGE CONTENT-->
					<c:choose>
						<c:when test="${param.s != null && fn:length(param.s) > 0}">
							<c:if test="${model.list != null && fn:length(model.list) > 0}">
								<div class="row">
									<div class="col-md-12">
										<c:if test="${model.total > 0}">
											<span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
										</c:if>
										<display:table name="model.list" id="list" 
														requestURI="support.dev" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: none;table-layout:fixed;margin-bottom: 10px;"
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="" maxWords="70" style="${list_rowNum mod model.pagesize == 0? '' : 'border-bottom:1px solid #E0DFDF; '}padding-bottom: 10px;">
												<h3><a href="<%=request.getContextPath() %>/dev/support.dev?cid=${list.dev_category.parent.id}&sid=${list.dev_category.id}&id=${list.id}">${list.title}</a></h3>
												<div>
													${list.content}
												</div>
											</display:column>
										</display:table>
										<script type="text/javascript">
											$(document).ready(function() {
												$('#list td h3 a').wrapInTag({
													  words: ["${fn:replace(param.s, ' ', '", "')}"]
													});
											});
										</script>
									</div>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<jsp:include page="support_detail.jsp" />
							<c:if test="${(param.cid == null || fn:length(param.cid) == 0 || (param.cid == '53f6c5cde4b017afe69b1ceb' && (param.sid == null || param.sid == ''))) && model.allCates != null && fn:length(model.allCates) > 0}">
								<c:set var="allCates" value="${model.allCates}" />
								<c:if test="${model.isDevManager && model.allCates[0].childs != null && fn:length(model.allCates[0].childs) > 0}">
									<c:set var="allCates" value="${model.allCates[0].childs}" />
								</c:if>
								
								<c:set var="key" value="cate_relate" />
								<c:if test="${model[key] != null && fn:length(model[key]) > 0}">
								<div class="row">
									<div class="col-md-12">
										<h4>
											<strong>Câu hỏi phổ biến</strong>
											<br />
											<span class="small">Bao gồm các câu hỏi thường gặp, hỏi nhiều ...</span>
										</h4>
									</div>
									<div class="clearfix"></div>
									<div class="col-md-6">
										<c:forEach var="art" items="${model[key]}" end="4">
										<p>
											<a href="<%=request.getContextPath() %>/dev/support.dev?cid=${art.dev_category.parent.id}&sid=${art.dev_category.id}&id=${art.id}">${art.title}</a>
										</p>
										</c:forEach>
									</div>
									<div class="col-md-6">
										<c:forEach var="art" items="${model[key]}" begin="5" end="9">
										<p>
											<a href="<%=request.getContextPath() %>/dev/support.dev?cid=${art.dev_category.parent.id}&sid=${art.dev_category.id}&id=${art.id}">${art.title}</a>
										</p>
										</c:forEach>
									</div>
									<div class="clearfix"></div>
									<div class="col-md-12"><hr /></div>
								</div>
								</c:if>
								<div class="row">
									<div class="col-md-12">
										<h4>
											<strong> Câu hỏi theo chuyên mục</strong>
											<br />
											<span class="small">Các câu hỏi được phân theo các chuyên mục</span>
										</h4>
									</div>
									<div class="clearfix"></div>
									<c:set var="topicCount" value="0" />
									<c:forEach var="cate" items="${allCates}" varStatus="status">
										<c:set var="key" value="cate_${cate.id}" />
										<c:if test="${model[key] != null && fn:length(model[key]) > 0}">
										<c:set var="topicCount" value="${topicCount + 1}" />
										<div class="col-md-6">
											<h5>
												<strong>${cate.title}</strong>
												<a href="<%=request.getContextPath() %>/dev/support.dev?cid=${cate.parent.id}&sid=${cate.id}" class="pull-right small">
													 Xem thêm <i class="fa fa-angle-right"></i>
												</a>
											</h5>
											<hr />
											<c:forEach var="art" items="${model[key]}" end="4">
											<p>
												<a href="<%=request.getContextPath() %>/dev/support.dev?cid=${art.dev_category.parent.id}&sid=${art.dev_category.id}&id=${art.id}">${art.title}</a>
											</p>
											</c:forEach>
										</div>
										<c:if test="${topicCount mod 2 == 0 || status.last}">
											<div class="clearfix"></div>
											<br />
										</c:if>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
							
							<c:if test="${model.list != null && fn:length(model.list) > 0}">
								<div class="row">
									<div class="col-md-12">
										<h4><strong>${model.list[0].dev_category.title}</strong></h4>
										<display:table name="model.list" id="list" 
														requestURI="support.dev" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: none;table-layout:fixed;margin-bottom: 10px;"
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="" maxWords="70" style="${list_rowNum mod model.pagesize == 0? '' : 'border-bottom:1px solid #E0DFDF; '}padding-bottom: 10px;">
												<h3><a href="<%=request.getContextPath() %>/dev/support.dev?cid=${list.dev_category.parent.id}&sid=${list.dev_category.id}&id=${list.id}">${list.title}</a></h3>
												<div>
													${list.content}
												</div>
											</display:column>
										</display:table>
										<c:if test="${model.total > 0}">
											<span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
										</c:if>
									</div>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
					
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