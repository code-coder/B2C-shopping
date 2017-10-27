package com.lin.entity.product;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class Productinfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Productcategory productCategory;
	private String name;
	private String subName;
	private String description;
	private Float baseprice;
	private Float sellprice;
	private Float star;
	private Date sellTime;
	private Date sellOutTime;
	private Integer homeIndex;
	private Integer isNew;
	private Integer isHot;
	private Integer clickcount;
	private Integer sellcount;
	private Set<Consultation> consultations = new HashSet<Consultation>();
	private Set<Uploadfile> uploadfiles = new HashSet<Uploadfile>();


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public Date getSellTime() {
		return sellTime;
	}

	public void setSellTime(Date sellTime) {
		this.sellTime = sellTime;
	}

	public Date getSellOutTime() {
		return sellOutTime;
	}

	public void setSellOutTime(Date sellOutTime) {
		this.sellOutTime = sellOutTime;
	}

	public Integer getIsNew() {
		return isNew;
	}

	public void setIsNew(Integer isNew) {
		this.isNew = isNew;
	}

	public Integer getIsHot() {
		return isHot;
	}

	public void setIsHot(Integer isHot) {
		this.isHot = isHot;
	}

	public Integer getHomeIndex() {
		return homeIndex;
	}

	public void setHomeIndex(Integer homeIndex) {
		this.homeIndex = homeIndex;
	}

	public Productcategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(Productcategory productCategory) {
		this.productCategory = productCategory;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getBaseprice() {
		return this.baseprice;
	}

	public void setBaseprice(Float baseprice) {
		this.baseprice = baseprice;
	}

	public Float getSellprice() {
		return this.sellprice;
	}

	public void setSellprice(Float sellprice) {
		this.sellprice = sellprice;
	}

	public Integer getClickcount() {
		return this.clickcount;
	}

	public void setClickcount(Integer clickcount) {
		this.clickcount = clickcount;
	}

	public Integer getSellcount() {
		return this.sellcount;
	}

	public void setSellcount(Integer sellcount) {
		this.sellcount = sellcount;
	}

	public Set<Consultation> getConsultations() {
		return consultations;
	}

	public void setConsultations(Set<Consultation> consultations) {
		this.consultations = consultations;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Productinfo other = (Productinfo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public Set<Uploadfile> getUploadfiles() {
		return uploadfiles;
	}

	public void setUploadfiles(Set<Uploadfile> uploadfiles) {
		this.uploadfiles = uploadfiles;
	}

	public Float getStar() {
		return star;
	}

	public void setStar(Float star) {
		this.star = star;
	}
	

}