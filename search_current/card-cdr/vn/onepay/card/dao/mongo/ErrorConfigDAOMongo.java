package vn.onepay.card.dao.mongo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.account.model.Account;
import vn.onepay.card.dao.ErrorConfigDAO;
import vn.onepay.card.model.ErrorConfig;
import vn.onepay.utils.Utils;

public class ErrorConfigDAOMongo implements ErrorConfigDAO{

  private MongoTemplate mongoTemplate;
  public void setMongoTemplate(MongoTemplate mongoTemplate) {
    this.mongoTemplate = mongoTemplate;
  }
  
  private void setToMongoDBTime(ErrorConfig errorConfig){
    if(errorConfig.getFrom_time()!=null)
      errorConfig.setFrom_time(Utils.convertToMongoDBTime(errorConfig.getFrom_time()));
    if(errorConfig.getEnd_time()!=null)
      errorConfig.setEnd_time(Utils.convertToMongoDBTime(errorConfig.getEnd_time()));
    
    if(errorConfig.getCreated_time()!=null)
      errorConfig.setCreated_time(Utils.convertToMongoDBTime(errorConfig.getCreated_time()));
    if(errorConfig.getUpdated_time()!=null)
      errorConfig.setUpdated_time(Utils.convertToMongoDBTime(errorConfig.getUpdated_time()));
  }
  
  private void setToDisplayTime(ErrorConfig errorConfig){
    if(errorConfig.getFrom_time()!=null)
      errorConfig.setFrom_time(Utils.mongoDbTimeToDisplayTime(errorConfig.getFrom_time()));
    if(errorConfig.getEnd_time()!=null)
      errorConfig.setEnd_time(Utils.mongoDbTimeToDisplayTime(errorConfig.getEnd_time()));
    
    if(errorConfig.getCreated_time()!=null)
      errorConfig.setCreated_time(Utils.mongoDbTimeToDisplayTime(errorConfig.getCreated_time()));
    if(errorConfig.getUpdated_time()!=null)
      errorConfig.setUpdated_time(Utils.mongoDbTimeToDisplayTime(errorConfig.getUpdated_time()));
  }
  
  @Override
  public void save(ErrorConfig errorConfig) {
    try{
      setToMongoDBTime(errorConfig);
      mongoTemplate.save(errorConfig);
    }catch(Exception e){
      e.printStackTrace();
    }
    
  }

  @Override
  public void remove(ErrorConfig errorConfig) {
    try {
      mongoTemplate.remove(errorConfig);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @Override
  public ErrorConfig getErrorConfig(String id) {
    try {
      Query query = new Query();
      query.addCriteria(Criteria.where("id").is(StringUtils.trimToEmpty(id)));
      
      ErrorConfig errorConfig = mongoTemplate.findOne(query, ErrorConfig.class);
      if(errorConfig != null){
        setToDisplayTime(errorConfig);
        return errorConfig;
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  @Override
  public int findTotalErrorConfig(Account account, List<String> telcos, List<Integer> status, Date fromDate,
      Date endDate) {
    
    try{
      Query query = getQuery(account, telcos, status, fromDate, endDate);
      return (int)mongoTemplate.count(query, ErrorConfig.class);
      
    }catch(Exception e){
      e.printStackTrace();
    }
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public List<ErrorConfig> findErrorConfigs(Account account, List<String> telcos, List<Integer> status, Date fromDate,
      Date endDate, int offset, int limit) {
    try{
      Query query = getQuery(account, telcos, status, fromDate, endDate);
      if(query==null)
        return null;
      
      Sort orderBy = new Sort(Sort.Direction.DESC, "from_time");
      
      if(offset>0)
        query.skip(offset);
      if(limit>0)
        query.limit(limit);
      
      query.with(orderBy);
      System.out.println(query);
      
      List<ErrorConfig> errorConfigs = mongoTemplate.find(query, ErrorConfig.class);
      if(errorConfigs != null && errorConfigs.size() > 0){
        for(ErrorConfig errorConfig : errorConfigs){
          setToDisplayTime(errorConfig);
        }
      }
      return errorConfigs;
    }catch(Exception e){
      e.printStackTrace();
    }
    
    return null;
  }

  private Query getQuery(Account account, List<String> telcos, List<Integer> status, Date fromDate, Date endDate) {
    Query query = new Query();
    List<Criteria> searchCriteria = new ArrayList<Criteria>();
    
    if(telcos != null && telcos.size() > 0){
      searchCriteria.add(Criteria.where("telco").in(telcos));
    }
    if(status != null && status.size() > 0){
      searchCriteria.add(Criteria.where("status").in(status));
    }
    
    if(fromDate != null || endDate != null) {
      if(fromDate == null) 
        fromDate = new Date(0L);
      if(endDate == null) 
        endDate = new Date();
      if(fromDate.getTime() <= endDate.getTime()){
        searchCriteria.add(Criteria.where("from_time").gte(Utils.convertToMongoDBTime(fromDate))); 
        searchCriteria.add(Criteria.where("from_time").lte(Utils.convertToMongoDBTime(endDate)));
      }
    }
    
    if(searchCriteria != null&&searchCriteria.size()>0)
      if(searchCriteria.size() > 1)
        query.addCriteria(new Criteria().andOperator(searchCriteria.toArray(new Criteria[0])));
      else
        query.addCriteria(searchCriteria.get(0));
    System.out.println(query.toString());
    return query;
  }

}
