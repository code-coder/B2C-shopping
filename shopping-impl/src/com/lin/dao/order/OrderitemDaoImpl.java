package com.lin.dao.order;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.order.Orderitem;

@Transactional
public class OrderitemDaoImpl extends DaoSupport<Orderitem> implements OrderitemDao {

}
