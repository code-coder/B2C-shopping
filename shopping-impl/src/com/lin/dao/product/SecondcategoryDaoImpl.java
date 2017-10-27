package com.lin.dao.product;

import java.util.List;

import com.lin.dao.DaoSupport;
import com.lin.entity.product.Secondcategory;

public class SecondcategoryDaoImpl extends DaoSupport<Secondcategory> implements SecondcategoryDao {

	@Override
	public boolean isUnique(String categoryname) {
		@SuppressWarnings("rawtypes")
		List list = getHibernateTemplate().find("from Secondcategory where name = ?", categoryname);
		if(list != null && list.size() > 0){		
			return false;
		}
		return true;
	}
}
