package com.pet.pay;

public class Pay {
	private int completeNum, reservationNum, price, cost,totalcost,fees;
	private String mean, created, subject,userName,userId ,address,checkIn,checkOut;
		
	
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public int getTotalcost() {
		return totalcost;
	}
	public void setTotalcost(int totalcost) {
		this.totalcost = totalcost;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getCompleteNum() {
		return completeNum;
	}
	public void setCompleteNum(int completeNum) {
		this.completeNum = completeNum;
	}
	public int getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMean() {
		return mean;
	}
	public void setMean(String mean) {
		this.mean = mean;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
	
}
