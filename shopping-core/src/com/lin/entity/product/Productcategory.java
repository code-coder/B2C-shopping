package com.lin.entity.product;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;



/**
 * Productcategory entity. @author MyEclipse Persistence Tools
 */

public class Productcategory implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	//private Set<Productinfo> products = new HashSet<Productinfo>();
	private Secondcategory secondcategory;
	private Date updateTime;


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}


/*	public Set<Productinfo> getProducts() {
		return products;
	}

	public void setProducts(Set<Productinfo> products) {
		this.products = products;
	}*/

	public Secondcategory getSecondcategory() {
		return secondcategory;
	}

	public void setSecondcategory(Secondcategory secondcategory) {
		this.secondcategory = secondcategory;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	

}