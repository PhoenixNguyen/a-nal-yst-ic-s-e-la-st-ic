package vn.onepay.merchant.product.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import vn.onepay.merchant.product.model.ProductVerify;
import vn.onepay.merchant.product.service.ProductVerifyService;

public abstract class AbstractProductVerify extends
		AbstractConsoleManagerController {
	protected ProductVerifyService productVerifyService;

	public void setProductVerifyService(
			ProductVerifyService productVerifyService) {
		this.productVerifyService = productVerifyService;
	}

	protected int generateVersion(String app_code, String charging_type) {
		List<ProductVerify> productVerifies = productVerifyService
				.findProductVerifies(app_code, charging_type, "", -1, "", null,
						null, 1, 0);

		if (productVerifies == null || productVerifies.size() == 0)
			return 1;

		List<Integer> oldVersions = new ArrayList<Integer>();
		for (ProductVerify productVerify : productVerifies) {
			oldVersions.add(productVerify.getVersion());

		}

		int max = 0;
		if (oldVersions != null && oldVersions.size() > 0) {
			max = Collections.max(oldVersions);
		}

		return max + 1;

	}

	protected ProductVerify getMaxVersion(String app_code, String charging_type) {
		List<ProductVerify> productVerifies = productVerifyService
				.findProductVerifies(app_code, charging_type, "", -1, "", null,
						null, 1, 0);

		if (productVerifies == null || productVerifies.size() == 0)
			return null;

		return productVerifies.get(0);
	}
}
