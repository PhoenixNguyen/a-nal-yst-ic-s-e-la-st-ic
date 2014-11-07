<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<display:setProperty name="paging.banner.placement" value="bottom" />
<display:setProperty name="paging.banner.group_size">4</display:setProperty>
<display:setProperty name="paging.banner.page.separator"> </display:setProperty>
<display:setProperty name="paging.banner.item_name">
	<span class="pagebanner"> Results </span>
</display:setProperty>
<display:setProperty name="paging.banner.items_name">
	<span class="pagebanner"> Results </span>
</display:setProperty>
<display:setProperty name="paging.banner.no_items_found">
	<span class="pagebanner"> Not found. </span>
</display:setProperty>
<display:setProperty name="paging.banner.one_item_found">
	<span class="pagebanner"> One {0} found. </span>
</display:setProperty>
<display:setProperty name="paging.banner.all_items_found">
	<!-- <span class="pagebanner"> {0} {1} tìm thấy, hiển thị tất cả {2}. </span> --> 
	<span class="pagebanner"></span> 
</display:setProperty>
<display:setProperty name="paging.banner.some_items_found">
	<!-- <span class="pagebanner"> {0} {1} tìm thấy, hiển thị từ {2} tới {3}. </span> -->
	<span class="pagebanner"></span> 
</display:setProperty>
<display:setProperty name="paging.banner.full">
	<span class="pagelinks">
		{0}  
		<a href="{1}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">&lt;&lt; First</a>
		<a href="{2}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">&lt; Previous</a>&nbsp;| 
		<a href="{3}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">Next &gt;</a>
		<a href="{4}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">Last &gt;&gt;</a>
	</span> 
</display:setProperty>
<display:setProperty name="paging.banner.first">
	<span class="pagelinks"> 
		{0} 
		<a href="{3}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">Next &gt;</a>
		<a href="{4}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">Last &gt;&gt;</a>
	</span>
</display:setProperty>
<display:setProperty name="paging.banner.last">
	<span class="pagelinks"> 
		{0} 
		<a href="{1}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">&lt;&lt; First</a>
		<a href="{2}" class="link_green" style="margin-left: 5px;background: none;margin: 0;padding: 0;font-size: 9pt;">&lt; Previous</a> 
	</span>
</display:setProperty>
<display:setProperty name="paging.banner.page.selected"><strong style="margin-right: 10px;">{0}</strong></display:setProperty>
<display:setProperty name="paging.banner.onepage">
	<span class="pagelinks">{0}</span>
</display:setProperty>
<display:setProperty name="export.banner">
	<div class="exportlinks"> Export: {0} </div>
</display:setProperty>
<display:setProperty name="basic.msg.empty_list_row">
		<tr class="empty"><td colspan="{0}">There is no result.</td></tr> 
</display:setProperty>
<display:setProperty name="basic.msg.empty_list">
		There is no result. 
</display:setProperty>
