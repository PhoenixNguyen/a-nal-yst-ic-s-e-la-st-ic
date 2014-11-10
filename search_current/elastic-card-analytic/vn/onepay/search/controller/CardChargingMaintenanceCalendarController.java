package vn.onepay.search.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.charging.card.common.CardConstants;
import vn.onepay.charging.card.dao.MaintenanceCalendarDAO;
import vn.onepay.charging.card.model.MaintenanceCalendar;
import vn.onepay.common.SharedConstants;
import vn.onepay.web.secure.controllers.AbstractProtectedController;

public class CardChargingMaintenanceCalendarController extends AbstractProtectedController {

	MaintenanceCalendarDAO maintenanceCalendarDAO;

  protected int limit;

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public void setMaintenanceCalendarDAO(MaintenanceCalendarDAO maintenanceCalendarDAO) {
    this.maintenanceCalendarDAO = maintenanceCalendarDAO;
  }


	@Override
	protected ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
		if (account == null) {
			return new ModelAndView("redirect:/");
		}
		// Init values
		model.put("telcos", CardConstants.ALL_CARD_TYPES);

		// Get request
		String fromDateRequest = StringUtils.trimToEmpty(request.getParameter("from_date"));
		String toDateRequest = StringUtils.trimToEmpty(request.getParameter("to_date"));
		List<String> telcoRequest = null;
		if (request.getParameterValues("ALL_CARD_TYPES") != null) {
			telcoRequest = Arrays.asList(request.getParameterValues("ALL_CARD_TYPES"));

		}

		Date fromDate = handleDate(fromDateRequest, false);
		Date toDate = handleDate(toDateRequest, true);

		int offset = 0;
		if (StringUtils.isNumeric(request.getParameter("d-49520-p"))) {
			offset = Integer.parseInt(request.getParameter("d-49520-p"));
			if (offset > 0) {
				offset = (offset - 1) * this.limit;
			}
		}

		int count = 0;
		List<MaintenanceCalendar> maintenanceCalendars = null;

		count = maintenanceCalendarDAO.findTotalMaintenanceCalendars(account, telcoRequest, null, fromDate, toDate);
		maintenanceCalendars = maintenanceCalendarDAO.findMaintenanceCalendars(account, telcoRequest, null, fromDate, toDate, offset, limit);

		model.put("total", count);
		model.put("pagesize", Integer.valueOf(this.limit));
		model.put("offset", Integer.valueOf(offset));
		model.put("list", maintenanceCalendars);

		return new ModelAndView(getWebView(), "model", model);
	}

	public static Date handleDate(String date, boolean end) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

		Date dateResult = null;
		try {
			if (!date.equals(""))
				dateResult = df.parse(date);
			else {
				dateResult = new Date();
				dateResult.setHours(0);
				dateResult.setMinutes(0);
				dateResult.setSeconds(0);
			}
			if (end) {
				Calendar c = Calendar.getInstance();
				c.setTime(dateResult);
				c.add(Calendar.DAY_OF_MONTH, 1);

				dateResult = c.getTime();
			}

			return dateResult;

		} catch (Exception e) {
			e.printStackTrace();

			// wrong format
			dateResult = new Date();
			dateResult.setHours(0);
			dateResult.setMinutes(0);
			dateResult.setSeconds(0);

			if (end) {
				Calendar c = Calendar.getInstance();
				c.setTime(dateResult);
				c.add(Calendar.DAY_OF_MONTH, 1);

				dateResult = c.getTime();
			}
		}

		return null;

	}

}