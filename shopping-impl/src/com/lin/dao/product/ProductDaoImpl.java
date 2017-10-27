package com.lin.dao.product;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.product.Productinfo;

@Transactional
public class ProductDaoImpl extends DaoSupport<Productinfo> implements ProductDao {

	/**
	 * 保存商品
	 */
	@Override
	public void save(Productinfo product) {
		
		if(product.getClickcount() == null)
			product.setClickcount(0);
		if(product.getSellcount() == null)
			product.setSellcount(0);
		
		getHibernateTemplate().save(product);
	}

	@Override
	public void saveOrUpdate(Productinfo product) {

		if(product.getClickcount() == null)
			product.setClickcount(0);
		if(product.getSellcount() == null)
			product.setSellcount(0);
		if(product.getSellTime() == null)
			product.setSellTime(new Date());
		getHibernateTemplate().saveOrUpdate(product);
	}

	
}
