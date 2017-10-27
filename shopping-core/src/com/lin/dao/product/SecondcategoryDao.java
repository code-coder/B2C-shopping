package com.lin.dao.product;

import com.lin.dao.BaseDao;
import com.lin.entity.product.Secondcategory;

public interface SecondcategoryDao extends BaseDao<Secondcategory> {
	public boolean isUnique(String categoryname);
}
