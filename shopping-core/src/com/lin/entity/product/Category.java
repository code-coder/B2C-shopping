package com.lin.entity.product;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import com.lin.entity.product.Secondcategory;

/**
 * AbstractCategory entity provides the base persistence definition of the
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Date updateTime;
	private String remark;
	private Set<Secondcategory> secondcategories = new HashSet<Secondcategory>();

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String name, Timestamp updateTime, String remark,
			Set secondcategories) {
		this.name = name;
		this.updateTime = updateTime;
		this.remark = remark;
		this.secondcategories = secondcategories;
	}

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

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getSecondcategories() {
		return this.secondcategories;
	}

	public void setSecondcategories(Set secondcategories) {
		this.secondcategories = secondcategories;
	}

}