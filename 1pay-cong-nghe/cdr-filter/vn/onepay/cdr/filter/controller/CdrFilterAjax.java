package vn.onepay.cdr.filter.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.onepay.account.model.Account;
import vn.onepay.cdr.filter.model.SmsCdrFilter;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;
import vn.onepay.cdr.filter.scan.Scaner;
import vn.onepay.common.SharedConstants;
import vn.onepay.utils.Utils;

@Controller
public class CdrFilterAjax extends AbstractController {
	
	final int limit = 20;
	
	@Autowired Scaner scaner;
	
	@RequestMapping(value="cdr/cdr-filter-import-data")
	public void importData(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		if(account == null || !(account.isOperator() || account.isBizSupportManager() || account.isCustomerCareManager()))
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		scaner.setBaseService(baseService);
		scaner.run();
	}
			
	@RequestMapping(value="cdr/cdr-filter-api")
	public String cdrFilterApi(
				HttpServletRequest request, HttpServletResponse response,
				ModelMap modelMap
			) {
		String layout = "cdr_filter_api";
		
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
		List<String> restrictedMerchants 	= merchantService.findMyOwnMerchants(account);
		model.put("merchants", restrictedMerchants);
		
		List<String> searchMerchant = null;
		if(!StringUtils.isBlank(request.getParameter("searchMerchant"))) {
			searchMerchant = Arrays.asList(request.getParameter("searchMerchant").replace(" ", "").split(","));
		} else {
			searchMerchant = httpService.getParamValues(request, "merchant");
		}
		
		List<String> msisdn = httpService.getParamValues(request, "msisdn");
		List<String> totalMSISDN = httpService.getParamValues(request, "totalMSISDN");
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
		
		try {
			int offset = 0;
			int pagesize = limit;
			
			List<SmsMerchantProductVerify> smpvs = cdrFilterService.findSmsMerchantProductVerifies(isSales?restrictedMerchants:null, null, null, Arrays.asList(new String[] {SmsMerchantProductVerify.APPROVED_STATUS}), null, null, -1, 0);
			List<String[]> exceptCmds = null;
			if(smpvs!=null && smpvs.size()>0) {
				exceptCmds = new ArrayList<String[]>();
				for(SmsMerchantProductVerify smpv: smpvs)
					exceptCmds.add(new String[] {smpv.getProvider(), smpv.getCommand_code()});
			}
			
			int total = cdrFilterService.findTotalSmsCdrFilters(msisdn, commandCode, providers, searchMerchant, exceptCmds, fromTime, toTime, null);
			
			if("all".equalsIgnoreCase(request.getParameter("list"))) {
				pagesize = total;
			}
			
			if(StringUtils.isNumeric(request.getParameter("d-49520-p"))){
				offset = Integer.parseInt(request.getParameter("d-49520-p"));
				if(offset>0) {
					offset = (offset - 1) * pagesize;
				}
			}
			
			List<Integer> totalMSISDN_ = new ArrayList<Integer>();
			for(String tt: totalMSISDN) {
				totalMSISDN_.add(Integer.valueOf(tt));
			}
			List<SmsCdrFilter> results = cdrFilterService.findSmsCdrFilters(msisdn, totalMSISDN_, commandCode, provider, searchMerchant, exceptCmds, fromTime, toTime, 
					Arrays.asList(new String[] {"totalSMS:desc", "chargingTime:desc"}),
					pagesize, offset);
			
			model.put("list", results);
			model.put("total", total);
			model.put("offset", offset);
			model.put("pagesize", pagesize);
			
			/*Import DATA SMS Verify*/
			if(results!= null && results.size() > 0)
				for(SmsCdrFilter cdr : results) {
					SmsMerchantProductVerify verify = new SmsMerchantProductVerify();
					verify.setCommand_code(cdr.getCommandCode());
					verify.setProvider(cdr.getPaymentProvider());
					verify.setMerchant(cdr.getMerchant());
					verify.setComment("no text");
					verify.setLog(cdr.getChargingTime() + "\t" + account.getUsername() + "\t" + verify.getComment());
					verify.setCreated_time(cdr.getChargingTime());
					verify.setUpdated_time(cdr.getChargingTime());
					verify.setApp_code(cdr.getContentService());
					cdrFilterService.save(verify);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return layout;
	}

	@RequestMapping(value="cdr/sms-verify-api")
	public void smsVerifyApi(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		if(account == null || !(account.isOperator() 
									|| account.isBizSupportManager() || account.isBizSupporter()
									|| account.isCustomerCareManager() 
									|| account.isBizManager() || account.isBizStaff()))
			return;
		
		final List<String> allStatus = Arrays.asList(new String[] {SmsMerchantProductVerify.PENDING_STATUS, SmsMerchantProductVerify.REJECT_STATUS, SmsMerchantProductVerify.APPROVED_STATUS});
		
		String merchant = StringUtils.trimToEmpty(request.getParameter("merchant"));
		String provider = StringUtils.trimToEmpty(request.getParameter("provider"));
		String commandCode = StringUtils.trimToEmpty(request.getParameter("commandCode"));
		String status = StringUtils.trimToEmpty(request.getParameter("status"));
		String comment = StringUtils.trimToEmpty(request.getParameter("comment"));
		
		try {
			if(!allStatus.contains(status))
				throw new Exception("Trạng thái không hợp lệ");
			
			if(comment.length() == 0) 
				throw new Exception("Lý do không được bỏ trống");
			
			SmsMerchantProductVerify smpv = cdrFilterService.findSmsMerchantProductVerifies(merchant, provider, commandCode);
			if(smpv != null) {
				smpv.setStatus(status);
				smpv.setComment(comment);
				
				String log = StringUtils.trimToEmpty(smpv.getLog());
				log += (log.length()>0?"\r\n#\r\n":"") + 
						smpv.getStatus() +
						(new Date().toString()) + " by " + account.getUsername() + ": " + comment;
				smpv.setLog(log);
				
				smpv.setUpdated_time(new Date());
				
				cdrFilterService.save(smpv);
				response.getOutputStream().write("1".getBytes());
			} else
				throw new Exception("Không tìm thấy SMPV");
		} catch (Exception e) {
			response.getOutputStream().write(("error:" + e.getMessage()).getBytes());
		}
	}
}
