package com.lin.dao.customer;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.customer.ShoppingAddress;

@Transactional
public class ShoppingAddressDaoImpl extends DaoSupport<ShoppingAddress> implements ShoppingAddressDao {

	public void save(ShoppingAddress shoppingAddress)
	{
		if(shoppingAddress.getIsDefault() == null || shoppingAddress.getIsDefault() != true)
			shoppingAddress.setIsDefault(false);
		getHibernateTemplate().save(shoppingAddress);
	}
	
	public void saveOrUpdate(ShoppingAddress shoppingAddress)
	{
		if(shoppingAddress.getIsDefault() == null || shoppingAddress.getIsDefault() != true)
			shoppingAddress.setIsDefault(false);
		getHibernateTemplate().saveOrUpdate(shoppingAddress);
	}
}
