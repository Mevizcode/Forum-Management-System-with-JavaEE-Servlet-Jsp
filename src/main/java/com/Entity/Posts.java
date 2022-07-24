package com.Entity;

import java.sql.Timestamp;

public class Posts {

  private long postId;
  private long threadId;
  private String userId;
  private java.sql.Timestamp createdOn;
  private String title;
  private String content;
  private String postedBy;
  private String modifiedBy;
  private java.sql.Timestamp modifiedOn;

  public Posts(){}

  public Posts(String postTitle, String content) {
    this.title = postTitle ;
    this.content = content;
  }
  public long getPostId() {
    return postId;
  }

  public void setPostId(long postId) {
    this.postId = postId;
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


  public java.sql.Timestamp getCreatedOn() {
    return createdOn;
  }

  public void setCreatedOn(java.sql.Timestamp createdOn) {
    this.createdOn = createdOn;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getPostedBy() {
    return postedBy;
  }

  public void setPostedBy(String postedBy) {
    this.postedBy = postedBy;
  }

  public String getModifiedBy() {
    return modifiedBy;
  }

  public void setModifiedBy(String modifiedBy) {
    this.modifiedBy = modifiedBy;
  }

  public Timestamp getModifiedOn() {
    return modifiedOn;
  }

  public void setModifiedOn(Timestamp modifiedOn) {
    this.modifiedOn = modifiedOn;
  }

}
