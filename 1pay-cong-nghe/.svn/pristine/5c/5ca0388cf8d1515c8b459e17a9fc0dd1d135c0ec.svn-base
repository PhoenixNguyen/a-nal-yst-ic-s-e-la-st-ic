package vn.onepay.cdr.filter.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.onepay.account.model.Account;
import vn.onepay.cdr.filter.model.SmsCdrFilter;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;
import vn.onepay.common.SharedConstants;
import vn.onepay.utils.Utils;

@Controller
public class SmsCdrFilterController extends AbstractController {

	final int limit = 30;
	final int maxPageSize = 1000;
	final int minTotalSMS = 3;
	
	@RequestMapping(value="cdr/sms-cdr-filter")
	public String smsCdrFilter(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws IOException {
		final String layout = "sms_cdr_filter";
		ModelMap model = new ModelMap();
		modelMap.put("model", model);
		
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		if(account == null || !(account.isOperator() 
									|| account.isBizSupportManager() || account.isBizSupporter()
									|| account.isCustomerCareManager() 
									|| account.isBizManager() || account.isBizStaff()))
			return "redirect:/console/index.wss";
		
		boolean isSales = account.isBizManager() || account.isBizStaff();
		
		//----------
		List<String> providers = smsCommandCodeDAO.getAllSMSServiceNumbers(account);
		model.put("providers", 	providers);
		//----------
		List<String> statuses = Arrays.asList(new String[] {SmsMerchantProductVerify.APPROVED_STATUS, SmsMerchantProductVerify.PENDING_STATUS, SmsMerchantProductVerify.REJECT_STATUS});
		model.put("status", 	statuses);
		//----------
		List<String> restrictedMerchants 	= merchantService.findMyOwnMerchants(account);
		model.put("merchants", restrictedMerchants);
		
		List<String> searchMerchant = null;
		if(!StringUtils.isBlank(request.getParameter("searchMerchant"))) {
			searchMerchant = Arrays.asList(request.getParameter("searchMerchant").replace(" ", "").split(","));
		} else {
			searchMerchant = httpService.getParamValues(request, "merchant");
		}
		
		List<String> msisdn = httpService.getParamValues(request, "msisdn");
		List<String> provider = httpService.getParamValues(request, "provider");
		List<String> commandCode = httpService.getParamValues(request, "commandCode");
		
		final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date reportFromDay 	= commonService.getDate(request, "startDate");
		Date reportToDay 	= commonService.getDate(request, "endDate");
		try {
			String[] dates 	= request.getParameter("reservation").split("-");
			reportFromDay 	= sdf.parse(dates[0].trim());
			reportToDay 	= sdf.parse(dates[1].trim());
		} catch (Exception e) {
			reportFromDay 	= new Date();
			reportToDay 	= new Date();
		}
		Date fromTime 	= reportFromDay!=null?Utils.getStartOfDay(reportFromDay):null;
		Date toTime 	= reportToDay!=null?Utils.getEndOfDay(reportToDay):null;
		model.put("todaySt", sdf.format(fromTime) + " - " + sdf.format(toTime));

		int offset = 0;
		int pagesize = limit;
		
		if(StringUtils.isNumeric(request.getParameter("d-49520-p"))){
			offset = Integer.parseInt(request.getParameter("d-49520-p"));
			if(offset>0) {
				offset = (offset - 1) * pagesize;
			}
		}
		
		String tab = StringUtils.trimToEmpty(request.getParameter("tab"));
		if("verify".equalsIgnoreCase(tab)) {
			try {
				String status = request.getParameter("status");
				List<String> statusList = null;
				if(!StringUtils.isBlank(status)) {
					if(SmsMerchantProductVerify.PENDING_STATUS.equalsIgnoreCase(status))
						statusList = Arrays.asList(new String[] {status, SmsMerchantProductVerify.INIT_STATUS});
					else
						statusList = Arrays.asList(new String[] {status});
				}
				
				int total = cdrFilterService.findTotalSmsMerchantProductVerifies(searchMerchant, providers, commandCode, statusList, fromTime, toTime);
				model.put("total", total);
				
				List<SmsMerchantProductVerify> results = cdrFilterService.findSmsMerchantProductVerifies(searchMerchant, providers, commandCode, statusList, fromTime, toTime, total, offset);
				model.put("list", results);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				List<SmsMerchantProductVerify> smpvs = cdrFilterService.findSmsMerchantProductVerifies(isSales?restrictedMerchants:null, null, null, Arrays.asList(new String[] {SmsMerchantProductVerify.APPROVED_STATUS}), null, null, -1, 0);
				List<String[]> exceptCmds = null;
				if(smpvs!=null && smpvs.size()>0) {
					exceptCmds = new ArrayList<String[]>();
					for(SmsMerchantProductVerify smpv: smpvs)
						exceptCmds.add(new String[] {smpv.getProvider(), smpv.getCommand_code()});
				}
				
				List<SmsCdrFilter> results1 = cdrFilterService.findSmsCdrFilters(msisdn, commandCode, provider, searchMerchant, exceptCmds, fromTime, toTime, 
						Arrays.asList(new String[] {"msisdn", "merchant"}), 
						Arrays.asList(new String[] {"msisdn:totalSMS", "sum:amount:amount"}), 
						Arrays.asList(new String[] {"totalSMS:desc"}),
						maxPageSize, offset);
				
				if(results1 != null && results1.size() > 0) {
					int i = 0;
					while(i < results1.size())
						if(results1.get(i).getTotalSMS() < minTotalSMS)
							results1.remove(i);
						else
							i++;
							
				}
				
				if(results1 != null && results1.size() > 0) {
					Map<String, SmsCdrFilter> map = new HashMap<String, SmsCdrFilter>(); 
					
					for(SmsCdrFilter cdr : results1) {
						if(!map.containsKey(cdr.getMerchant())) {
							SmsCdrFilter cdr_ = cdr.clone();
							
							cdr_.setTotalMSISDN(cdr.getTotalMSISDN());
							cdr_.setTotalSMS(cdr.getTotalSMS());
							
							if(cdr_.getTotalMSISDN() == 0)
								cdr_.setTotalMSISDN(1);
							if(cdr_.getTotalSMS() == 0)
								cdr_.setTotalSMS(1);
							map.put(cdr.getMerchant(), cdr_);
						} else {
							SmsCdrFilter cdr_ = map.get(cdr.getMerchant());
							cdr_.setTotalSMS(cdr_.getTotalSMS() + cdr.getTotalSMS());
							cdr_.setTotalMSISDN(cdr_.getTotalMSISDN() + 1);
							cdr_.setAmount(cdr_.getAmount().add(cdr.getAmount()));
							
							map.put(cdr.getMerchant(), cdr_);
						}
					}
		
					List<SmsCdrFilter> results2 = new ArrayList<SmsCdrFilter>(map.values());
					Collections.sort(results2, new Comparator<SmsCdrFilter>() {

						@Override
						public int compare(SmsCdrFilter arg0, SmsCdrFilter arg1) {
							// TODO Auto-generated method stub
							return arg1.getTotalMSISDN() - arg0.getTotalMSISDN();
						}
					});
					
					Collections.sort(results1, new Comparator<SmsCdrFilter>() {

						@Override
						public int compare(SmsCdrFilter arg0, SmsCdrFilter arg1) {
							// TODO Auto-generated method stub
							return arg1.getTotalSMS() - arg0.getTotalSMS();
						}
					});
					
					while(results1.size() > limit) {
						results1.remove(limit);
					}
					
					while(results2.size() > limit) {
						results2.remove(limit);
					}
					
					/*List<SmsCdrFilter> results2 = cdrFilterService.findSmsCdrFilters(msisdn, commandCode, provider, merchants, fromTime, toTime, 
							Arrays.asList(new String[] {"merchant"}),
							Arrays.asList(new String[] {"distinct:msisdn:totalMSISDN", "merchant:totalSMS"}),
							Arrays.asList(new String[] {"totalMSISDN:desc", "totalSMS:desc"}),
							pagesize, offset);*/
					
					model.put("list1", results1);
					model.put("list2", results2);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.put("offset", offset);
		model.put("pagesize", pagesize);
		
		return layout;
	}
	
}
