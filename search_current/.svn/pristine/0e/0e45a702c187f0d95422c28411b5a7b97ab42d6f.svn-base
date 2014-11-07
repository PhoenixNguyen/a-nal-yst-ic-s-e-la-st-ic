package vn.onepay.main.repositories;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.onepay.search.entities.ESSmsCdrFilter;


@Service
public class SMSService {
	
	@Resource
	MySMSRepository mySMSRepository;

	public MySMSRepository getMySMSRepository() {
    return mySMSRepository;
  }

  public void setMySMSRepository(MySMSRepository mySMSRepository) {
    this.mySMSRepository = mySMSRepository;
  }

	public void save(ESSmsCdrFilter object) {
	  mySMSRepository.save(object);
    }
	
	public void bulkSave(List<ESSmsCdrFilter> objects) {
	  mySMSRepository.save(objects);
    }
	
	public boolean checkExist(){
		return mySMSRepository.exists("id");
	}
	
	public void deleteAll(){
	  mySMSRepository.deleteAll();
	}
}
