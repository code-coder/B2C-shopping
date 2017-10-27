package com.lin.service;

import java.io.File;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.lin.entity.account.Account;
import com.lin.entity.account.Tradingitem;
import com.lin.entity.cart.Cart;
import com.lin.entity.cart.Cartitem;
import com.lin.entity.customer.Customer;
import com.lin.entity.customer.ShoppingAddress;
import com.lin.entity.order.Order;
import com.lin.entity.order.Orderitem;
import com.lin.model.PageModel;

/**
 * 用户业务逻辑接口
 * @author lin
 *
 */
public interface CustomerService {
	
	public static final String CUSTOMER_COOKIE = "customer.cookie";
	
	/*
	 * 用户登陆
	 */
	public final static int NORMALCUSTOMER = 0;
	public final static int FORBIDDENCUSTOMER = 1;
	
	public Customer loginValid(String username,String password);//登陆校验
	public boolean customerIsUnique(String username);//校验用户名称是否唯一
	public void saveCustomer(Customer customer, Account account);//保存用户
	
	public Cart getCart(Customer customer);//获取购物车
	public Cart removeItemFromCart(Customer customer, Cartitem item);//从购物车移除商品
	public Cart addItemToCart(Customer customer, Cartitem item);//添加商品进购物车
	public Cart clearCart(Customer customer,Set<Cartitem> buyItems, float totalPrice);//清空购物车已购买的商品
	public Cart clearCart(Customer customer);//清空购物车
	public Cart updateCartItem(Customer customer,Cartitem item); //修改购物车的商品
	
	
	public boolean validPassword(Customer customer, String password);//校验输入密码
	public Customer savePassword(Customer customer, String password);//保存修改密码
	public Customer saveHeadPortrait(Customer customer, File file);//保存上传头像
	
	public Account getAccount(Customer customer);//获取交易账号
	public void saveRecharge(Customer customer, Tradingitem tradingitem);//保存充值
	public boolean validPayPassword(Customer customer, String password);//校验输入的支付密码
	public void savePayPassword(Customer customer, String password);//保存修改的支付密码
	public boolean payForOrder(Customer customer, String orderId);//为订单付款
	public PageModel<Tradingitem> getTradingRecord(Customer customer, int pageNo, int pageSize);
	
	public ShoppingAddress getModifyShoppingAddress(int shoppingAddressId);//获取要修改的收货地址
	public void saveShoppingAddress(Customer customer, ShoppingAddress shoppingAddress);//保存收货地址
	public void delectShoppingAddress(int shoppingAddressId);//删除收货地址
	public void setShoppingAddressIsDefault(Customer customer, int shoppingAddressId);//设置地址为默认地址
	public PageModel<ShoppingAddress> getSavedShoppingAdderess(Customer customer);//获取所以收货地址
	
	public Orderitem getTempOrderitem(int productId, int amount);//获取临时订单(未提交)
	public Order newOrderFromDirect(Customer customer, ShoppingAddress shoppingAddress, Orderitem orderitem);//保存新订单(直接购买)
	public Order newOrderFromCart(Customer customer, ShoppingAddress shoppingAddress, Set<Cartitem> buyItems, float totalPrice);//保存新订单(购物车结算)
	public Order getOrderById(String orderId);//根据orderId获取单个订单
	public PageModel<Order> getOrders(Customer customer, int pageNo, int pageSize);//获取订单列表
	
	public Cookie addCookie(Customer customer);//添加cookie
	public boolean getCookie(HttpServletRequest request);//获取cookie
	public Cookie delectCookie(HttpServletRequest request);//删除cookie
	public void saveModifyShoppingAddress(Customer customer,ShoppingAddress shoppingAddress);
}
