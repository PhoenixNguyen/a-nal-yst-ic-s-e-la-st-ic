package vn.onepay.merchant.product.api;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.common.SharedConstants;
import vn.onepay.merchant.product.controllers.AbstractProductVerify;
import vn.onepay.merchant.product.model.MerchantProduct;
import vn.onepay.merchant.product.model.ProductVerify;
import vn.onepay.utils.Utils;
import vn.onepay.vietnamese.VnUtils;

public class ProductVerifyManagerAjax extends AbstractProductVerify {

	private enum Action {
		ADD_EDIT, DELETE, UPDATE_STATUS, CLONE, CHECK_BY_APP_CODE
	}

	@Override
	protected ModelAndView handleRequest(
			HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, ModelMap paramModelMap)
			throws Exception {

		paramHttpServletResponse.setContentType("text/html");
		Account account = (Account) paramHttpServletRequest.getSession()
				.getAttribute(SharedConstants.ACCOUNT_LOGINED);

		if (account == null) {
			paramHttpServletResponse.getOutputStream().write(
					"Bạn chưa đăng nhập!".getBytes("UTF-8"));
			return null;
		}

		if (!account.isStaff()) {
			paramHttpServletResponse.getOutputStream().write(
					"Bạn không có quyền thực hiện.".getBytes("UTF-8"));
			return null;
		}

		// request
		String actionRequest = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("action"));
		System.out.println("actionRequest " + " " + actionRequest);

		Action action = null;
		try {
			action = Action.valueOf(actionRequest);

		} catch (Exception e) {
			e.printStackTrace();

		}

		if (action != null)
			switch (action) {
			case ADD_EDIT:
				modifyData(paramHttpServletRequest, paramHttpServletResponse,
						account);
				break;
			case CLONE:
				cloneData(paramHttpServletRequest, paramHttpServletResponse,
						account);
				break;
			case DELETE:
				break;
			case UPDATE_STATUS:
				updateStatus(paramHttpServletRequest, paramHttpServletResponse,
						account);
				break;
			case CHECK_BY_APP_CODE:
				checkByAppCode(paramHttpServletRequest, paramHttpServletResponse,
						account);
				break;
			}
		else {
			paramHttpServletResponse.getOutputStream().write(
					"Không tồn tại yêu cầu, hãy thử lại sau!".getBytes("utf8"));
		}

