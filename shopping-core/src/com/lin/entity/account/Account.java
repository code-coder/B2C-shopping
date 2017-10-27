package com.lin.entity.account;

import java.util.Set;


public class Account implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	
	private String id;
	private Float balance;
	private String password;
	private Set<Tradingitem> tradingitems ;


	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Float getBalance() {
		return balance;
	}

	public void setBalance(Float balance) {
		this.balance = balance;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Tradingitem> getTradingitems() {
		return tradingitems;
	}

	public void setTradingitems(Set<Tradingitem> tradingitems) {
		this.tradingitems = tradingitems;
	}	

}