package com.lin.dao.customer;

import com.lin.dao.BaseDao;
import com.lin.entity.customer.ShoppingAddress;

public interface ShoppingAddressDao extends BaseDao<ShoppingAddress> {
	//重新保存方法
	public void save(ShoppingAddress shoppingAddress);//保存数据
	public void saveOrUpdate(ShoppingAddress shoppingAddress);//保存或修改数据
}
