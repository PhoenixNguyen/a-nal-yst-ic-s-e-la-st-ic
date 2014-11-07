<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ attribute name="treeMap" type="java.util.Map"%>
<%@ attribute name="level" type="java.lang.Long"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@tag description="Descriptive Text" pageEncoding="UTF-8"%>

<div id="display_tree">
	<c:set var="index" value="0"/>
	<c:forEach var="treeItem" items="${treeMap}" varStatus="status">
	 <%-- <c:if test="${treeItem.key.first_period > 0 || treeItem.key.in_period > 0 || treeItem.key.last_period > 0 || true}"> --%>
	 <c:set var="index" value="${index + 1 }"/>
	 
  	  	 <tr style="font-weight: bold;">
		    
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
			
  	  	 	<td>
  	  	 		<a href="javascript:void(0);" class="category_management_edit_popup" parent_id="${treeItem.key.parentCategory.id }" parent="${treeItem.key.parentCategory.title }" id="${treeItem.key.id }" title="${treeItem.key.title }" code_name="${treeItem.key.code_name }" index="${treeItem.key.index }">
	  				<img src="<%=request.getContextPath() %>/images/denghi.png" title="Sửa Danh mục" alt="" />
  				</a>
  				<a href="cash-flow.html?delete_category=${treeItem.key.id }&backURL=${model.currURL}" onclick='return confirm("Bạn có chắc chắn?");'>
  					<img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa Danh mục" alt="" />
  				</a>
  	  	 	</td>
		  </tr>
		  
		  <c:if test="${not empty treeItem.value}">
		    <tag:treeCategoryTr treeMap="${treeItem.value}" level="${level+1}"/>
		  </c:if>
	 <%--  </c:if>  --%>
	</c:forEach>
</div>