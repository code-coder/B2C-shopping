package com.lin.entity.product;

import java.util.Date;

import com.lin.entity.customer.Customer;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Consultation implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	
	private int id;
	private Customer customer;
	private Productinfo product;
	private Date consultingTime;
	private Date answeringTime;
	private String details;
	private String answer;
	private Boolean answered;
	private Boolean showed;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Productinfo getProduct() {
		return product;
	}
	public void setProduct(Productinfo product) {
		this.product = product;
	}
	
	public Date getConsultingTime() {
		return consultingTime;
	}
	public void setConsultingTime(Date consultingTime) {
		this.consultingTime = consultingTime;
	}
	public Date getAnsweringTime() {
		return answeringTime;
	}
	public void setAnsweringTime(Date answeringTime) {
		this.answeringTime = answeringTime;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Boolean getAnswered() {
		return answered;
	}
	public void setAnswered(Boolean answered) {
		this.answered = answered;
	}
	public Boolean getShowed() {
		return showed;
	}
	public void setShowed(Boolean showed) {
		this.showed = showed;
	}

}