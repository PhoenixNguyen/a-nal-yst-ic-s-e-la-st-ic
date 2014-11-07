<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ attribute name="treeMap" type="java.util.Map"%>
<%@ attribute name="level" type="java.lang.Long"%>

<c:forEach var="treeItem" items="${treeMap}">
  <%-- <a href="#" style="color: #39B54A; font-size: 14px;" class="Choose_cate" title = "${treeItem.key.title }" id="${treeItem.key.id }"> --%>
  <option value="${treeItem.key.id }" class="${treeItem.key.type }">
	  <c:forEach var="counter" begin="0" end="${level}">---</c:forEach>
	  ${treeItem.key.title }
  </option>
  <!-- </a> -->
  <br>
   
  <c:if test="${not empty treeItem.value}">
    <tag:treeOption treeMap="${treeItem.value}" level="${level+1}"/>
  </c:if>
</c:forEach>