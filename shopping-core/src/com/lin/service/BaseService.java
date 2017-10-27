package com.lin.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.lin.dao.account.AccountDao;
import com.lin.dao.account.TradingitemDao;
import com.lin.dao.cart.CartDao;
import com.lin.dao.cart.CartitemDao;
import com.lin.dao.customer.CustomerDao;
import com.lin.dao.customer.HeadPortraitDao;
import com.lin.dao.customer.ShoppingAddressDao;
import com.lin.dao.manager.ManagerDao;
import com.lin.dao.order.OrderDao;
import com.lin.dao.order.OrderitemDao;
import com.lin.dao.product.CategoryDao;
import com.lin.dao.product.ConsultationDao;
import com.lin.dao.product.ProductDao;
import com.lin.dao.product.ProductcategoryDao;
import com.lin.dao.product.SecondcategoryDao;
import com.lin.dao.product.UploadFileDao;

public class BaseService {

	/*
	 * 注入Dao
	 */
	@Autowired
	protected ManagerDao managerDao;
	@Autowired
	protected CustomerDao customerDao;
	@Autowired
	protected ProductDao productDao;
	@Autowired
	protected SecondcategoryDao secondcategoryDao;
	@Autowired
	protected ProductcategoryDao productcategoryDao;
	@Autowired
	protected CategoryDao categoryDao;
	@Autowired
	protected UploadFileDao uploadfileDao;
	@Autowired
	protected ConsultationDao consultationDao;
	@Autowired
	protected OrderDao orderDao;
	@Autowired
	protected OrderitemDao orderitemDao;
	@Autowired
	protected ShoppingAddressDao shoppingAddressDao;
	@Autowired
	protected CartDao cartDao;
	@Autowired
	protected CartitemDao cartitemDao;
	@Autowired
	protected AccountDao accountDao;
	@Autowired
	protected TradingitemDao tradingitemDao;
	@Autowired
	protected HeadPortraitDao headPortraitDao;

}
