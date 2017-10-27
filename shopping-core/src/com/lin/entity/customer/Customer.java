package com.lin.entity.customer;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.lin.entity.account.Account;
import com.lin.entity.cart.Cart;
import com.lin.entity.order.Order;
import com.lin.entity.product.Consultation;


public class Customer implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String username;
	private String password;
	private String realname;
	private String sex;
	private String address;
	private String email;
	private String mobile;
	private Float balance;
	private Boolean forbidden;
	private Set<Order> orders = new HashSet<Order>();
	private Set<ShoppingAddress> shoppingAddresses = new HashSet<ShoppingAddress>();
	private Set<Consultation> consultations = new HashSet<Consultation>();
	private Cart cart;
	private Account account;
	private HeadPortrait headPortrait;
	private Date lastLogin;
	private Date registerTime;
	

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Boolean getForbidden() {
		return forbidden;
	}

	public void setForbidden(Boolean forbidden) {
		this.forbidden = forbidden;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Float getBalance() {
		return balance;
	}

	public void setBalance(Float balance) {
		this.balance = balance;
	}

	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}


	public Set<ShoppingAddress> getShoppingAddresses() {
		return shoppingAddresses;
	}

	public void setShoppingAddresses(Set<ShoppingAddress> shoppingAddresses) {
		this.shoppingAddresses = shoppingAddresses;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public HeadPortrait getHeadPortrait() {
		return headPortrait;
	}

	public void setHeadPortrait(HeadPortrait headPortrait) {
		this.headPortrait = headPortrait;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Set getConsultations() {
		return consultations;
	}

	public void setConsultations(Set consultations) {
		this.consultations = consultations;
	}

}