package com.lin.dao.product;

import com.lin.dao.BaseDao;
import com.lin.entity.product.Productinfo;

public interface ProductDao extends BaseDao<Productinfo>{
	
	//重写保存方法
	public void save(Productinfo product);//保存数据
	public void saveOrUpdate(Productinfo product);//保存或修改数据
}
