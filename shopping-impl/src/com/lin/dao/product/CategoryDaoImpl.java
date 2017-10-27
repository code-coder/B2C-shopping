package com.lin.dao.product;

import java.util.List;

import com.lin.dao.DaoSupport;
import com.lin.entity.product.Category;

public class CategoryDaoImpl extends DaoSupport<Category> implements CategoryDao {

	@Override
	public boolean isUnique(String categoryname) {
		@SuppressWarnings("rawtypes")
		List list = getHibernateTemplate().find("from Category where name = ?", categoryname);
		if(list != null && list.size() > 0){		
			return false;
		}
		return true;
	}
}
