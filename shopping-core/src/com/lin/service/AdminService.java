package com.lin.service;

import java.io.File;
import java.util.List;

import com.lin.entity.customer.Customer;
import com.lin.entity.order.Order;
import com.lin.entity.product.Category;
import com.lin.entity.product.Consultation;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Productinfo;
import com.lin.entity.product.Secondcategory;
import com.lin.model.PageModel;

/**
 * 管理员业务逻辑接口
 * @author lin
 *
 */
public interface AdminService {
	
	/*
	 * 管理员登陆
	 */
	public boolean loginValid(String username,String password);//登陆校验
	/*
	 * 管理员管理用户
	 */
	public PageModel<Customer> findCustomerList(int pageNo, int maxResult);//获取用户列表
	public PageModel<Customer> queryCustomerByUsername(String username, int pageNo, int maxResult);//根据用户名查找用户
	public void banCustomer(String id);//对用户进行封号操作
	public void reopenCustomer(String id);//解除用户封号操作
	/*
	 * 管理员管理商品种类
	 */
	public PageModel<Category> findCategoryList(int pageNo, int maxResult);//获取商品类列表
	public PageModel<Category> queryCategoryByName(String name, int pageNo, int maxResult);//根据名称查找商品类
	public Category getCategory(int categoryId);//获取单个商品类
	public Secondcategory getSecondcategory(int secondcategoryId);
	public Productcategory getProductcategory(int productcategoryId);
	public void delectCategory(int id);//删除商品类
	public void delectProductcategory(int id);
	public void delectSecondcategory(int id);
	public boolean categoryIsUnique(String categoryname);//验证商品类名称是否唯一
	public boolean secondcategoryIsUnique(String secondcategoryName);
	public boolean productcategoryIsUnique(String productcategoryName);
	public void saveOrUpdateCategory(Category category);//保存或更新商品类名称
	public PageModel<Secondcategory> findSecondCategoryList(int categoryId,int pageNo, int maxResult);
	public PageModel<Productcategory> findProductCategoryList(int secondcategoryId,int pageNo, int maxResult);
	public void saveOrUpdateSecondcategory(Secondcategory secondcategory);
	public void saveOrUpdateProductcategory(Productcategory productcategory);
	/*
	 * 管理员管理商品
	 */
	public PageModel<Productinfo> findProductList(int pageNo, int maxResult);//获取商品列表
	public PageModel<Productinfo> queryProductByName(String name, int pageNo, int maxResult);//根据名称查找商品
	public void delectProduct(int id);//删除商品
	public Productinfo findProduct(int id);//获取单个商品
	public void saveOrUpdateProduct(Productinfo product,File file);//保存或更新商品
	public List<Category> getCategoryList();//获取商品类目录
	
	/**
	 * 管理员管理订单
	 */
	public PageModel<Order> findOrderList(int pageNo, int maxResult);//获取订单列表
	public PageModel<Order> queryOrderByOrderId(String orderId, int pageNo, int maxResult);//根据订单号查找订单
	public void delectOrder(String orderId);//删除订单
	
	/**
	 * 管理员管理留言
	 */
	public PageModel<Consultation> getUnansweredConsultations(int pageNo, int pageSize);//获取未回复留言列表
	public PageModel<Consultation> getAnsweredConsultations(int pageNo, int pageSize);//获取已回复留言列表
	public Consultation getConsultationById(int consultationId);//根据id获取单个留言
	public void saveAnswerConsultation(Consultation consultation);//保存回复
	
	
	
	
	
}
