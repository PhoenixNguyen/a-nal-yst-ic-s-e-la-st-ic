package vn.onepay.cdr.filter.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;

public interface SmsMerchantProductVerifyDAO {
	void save(SmsMerchantProductVerify smsMerchantProductVerify);
	
	SmsMerchantProductVerify 		findSmsMerchantProductVerifies		(String merchant, String provider, String commandCode);
	
	List<SmsMerchantProductVerify> 	findSmsMerchantProductVerifies		(List<String> merchants, List<String> providers, List<String> commandCodes, List<String> statuses, Date fromTime, Date toTime, int limit, int offset);
	int 							findTotalSmsMerchantProductVerifies	(List<String> merchants, List<String> providers, List<String> commandCodes, List<String> statuses, Date fromTime, Date toTime);
	
}
