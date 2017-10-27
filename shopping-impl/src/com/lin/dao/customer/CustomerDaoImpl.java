package com.lin.dao.customer;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.customer.Customer;


@Transactional
public class CustomerDaoImpl extends DaoSupport<Customer> implements CustomerDao {
	
	@Override
	public void save(Customer customer) {
		
		if(customer.getBalance() == null)
		{
			customer.setBalance(0f);
		}
		if(customer.getForbidden() == null)
		{
			customer.setForbidden(false);
		}
		
		getHibernateTemplate().save(customer);
	}

	@Override
	public void saveOrUpdate(Customer customer) {

		if(customer.getBalance() == null)
		{
			customer.setBalance(0f);
		}
		if(customer.getForbidden() == null)
		{
			customer.setForbidden(false);
		}
		if(customer.getRegisterTime() == null)
			customer.setRegisterTime(new Date());
		if(customer.getSex() == null)
			customer.setSex("保密");
		getHibernateTemplate().saveOrUpdate(customer);
	}
	
	
	@Override
	public Customer login(String username, String password) {
		if(username != null && password != null){
			String where = "where username=? and password=?";
			Object[] queryParams = {username,password};
			List<Customer> list = find(-1, -1, where, queryParams).getList();
			if(list != null && list.size() > 0){
				return list.get(0);
			}
		}
		return null;
	}

	@Override
	public boolean isUnique(String username) {
		List<Customer> list = (List<Customer>) getHibernateTemplate().find("from Customer where username = ?", username);
		if(list != null && list.size() > 0){
			return false;
		}
		return true;
	}
}
