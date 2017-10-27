package com.lin.dao.product;

import java.util.List;

import com.lin.dao.DaoSupport;
import com.lin.entity.product.Productcategory;
import com.lin.dao.product.ProductcategoryDao;

public class ProductcategoryDaoImpl extends DaoSupport<Productcategory> implements ProductcategoryDao {

	@Override
	public boolean isUnique(String categoryname) {
		@SuppressWarnings("rawtypes")
		List list = getHibernateTemplate().find("from Productcategory where name = ?", categoryname);
		if(list != null && list.size() > 0){		
			return false;
		}
		return true;
	}
}
