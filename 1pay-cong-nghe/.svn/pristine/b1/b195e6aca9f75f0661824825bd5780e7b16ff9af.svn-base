package vn.onepay.cdr.filter.dao.mongodb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import vn.onepay.cdr.filter.dao.SmsMerchantProductVerifyDAO;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;
import vn.onepay.utils.Utils;

import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Service
public class SmsMerchantProductVerifyDAOMongo implements SmsMerchantProductVerifyDAO {
	
	@Autowired private MongoTemplate mongoTemplate;
	
	private String smsMerchantProductVerifyMongoCollection = SmsMerchantProductVerify.COLLECTION_NAME;

	@Override
	public void save(SmsMerchantProductVerify smsMerchantProductVerify) {
		try {
			if(smsMerchantProductVerify == null 
					|| (StringUtils.isBlank(smsMerchantProductVerify.getId()) && findSmsMerchantProductVerifies(smsMerchantProductVerify.getMerchant(), smsMerchantProductVerify.getProvider(), smsMerchantProductVerify.getCommand_code()) != null)) 
				return;
			smsMerchantProductVerify.setCreated_time(Utils.convertToMongoDBTime(smsMerchantProductVerify.getCreated_time()));
			smsMerchantProductVerify.setUpdated_time(Utils.convertToMongoDBTime(smsMerchantProductVerify.getUpdated_time()));
			
			mongoTemplate.save(smsMerchantProductVerify);
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
	}

	@Override
	public List<SmsMerchantProductVerify> findSmsMerchantProductVerifies(
			List<String> merchants, List<String> providers,
			List<String> commandCodes, List<String> statuses, Date fromTime,
			Date toTime, int limit, int offset) {
		try {
			List<SmsMerchantProductVerify> results = new ArrayList<SmsMerchantProductVerify>();
			
			DBCollection collection = mongoTemplate.getCollection(smsMerchantProductVerifyMongoCollection);
			BasicDBObject query = getQueryObject(merchants, providers, commandCodes, statuses, fromTime, toTime);
			
			BasicDBObject orderBy = getSortQuery(new String[] {"status", "updated_time", "created_time"}, 
													new int[] {1, -1, -1}); 
			DBCursor cursor = collection.find(query);
			if(orderBy != null)
				cursor.sort(orderBy);
			if(offset >= 0)
				cursor.skip(offset);
			if(limit > 0)
				cursor.limit(limit);
			try {
				while (cursor.hasNext()) {
					DBObject obj = cursor.next();
					SmsMerchantProductVerify smsMerchantProductVerify = SmsMerchantProductVerify.dbObjectToPojo(obj);
					if(smsMerchantProductVerify!=null)
						results.add(smsMerchantProductVerify);
				}
			} finally {
				cursor.close();
			}
			
			return results;
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int findTotalSmsMerchantProductVerifies(List<String> merchants,
			List<String> providers, List<String> commandCodes,
			List<String> statuses, Date fromTime, Date toTime) {
		try {
			DBCollection collection = mongoTemplate.getCollection(smsMerchantProductVerifyMongoCollection);
			BasicDBObject query = getQueryObject(merchants, providers, commandCodes, statuses, fromTime, toTime);
			
			int total = (int) collection.count(query);
			
			return total;
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return 0;
	}

	private BasicDBObject getQueryObject(List<String> merchants, List<String> providers,
			List<String> commandCodes, List<String> statuses, Date fromTime,
			Date toTime) {
		BasicDBObject query = new BasicDBObject();
		
		if(fromTime != null || toTime != null) {
			if(fromTime == null) {
				fromTime = new Date(0L);
			}
			if(toTime == null) {
				toTime = new Date();
			}
			
			if(fromTime.getTime() <= toTime.getTime())
				query.put("created_time", BasicDBObjectBuilder.start("$gte", Utils.convertToMongoDBTime(fromTime)).add("$lte", Utils.convertToMongoDBTime(toTime)).get());
		}
		
		if(merchants != null && merchants.size() > 0){
			if(merchants.size()>1)
				query.put("merchant", new BasicDBObject("$in", merchants));
			else
				query.put("merchant",  merchants.get(0));
		}
		if(providers != null && providers.size() > 0){
			if(providers.size()>1)
				query.put("provider", new BasicDBObject("$in", providers));
			else
				query.put("provider", providers.get(0));
		}
		if(commandCodes != null && commandCodes.size() > 0) {
			if(commandCodes.size()>1){
				List<BasicDBObject> chargingCriteria = new ArrayList<BasicDBObject>();
				for(String cmdCode:commandCodes) {
					if(StringUtils.isBlank(cmdCode)) continue;
					chargingCriteria.add(new BasicDBObject("command_code", Pattern.compile("^"+cmdCode+"$", Pattern.CASE_INSENSITIVE)));
				}
				if(chargingCriteria.size() > 0)
					query.put("$or", chargingCriteria);
			}else{
				query.put("command_code", Pattern.compile("^"+commandCodes.get(0)+"$", Pattern.CASE_INSENSITIVE));
			}
		}
		if(statuses != null && statuses.size() > 0){
			if(statuses.size()>1)
				query.put("status", new BasicDBObject("$in", statuses));
			else
				query.put("status", statuses.get(0));
		}

//		System.out.println(query.toString());
		return query;
	}
	
	private BasicDBObject getSortQuery(String[] colNames, int[] sortDirect) {
		if(colNames == null || colNames.length == 0 
				|| sortDirect == null || sortDirect.length == 0
				|| colNames.length != sortDirect.length)
			return null;
		
		BasicDBObject sort = new BasicDBObject();
		for(int i = 0; i < colNames.length; i++)
			sort.append(colNames[i], sortDirect[i]);
		
		return sort;
	}

	@Override
	public SmsMerchantProductVerify findSmsMerchantProductVerifies(String merchant,
			String provider, String commandCode) {
		try {
			List<String> merchants = StringUtils.isNotEmpty(merchant) ? Arrays.asList(new String[] {merchant}) : null;
			List<String> providers = StringUtils.isNotEmpty(provider) ? Arrays.asList(new String[] {provider}) : null;
			List<String> commandCodes = StringUtils.isNotEmpty(commandCode) ? Arrays.asList(new String[] {commandCode}) : null;
			List<SmsMerchantProductVerify> list = findSmsMerchantProductVerifies(merchants, providers, commandCodes, null, null, null, -1, 0);
			if(list != null && list.size() > 0)
				return list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
