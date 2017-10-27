package com.lin.entity.account;

import java.io.Serializable;
import java.util.Date;


public class Tradingitem implements Serializable{

	// Fields
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Date tradingTime;
	private String tradingDetails;
	private Float money;
	private Account account;
	private Integer status;
    private String remark;
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getTradingTime() {
		return tradingTime;
	}
	public void setTradingTime(Date tradingTime) {
		this.tradingTime = tradingTime;
	}
	public String getTradingDetails() {
		return tradingDetails;
	}
	public void setTradingDetails(String tradingDetails) {
		this.tradingDetails = tradingDetails;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}