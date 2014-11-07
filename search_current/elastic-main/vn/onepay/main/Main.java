package vn.onepay.main;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.mongodb.core.MongoTemplate;

import vn.onepay.card.model.CardCdr;
import vn.onepay.main.repositories.SMSService;
import vn.onepay.main.repositories.CardService;
import vn.onepay.search.entities.ESCardCdr;
import vn.onepay.search.entities.ESSmsCdr;
import vn.onepay.search.entities.ESSmsCdrFilter;
import vn.onepay.sms.model.SMS;
import vn.onepay.sms.model.SmsCdr;
import vn.onepay.utils.Utils;

public class Main {
	@SuppressWarnings("unused")
  public static void main(String [] args){
		Main main = new Main();
		
		//Use Repository
		smsChargingIndexRepository();
		
		//cardChargingIndexRepository();
	}

	private static void smsChargingIndexRepository() {
    @SuppressWarnings("resource")
    ApplicationContext ctx1 = new ClassPathXmlApplicationContext("/vn/onepay/main/elastic-repository-config.xml");
    SMSService mySMSService = (SMSService)ctx1.getBean("mySMSService");
    
    ElasticsearchTemplate elasticsearchTemplate = (ElasticsearchTemplate) ctx1.getBean("elasticsearchTemplate");
    
    @SuppressWarnings("resource")
    ApplicationContext ctx = new ClassPathXmlApplicationContext("/vn/onepay/main/mongo-config.xml");
    MongoTemplate mongoTemplate = (MongoTemplate) ctx.getBean("mongoTemplate");
    
    List<SmsCdr> smsCdrs = mongoTemplate.findAll(SmsCdr.class);
      if ((smsCdrs != null) && (smsCdrs.size() > 0)) {
        for (SmsCdr sms : smsCdrs) {
          sms.setRequestTime(Utils.mongoDbTimeToDisplayTime(sms.getRequestTime()));
        }
      }
      
      List<SMS> mos = mongoTemplate.findAll(SMS.class);
      if ((mos != null) && (mos.size() > 0)) {
        for (SMS mo : mos) {
          mo.setRequest_time(Utils.mongoDbTimeToDisplayTime(mo.getRequest_time()));
        }
      }
      
//      if(smsCdrs == null || smsCdrs.size() == 0){
//        return;
//        }
      
      //System.out.println("Size: " + smsCdrs.size());
      
      //delete all data
      mySMSService.deleteAll();
      
      //delete index
      elasticsearchTemplate.deleteIndex(ESSmsCdrFilter.class);
      
      //INDEX
      if(!elasticsearchTemplate.indexExists(ESSmsCdrFilter.class)){
        System.out.println("Dang danh chi muc ...");
        
        
        List<ESSmsCdrFilter> objList = new ArrayList<ESSmsCdrFilter>();
        List<String> ids = new ArrayList<String>();
        
        //SMS
        for(SmsCdr sms : smsCdrs){
          ids.add(sms.getId());
          objList.add(new ESSmsCdrFilter(sms.getId(), sms.getMerchant(), sms.getApp_code(), sms.getPaymentProvider(), sms.getTelco(), 
              sms.getMsisdn(), sms.getAmount(), sms.getCommandCode(), 
              sms.getShortCode(), sms.getMoMessage(), sms.getRequestTime()));
          
        }
        
        //IAC
        for(SMS mo : mos){
          ids.add(mo.getId());
          objList.add(new ESSmsCdrFilter(mo.getId(), mo.getCp_code(), mo.getContent_id(), "mw_9029", mo.getTelco(), 
              mo.getMsisdn(), mo.getAmount(), mo.getGame_code(), 
              "9029", mo.getMo_message(), mo.getRequest_time()));
          
        }
        
        //cardCdrService.bulkSave(objList); too much
        int MAX = 50000;
        int times = objList.size()/MAX;
        for(int i = 0; i <= times; i++){
          
          if( i != times){
            System.out.println("Danh chi muc lan " + (i + 1) + " tu " + i * MAX + " den " + (MAX*(i+1) - 1) + " ...");
            mySMSService.bulkSave(objList.subList(i * MAX, MAX*(i+1)));
          }
          else{
            System.out.println("Danh chi muc lan " + (i + 1) + " tu " + i * MAX + " den " + (objList.size() - 1) + " ...");
            mySMSService.bulkSave(objList.subList(i * MAX, objList.size()));
          }
          
          System.out.println("    Hoan thanh lan " + (i + 1));
        }
        
        System.out.println("Hoan thanh tat ca");
      }
      else{
        System.out.println("Da ton tai chi muc");
        }
  }
	
