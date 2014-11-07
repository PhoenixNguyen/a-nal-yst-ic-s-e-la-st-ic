package vn.onepay.analytic.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.analytic.model.MsisdnStatistic;
import vn.onepay.iac.model.IacCdr;
import vn.onepay.search.entities.ESSmsCdrFilter;
import vn.onepay.sms.model.SmsCdr;

public interface CdrFilterDAO {
	String BEAN_NAME ="cdrFilterDAO";
	<T> List<MsisdnStatistic> mapReduce(final Class<T> clazz, final Date fromTime, final Date toTime, final int count, final double amount);
	List<ESSmsCdrFilter> findESSmsCdrFilters(String chargingService, String provider, List<String> dsMsisdn, Date fromTime, Date toTime, int offset, int limit);
}
