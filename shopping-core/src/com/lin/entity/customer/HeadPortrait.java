package com.lin.entity.customer;

import java.util.Date;


public class HeadPortrait implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	// Fields

	private String id;
	private String path;
	private Date updateTime;


	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}