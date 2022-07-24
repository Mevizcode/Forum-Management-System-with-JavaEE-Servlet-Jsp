package com.Entity;


public class UserLog {

  private String id;
  private String loginTime;
  private String logoutTime;
  private String clientIp;
  private String userId;
  private String clientOs;
  private String clientBrowser;
  private String active_time;
  private int active_status;

  public UserLog(String logID, String loginTime, String clientIP, String userID, String clientOS, String clientBrowser, int active_status) {
    this.id = logID;
    this.loginTime = loginTime;
    this.clientIp = clientIP;
    this.userId = userID;
    this.clientOs = clientOS;
    this.clientBrowser = clientBrowser;
    this.active_status = active_status;
  }

  public UserLog() {
  }


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getLoginTime() {
    return loginTime;
  }

  public void setLoginTime(String loginTime) {
    this.loginTime = loginTime;
  }


  public String getLogoutTime() {
    return logoutTime;
  }

  public void setLogoutTime(String logoutTime) {
    this.logoutTime = logoutTime;
  }


  public String getClientIp() {
    return clientIp;
  }

  public void setClientIp(String clientIp) {
    this.clientIp = clientIp;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getClientOs() {
    return clientOs;
  }

  public void setClientOs(String clientOs) {
    this.clientOs = clientOs;
  }


  public String getClientBrowser() {
    return clientBrowser;
  }

  public void setClientBrowser(String clientBrowser) {
    this.clientBrowser = clientBrowser;
  }

  public String getActive_time() {
    return active_time;
  }

  public void setActive_time(String active_time) {
    this.active_time = active_time;
  }

  public int getActive_status() {
    return active_status;
  }

  public void setActive_status(int active_status) {
    this.active_status = active_status;
  }
}
