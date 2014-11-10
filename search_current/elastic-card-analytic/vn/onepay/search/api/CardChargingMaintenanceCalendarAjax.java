package vn.onepay.search.api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.charging.card.common.CardConstants;
import vn.onepay.charging.card.dao.MaintenanceCalendarDAO;
import vn.onepay.charging.card.model.MaintenanceCalendar;
import vn.onepay.common.SharedConstants;
import vn.onepay.search.controller.CardChargingMaintenanceCalendarController;
import vn.onepay.web.secure.controllers.AbstractProtectedController;

public class CardChargingMaintenanceCalendarAjax extends AbstractProtectedController{
  MaintenanceCalendarDAO maintenanceCalendarDAO;

  public void setMaintenanceCalendarDAO(MaintenanceCalendarDAO maintenanceCalendarDAO) {
    this.maintenanceCalendarDAO = maintenanceCalendarDAO;
  }

  private enum Action {
    ADD_EDIT, DELETE
  }

  @Override
  protected ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, ModelMap model)
      throws Exception {
    response.setContentType("text/html");
    Account account = (Account) request.getSession()
        .getAttribute(SharedConstants.ACCOUNT_LOGINED);
    if (account == null) {
      response.getOutputStream().write(
          "Bạn chưa đăng nhập!".getBytes("UTF-8"));
      return null;
    }
    
    String actionRequest = StringUtils.trimToEmpty(request.getParameter("action"));
    
    
    Action action = null;
    try{
      action = Action.valueOf(actionRequest);
    }catch(Exception e){
      e.printStackTrace();
    }
    
    if(action == null){
      response.getOutputStream().write(
          "Không tồn tại yêu cầu, hãy thử lại sau!".getBytes("utf8"));
      return null;
    }
    
    switch(action){
    case ADD_EDIT:
      modifyData(request, response, account);
      break;
    case DELETE:
      deleteData(request, response, account);
      break;
    }
    
    return null;
  }

  private void deleteData(HttpServletRequest request, HttpServletResponse response, Account account) throws UnsupportedEncodingException, IOException {
    String id = StringUtils.trimToEmpty(request.getParameter("id"));
    
    MaintenanceCalendar maintenanceCalendar = maintenanceCalendarDAO.getMaintenanceCalendar(id);
    if(maintenanceCalendar == null){
      response.getOutputStream().write(
          "Không tồn tại cấu hình này!".getBytes("UTF-8"));
      return;
    }
    
    maintenanceCalendarDAO.remove(maintenanceCalendar);
    
    response.getOutputStream().write(
        "Xóa cấu hình thành công!".getBytes("UTF-8"));
    return;
  }

  private void modifyData(HttpServletRequest request, HttpServletResponse response, Account account) throws UnsupportedEncodingException, IOException {
    String id = StringUtils.trimToEmpty(request.getParameter("id"));
    String title = StringUtils.trimToEmpty(request.getParameter("title"));
    String telco = StringUtils.trimToEmpty(request.getParameter("telco"));
    String from_time = StringUtils.trimToEmpty(request.getParameter("from_time"));
    String end_time = StringUtils.trimToEmpty(request.getParameter("end_time"));
    String note = StringUtils.trimToEmpty(request.getParameter("note"));
    
    DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    
    MaintenanceCalendar maintenanceCalendar = new MaintenanceCalendar();
    //new record
    if(id.equals("")){
      maintenanceCalendar.setCreated_time(new Date());
      
    }else{
      maintenanceCalendar = maintenanceCalendarDAO.getMaintenanceCalendar(id);
      
      if(maintenanceCalendar == null){
        response.getOutputStream().write(
            "Không tồn tại cấu hình này!".getBytes("UTF-8"));
        return;
      }
    }
    
    try{
      Date fromDate = df.parse(from_time);
      Date endDate = df.parse(end_time);
      
      if(endDate.before(fromDate)){
        response.getOutputStream().write(
            "Thời gian kết thúc phải sau thời gian bắt đầu!".getBytes("UTF-8"));
        return;
      }
      maintenanceCalendar.setFrom_time(fromDate);
      maintenanceCalendar.setEnd_time(endDate);
      
    }catch(Exception e){
      e.printStackTrace();
      
      response.getOutputStream().write(
          "Thời gian sai định dạng!".getBytes("UTF-8"));
      return;
    }
    
    if(!title.equalsIgnoreCase(""))
      maintenanceCalendar.setTitle(title);
    else{
      response.getOutputStream().write(
          "Tiêu đề không được trống!".getBytes("UTF-8"));
      return;
    }
    
    if(!telco.equals("")){
      if(CardConstants.ALL_CARD_TYPES.contains(telco))
        maintenanceCalendar.setTelco(telco);
      else{
        response.getOutputStream().write(
            "Telco không tồn tại!".getBytes("UTF-8"));
        return;
      }
    }
    else{
      response.getOutputStream().write(
          "Telco không được trống!".getBytes("UTF-8"));
      return;
    }
    
    if(!note.equals(""))
      maintenanceCalendar.setNote(note);
    else{
      response.getOutputStream().write(
          "Nội dung không được trống!".getBytes("UTF-8"));
      return;
    }
    maintenanceCalendar.setUpdated_time(new Date());
    
    maintenanceCalendarDAO.save(maintenanceCalendar);
    
    if (!id.equalsIgnoreCase("")) {
      response.getOutputStream().write(
          "Sửa cấu hình thành công!".getBytes("UTF-8"));
      return;
    }

    response.getOutputStream().write(
        "Lập cấu hình thành công!".getBytes("UTF-8"));
  }
  
  
}
