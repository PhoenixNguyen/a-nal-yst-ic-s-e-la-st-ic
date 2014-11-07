<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
				<title>1Pay.vn - Ket noi nhanh, thanh toan linh hoat</title>
			</head>
			<body>
				<div>
					<table border="0" cellpadding="0" cellspacing="0" style="font: 11px Verdana, Arial, Helvetica, sans-serif; color: #333" width="580">
						<tbody>
							<tr valign="top">
								<td colspan="3">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td width="130px;"><a href="https://1pay.vn" target="_blank"><img src="https://1pay.vn/images/logo_1pay.png" border="0" alt="1Pay"/></a></td>
											</tr>
											<tr>
												<td><img alt="" border="0" height="10" src="https://1pay.vn/images/pixel.gif" width="1"/></td>
											</tr>
											<tr>
												<td></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<img height="13" src="https://1pay.vn/images/scr_emailTopCorners_580wx13h.gif" border="0" style="vertical-align: bottom" alt=""/>
								</td>
							</tr>
							<tr>
								<td width="12" style="background: url(http://1pay.vn/images/scr_emailLeftBorder_13wx1h.gif) left repeat-y; border-left: 1px solid #ddd">
									<img src="https://1pay.vn/images/pixel.gif" border="0" alt=""/>
								</td>
								<td style="width: 530px; word-wrap: break-word; padding: 12px; margin: 0" width="530">
									<table style="font: Verdana, Arial, Helvetica, sans-serif" width="100%">
										<tbody>
											<tr>
												<td></td>
											</tr>
										</tbody>
									</table>
									<p>
										Dear <strong>BOM</strong>,
									</p>
									<p>
										Thông báo số liệu thử nghiệm từ <xsl:value-of select="summary/fromTime"/> đến  <xsl:value-of select="summary/toTime"/>:
									</p>
									<p>
										Top <strong>Thuê bao</strong> thử nghiệm:
									</p>
									<p>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td align="center" ><strong>Thuê bao</strong></td>
												<td align="center"><strong>Merchant</strong></td>
												<td align="center"><strong>Tin nhắn</strong></td>
											</tr>
											<xsl:for-each select="summary/msisdn">
												<tr>
												<td><em><strong><xsl:value-of select="msisdn"/></strong></em></td>
												<td><xsl:value-of select="merchant"/></td>
												<td align="right"><xsl:value-of select="totalSMS"/></td>
											</tr>
											</xsl:for-each>
										</table>
									</p>
									<p>
										Top <strong>Merchants</strong> thử nghiệm:
									</p>
									<p>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td align="center"><strong>Merchant</strong></td>
												<td align="center"><strong>Thuê bao</strong></td>
												<td align="center"><strong>Tin nhắn</strong></td>
											</tr>
											<xsl:for-each select="summary/merchant">
											<tr>
												<td><em><strong><xsl:value-of select="merchant"/></strong></em></td>
												<td><xsl:value-of select="totalMSISDN"/></td>
												<td align="right"><xsl:value-of select="totalSMS"/></td>
											</tr>
											</xsl:for-each>
										</table>
									</p>
									<p>
										<a href="https://1pay.vn/cdr/sms-cdr-filter.cdr">Click vào đây để xem chi tiết</a>
									</p>
									<p>
										Yours sincerely,<br/> <strong>1Pay Team</strong>
									</p>
								</td>
								<td width="12" style="background: url(http://1pay.vn/images/scr_emailRightBorder_13wx1h.gif) left repeat-y; border-right: 1px solid #ddd">
									<img src="https://1pay.vn/images/pixel.gif" border="0" alt=""/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<img height="13" src="http://1pay.vn/images/scr_emailBottomCorners_580wx13h.gif" border="0" alt=""/>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="0" cellspacing="0" width="580" style="padding-top: 20px; font: 10px Verdana, Arial, Helvetica, sans-serif; color: #333">
						<tbody>
							<tr>
								<td>
									<div style="margin: 5px 0; padding: 0">
										<a href="http://help.1pay.vn" target="_blank">Help Centre</a><span style="color: #ccc"> | </span><a href="#" target="_blank">Contact us</a>
									</div>
									<p>
										Làm ơn không trả lời vào email này vì chúng tôi không theo dõi
										hòm thư này. Để liên lạc với chúng tôi, bạn đăng nhập vào tài
										khoản của mình và click vào phần <strong>Liên hệ</strong> trên
										cùng của trang.
									</p>
									<p>
										Copyright © 2013 <strong>1Pay Co., Ltd</strong>. All rights
										reserved.
									</p>
									<p>
										Consumer advisory: <strong>1Pay Co., Ltd</strong>, the Holder of
										the 1Pay™ payment service stored value facility. Consumers
										(users) are advised to read the <a href="#" target="_blank">terms
											and conditions</a> carefully.
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>