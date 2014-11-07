package vn.onepay.card.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.account.model.Account;
import vn.onepay.card.model.ErrorConfig;

public interface ErrorConfigDAO {
  public void save(ErrorConfig errorConfig);
  public void remove(ErrorConfig errorConfig);
  
  public ErrorConfig getErrorConfig(String id);
  
  public int findTotalErrorConfig(Account account, List<String> telcos, List<Integer> status, Date fromDate, Date endDate);
  public List<ErrorConfig> findErrorConfigs(Account account, List<String> telcos, List<Integer> status, Date fromDate, Date endDate, int offset, int limit);
  
}