	private static void cardChargingIndexRepository() {
    @SuppressWarnings("resource")
    ApplicationContext ctx1 = new ClassPathXmlApplicationContext("/vn/onepay/main/elastic-repository-config.xml");
    CardService cardService = (CardService)ctx1.getBean("cardService");
    
    ElasticsearchTemplate elasticsearchTemplate = (ElasticsearchTemplate) ctx1.getBean("elasticsearchTemplate");
    
    @SuppressWarnings("resource")
    ApplicationContext ctx = new ClassPathXmlApplicationContext("/vn/onepay/main/mongo-config.xml");
    MongoTemplate mongoTemplate = (MongoTemplate) ctx.getBean("mongoTemplate");
    
      List<CardCdr> cards = mongoTemplate.findAll(CardCdr.class);
      if ((cards != null) && (cards.size() > 0)) {
        for (CardCdr card : cards) {
          card.setTimestamp(Utils.mongoDbTimeToDisplayTime(card.getTimestamp()));
        }
      }
      
      if(cards == null || cards.size() == 0){
        return;
        }
      
      System.out.println("Size: " + cards.size());
      
      //delete all data
      cardService.deleteAll();
      
      //delete index
      elasticsearchTemplate.deleteIndex(ESCardCdr.class);
      
      //INDEX
      if(!elasticsearchTemplate.indexExists(ESCardCdr.class)){
        System.out.println("Dang danh chi muc ...");
        
        
        List<ESCardCdr> objList = new ArrayList<ESCardCdr>();
        List<String> ids = new ArrayList<String>();
        
        //CARD
        for(CardCdr card : cards){
          ids.add(card.getId());
          objList.add(new ESCardCdr(card.getId(), card.getAmount(), card.getMerchant(), card.getPaymentProvider(),
              card.getApp_code(), card.getPin(), card.getSerial(), card.getType(), card.getStatus(), card.getMessage(),
              card.getTimestamp()));
          
        }
        
        //cardCdrService.bulkSave(objList); too much
        int MAX = 50000;
        int times = objList.size()/MAX;
        for(int i = 0; i <= times; i++){
          
          if( i != times){
            System.out.println("Danh chi muc lan " + (i + 1) + " tu " + i * MAX + " den " + (MAX*(i+1) - 1) + " ...");
            cardService.bulkSave(objList.subList(i * MAX, MAX*(i+1)));
          }
          else{
            System.out.println("Danh chi muc lan " + (i + 1) + " tu " + i * MAX + " den " + (objList.size() - 1) + " ...");
            cardService.bulkSave(objList.subList(i * MAX, objList.size()));
          }
          
          System.out.println("    Hoan thanh lan " + (i + 1));
        }
        
        System.out.println("Hoan thanh tat ca");
      }
      else{
        System.out.println("Da ton tai chi muc");
        }
  }
	
	private Random random = new Random();
	private String getRandomList(List<String> list) {
	    int index = random.nextInt(list.size());
	    //System.out.println("\nIndex :" + index );
	    return list.get(index);
	}
	
//	private void cardIndexTemplate() {
//		ApplicationContext ctx1 = new ClassPathXmlApplicationContext("/vn/onepay/search/resources/elastic-config.xml");
//		ElasticSearch elasticSearch = (ElasticSearch) ctx1.getBean("elasticSearch");
//		
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("/main/mongo-config.xml");
//		CardCdrDAO cardCdrDAO= (CardCdrDAO) ctx.getBean("cardCdrDAO");
//		
//		List<CardCdr> cardCdrList = cardCdrDAO.findAllCardCdrs();
//  	  
//	  	  if(cardCdrList != null){
//	  		  System.out.println("Size: " + cardCdrList.size());
//	  	  }
//	  	  
//		  elasticSearch.deleteIndex(vn.onepay.search.entities.CardCdr.class);
//	      //INDEX
//	      if(!elasticSearch.checkIndex(vn.onepay.search.entities.CardCdr.class) ){
//	    	  System.out.println("Dang danh chi muc ...");
//	    	  //cardCdrElasticSearch.deleteIndex();
//	    	  //List<CardCdr> cardCdrList = cardCdrDAO.findAllCardCdrs();
//	    	  
//	    	  if(cardCdrList != null){
//	    		  System.out.println("Size: " + cardCdrList.size());
//	    	  }
//	    	  if(cardCdrList == null || cardCdrList.size() == 0){
//	    		  return;
//	    	  }
//	    	  
//	    	  List<vn.onepay.search.entities.CardCdr> objList = new ArrayList<vn.onepay.search.entities.CardCdr>();
//	    	  List<String> ids = new ArrayList<String>();
//	    	  for(CardCdr card : cardCdrList){
//	    		  ids.add(card.getId());
//	    		  objList.add(new vn.onepay.search.entities.CardCdr(card.getId(), card.getAmount(), card.getMerchant(), card.getPaymentProvider(),
//	    				  card.getApp_code(), card.getPin(), card.getSerial(), card.getType(), 
//	    				  card.getStatus(), card.getMessage(), card.getTimestamp(), card.getExtractStatus()));
//	    		  
//	    	  }
//	    	  
//	    	  for(int i = 0; i <= objList.size()/20000; i++){
//	    		  System.out.println("Danh chi muc lan " + (i + 1));
//	    		  elasticSearch.bulkIndex(ids, objList.subList(i, 20000*(i+1)));
//	    	  }
//	    	  
//	    	  
//	    	  System.out.println("Hoan thanh");
//	      }
//	      else{
//	    	  System.out.println("Da ton tai chi muc");
//	      }
//		
//	}
}
