package vn.onepay.search.entities;

public class FilterType {
	public static String OVER_AMOUNT_LIMIT_PER_DAY = "01";
	public static String OVER_03_MESSAGES_LIMIT_PER_05_MINUTES = "02";
	public static String OVER_05_MESSAGES_LIMIT_PER_10_MINUTES = "03";
	public static String OVER_30_MESSAGES_LIMIT_PER_60_MINUTES = "04";

	public static String[] ALL_FILTER_TYPES = new String[] { OVER_03_MESSAGES_LIMIT_PER_05_MINUTES,
			OVER_05_MESSAGES_LIMIT_PER_10_MINUTES, OVER_30_MESSAGES_LIMIT_PER_60_MINUTES, OVER_AMOUNT_LIMIT_PER_DAY };
}
