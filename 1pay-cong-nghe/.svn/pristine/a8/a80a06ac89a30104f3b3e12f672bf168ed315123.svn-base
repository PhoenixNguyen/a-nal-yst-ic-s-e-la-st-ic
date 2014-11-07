<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
<div class="left_cat">
	<ul class="sub_cat">
		 <ul class="sub_cat">
          	<li><a href="<%=request.getContextPath() %>/dich-vu.html" class="cat_head">Services</a></li>
          	<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=card" class="card_${cardCharging?'active':'normal'}">Card Charging</a></li>
          	<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=sms" class="sms_${smsCharging?'active':'normal'}">SMS Charging</a></li>
          	<li><a href="<%=request.getContextPath() %>/dich-vu.html?n=wap" class="wap_${wapCharging?'active':'normal'}">Wap Charging</a></li>
            <li><a href="<%=request.getContextPath() %>/dich-vu.html?n=iac" class="iac_${iacCharging?'active':'normal'}">In-App Charging</a></li>  
            <li><a class="direct_invi">Direct Charging</a></li>
            <li><a class="sub_invi">Sub Charging</a></li>
          </ul>
          
          <ul class="sub_cat">
              <li><a href="#" class="other_link">Blog services</a></li>
              <li><a href="http://forum.1pay.vn" class="other_link">Forum</a></li>
              <li><a href="http://docs.1pay.vn/doku.php?id=card-charging" class="other_link">Connect Support APis</a></li>
              
          </ul>
     </ul>
     <div>
		<a href="<%=request.getContextPath() %>/nha-phat-trien.html" class="banner_sdk"></a>
		<a href="<%=request.getContextPath() %>/nha-phat-trien.html" class="banner_api"></a>
	</div>
</div>