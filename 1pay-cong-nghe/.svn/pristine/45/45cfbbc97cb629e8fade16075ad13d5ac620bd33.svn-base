package vn.onepay.cdr.filter.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.onepay.cdr.filter.dao.CdrFilterDAO;
import vn.onepay.cdr.filter.dao.SmsMerchantProductVerifyDAO;
import vn.onepay.cdr.filter.model.SmsCdrFilter;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;
import vn.onepay.cdr.filter.service.CdrFilterService;

@Service
public class CdrFilterServiceImpl implements CdrFilterService {

	@Autowired CdrFilterDAO cdrFilterDAO;
	@Autowired SmsMerchantProductVerifyDAO smsMerchantProductVerifyDAO;
	
	@Override
	public List<SmsCdrFilter> findSmsCdrFilters(List<String> msisdns, List<String> commandCodes,
			List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime,
			Date toTime, List<String> groupByCols, List<String> countByCols, List<String> orderByCols, 
			int limit, int offset) {
		return cdrFilterDAO.findSmsCdrFilters(msisdns, commandCodes, providers, merchants, exceptCmds, fromTime, toTime, groupByCols, countByCols, orderByCols, limit, offset);
	}

	@Override
	public int findTotalSmsCdrFilters(List<String> msisdns,
			List<String> commandCodes, List<String> providers,
			List<String> merchants, List<String[]> exceptCmds, 
			Date fromTime, Date toTime,
			List<String> groupByCols) {
		// TODO Auto-generated method stub
		return cdrFilterDAO.findTotalSmsCdrFilters(msisdns, commandCodes, providers, merchants, exceptCmds, fromTime, toTime, groupByCols);
	}

	@Override
	public List<SmsCdrFilter> findSmsCdrFilters(List<String> msisdns,
			List<Integer> totalMSISDN, List<String> commandCodes,
			List<String> providers, List<String> merchants, List<String[]> exceptCmds, 
			Date fromTime, Date toTime, 
			List<String> orderByCols, int limit, int offset) {
		// TODO Auto-generated method stub
		return cdrFilterDAO.findSmsCdrFilters(msisdns, totalMSISDN, commandCodes, providers, merchants, exceptCmds, fromTime, toTime, orderByCols, limit, offset);
	}

	/*SmsMerchantProductVerify*/
	@Override
	public void save(SmsMerchantProductVerify smsMerchantProductVerify) {
		smsMerchantProductVerifyDAO.save(smsMerchantProductVerify);
	}

	@Override
	public SmsMerchantProductVerify findSmsMerchantProductVerifies( String merchant, String provider, String commandCode) {
		return smsMerchantProductVerifyDAO.findSmsMerchantProductVerifies(merchant, provider, commandCode);
	}

	@Override
	public List<SmsMerchantProductVerify> findSmsMerchantProductVerifies(
			List<String> merchants, List<String> providers,
			List<String> commandCodes, List<String> statuses, Date fromTime,
			Date toTime, int limit, int offset) {
		return smsMerchantProductVerifyDAO.findSmsMerchantProductVerifies(merchants, providers, commandCodes, statuses, fromTime, toTime, limit, offset);
	}

	@Override
	public int findTotalSmsMerchantProductVerifies(List<String> merchants,
			List<String> providers, List<String> commandCodes,
			List<String> statuses, Date fromTime, Date toTime) {
		return smsMerchantProductVerifyDAO.findTotalSmsMerchantProductVerifies(merchants, providers, commandCodes, statuses, fromTime, toTime);
	}
	/*SmsMerchantProductVerify END*/

	@Override
	public int findTotalSmsCdrFilters(List<String> msisdns,
			List<Integer> totalMSISDN, List<String> commandCodes,
			List<String> providers, List<String> merchants,
			List<String[]> exceptCmds, Date fromTime, Date toTime) {
		return cdrFilterDAO.findTotalSmsCdrFilters(msisdns, totalMSISDN, commandCodes, providers, merchants, exceptCmds, fromTime, toTime);
	}
}
