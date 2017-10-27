package com.lin.dao.customer;

import com.lin.dao.BaseDao;
import com.lin.entity.customer.Customer;

public interface CustomerDao extends BaseDao<Customer> {
	//重写保存方法
	public void save(Customer customer);//保存数据
	public void saveOrUpdate(Customer customer);//保存或修改数据
	public Customer login(String username, String password);
	public boolean isUnique(String username);
}
