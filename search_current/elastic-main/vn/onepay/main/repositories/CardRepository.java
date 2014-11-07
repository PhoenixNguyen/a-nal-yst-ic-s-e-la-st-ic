package vn.onepay.main.repositories;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import vn.onepay.search.entities.ESCardCdr;

public interface CardRepository extends ElasticsearchRepository<ESCardCdr,String>{

}
