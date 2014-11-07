<%@page import="vn.onepay.dev.model.DevCategory"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>

<div id="add-cate" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form role="form" method="post" name="cate_update" action="<%=request.getContextPath()%>/dev/dev-api.dev">
				<input type="hidden" name="a" value="update_cate" />
				<input type="hidden" name="cid" id="cid" value="" />
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title">Thêm chuyên mục</h4>
				</div>
				<div class="modal-body">
					<div class="scroller" style="height: 300px" data-always-visible="1"
						data-rail-visible1="1">
						<div class="row">
							<div class="col-md-12">
								<div class="form-body">
									<div class="row">
										<div class="form-group">
											<label class="col-md-4 control-label">Chuyên mục cha</label>
											<div class="col-md-8">
												<select id="pid" name="pid" class="bs-select form-control input-medium" data-style="blue">
													<option value="">---- Chuyên mục gốc ----</option>
													${model.cateOptions }
												</select>
											</div>
										</div>
										<div class="clearfix"></div>
										<br />
										<div class="form-group">
											<label class="col-md-4 control-label">Tên chuyên mục</label>
											<div class="col-md-4">
												<input type="text" class="form-control input-medium" id="title" name="title" placeholder="Ví dụ: SMS Charging." />
											</div>
											<div class="col-md-4">
												<select id="categoryType" name="categoryType" class="bs-select form-control input-small" data-style="green">
													<% for(String ct : DevCategory.ALL_CATEGORY_TYPE) { %>
													<option value="<%=ct%>"><%=ct%></option>
													<% } %>
												</select>
											</div>
										</div>
										<div class="clearfix"></div>
										<br />
										<div class="form-group">
											<label class="col-md-4 control-label">URL</label>
											<div class="col-md-8">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-globe"></i>
													</span>
													<input type="text" id="url" name="url" class="form-control" placeholder="http://dev.1pay.vn/">
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
										<br />
										<div class="form-group col-md-4">
											<label>Icon</label>
											<div>
												<select id="icon" name="icon" class="bs-select form-control input-small" data-show-subtext="true" style="text-transform: capitalize;">
													<c:forEach var="icon" items="${model.allIcons }">
														<option data-icon="${icon} icon-default" value="${icon}" style="text-transform: capitalize;">${fn:replace(icon, 'fa-', '')}</option>	
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group col-md-4">
											<label>Thứ tự hiển thị</label>
											<div>
												<input type="number" id="order" name="order" value="999" class="form-control input-small" placeholder="Icon">
											</div>
										</div>
										<div class="form-group col-md-4">
											<label>Hiển thị</label>
											<div>
												<select id="status" name="status" class="bs-select form-control input-small" data-style="yellow">
													<% for(String st : DevCategory.ALL_ADMIN_STATUS) { %>
													<option value="<%=st%>"><%=st%></option>
													<% } %>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label>Mô tả</label>
										<textarea id="description" name="description" class="form-control" rows="3"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn default">Hủy bỏ</button>
					<button type="submit" class="btn green">Thêm mới</button>
				</div>
			</form>
			<script type="text/javascript">
				$(document).ready(function() {
					$('.add-cate').live('click', function() {
						$('form[name=cate_update] .modal-title').html('Thêm mới chuyên mục');
						$('form[name=cate_update] button[type=submit]').html('Thêm mới');
						var pid = $(this).attr('cate_id');
						var cate_type = $(this).attr('cate_type');
						
						$('form[name=cate_update] #cid').val('');
						$('form[name=cate_update] #title').val('');
						$('form[name=cate_update] #description').val('');
						$('form[name=cate_update] #url').val('');
						$('form[name=cate_update] #order').val(999);
						onepay.setSelectBoxValue('form[name=cate_update] #categoryType', 'categoryType', cate_type);
						onepay.setSelectBoxValue('form[name=cate_update] #status', 'status', '');
						onepay.setSelectBoxValue('form[name=cate_update] #icon', 'icon', '');
						onepay.setSelectBoxValue('form[name=cate_update] #pid', 'pid', pid);
					});
					
					$('.edit-cate').live('click', function() {
						$('form[name=cate_update] .modal-title').html('Cập nhật chuyên mục');
						$('form[name=cate_update] button[type=submit]').html('Cập nhật');
						var id = $(this).attr('cate_id');
						var title = $(this).attr('cate_title');
						var cate_type = $(this).attr('cate_type');
						var description = $(this).attr('cate_description');
						var order = $(this).attr('cate_order');
						var status = $(this).attr('cate_status');
						var icon = $(this).attr('cate_icon');
						var pid = $(this).attr('cate_pid');
						var url = $(this).attr('cate_url');

						$('form[name=cate_update] #cid').val(id);
						$('form[name=cate_update] #title').val(title);
						$('form[name=cate_update] #description').val(description);
						$('form[name=cate_update] #url').val(url);
						$('form[name=cate_update] #order').val(order);
						onepay.setSelectBoxValue('form[name=cate_update] #categoryType', 'categoryType', cate_type);
						onepay.setSelectBoxValue('form[name=cate_update] #status', 'status', status);
						onepay.setSelectBoxValue('form[name=cate_update] #icon', 'icon', icon);
						onepay.setSelectBoxValue('form[name=cate_update] #pid', 'pid', pid);
					});
					
					$('form[name=cate_update]').submit(function() {
						var formName = $('form[name=cate_update] button[type=submit]').text();
						
						if(!confirm('Bạn có chắc chắn muốn ' + formName.toLowerCase() + ' chuyên mục?'))
							return false;
						
						if($('form[name=cate_update] input[name=title]').val().trim().length <= 0) {
							alert('Tên chuyên mục không được bỏ trống.');
							return false;
						}
						if($('form[name=cate_update] input[name=order]').val().trim().length <= 0) {
							alert('Thứ tự hiển thị không được bỏ trống.');
							return false;
						}
						
						$.post($(this).attr('action'), $(this).serialize(), function(result) {
							if(result == '1') {
								alert(formName + ' thành công.');
								window.location = (window.location + '').substring(0, (window.location + '').indexOf('#'));
							} else {
								alert(result);
							}
						}, 'text');
						
						return false;
					});
				});
			</script>
		</div>
	</div>