		return null;
	}

	private void updateStatus(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Account account)
			throws UnsupportedEncodingException, IOException {
		String id = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("id"));
		String statusRequest = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("status"));
		String reason = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("reason"));
		System.out.println("REQUEST: " + id + " " + statusRequest + " reason: "
				+ reason);

		int status = -1;
		try {
			status = Integer.parseInt(statusRequest);
		} catch (Exception e) {
			e.printStackTrace();
			paramHttpServletResponse.getOutputStream().write(
					"Lỗi không xác định!".getBytes("UTF-8"));
			return;
		}

		ProductVerify productVerify = null;

		if (!id.equals(""))
			productVerify = productVerifyService.loadProductVerify(id);

		if (productVerify != null) {
			// suggest
			if ((status == ProductVerify.SUGGESTED_STATUS && productVerify
					.getStatus() == ProductVerify.INIT_STATUS)
					|| (status == ProductVerify.SUGGESTED_REJECTED_STATUS && productVerify
							.getStatus() == ProductVerify.INIT_STATUS)) {
				if (account.isBizStaff() || account.isBizSupportManager()
						|| account.isOperator())
					productVerify.setStatus(status);
				else {
					paramHttpServletResponse.getOutputStream().write(
							"Bạn không có quyền đề nghị!".getBytes("UTF-8"));
					return;
				}
			}

			// approve
			else if ((status == ProductVerify.APPROVED_STATUS && productVerify
					.getStatus() == ProductVerify.SUGGESTED_STATUS)
					|| (status == ProductVerify.APPROVED_REJECTED_STATUS && productVerify
							.getStatus() == ProductVerify.SUGGESTED_STATUS)) {
				if (account.isBizSupportManager() || account.isOperator())
					productVerify.setStatus(status);
				else {
					paramHttpServletResponse.getOutputStream().write(
							"Bạn không có quyền duyệt!".getBytes("UTF-8"));
					return;
				}
			}

			else {
				paramHttpServletResponse.getOutputStream().write(
						"Quy trình cập nhật trạng thái không đúng!"
								.getBytes("UTF-8"));
				return;
			}

			// Reject reason
			if (status == ProductVerify.SUGGESTED_REJECTED_STATUS
					|| status == ProductVerify.APPROVED_REJECTED_STATUS) {
				if (reason.equals("")) {
					paramHttpServletResponse.getOutputStream()
							.write("Lý do từ chối không được trống!"
									.getBytes("UTF-8"));
					return;
				} else
					productVerify.setReject_reason(reason);
			}
		} else {
			paramHttpServletResponse.getOutputStream().write(
					"Không tồn tại phiếu hậu kiểm này!".getBytes("UTF-8"));
			return;
		}
		productVerifyService.save(productVerify);
		paramHttpServletResponse.getOutputStream().write(
				"Cập nhật trạng thái thành công!".getBytes("UTF-8"));

	}

	private void modifyData(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Account account)
			throws IOException {
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");

		// String productId =
		// StringUtils.trimToEmpty(paramHttpServletRequest.getParameter("pid"));

		String id = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("id"));

		String app_code = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("app_code"));
		String charging_type = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("charging_type"));

		String expired_time = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("expired_date"));
		String title = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("title"));
		String description = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("description"));
		String bizz_channel = StringUtils.trimToEmpty(paramHttpServletRequest
				.getParameter("bizz_channel"));

		ProductVerify productVerify = new ProductVerify();
		// new
		if (id.equalsIgnoreCase("")) {
			// check permission
			if (!account.isBizSupporter() && !account.isBizSupportManager()
					&& !account.isOperator()) {
				paramHttpServletResponse.getOutputStream().write(
						"Bạn không có quyền tạo phiếu hậu kiểm!"
								.getBytes("UTF-8"));
				return;
			}

			// PostAudits
			MerchantProduct merchantProduct = new MerchantProduct();
			if (!app_code.equalsIgnoreCase("")) {
				merchantProduct = productVerifyService
						.findMerchantProductByCode(app_code);
			}

			// check is ok
			if (merchantProduct != null
					&& ((merchantProduct.getSms_charging() != null && merchantProduct
							.getSms_charging().getStatus()
							.equalsIgnoreCase(MerchantProduct.APPROVED_STATUS)) || (merchantProduct
							.getIac_charging() != null && merchantProduct
							.getIac_charging().getStatus()
							.equalsIgnoreCase(MerchantProduct.APPROVED_STATUS)))) {
				productVerify.setCreated_date(new Date());
				productVerify.setApp_code(app_code);
			} else {
				paramHttpServletResponse.getOutputStream().write(
						"Sản phẩm không đủ điều kiện hậu kiểm!"
								.getBytes("UTF-8"));
				return;
			}

			// charging type
			if (charging_type.equals("")) {
				paramHttpServletResponse.getOutputStream().write(
						"Loại charging không được trống!".getBytes("UTF-8"));
				return;
			} else
				productVerify.setCharging_type(charging_type);

			// add version
			productVerify.setVersion(generateVersion(app_code, charging_type));

			ProductVerify maxVersionProdVerify = getMaxVersion(app_code, charging_type);
			if(maxVersionProdVerify != null) {
				if (maxVersionProdVerify.getStatus() == ProductVerify.INIT_STATUS
						|| maxVersionProdVerify.getStatus() == ProductVerify.SUGGESTED_STATUS) {
					paramHttpServletResponse
							.getOutputStream()
							.write(("Lỗi khởi tạo phiếu hậu kiểm, phiếu hậu kiểm 1."
									+ maxVersionProdVerify.getVersion() + " đang chờ xử lý")
									.getBytes("UTF-8"));
					return;
				} else if (maxVersionProdVerify.getStatus() == ProductVerify.APPROVED_STATUS
						&& maxVersionProdVerify.getExpired_date().getTime() > new Date()
								.getTime()) {
					paramHttpServletResponse
							.getOutputStream()
							.write(("Lỗi khởi tạo phiếu hậu kiểm, phiếu hậu kiểm 1."
									+ maxVersionProdVerify.getVersion() + " đã xử lý và đang còn hạn")
									.getBytes("UTF-8"));
					return;
				}
			}
		}
		// edit
		else {
			// check permission
			if (!account.isBizSupporter() && !account.isBizSupportManager()
					&& !account.isOperator()) {
				paramHttpServletResponse.getOutputStream().write(
						"Bạn không có quyền sửa phiếu hậu kiểm!"
								.getBytes("UTF-8"));
				return;
			}

			productVerify = productVerifyService.loadProductVerify(id);
			if (productVerify == null) {
				paramHttpServletResponse.getOutputStream().write(
						"Không tồn tại hậu kiêm!".getBytes("UTF-8"));
				return;
			} else {
				if (productVerify.getStatus() == ProductVerify.SUGGESTED_REJECTED_STATUS
						|| productVerify.getStatus() == ProductVerify.APPROVED_REJECTED_STATUS
						|| productVerify.getStatus() == ProductVerify.APPROVED_STATUS) {
					paramHttpServletResponse.getOutputStream().write(
							"Chỉ sửa được ở trạng thái khởi tạo hoặc đề nghị!"
									.getBytes("UTF-8"));
					return;
				}
			}
		}

		Date expired_date = null;
		try {
			expired_date = df.parse(expired_time);

		} catch (Exception e) {
			e.printStackTrace();
			paramHttpServletResponse.getOutputStream().write(
					"Lỗi không xác định!".getBytes("UTF-8"));
			return;
		}

		if (expired_date == null) {
			paramHttpServletResponse.getOutputStream().write(
					"Ngày hết hạn sai định dạng!".getBytes("UTF-8"));
			return;
		} else
			productVerify.setExpired_date(expired_date);
		if (title.equals("")) {
			paramHttpServletResponse.getOutputStream().write(
					"Tiêu đề không được trống!".getBytes("UTF-8"));
			return;
		} else
			productVerify.setTitle(title);
		if (description.equals("")) {
			paramHttpServletResponse.getOutputStream().write(
					"Mô tả không được trống!".getBytes("UTF-8"));
			return;
		} else
			productVerify.setDescription(description);

		if (bizz_channel.equals("")) {
			paramHttpServletResponse.getOutputStream().write(
					"Kênh kinh doanh không được trống!".getBytes("UTF-8"));
			return;
		} else
			productVerify.setBizz_channel(bizz_channel);

		// attachments
		String[] attachments = uploadFile(paramHttpServletRequest, account);
		if (attachments != null && attachments.length > 0) {
			if (productVerify.getList_attachment() != null
					&& productVerify.getList_attachment().length > 0) {
				List<String> attachmentsTmp = new ArrayList<String>();
				for (String attachment : productVerify.getList_attachment()) {
					if (!attachmentsTmp.contains(attachment))
						attachmentsTmp.add(attachment);
				}
				for (String attachment : attachments) {
					if (!attachmentsTmp.contains(attachment))
						attachmentsTmp.add(attachment);
				}
			} else {
				productVerify.setList_attachment(attachments);
			}
		}

		productVerifyService.save(productVerify);

		if (!id.equalsIgnoreCase("")) {
			paramHttpServletResponse.getOutputStream().write(
					"Sửa phiếu thành công!".getBytes("UTF-8"));
			return;
		}

		paramHttpServletResponse.getOutputStream().write(
				"Lập phiếu thành công!".getBytes("UTF-8"));

	}

	private void cloneData(HttpServletRequest request,
			HttpServletResponse response, Account account) throws Exception {
		String id = StringUtils.trimToEmpty(request.getParameter("id"));
		// check permission
		if (!account.isBizSupporter() && !account.isBizSupportManager()
				&& !account.isOperator()) {
			response.getOutputStream().write(
					"Bạn không có quyền Clone phiếu hậu kiểm!".getBytes("UTF-8"));
			return;
		}

		ProductVerify productVerify = productVerifyService
				.loadProductVerify(id);
		if (productVerify == null) {
			response.getOutputStream().write(
					"Không tồn tại hậu kiêm!".getBytes("UTF-8"));
			return;
		} else {
			ProductVerify maxVersionProdVerify = getMaxVersion(productVerify.getApp_code(), productVerify.getCharging_type());
			if(maxVersionProdVerify != null) {
				if (maxVersionProdVerify.getStatus() == ProductVerify.INIT_STATUS
						|| maxVersionProdVerify.getStatus() == ProductVerify.SUGGESTED_STATUS) {
					response
							.getOutputStream()
							.write(("Lỗi không clone được phiếu hậu kiểm, phiếu hậu kiểm 1."
									+ maxVersionProdVerify.getVersion() + " đang chờ xử lý")
									.getBytes("UTF-8"));
					return;
				} else if (maxVersionProdVerify.getStatus() == ProductVerify.APPROVED_STATUS
						&& maxVersionProdVerify.getExpired_date().getTime() > new Date()
								.getTime()) {
					response
							.getOutputStream()
							.write(("Lỗi không clone được phiếu hậu kiểm, phiếu hậu kiểm 1."
									+ maxVersionProdVerify.getVersion() + " đã xử lý và đang còn hạn")
									.getBytes("UTF-8"));
					return;
				}
			}
			productVerify.setId(null);
			productVerify.setStatus(ProductVerify.INIT_STATUS);
			productVerify.setVersion(generateVersion(
					productVerify.getApp_code(),
					productVerify.getCharging_type()));
			productVerify.setCreated_date(new Date());
			productVerify.setExpired_date(Utils.dateAdd(new Date(), 7));
			productVerify.setReject_reason(null);
			productVerify.setList_attachment(null);

			productVerifyService.save(productVerify);

			response.getOutputStream().write(
					"Clone thành công!".getBytes("UTF-8"));
		}
	}

	private String[] uploadFile(HttpServletRequest request, Account account) {
		List<String> fileNames = new ArrayList<String>();
		try {
			MultipartHttpServletRequest multiPartRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> multiparts = multiPartRequest
					.getFiles("attachments");

			if (multiparts == null || multiparts.size() == 0)
				return null;

			System.out.println(multiparts.size());
			for (MultipartFile item : multiparts) {
				if (item == null || item.getBytes() == null
						|| item.getBytes().length == 0)
					continue;

				String itemName = item.getOriginalFilename();
				itemName = VnUtils.removeTone(itemName).replaceAll(
						"[^A-Za-z0-9.]", "_");

				File savedFile = new File(SharedConstants.UPLOAD_FOLDER
						+ "/product_verify/" + account.getUsername(), itemName);
				if (!savedFile.getParentFile().exists())
					savedFile.getParentFile().mkdirs();

				FileUtils.writeByteArrayToFile(savedFile, item.getBytes());

				fileNames.add(account.getUsername() + "/" + itemName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (fileNames.size() > 0) {
			return fileNames.toArray(new String[0]);
		} else {
			return null;
		}
	}
	
	private void checkByAppCode(HttpServletRequest request, HttpServletResponse response, 
			Account account) throws Exception {
		String app_code = StringUtils.trimToEmpty(request.getParameter("app_code"));
		// check permission
		if (!account.isBizSupporter() && !account.isBizSupportManager()
				&& !account.isOperator()) {
			response.getOutputStream().write("".getBytes("UTF-8"));
			return;
		}
		
		ProductVerify productVerifySMS = getMaxVersion(app_code, SharedConstants.SMS_CHARGING_SERVICE_CODE);
		ProductVerify productVerifyIAC = getMaxVersion(app_code, SharedConstants.IAC_CHARGING_SERVICE_CODE);
		String resultSMS = getResultProductVerify(productVerifySMS);
		String resultIAC = getResultProductVerify(productVerifyIAC);
		
		response.getOutputStream().write((resultSMS + resultIAC).getBytes("UTF-8"));
		return;
	}
	
	private String getResultProductVerify(ProductVerify productVerify) {
		String result = "0";
		if(productVerify != null) {
			result = "1";
			if(productVerify.getStatus() == ProductVerify.APPROVED_STATUS) {
				result = "2";
				if(productVerify.getExpired_date().getTime() > new Date().getTime())
					result = "3";
			}
		}
		
		return result;
	}
}
