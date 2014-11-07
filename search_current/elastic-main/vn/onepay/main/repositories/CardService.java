package vn.onepay.main.repositories;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import vn.onepay.search.entities.ESCardCdr;


@Service
public class CardService {
	
	@Resource
	CardRepository cardRepository;


	public CardRepository getCardRepository() {
    return cardRepository;
  }

  public void setCardRepository(CardRepository cardRepository) {
    this.cardRepository = cardRepository;
  }

  public void save(ESCardCdr object) {
    cardRepository.save(object);
    }
	
	public void bulkSave(List<ESCardCdr> objects) {
	  cardRepository.save(objects);
    }
	
	public boolean checkExist(){
		return cardRepository.exists("id");
	}
	
	public void deleteAll(){
	  cardRepository.deleteAll();
	}
}
