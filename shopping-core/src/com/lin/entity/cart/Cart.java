package com.lin.entity.cart;

import java.util.Set;

public class Cart implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	
	private String id;
	private Float totalPrice;
	private Integer itemAmount;
	private Set<Cartitem> cartitems ;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Float getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getItemAmount() {
		return this.itemAmount;
	}

	public void setItemAmount(Integer itemAmount) {
		this.itemAmount = itemAmount;
	}

	
	
	public Set<Cartitem> getCartitems() {
		return cartitems;
	}

	public void setCartitems(Set<Cartitem> cartitems) {
		this.cartitems = cartitems;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", totalPrice=" + totalPrice
				+ ", itemAmount=" + itemAmount + "]";
	}

	

}