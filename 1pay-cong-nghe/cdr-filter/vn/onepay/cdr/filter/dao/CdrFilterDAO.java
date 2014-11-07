package vn.onepay.cdr.filter.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.cdr.filter.model.SmsCdrFilter;

public interface CdrFilterDAO {
	List<SmsCdrFilter> findSmsCdrFilters		(List<String> msisdns, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime, List<String> groupByCols, List<String> countByCols, List<String> orderByCols, int limit, int offset);
	int 			   findTotalSmsCdrFilters	(List<String> msisdns, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime, List<String> groupByCols);
	List<SmsCdrFilter> findSmsCdrFilters		(List<String> msisdns, List<Integer> totalMSISDN, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime, List<String> orderByCols, int limit, int offset);
	int 			   findTotalSmsCdrFilters	(List<String> msisdns, List<Integer> totalMSISDN, List<String> commandCodes, List<String> providers, List<String> merchants, List<String[]> exceptCmds, Date fromTime, Date toTime);
}
