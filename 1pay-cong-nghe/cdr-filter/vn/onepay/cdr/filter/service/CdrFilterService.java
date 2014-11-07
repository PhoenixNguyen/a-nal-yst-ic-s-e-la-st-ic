package vn.onepay.cdr.filter.service;

import java.util.Date;
import java.util.List;

import vn.onepay.cdr.filter.model.SmsCdrFilter;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;

public interface CdrFilterService {

	List<SmsCdrFilter> findSmsCdrFilters		(List<String> msisdns, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime, List<String> groupByCols, List<String> countByCols, List<String> orderByCols, int limit, int offset);
	int 			   findTotalSmsCdrFilters	(List<String> msisdns, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime, List<String> groupByCols);
	List<SmsCdrFilter> findSmsCdrFilters		(List<String> msisdns, List<Integer> totalMSISDN, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime, List<String> orderByCols, int limit, int offset);
	int 			   findTotalSmsCdrFilters	(List<String> msisdns, List<Integer> totalMSISDN, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime);
	
	/*SmsMerchantProductVerify*/
	void save(SmsMerchantProductVerify smsMerchantProductVerify);
	
	SmsMerchantProductVerify 		findSmsMerchantProductVerifies		(String merchant, String provider, String commandCode);
	
	List<SmsMerchantProductVerify> 	findSmsMerchantProductVerifies		(List<String> merchants, List<String> providers, List<String> commandCodes, List<String> statuses, Date fromTime, Date toTime, int limit, int offset);
	int 							findTotalSmsMerchantProductVerifies	(List<String> merchants, List<String> providers, List<String> commandCodes, List<String> statuses, Date fromTime, Date toTime);
	/*SmsMerchantProductVerify END*/
}
