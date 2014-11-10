package vn.onepay.charging.card.dao.mongo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import vn.onepay.account.model.Account;
import vn.onepay.charging.card.dao.MaintenanceCalendarDAO;
import vn.onepay.charging.card.model.MaintenanceCalendar;
import vn.onepay.utils.Utils;

public class MaintenanceCalendarDAOMongo implements MaintenanceCalendarDAO{

  private MongoTemplate mongoTemplate;
  public void setMongoTemplate(MongoTemplate mongoTemplate) {
    this.mongoTemplate = mongoTemplate;
  }
  
  private void setToMongoDBTime(MaintenanceCalendar maintenanceCalendar){
    if(maintenanceCalendar.getFrom_time()!=null)
      maintenanceCalendar.setFrom_time(Utils.convertToMongoDBTime(maintenanceCalendar.getFrom_time()));
    if(maintenanceCalendar.getEnd_time()!=null)
      maintenanceCalendar.setEnd_time(Utils.convertToMongoDBTime(maintenanceCalendar.getEnd_time()));
    
    if(maintenanceCalendar.getCreated_time()!=null)
      maintenanceCalendar.setCreated_time(Utils.convertToMongoDBTime(maintenanceCalendar.getCreated_time()));
    if(maintenanceCalendar.getUpdated_time()!=null)
      maintenanceCalendar.setUpdated_time(Utils.convertToMongoDBTime(maintenanceCalendar.getUpdated_time()));
  }
  
  private void setToDisplayTime(MaintenanceCalendar maintenanceCalendar){
    if(maintenanceCalendar.getFrom_time()!=null)
      maintenanceCalendar.setFrom_time(Utils.mongoDbTimeToDisplayTime(maintenanceCalendar.getFrom_time()));
    if(maintenanceCalendar.getEnd_time()!=null)
      maintenanceCalendar.setEnd_time(Utils.mongoDbTimeToDisplayTime(maintenanceCalendar.getEnd_time()));
    
    if(maintenanceCalendar.getCreated_time()!=null)
      maintenanceCalendar.setCreated_time(Utils.mongoDbTimeToDisplayTime(maintenanceCalendar.getCreated_time()));
    if(maintenanceCalendar.getUpdated_time()!=null)
      maintenanceCalendar.setUpdated_time(Utils.mongoDbTimeToDisplayTime(maintenanceCalendar.getUpdated_time()));
  }
  
  @Override
  public void save(MaintenanceCalendar maintenanceCalendar) {
    try{
      setToMongoDBTime(maintenanceCalendar);
      mongoTemplate.save(maintenanceCalendar);
    }catch(Exception e){
      e.printStackTrace();
    }
    
  }

  @Override
  public void remove(MaintenanceCalendar maintenanceCalendar) {
    try {
      mongoTemplate.remove(maintenanceCalendar);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @Override
  public MaintenanceCalendar getMaintenanceCalendar(String id) {
    try {
      Query query = new Query();
      query.addCriteria(Criteria.where("id").is(StringUtils.trimToEmpty(id)));
      
      MaintenanceCalendar maintenanceCalendar = mongoTemplate.findOne(query, MaintenanceCalendar.class);
      if(maintenanceCalendar != null){
        setToDisplayTime(maintenanceCalendar);
        return maintenanceCalendar;
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  @Override
  public int findTotalMaintenanceCalendars(Account account, List<String> telcos, List<Integer> status, Date fromDate,
      Date endDate) {
    
    try{
      Query query = getQuery(account, telcos, status, fromDate, endDate);
      return (int)mongoTemplate.count(query, MaintenanceCalendar.class);
      
    }catch(Exception e){
      e.printStackTrace();
    }
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public List<MaintenanceCalendar> findMaintenanceCalendars(Account account, List<String> telcos, List<Integer> status, Date fromDate,
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
      
      List<MaintenanceCalendar> maintenanceCalendars = mongoTemplate.find(query, MaintenanceCalendar.class);
      if(maintenanceCalendars != null && maintenanceCalendars.size() > 0){
        for(MaintenanceCalendar maintenanceCalendar : maintenanceCalendars){
          setToDisplayTime(maintenanceCalendar);
        }
      }
      return maintenanceCalendars;
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
