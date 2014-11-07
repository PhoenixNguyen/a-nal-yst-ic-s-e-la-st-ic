
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ attribute name="treeMap" type="java.util.Map"%>
<%@ attribute name="level" type="java.lang.Long"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@tag description="Descriptive Text" pageEncoding="UTF-8"%>

<style>
	#table_record tr{
		border-top: 1px solid #CCCCCC;
		border-right: 1px solid #CCCCCC;
		border-bottom: 1px solid #CCCCCC;
	}
	
	#table_record td{
		border-top: 1px solid #CCCCCC;
		border-right: 1px solid #CCCCCC;
		border-bottom: 1px solid #CCCCCC;
	}
</style>

<div id="display_tree">
	<table style="width: 100%;">
	<c:forEach var="treeItem" items="${treeMap}">
	  <tr>
	  	<td>
	  	  <table id="table_record" style="width: 100%; font-weight: bold;">
	  	  	 <tr>
	  	  	 	<fmt:formatNumber value="${treeItem.key.first_period }" maxFractionDigits="3" var="first_period1"/>
			    <fmt:formatNumber value="${treeItem.key.in_period }" maxFractionDigits="3" var="in_period1"/>
			    <fmt:formatNumber value="${treeItem.key.last_period}" maxFractionDigits="3" var="last_period1"/>
			    
	  	  	 	<td style="width: 25%;">
	  	  	 
				  <c:forEach var="counter" begin="0" end="${level}">---</c:forEach>
				  <b><c:out value="${treeItem.key.title }"/></b>
				</td>
	  	  	 	<td style="text-align: right; width: 15%;">
	  	  	 		<c:out value="${first_period1 }"/>
	  	  	 	</td>
	  	  	 	<td style="text-align: right; width: 15%;">
	  	  	 		<c:out value="${in_period1 }"/>
	  	  	 	</td>
	  	  	 	<td style="text-align: right; width: 15%;">
	  	  	 		<c:out value="${last_period1 }"/>
	  	  	 	</td>
	  	  	 	<td style="width: 10%;"></td>
	  	  	 	<td style="width: 5%;"></td>
	  	  	 	<td style="width: 10%;">${treeItem.key.account }</td>
	  	  	 	<td style="width: 5%;">
	  	  	 		<a href="#" class="category_management_edit_popup" parent_id="${treeItem.key.parentCategory.id }" parent="${treeItem.key.parentCategory.title }" id="${treeItem.key.id }" title="${treeItem.key.title }">
		  				<img src="<%=request.getContextPath() %>/images/denghi.png" title="Sửa Danh mục" alt="" />
	  				</a>
	  				<a href="cash-flow.html?delete_category=${treeItem.key.id }" onclick='return confirm("Bạn có chắc chắn?");'>
	  					<img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa Danh mục" alt="" />
	  				</a>
	  	  	 	</td>
			  </tr>
		  </table>
		  
		  <c:forEach items="${model.recordList }" var="record" varStatus="status">
		  	<c:if test="${record.category_id ==  treeItem.key.id}">
		  		<div id="table_record">
			  		<table class="table_view" style="width: 100%;">
			  			<tr>
			  				<fmt:formatNumber value="${record.first_period }" maxFractionDigits="3" var="first_period2"/>
						    <fmt:formatNumber value="${record.in_period }" maxFractionDigits="3" var="in_period2"/>
						    <fmt:formatNumber value="${record.last_period}" maxFractionDigits="3" var="last_period2"/>
						    
			  				<fmt:formatDate value="${record.month_year }" pattern="MM/yyyy" var="month_year"/>
			  				<td style="width: 25%;">${record.title}</td>
					  		<td style="text-align: right; width: 15%;">${first_period2 }</td>
					  		<td style="text-align: right; width: 15%;">${in_period2 }</td>
					  		<td style="text-align: right; width: 15%;">${last_period2 }</td>
					  		<td style="text-align: center; width: 10%;">${month_year }</td>
					  		<td style="text-align: center; width: 5%;">${record.period }</td>
					  		<td style="width: 10%;">${record.account }</td>
					  		
					  		<td style="width: 5%;">
					  			
					  			<a href="#" class="record_management_edit_popup" parent="${treeItem.key.title }" parent_id="${record.category_id }" id="${record.id }" title="${record.title }" type="${record.type }"
					  				first_period="${record.first_period }" in_period="${record.in_period }" last_period="${record.last_period }" 
					  				period="${record.period }" month_year="${month_year }">
					  				<img src="<%=request.getContextPath() %>/images/denghi.png" title="Sửa Bản ghi" alt="" />
				  				</a>
				  				<a href="cash-flow.html?delete_recode=${record.id }" onclick='return confirm("Bạn có chắc chắn?");'>
				  					<img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa Bản ghi" alt="" />
				  				</a>
				  			</td>
				  		</tr>
			  		</table>
		  		</div>
		  		 <!-- <br/> -->
		  	</c:if>
		  </c:forEach>
		  
		  <!-- <span style="float: right;">Value2</span> -->
		  <br>
	  	  
		  <c:if test="${not empty treeItem.value}">
		    <tag:treePrinterTable treeMap="${treeItem.value}" level="${level+1}"/>
		  </c:if>
	    </td>
	    
	  </tr>
	</c:forEach>
	</table>
</div>