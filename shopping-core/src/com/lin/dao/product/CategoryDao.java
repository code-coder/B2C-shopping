package com.lin.dao.product;

import com.lin.dao.BaseDao;
import com.lin.entity.product.Category;

public interface CategoryDao extends BaseDao<Category> {
	public boolean isUnique(String categoryname);

}
