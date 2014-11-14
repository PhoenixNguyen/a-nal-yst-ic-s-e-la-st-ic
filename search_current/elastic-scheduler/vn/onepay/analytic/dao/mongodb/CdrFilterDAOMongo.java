package vn.onepay.analytic.dao.mongodb;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.analytic.dao.CdrFilterDAO;
import vn.onepay.analytic.model.MsisdnStatistic;
import vn.onepay.charging.iac.model.IacCdr;
import vn.onepay.charging.sms.model.SmsCdr;
import vn.onepay.common.SharedConstants;
import vn.onepay.search.entities.ESSmsCdrFilter;
import vn.onepay.utils.Utils;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MapReduceOutput;
import com.mongodb.util.JSON;

public class CdrFilterDAOMongo implements CdrFilterDAO {
	private MongoTemplate mongoTemplate;

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	@Override
	public <T> List<MsisdnStatistic> mapReduce(Class<T> clazz, final Date fromTime, final Date toTime, final int count, final double amount) {
		// TODO Auto-generated method stub
		long startTime = System.currentTimeMillis();

		final String result = "resultCollection";
		String mapFunction = "function(){"
				+ "emit({msisdn: this.msisdn, provider: this.paymentProvider, merchant: this.merchant},{count:1, amount: this.amount});}";
		if (IacCdr.class.equals(clazz))
			mapFunction = "function(){" + "emit({msisdn: this.msisdn, provider: this.provider, merchant: this.merchant},{count:1, amount: this.amount});}";
		final String reduceFunction = "function(key, values) { var count= 0; var total =0 ; for (var i = 0; i < values.length; i++){count += values[i].count; total +=values[i].amount}; return {count: count, amount: total};}";

		List<Criteria> searchCriteria = new ArrayList<Criteria>();
		searchCriteria.add(Criteria.where("requestTime").gte(Utils.convertToMongoDBTime(fromTime)));
		searchCriteria.add(Criteria.where("requestTime").lte(Utils.convertToMongoDBTime(toTime)));
		Query query = new Query();
		query.addCriteria(new Criteria().andOperator(searchCriteria.toArray(new Criteria[0])));
		System.out.println(query.toString());
		final String collectionName = mongoTemplate.getCollectionName(clazz);
		DBCollection mongoCollection = mongoTemplate.getCollection(collectionName);
		MapReduceOutput mapReduceOutput = mongoCollection.mapReduce(mapFunction, reduceFunction, result, query.getQueryObject());
		DBCollection resultColl = mapReduceOutput.getOutputCollection();

		BasicDBObject whereQuery = new BasicDBObject();
		whereQuery.put("value.count", new BasicDBObject("$gte", count));
		whereQuery.put("value.amount", new BasicDBObject("$gte", amount));
		DBCursor cursor = resultColl.find(whereQuery).sort(new BasicDBObject("value.count", -1));// .limit(100);
		List<MsisdnStatistic> statistics = new ArrayList<MsisdnStatistic>();
		while (cursor.hasNext()) {
			try {
				DBObject dbObject = cursor.next();
				System.out.println(dbObject);
				JSONObject jsonObject = new JSONObject(JSON.serialize(dbObject.toMap()));
				String msisdn = ((JSONObject) jsonObject.get("_id")).getString("msisdn");
				String provider = ((JSONObject) jsonObject.get("_id")).getString("provider");
				String merchant = ((JSONObject) jsonObject.get("_id")).getString("merchant");
				int Count = ((JSONObject) jsonObject.get("value")).getInt("count");
				double Amount = ((JSONObject) jsonObject.get("value")).getDouble("amount");
				MsisdnStatistic msisdnStatistic = new MsisdnStatistic(msisdn, provider, merchant, Count, Amount);
				statistics.add(msisdnStatistic);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Map reduce time: " + (System.currentTimeMillis() - startTime));
		return statistics;
	}

	@Override
	public List<ESSmsCdrFilter> findESSmsCdrFilters(String chargingService, String provider, List<String> dsMsisdn, Date fromTime, Date toTime, int offset,
			int limit) {
		// TODO Auto-generated method stub

		List<Criteria> searchCriteria = new ArrayList<Criteria>();
		if (StringUtils.isNotEmpty(provider))
			searchCriteria.add(Criteria.where(SharedConstants.SMS_CHARGING_SERVICE_CODE.equalsIgnoreCase(chargingService) ? "paymentProvider" : "provider").is(
					StringUtils.trimToEmpty(provider)));
		if (dsMsisdn != null && dsMsisdn.size() > 0) {
			if (dsMsisdn.size() > 1)
				searchCriteria.add(Criteria.where("msisdn").in(dsMsisdn));
			else
				searchCriteria.add(Criteria.where("msisdn").is(dsMsisdn.get(0)));
		}
		searchCriteria.add(Criteria.where("requestTime").gte(Utils.convertToMongoDBTime(fromTime)));
		searchCriteria.add(Criteria.where("requestTime").lte(Utils.convertToMongoDBTime(toTime)));

		Query query = new Query();
		query.addCriteria(new Criteria().andOperator(searchCriteria.toArray(new Criteria[0])));
		Sort orderBy = new Sort(Sort.Direction.ASC, "requestTime");
		query.with(orderBy);
		if (offset > 0)
			query.skip(offset);
		if (limit > 0)
			query.limit(limit);
		if (SharedConstants.SMS_CHARGING_SERVICE_CODE.equalsIgnoreCase(chargingService)) {
			List<SmsCdr> cdrs = mongoTemplate.find(query, SmsCdr.class);
			if (cdrs != null && cdrs.size() > 0) {
				List<ESSmsCdrFilter> esSmsCdrFilters = new ArrayList<ESSmsCdrFilter>();
				for (SmsCdr cdr : cdrs) {
					if (cdr.getRequestTime() != null)
						cdr.setRequestTime(Utils.mongoDbTimeToDisplayTime(cdr.getRequestTime()));
					if (cdr.getResponseTime() != null)
						cdr.setResponseTime(Utils.mongoDbTimeToDisplayTime(cdr.getResponseTime()));
					// ----------
					ESSmsCdrFilter esSmsCdrFilter = new ESSmsCdrFilter(cdr.getId(), cdr.getMerchant(), cdr.getApp_code(), cdr.getPaymentProvider(),
							cdr.getTelco(), cdr.getMsisdn(), cdr.getAmount(), cdr.getCommandCode(), cdr.getShortCode(), cdr.getMoMessage(),
							cdr.getRequestTime());
					esSmsCdrFilters.add(esSmsCdrFilter);
				}
				return esSmsCdrFilters;
			}
		} else {
			System.out.println("QUERY: "+query.toString());
			List<IacCdr> cdrs = mongoTemplate.find(query, IacCdr.class);
			if (cdrs != null && cdrs.size() > 0) {
				List<ESSmsCdrFilter> esSmsCdrFilters = new ArrayList<ESSmsCdrFilter>();
				for (IacCdr cdr : cdrs) {
					if (cdr.getRequestTime() != null)
						cdr.setRequestTime(Utils.mongoDbTimeToDisplayTime(cdr.getRequestTime()));
					if (cdr.getResponseTime() != null)
						cdr.setResponseTime(Utils.mongoDbTimeToDisplayTime(cdr.getResponseTime()));
					// ----------
					ESSmsCdrFilter esSmsCdrFilter = new ESSmsCdrFilter(cdr.getId(), cdr.getMerchant(), cdr.getApp_code(), cdr.getProvider(), cdr.getTelco(),
							cdr.getMsisdn(), cdr.getAmount(), cdr.getCommand(), "9029", cdr.getMoMessage(), cdr.getRequestTime());
					esSmsCdrFilters.add(esSmsCdrFilter);
				}
				return esSmsCdrFilters;
			}
		}
		return null;
	}

}
