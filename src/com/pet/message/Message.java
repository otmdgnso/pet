package com.pet.message;

import java.util.List;

public class Message {
	private int messageNum;
	private String subject, content, sendUserId, userId;
	private String receiveUserId, sendCreated, confirmCreated;
	private String sendDelete, receiveDelete;
	private List<Integer> messageNums;
	
	public List<Integer> getMessageNums() {
		return messageNums;
	}
	public void setMessageNums(List<Integer> messageNums) {
		this.messageNums = messageNums;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendUserId() {
		return sendUserId;
	}
	public void setSendUserId(String sendUserId) {
		this.sendUserId = sendUserId;
	}
	public String getReceiveUserId() {
		return receiveUserId;
	}
	public void setReceiveUserId(String receiveUserId) {
		this.receiveUserId = receiveUserId;
	}
	public String getSendCreated() {
		return sendCreated;
	}
	public void setSendCreated(String sendCreated) {
		this.sendCreated = sendCreated;
	}
	public String getConfirmCreated() {
		return confirmCreated;
	}
	public void setConfirmCreated(String confirmCreated) {
		this.confirmCreated = confirmCreated;
	}
	public String getSendDelete() {
		return sendDelete;
	}
	public void setSendDelete(String sendDelete) {
		this.sendDelete = sendDelete;
	}
	public String getReceiveDelete() {
		return receiveDelete;
	}
	public void setReceiveDelete(String receiveDelete) {
		this.receiveDelete = receiveDelete;
	}
}
