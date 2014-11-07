
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ attribute name="treeMap" type="java.util.Map"%>
<%@ attribute name="level" type="java.lang.Long"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@tag description="Descriptive Text" pageEncoding="UTF-8"%>

<div id="display_tree">
	<c:set var="index" value="0"/>
	<c:forEach var="treeItem" items="${treeMap}" varStatus="status">
	
	 <c:if test="${treeItem.key.sum_requesting > 0 || treeItem.key.first_period != 0 || treeItem.key.in_period != 0 || treeItem.key.last_period != 0}"> 
	 <c:set var="index" value="${index + 1 }"/>
	 
  	  	 <tr style="font-weight: bold;">
  	  	 	<fmt:formatNumber value="${treeItem.key.first_period }" maxFractionDigits="3" var="first_period1"/>
		    <fmt:formatNumber value="${treeItem.key.in_period }" maxFractionDigits="3" var="in_period1"/>
		    <fmt:formatNumber value="${treeItem.key.last_period}" maxFractionDigits="3" var="last_period1"/>
		    
		    <td style="text-align: center;" class="title_category">
		   
			  	<c:if test="${level ==1 || level == 2 }">
			  		<c:if test="${level ==1 }"><c:set var="lv" value="1"/></c:if>
			  		<c:if test="${level ==2 }"><c:set var="lv" value="2"/></c:if>
			  		
			  		<b><c:out value="${model.level[lv].get(index-1)}"/></b>
			  	</c:if>
			  
		    </td>
  	  	 	<td class="title_category">
  	  	 	  <c:if test="${level == 3 }">
  	  	 	  	-
  	  	 	  </c:if>
  	  	 	  <c:if test="${level == 4 }">
  	  	 	  	&nbsp&nbsp+
  	  	 	  </c:if>
  	  	 	  <c:if test="${level > 4 }">
  	  	 	  	<c:forEach var="counter" begin="5" end="${level}">&nbsp&nbsp&nbsp</c:forEach>
  	  	 	  </c:if>
			  
			  <b><c:out value="${treeItem.key.title }"/></b>
			</td>
  	  	 	<td style="text-align: right;">
  	  	 		<c:out value="${first_period1 }"/>
  	  	 	</td>
  	  	 	<td style="text-align: right;">
  	  	 		<c:out value="${in_period1 }"/>
  	  	 	</td>
  	  	 	<td style="text-align: right;">
  	  	 		<c:out value="${last_period1 }"/>
  	  	 	</td>
  	  	 	
  	  	 	<td>
  	  	 		<a onclick="alert('Hãy chọn chức năng quản lý danh mục để sửa danh mục này')">
	  				<img src="<%=request.getContextPath() %>/images/denghi.png" title="Sửa Danh mục" alt="" />
  				</a>
  				<a onclick='alert("Hãy xóa tất cả các bản ghi báo cáo để xóa danh mục này");'>
  					<img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa Danh mục" alt="" />
  				</a>
  	  	 	</td>
		  </tr>
		  
		  <c:set var="recordIndex" value="0" />
		  <c:forEach items="${model.recordList }" var="record" varStatus="status">
		  	<c:if test="${record.category_id ==  treeItem.key.id}">
		  	<c:set var="recordIndex" value="${recordIndex + 1}" />
		  		<div id="table_record">
			  			<tr ${record.request == "requesting"?"class='requesting_color' title='Chờ duyệt'":"" }>
			  				<fmt:formatNumber value="${record.first_period }" maxFractionDigits="3" var="first_period2"/>
						    <fmt:formatNumber value="${record.in_period }" maxFractionDigits="3" var="in_period2"/>
						    <fmt:formatNumber value="${record.last_period}" maxFractionDigits="3" var="last_period2"/>
						    
			  				<fmt:formatDate value="${record.month_year }" pattern="MM/yyyy" var="month_year"/>
			  				<td></td>
			  				<td ${record.request == "requesting"?"class='requesting_color'":"class='title_color'" }>
			  					<c:if test="${level > 3 }">
					  	  	 	  	<c:forEach var="counter" begin="4" end="${level}">&nbsp&nbsp&nbsp</c:forEach>
					  	  	 	 </c:if>
			  					${recordIndex}. ${record.title}
		  					</td>
					  		<td style="text-align: right;">${first_period2 }</td>
					  		<td style="text-align: right;">${in_period2 }</td>
					  		<td style="text-align: right;">${last_period2 }</td>
					  		<%-- <td style="text-align: center;">${month_year }</td>
					  		<td style="text-align: center;">${record.period }</td>
					  		<td style="color: #2C8F39;">${record.account }</td> --%>
					  		
					  		<td>
					  			
					  			<a href="javascript:void(0);" class="record_management_edit_popup" parent="${treeItem.key.title }" parent_id="${record.category_id }" id="${record.id }" title="${record.title }" type="${record.type }"
					  				first_period="${record.first_period }" in_period="${record.in_period }" last_period="${record.last_period }" 
					  				period="${record.period }" month_year="${month_year }" number_code="${record.code_name }" description="${record.description }" request="${record.request }">
					  				<img src="<%=request.getContextPath() %>/images/denghi.png" title="Sửa Bản ghi" alt="" />
				  				</a>
				  				<a href="cash-flow.html?delete_record=${record.id }&backURL=${model.currURL}" onclick='return confirm("Bạn có chắc chắn?");'>
				  					<img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa Bản ghi" alt="" />
				  				</a>
				  			</td>
				  			
				  		</tr>
		  		</div>
		  		 <!-- <br/> -->
		  	</c:if>
		  </c:forEach>
		  
		  <c:if test="${param.tab != 'amount' }">
			  <c:if test="${not empty treeItem.value}">
			    <tag:treeTr treeMap="${treeItem.value}" level="${level+1}"/>
			  </c:if>
		  </c:if>
		  
		  <c:if test="${param.tab == 'amount' }">
			  <c:if test="${not empty treeItem.value && treeItem.key.type != 'COST' && treeItem.key.type != 'REVENUE'}">
			    <tag:treeTr treeMap="${treeItem.value}" level="${level+1}"/>
			  </c:if>
		  </c:if>
	 </c:if>
	</c:forEach>
</div>