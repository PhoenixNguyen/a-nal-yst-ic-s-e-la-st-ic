<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="120"><img src="https://1pay.vn/images/logo_1pay.png" border="0" width="120"></td>
    <td align="center"><strong>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</strong><br />
      <em>Độc lập - Tự Do - Hạnh Phúc</em>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" align="center"><h2>THÔNG BÁO DOANH THU DỊCH VỤ THANH TOÁN</h2></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td align="center">KỲ ĐỐI SOÁT: <span style="color: red">[${model.comparison.title}] </span>  </td>
    <td align="center">
    	Từ: <span style="color: red">[00 giờ 00 phút 00 giây ngày ${model.comparison_start} đến hết 23 giờ 59 phút 59 giây ngày ${model.comparison_end}]</span>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">MÃ ĐỐI TÁC:
    	<span style="color: red">[${model.comparison.provider}]</span>
    	<span style="color: red">[${model.comparison.provider_name}]</span>
    </td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td align="center">HỢP ĐỒNG SỐ: <span style="color: red">[${model.comparison.contract_no}]</span>   </td>
    <td align="center">Ký HĐ ngày: <span style="color: red">[${model.contract_date}]</span></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">CHU KỲ THANH TOÁN: <span style="color: red">${model.comparison.payment_policy}</span></td>
  </tr>
</table>
<br><br>

