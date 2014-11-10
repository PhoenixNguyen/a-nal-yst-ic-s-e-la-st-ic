package vn.onepay.charging.card.dao;

import java.util.Date;
import java.util.List;

import vn.onepay.account.model.Account;
import vn.onepay.charging.card.model.MaintenanceCalendar;

public interface MaintenanceCalendarDAO {
  public void save(MaintenanceCalendar caintenanceCalendar);
  public void remove(MaintenanceCalendar caintenanceCalendar);
  
  public MaintenanceCalendar getMaintenanceCalendar(String id);
  
  public int findTotalMaintenanceCalendars(Account account, List<String> telcos, List<Integer> status, Date fromDate, Date endDate);
  public List<MaintenanceCalendar> findMaintenanceCalendars(Account account, List<String> telcos, List<Integer> status, Date fromDate, Date endDate, int offset, int limit);
  
}
