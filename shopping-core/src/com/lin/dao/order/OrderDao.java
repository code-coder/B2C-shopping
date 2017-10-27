package com.lin.dao.order;

import com.lin.dao.BaseDao;
import com.lin.entity.order.Order;

public interface OrderDao extends BaseDao<Order> {
	public Order findByCustomer(int customerId);
}