<table width="100%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
  <tr>
    <th scope="col">STT</th>
    <th scope="col">Dịch vụ thanh toán</th>
    <th scope="col">Doanh thu chia sẻ (Không bao gồm VAT)</th>
    <th scope="col">Tỷ lệ chia sẻ Doanh thu <span style="color: red">[${model.comparison.provider}] </span>được hưởng</th>
    <th scope="col">Doanh thu 
	<span style="color: red">[${model.comparison.provider}] </span>được hưởng</th>
  </tr>
  
  <c:forEach items="${model.comparison.chargingComparisonGroups}" var="com_group" varStatus="i">
  <tr>
    <td align="center"><strong>${i.index+1}</strong></td>
    <td align="center"><strong>Dịch vụ thanh toán qua ${com_group.chargingService}</strong></td>
    <td align="right"></td>
    <td align="center"></td>
    <td align="right"></td>
  </tr>
  <tr>
    <td align="center"><strong>(1)</strong></td>
    <td align="center"><strong>(2)</strong></td>
    <td align="right"><strong>(3)</strong></td>
    <td align="center"><strong>(4)</strong></td>
    <td align="right"><strong>(5)=(3)*(4)*${com_group.rate}%</strong></td>
  </tr>
  
  <c:forEach items="${com_group.chargingComparisonElements}" var="com_element" varStatus="j">
  	  <tr>
	    <td align="center">${i.index+1}.${j.index+1}</td>
	    <td align="center">
	    	<c:choose>
	    		<c:when test="${com_element.chargingService =='CARD' }">
	    		Thẻ
	    		</c:when>
	    		<c:otherwise>
	    		Mạng
	    		</c:otherwise>
	    	</c:choose>
	    ${com_element.telco_name}
	    </td>
	    <fmt:formatNumber value="${com_element.amount}" var="amount" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
	    <td align="right"><c:out value="${amount}"></c:out></td>
	    <td align="center">
	    	<span style="color: red">${com_element.rate}%</span>
	    </td>
	    <fmt:formatNumber value="${com_element.revenue}" var="amount_merchant_received" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
	    <td align="right">${amount_merchant_received}</td>
	  </tr>
  </c:forEach>
  <tr>
    <td style="background: #ccc" align="center"></td>
    <td style="background: #ccc" align="center"><strong>Tổng ${i.index+1}</strong></td>
    <fmt:formatNumber value="${com_group.amount}" var="sum_group_amount" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td style="background: #ccc" align="right"><strong><c:out value="${sum_group_amount}"></c:out></strong></td>
    <td style="background: #ccc" align="center"></td>
    <fmt:formatNumber value="${com_group.revenue}" var="sum_group_amount_receive" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td style="background: #ccc" align="right"><strong><c:out value="${sum_group_amount_receive}"></c:out></strong></td>
  </tr>
  </c:forEach>
  
  <tr>
    <td style="background: #ccc" align="center"></td>
    <td style="background: #ccc" align="center"><strong>Tổng cộng Doanh thu (1+2+3) ( Không bao gồm VAT)</strong></td>
    <fmt:formatNumber value="${model.comparison.sum_total}" var="sum_123_group_amount" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td style="background: #ccc" align="right"><strong><c:out value="${sum_123_group_amount}"></c:out></strong></td>
    <td style="background: #ccc" align="center"></td>
    <fmt:formatNumber value="${model.comparison.sum_total_received}" var="sum_123_group_amount_receive" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td style="background: #ccc" align="right"><strong><c:out value="${sum_123_group_amount_receive}"></c:out></strong></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="50%"><strong>I - Tổng doanh thu  <span style="color: red"> [${model.comparison.provider}]  </span>  được hưởng là:</strong></td>
    <fmt:formatNumber value="${model.comparison.sum_total_received}" var="sum_total_received" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${sum_total_received}"></c:out> đồng (  Chưa bao gồm VAT ) </strong></td>
  </tr>
  <tr>
    <td width="50%"><strong>II - Tổng số tiền [${model.comparison.provider}] được hưởng từ chiết khấu đặc biệt là (II.1+II.2+II.3): </strong></td>
    <fmt:formatNumber value="${model.comparison.sum_discount}" var="sum_discount" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${sum_discount}"></c:out> đồng </strong></td>
  </tr>
  <c:forEach items="${model.comparison.chargingComparisonDiscounts}" var="discount_element" varStatus="i">
  <tr>
    <td width="50%" style="padding-left: 30px;"><strong>II.${i.index+1} - Số tiền chiết khấu đặc biệt từ <c:out value="${discount_element.chargingService }"/>(<c:out value="${discount_element.discountRate }"/>%)</strong></td>
    <fmt:formatNumber value="${discount_element.discount}" var="discount" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${discount}"></c:out> đồng </strong></td>
  </tr>
  </c:forEach>
  <tr>
    <td width="50%"><strong>III - Tổng doanh thu  <span style="color: red"> [${model.comparison.provider}]  </span>  được hưởng (I+II):</strong></td>
    <fmt:formatNumber value="${model.comparison.amount_merchant_received}" var="amount_merchant_received" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${amount_merchant_received}"></c:out> đồng </strong></td>
  </tr>
  <tr>
    <td width="50%"><strong>IV - Các chi phí [${model.comparison.provider}] bị giảm trừ là (IV.1+IV.2+IV.3+IV.4): </strong></td>
    <fmt:formatNumber value="${model.comparison.sum_fee}" var="sum_fee" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${sum_fee}"></c:out> đồng </strong></td>
  </tr>
  <tr>
    <td width="50%" style="padding-left: 30px;"><strong>IV.1 - Phí mở mã (80.000 đ/ mã):</strong></td>
    <fmt:formatNumber value="${model.comparison.fee_open}" var="fee_open" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${fee_open}"></c:out> đồng </strong></td>
  </tr>
  <tr>
    <td width="50%" style="padding-left: 30px;"><strong>IV.2 - Phí duy trì mã (32.000 đ/ mã):</strong></td>
    <fmt:formatNumber value="${model.comparison.fee_maintain}" var="fee_maintain" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${fee_maintain}"></c:out> đồng </strong></td>
  </tr>
  <tr>
    <td width="50%" style="padding-left: 30px;"><strong>IV.3 - Phí hoàn trả cước khách hàng khiếu nại (nếu có):</strong></td>
    <fmt:formatNumber value="${model.comparison.fee_chargeback}" var="fee_chargeback" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${fee_chargeback}"></c:out> đồng </strong></td>
  </tr>
  <tr>
    <td width="50%" style="padding-left: 30px;"><strong>IV.4 - Phí khác (nếu có):</strong></td>
    <fmt:formatNumber value="${model.comparison.fee_other}" var="fee_other" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${fee_other}"></c:out> đồng </strong></td>
  </tr>
  <tr>
    <td width="50%"><strong>V -  Tổng doanh thu <span style="color: red"> [${model.comparison.provider}]  </span> được hưởng còn lại (III-IV):</strong></td>
    <fmt:formatNumber value="${model.comparison.amount_merchant_received_after_free}" var="amount_merchant_received_after_free" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${amount_merchant_received_after_free}"></c:out> đồng</strong></td>
  </tr>
  <tr>
    <td width="50%"><strong>VI -  Tổng số tiền 1PAY đã tạm ứng  <span style="color: red"> [${model.comparison.provider}]  </span>  là:</strong></td>
    <fmt:formatNumber value="${model.comparison.advance_payment}" var="advance_payment" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${advance_payment}"></c:out> đồng</strong></td>
  </tr>
  
  <tr>
    <td width="50%"><strong>VII - Tổng số tiền 1PAY phải trả cho <span style="color: red">[${model.comparison.provider}] </span>   là (V-VI):</strong></td>
    <fmt:formatNumber value="${model.comparison.amount_merchant_final_received}" var="amount_merchant_final_received" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
    <td width="50%"><strong><c:out value="${amount_merchant_final_received}"></c:out> đồng</strong></td>
  </tr>
  <tr>
    <td colspan="2"><strong>Bằng chữ: <span style="color: red"><c:out value="${ onepay:numberToText(amount_merchant_final_received)}"/></span> đồng</strong></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="right" style="padding-top: 20px;"><em>Hà Nội, ${model.dd_mm_yyyy}.</em></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="60%" align="center"><strong>CTY TNHH 1PAY</strong></td>
    <td width="40%" align="center"><span style="color: red"><strong>[${model.comparison.provider_name}]</strong></span></td>
  </tr>
  <tr>
    <td width="60%" align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="5">
        	<tr>
            	<td style="padding-bottom: 200px"><strong>Giám đốc</strong></td>
                <td style="padding-bottom: 200px"> <strong>P.Kỹ thuật</strong></td>
                <td style="padding-bottom: 200px"><strong>P.Đối soát</strong></td>
            </tr>
        </table>
    </td>
    <td width="40%" align="center"></td>
  </tr>
</table>