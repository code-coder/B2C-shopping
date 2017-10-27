package com.lin.dao.product;

import com.lin.dao.BaseDao;
import com.lin.entity.product.Productcategory;

public interface ProductcategoryDao extends BaseDao<Productcategory> {
	public boolean isUnique(String categoryname);
}