</div>

<div id="add-art" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form role="form" method="post" name="art_update" action="<%=request.getContextPath()%>/dev/dev-api.dev">
				<input type="hidden" name="a" value="update_art" />
				<input type="hidden" name="id" id="id" value="" />
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title">Thêm bài viết</h4>
				</div>
				<div class="modal-body">
					<div class="scroller" style="height: 400px" data-always-visible="1"
						data-rail-visible1="1">
						<div class="row">
							<div class="col-md-12">
								<div class="form-body">
									<div class="row">
										<div class="form-group">
											<label class="col-md-2 control-label">Chuyên mục</label>
											<div class="col-md-10">
												<select id="cid" name="cid" class="bs-select form-control input-medium" data-style="blue">
													${model.cateOptions }
												</select>
											</div>
										</div>
										<div class="clearfix"></div>
										<br />
										<div class="form-group">
											<label class="col-md-2 control-label">Tiêu đề</label>
											<div class="col-md-10">
												<input type="text" class="form-control input-full" id="title" name="title" placeholder="Ví dụ: SMS Charging." />
											</div>
										</div>
										<div class="clearfix"></div>
										<br />
										<div class="form-group col-md-3">
											<label>Ảnh đại diện</label>
											<div>
												<select id="avatar" name="avatar" class="bs-select form-control input-small" data-show-subtext="true" style="text-transform: capitalize;">
													<c:forEach var="icon" items="${model.allIcons }">
														<option data-icon="${icon} icon-default" value="${icon}" style="text-transform: capitalize;">${fn:replace(icon, 'fa-', '')}</option>	
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group col-md-3">
											<label>Thứ tự hiển thị</label>
											<div>
												<input type="number" id="order" name="order" value="999" class="form-control input-small" placeholder="Icon">
											</div>
										</div>
										<div class="form-group col-md-3">
											<label>Hiển thị</label>
											<div>
												<select id="status" name="status" class="bs-select form-control input-small" data-style="yellow">
													<% for(String st : DevCategory.ALL_ADMIN_STATUS) { %>
													<option value="<%=st%>"><%=st%></option>
													<% } %>
												</select>
											</div>
										</div>
										<div class="form-group col-md-3">
											<div class="checkbox-list">
												<label><input type="checkbox" id="intro" name="intro" value="1"> Bài viết mặc định của chuyên mục </label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-8">
											<label>Mô tả</label>
											<textarea id="description" name="description" class="form-control" rows="3"></textarea>
										</div>
										<div class="form-group col-md-4">
											<label>Tags</label>
											<textarea id="tags" name="tags" class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="form-group">
										<label>Nội dung</label>
										<textarea id="content" name="content" class="form-control ckeditor" rows="6"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn default">Hủy bỏ</button>
					<button type="submit" class="btn green">Thêm mới</button>
				</div>
			</form>
			<script type="text/javascript">
				$(document).ready(function() {
					$('.add-art').live('click', function() {
						$('form[name=art_update] .modal-title').html('Thêm mới bài viết');
						$('form[name=art_update] button[type=submit]').html('Thêm mới');
						var cid = $(this).attr('art_cid');

						$('form[name=art_update] #id').val('');
						$('form[name=art_update] #title').val('');
						$('form[name=art_update] #description').val('');
						$('form[name=art_update] #order').val('999');
						$('form[name=art_update] #tags').val('');
						CKEDITOR.instances.content.setData('');
						onepay.setSelectBoxValue('form[name=art_update] #status', 'status', '');
						onepay.setSelectBoxValue('form[name=art_update] #avatar', 'avatar', '');
						onepay.setSelectBoxValue('form[name=art_update] #cid', 'cid', cid);
						$('form[name=art_update] #intro').attr('checked', false);
						$.uniform.update('form[name=art_update] #intro');
					});
					
					$('.edit-art').live('click', function() {
						$('form[name=art_update] .modal-title').html('Cập nhật bài viết');
						$('form[name=art_update] button[type=submit]').html('Cập nhật');
						var id = $(this).attr('art_id');
						var order = $(this).attr('art_order');
						var status = $(this).attr('art_status');
						var avatar = $(this).attr('art_avatar');
						var cid = $(this).attr('art_cid');
						var intro = $(this).attr('art_intro');
						var tags = $(this).attr('art_tags');
						var title = $('#art_title').text().trim();
						var description = $('#art_description').html();
						var content = $('#art_content').html();

						$('form[name=art_update] #id').val(id);
						$('form[name=art_update] #title').val(title);
						$('form[name=art_update] #description').val(description);
						$('form[name=art_update] #order').val(order);
						$('form[name=art_update] #tags').val(tags);
						CKEDITOR.instances.content.setData(content);
						onepay.setSelectBoxValue('form[name=art_update] #status', 'status', status);
						onepay.setSelectBoxValue('form[name=art_update] #avatar', 'avatar', avatar);
						onepay.setSelectBoxValue('form[name=art_update] #cid', 'cid', cid);
						if(intro == '1' || intro == 'true')
							$('form[name=art_update] #intro').attr('checked', true);
						else
							$('form[name=art_update] #intro').attr('checked', false);
						$.uniform.update('form[name=art_update] #intro');
					});
					
					$('form[name=art_update]').submit(function() {
						var formName = $('form[name=art_update] button[type=submit]').text();
						
						if(!confirm('Bạn có chắc chắn muốn ' + formName.toLowerCase() + ' bài viết?'))
							return false;
						
						//update ckeditor to element
						onepay.ckeditor();
						
						if($('form[name=art_update] input[name=title]').val().trim().length <= 0) {
							alert('Tiêu đề bài viết không được bỏ trống.');
							return false;
						}
						if($('form[name=art_update] input[name=order]').val().trim().length <= 0) {
							alert('Thứ tự hiển thị không được bỏ trống.');
							return false;
						}
						
						$.post($(this).attr('action'), $(this).serialize(), function(result) {
							if(result == '1') {
								alert(formName + ' thành công.');
								window.location = (window.location + '').substring(0, (window.location + '').indexOf('#'));
							} else {
								alert(result);
							}
						}, 'text');
						
						return false;
					});
				});
			</script>
		</div>
	</div>
</div>