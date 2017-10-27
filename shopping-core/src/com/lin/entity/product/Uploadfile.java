package com.lin.entity.product;

import java.sql.Timestamp;
import java.util.Date;


public class Uploadfile implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	// Fields
	private Integer id;
    private Productinfo product;


	private String path;
    private Date uploadTime;
    private String remark;
    private int isCover;


    public int getIsCover() {
		return isCover;
	}

	public void setIsCover(int isCover) {
		this.isCover = isCover;
	}

	public Productinfo getProduct() {
		return product;
	}

	public void setProduct(Productinfo product) {
		this.product = product;
	}
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return this.path;
    }
    
    public void setPath(String path) {
        this.path = path;
    }

    public Date getUploadTime() {
        return this.uploadTime;
    }
    
    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
}