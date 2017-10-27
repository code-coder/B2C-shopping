package com.lin.dao.cart;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.cart.Cart;

@Transactional
public class CartDaoImpl extends DaoSupport<Cart> implements CartDao {

	@Override
	public void save(Cart cart) {
		
		if(cart.getTotalPrice() == null)
		{
			cart.setTotalPrice(0f);
		}
		if(cart.getItemAmount() == null)
		{
			cart.setItemAmount(0);
		}
		getHibernateTemplate().save(cart);
	}

	@Override
	public void saveOrUpdate(Cart cart) {

		if(cart.getTotalPrice() == null)
		{
			cart.setTotalPrice(0f);
		}
		if(cart.getItemAmount() == null)
		{
			cart.setItemAmount(0);
		}
		getHibernateTemplate().saveOrUpdate(cart);
	}

	
}
