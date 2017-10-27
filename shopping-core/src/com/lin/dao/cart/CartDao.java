package com.lin.dao.cart;

import com.lin.dao.BaseDao;
import com.lin.entity.cart.Cart;

public interface CartDao extends BaseDao<Cart> {
	
	//重写保存方法
	public void save(Cart cart);//保存数据
	public void saveOrUpdate(Cart cart);//保存或修改数据
}
