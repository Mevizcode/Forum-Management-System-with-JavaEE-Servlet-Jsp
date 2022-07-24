package com.Entity;


import java.sql.Timestamp;

public class Thread {

  private long threadId;
  private String userId;
  private java.sql.Timestamp threadCreatedOn;
  private String subject;
  private int postId;
  private String createdBy;

  public Thread (){

  }

  public Thread(long threadId, String userId, Timestamp threadCreatedOn, String subject) {
    this.threadId = threadId;
    this.userId = userId;
    this.threadCreatedOn = threadCreatedOn;
    this.subject = subject;
  }

  public Thread(String content) {
    this.subject=content;
  }

  public long getThreadId() {
    return threadId;
  }

  public void setThreadId(long threadId) {
    this.threadId = threadId;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public java.sql.Timestamp getThreadCreatedOn() {
    return threadCreatedOn;
  }

  public void setThreadCreatedOn(java.sql.Timestamp threadCreatedOn) {
    this.threadCreatedOn = threadCreatedOn;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public int getPostId() {
    return postId;
  }

  public void setPostId(int postId) {
    this.postId = postId;
  }

  public String getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(String createdBy) {
    this.createdBy = createdBy;
  }
}
