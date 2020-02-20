package com.wangziping.domain;

public class Condition {

	private String startDate;
	private String endDate;
	private String orderMethod;
	private String orderName;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getOrderMethod() {
		return orderMethod;
	}

	public void setOrderMethod(String orderMethod) {
		this.orderMethod = orderMethod;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	@Override
	public String toString() {
		return "Condition [startDate=" + startDate + ", endDate=" + endDate + ", orderMethod=" + orderMethod
				+ ", orderName=" + orderName + "]";
	}

}
