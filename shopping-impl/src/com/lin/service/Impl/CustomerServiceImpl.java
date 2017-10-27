package com.lin.service.Impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.lin.entity.account.Account;
import com.lin.entity.account.Tradingitem;
import com.lin.entity.cart.Cart;
import com.lin.entity.cart.Cartitem;
import com.lin.entity.customer.Customer;
import com.lin.entity.customer.HeadPortrait;
import com.lin.entity.customer.ShoppingAddress;
import com.lin.entity.order.Order;
import com.lin.entity.order.Orderitem;
import com.lin.entity.product.Productinfo;
import com.lin.model.PageModel;
import com.lin.service.BaseService;
import com.lin.service.CustomerService;
import com.lin.util.StringUitl;

/**
 * 用户业务逻辑实现类
 * @author lin
 *
 */
@Scope("prototype")
@Service("customerService")
public class CustomerServiceImpl extends BaseService implements CustomerService {

	/**
	 * 用户登陆验证
	 * @return 
	 */
	@Override
	public Customer loginValid(String username, String password) {

		Customer loginCustomer = customerDao.login(username, password);
		if(loginCustomer !=null){
			loginCustomer.setLastLogin(new Date());
			customerDao.saveOrUpdate(loginCustomer);
			return loginCustomer;
		}
		else
			return null;
	}

	/**
	 * 验证用户用户名是否唯一
	 * @return boolean
	 */
	@Override
	public boolean customerIsUnique(String username) {

		return customerDao.isUnique(username);	
	}

	/**
	 * 储存用户
	 */
	@Override
	public void saveCustomer(Customer customer, Account account) {
		if(customer.getCart() == null)
		{
			//为用户配置购物车
			Cart cart = new Cart();
			cart.setId(customer.getId());
			cartDao.saveOrUpdate(cart);
			customer.setCart(cart);
		}
		if(customer.getHeadPortrait() == null)
		{
			//为用户配置头像
			HeadPortrait headPortrait =new HeadPortrait();
			headPortrait.setId(customer.getId());
			headPortrait.setPath("default.jpg");
			headPortrait.setUpdateTime(new Date());
			headPortraitDao.saveOrUpdate(headPortrait);
			customer.setHeadPortrait(headPortrait);
		}
		if(customer.getAccount() == null)
		{
			//为用户配置交易账户
			account.setId(customer.getId());
			accountDao.saveOrUpdate(account);
			customer.setAccount(account);
		}

		//重载购物车信息
		if(customer.getCart() != null && customer.getCart().getId() != null){
			customer.setCart(cartDao.load(customer.getCart().getId()));
		}

		//重载余额账户
		if(customer.getAccount() != null && customer.getAccount().getId() != null){
			customer.setAccount(accountDao.load(customer.getAccount().getId()));
		}

		customerDao.saveOrUpdate(customer);
	}

	/**
	 * 获取用户的购物车
	 * @return Cart
	 */
	@Override
	public Cart getCart(Customer customer) {

		return cartDao.get(customer.getCart().getId());
	}

	/**
	 * 获取用户的交易账户
	 * @return Account
	 */
	@Override
	public Account getAccount(Customer customer) {

		if(customer !=null && customer.getAccount() == null)
		{
			customer = customerDao.get(customer.getId());
		}
		return accountDao.get(customer.getAccount().getId());
	}

	/**
	 * 从用户的购物车移除商品
	 */
	@Override
	public Cart removeItemFromCart(Customer customer, Cartitem item) {

		Cart cart = cartDao.get(customer.getCart().getId());
		Set<Cartitem> cartitems = cart.getCartitems();
		Cartitem delectedItem = cartitemDao.get(item.getId());
		if(cartitems.contains(delectedItem))
		{
			cart.setItemAmount(cart.getItemAmount() - 1);
			cart.setTotalPrice(cart.getTotalPrice() - delectedItem.getPrice());
			cartitems.remove(delectedItem);
			cartitemDao.delete(item.getId());
			cartDao.saveOrUpdate(cart);
		}
		return cart;
	}
	
	@Override
	public Cart updateCartItem(Customer customer,Cartitem item){
		Cartitem ct = cartitemDao.get(item.getId());
		int amount =item.getAmount();
		ct.setAmount(amount);
		float oldPrice = ct.getPrice();
		float newPrice = ct.getProduct().getSellprice()*amount;
		ct.setPrice(newPrice);
		cartitemDao.update(ct);
		Cart cart = cartDao.get(customer.getCart().getId());
		cart.setTotalPrice(cart.getTotalPrice() - oldPrice + newPrice);
		return cart;
	}

	/**
	 * 添加商品到用户购物车
	 */
	@Override
	public Cart addItemToCart(Customer customer, Cartitem item) {

		Cart cart = cartDao.get(customer.getCart().getId());
		Set<Cartitem> cartitems = cart.getCartitems();

		Productinfo product = productDao.get(item.getProduct().getId());
		item.setProduct(product);
		item.setPrice(product.getSellprice()*item.getAmount());
		item.setJoinTime(new Date());
		
		cart.setTotalPrice(cart.getTotalPrice() + item.getPrice());
		Cartitem addedItem;
		for (Cartitem cartitem : cartitems) {

			if(cartitem.equals(item))
			{
				addedItem = cartitem;
				addedItem.setAmount(item.getAmount()+addedItem.getAmount());
				addedItem.setPrice(item.getPrice()+addedItem.getPrice());
				cartitemDao.saveOrUpdate(addedItem);
				cart.getCartitems().add(item);
				cartDao.update(cart);
				return cart;
			}	
		}
		cart.setItemAmount(cart.getItemAmount() + 1);
		item.setCart(cart);
		cart.getCartitems().add(item);
		cartitemDao.saveOrUpdate(item);
		cartDao.update(cart);
		return cart;
	}

	/**
	 * 清空购物车已经购买的商品
	 */
	@Override
	public Cart clearCart(Customer customer,Set<Cartitem> buyItems, float totalPrice) {

		//加载购物车
		Cart cart = cartDao.get(customer.getCart().getId());
		Set<Cartitem> cartitems = cart.getCartitems();
		
		//删除购物车项目
		for (Cartitem cartitem : buyItems) {
			cartitemDao.delete(cartitem.getId());
		}
		
		//清空购物车已购买商品的数据
		cart.setItemAmount(cartitems.size()-buyItems.size());
		cart.setTotalPrice(cart.getTotalPrice()-totalPrice);
		cartitems.removeAll(buyItems);
		cartDao.saveOrUpdate(cart);
		return cart;
	}
	/**
	 * 清空购物车
	 */
	@Override
	public Cart clearCart(Customer customer) {

		//加载购物车
		Cart cart = cartDao.get(customer.getCart().getId());
		Set<Cartitem> cartitems = cart.getCartitems();
		//删除购物车项目
		for (Cartitem cartitem : cartitems) {
			cartitemDao.delete(cartitem.getId());
		}
		
		//清空购物车数据
		cart.setItemAmount(0);
		cart.setTotalPrice(0f);
		cartitems.clear();
		cartDao.saveOrUpdate(cart);
		return cart;
	}

	/**
	 * 验证密码
	 * @return boolean
	 */
	@Override
	public boolean validPassword(Customer customer, String password) {

		if(customer.getPassword().equals(password))
			return true;
		else
			return false;
	}

	/**
	 * 保存修改的密码
	 * @return newCustomer
	 */
	@Override
	public Customer savePassword(Customer customer, String password) {

		customer.setPassword(password);
		customerDao.saveOrUpdate(customer);
		return customer;
	}

	/**
	 * 保存上传的头像
	 * @return newCustomer
	 */
	@Override
	public Customer saveHeadPortrait(Customer customer, File file) {

		if(file != null ){//如果文件路径不为空
			//获取服务器的绝对路径
			String path = ServletActionContext.getServletContext().getRealPath("/headPortrait");
			System.out.println(path);
			File dir = new File(path);
			if(!dir.exists()){//如果文件夹不存在
				dir.mkdir();//创建文件夹
			}
			String fileName = StringUitl.getStringTime() + ".jpg";//自定义图片名称
			FileInputStream fis = null;//输入流
			FileOutputStream fos = null;//输出流
			try {
				fis = new FileInputStream(file);//根据上传文件创建InputStream实例
				fos = new FileOutputStream(new File(dir,fileName)); //创建写入服务器地址的输出流对象
				byte[] bs = new byte[1024 * 4]; //创建字节数组实例
				int len = -1;
				while((len = fis.read(bs)) != -1){//循环读取文件
					fos.write(bs, 0, len);//向指定的文件夹中写数据
				}
				HeadPortrait headPortrait = headPortraitDao.get(customer.getHeadPortrait().getId());
				if(headPortrait.getPath() != null)
				{
					File oldHeadPortrait = new File(path+"/"+headPortrait.getPath());
					if(oldHeadPortrait.exists())
					{
						oldHeadPortrait.delete();
					}
				}
				headPortrait.setPath(fileName);//设置文件名称
				headPortraitDao.saveOrUpdate(headPortrait);
				customer.setHeadPortrait(headPortrait);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					fos.flush();
					fos.close();
					fis.close();
				} catch (IOException e) {

					e.printStackTrace();
				}	
			}
		}
		return customer;
	}

	/**
	 * 保存充值
	 */
	@Override
	public void saveRecharge(Customer customer, Tradingitem tradingitem) {

		Account account = accountDao.get(customer.getAccount().getId());
		tradingitem.setAccount(account);
		tradingitem.setTradingDetails("充值");
		tradingitem.setTradingTime(new Date());
		tradingitemDao.saveOrUpdate(tradingitem);

		account.setBalance(account.getBalance()+tradingitem.getMoney());
		accountDao.saveOrUpdate(account);
		
		customer.setBalance(account.getBalance());
		customerDao.saveOrUpdate(customer);
	}
	
	/**
	 * 验证支付密码
	 * @return boolean
	 */
	@Override
	public boolean validPayPassword(Customer customer, String password) {

		Account account = accountDao.get(customer.getAccount().getId());
		if(password.equals(account.getPassword()))
			return true;
		else
			return false;
					
	}

	/**
	 * 保存修改的支付密码
	 */
	@Override
	public void savePayPassword(Customer customer, String password) {

		Account account = accountDao.get(customer.getAccount().getId());
		account.setPassword(password);
		accountDao.saveOrUpdate(account);
	}

	/**
	 * 支付金额
	 */
	@Override
	public boolean payForOrder(Customer customer, String orderId) {

		//加载订单
		Order order = orderDao.get(orderId);
		//加载交易账户
		Account account = accountDao.get(customer.getAccount().getId());
		if(account.getBalance() < order.getTotalPrice())
		{
			return false;
		}
		else
		{
			Tradingitem tradingitem = new Tradingitem();
			tradingitem.setAccount(account);
			tradingitem.setMoney(-(order.getTotalPrice()));
			tradingitem.setTradingDetails("购买商品");
			tradingitem.setTradingTime(new Date());
			tradingitemDao.saveOrUpdate(tradingitem);

			account.setBalance(account.getBalance()-order.getTotalPrice());
			accountDao.saveOrUpdate(account);

			customer.setBalance(account.getBalance());
			customerDao.saveOrUpdate(customer);
			
			order.setOrderState("已付款");
			order.setPayTime(new Date());
			orderDao.saveOrUpdate(order);

			Set<Orderitem> orderitems = order.getOrderitems();
			for (Orderitem orderitem : orderitems) {
				Productinfo product = orderitem.getProduct();
				product.setSellcount(product.getSellcount()+1);
				productDao.saveOrUpdate(product);
			}
			
			return true;
		}
	}

	/**
	 * 获取交易记录
	 */
	@Override
	public PageModel<Tradingitem> getTradingRecord(Customer customer, int pageNo, int pageSize) {

		
		Account account = getAccount(customer);
		String where = "where account.id = ?";
		Object[] queryParams = {account.getId()};
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("id", "desc");//为Map集合赋值
		return tradingitemDao.find(where, queryParams, orderby, pageNo, pageSize);	
	}

	/**
	 * 获取要修改的收货地址
	 */
	@Override
	public ShoppingAddress getModifyShoppingAddress(int shoppingAddressId) {

		return shoppingAddressDao.get(shoppingAddressId);
	}

	/**
	 * 获取顾客所以收货地址
	 */
	@Override
	public PageModel<ShoppingAddress> getSavedShoppingAdderess(Customer customer) {

		String where = "where customer.id = ?";
		Object[] queryParams = {customer.getId()};
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("id", "desc");//为Map集合赋值
		return shoppingAddressDao.find(where, queryParams, orderby, 1, 10);
	}

	/**
	 * 保存收货地址
	 */
	@Override
	public void saveShoppingAddress(Customer customer,
			ShoppingAddress shoppingAddress) {

		if(shoppingAddress.getCustomer() ==null || shoppingAddress.getCustomer().getId() !=null)
		{
			shoppingAddress.setCustomer(customer);
		}

		PageModel<ShoppingAddress> shoppingAddresses = getSavedShoppingAdderess(customer);
		//没有保存过收货地址
		if(shoppingAddresses.getTotalRecords() <= 0)
		{
			shoppingAddress.setIsDefault(true);
			shoppingAddressDao.saveOrUpdate(shoppingAddress);
			return;
		}

		if(shoppingAddress.getIsDefault()!=null && shoppingAddress.getIsDefault() == true)
		{
			//取消原先的默认地址
			List<ShoppingAddress> list = shoppingAddresses.getList();
			for (ShoppingAddress address : list) {
				if(address.getIsDefault() == true)
				{
					address.setIsDefault(false);
					shoppingAddressDao.saveOrUpdate(address);
				}
			}
		}
		shoppingAddressDao.saveOrUpdate(shoppingAddress);
	}
	@Override
	public void saveModifyShoppingAddress(Customer customer,
			ShoppingAddress shoppingAddress) {
		shoppingAddress.setCustomer(customer);
		shoppingAddressDao.saveOrUpdate(shoppingAddress);
		
	}


	/**
	 * 删除收货地址
	 */
	@Override
	public void delectShoppingAddress(int shoppingAddressId) {

		shoppingAddressDao.delete(shoppingAddressId);
	}

	/**
	 * 设置为默认收货地址
	 */
	@Override
	public void setShoppingAddressIsDefault(Customer customer, int shoppingAddressId) {

		//取消原先的默认地址
		PageModel<ShoppingAddress> shoppingAddresses = getSavedShoppingAdderess(customer);
		List<ShoppingAddress> list = shoppingAddresses.getList();
		for (ShoppingAddress shoppingAddress : list) {
			if(shoppingAddress.getIsDefault() == true)
			{
				shoppingAddress.setIsDefault(false);
				shoppingAddressDao.saveOrUpdate(shoppingAddress);
			}
		}
		//设为默认地址
		ShoppingAddress defaultShoppingAddress = shoppingAddressDao.get(shoppingAddressId);
		defaultShoppingAddress.setIsDefault(true);
		shoppingAddressDao.saveOrUpdate(defaultShoppingAddress);
	}

	/**
	 * 保存订单(直接购买)
	 * @return Order
	 */
	@Override
	public Order newOrderFromDirect(Customer customer, ShoppingAddress shoppingAddress, Orderitem orderitem) {

		//保存商品信息
		Productinfo product = productDao.get(orderitem.getProduct().getId());
		orderitem.setProduct(product);
		//加载地址
		shoppingAddress = shoppingAddressDao.get(shoppingAddress.getId());
		//新建订单
		//生成订单号(创建时时间)
		String orderId = StringUitl.getStringTime();
		Order order = new Order();
		order.setOrderId(orderId);
		order.setCreateTime(new Date());
		order.setItemAmount(orderitem.getAmount());
		order.setTotalPrice(product.getSellprice()*orderitem.getAmount());
		order.setOrderState("未付款");
		order.setCustomer(customer);
		order.setConsignee(shoppingAddress.getConsignee());
		order.setAddress(shoppingAddress.getAddress());
		order.setPostcode(shoppingAddress.getPostcode());
		order.setMobile(shoppingAddress.getMobile());
		//保存订单和订单项目
		Set<Orderitem> orderitems = order.getOrderitems();
		orderitems.add(orderitem);
		orderDao.saveOrUpdate(order);
		orderitem.setOrder(order);
		orderitemDao.saveOrUpdate(orderitem);

		return order;
	}

	/**
	 * 从购物车结算生成新订单
	 * @return Order
	 */
	@Override
	public Order newOrderFromCart(Customer customer, ShoppingAddress shoppingAddress,Set<Cartitem> buyItems,float totalPrice) {

		if(buyItems !=null && !buyItems.isEmpty() )
		{
			//加载地址
			shoppingAddress = shoppingAddressDao.get(shoppingAddress.getId());

			//新建订单
			//生成订单号(创建时时间)
			String orderId = StringUitl.getStringTime();
			Order order = new Order();
			order.setOrderId(orderId);
			order.setCreateTime(new Date());
			order.setItemAmount(buyItems.size());
			order.setTotalPrice(totalPrice);
			order.setOrderState("未付款");
			order.setCustomer(customer);
			order.setConsignee(shoppingAddress.getConsignee());
			order.setAddress(shoppingAddress.getAddress());
			order.setPostcode(shoppingAddress.getPostcode());
			order.setMobile(shoppingAddress.getMobile());		
			orderDao.saveOrUpdate(order);

			//将购物车项目转为订单项目	
			Set<Orderitem> orderitems = order.getOrderitems();
			Set<Cartitem> cartitems = buyItems;
			for (Cartitem cartitem : cartitems) {
				Orderitem orderitem = new Orderitem();
				orderitem.setProduct(cartitem.getProduct());
				orderitem.setAmount(cartitem.getAmount());
				orderitem.setPrice(cartitem.getProduct().getSellprice()*cartitem.getAmount());
				orderitem.setOrder(order);
				orderitemDao.saveOrUpdate(orderitem);
				orderitems.add(orderitem);
			}

			//保存订单
			orderDao.saveOrUpdate(order);
			return order;
		}
		return null;
	}

	/**
	 * 获取临时订单项目（未保存）
	 */
	@Override
	public Orderitem getTempOrderitem(int productId, int amount) {

		Productinfo product = productDao.get(productId);
		Orderitem tempOrderitem = new Orderitem();
		tempOrderitem.setProduct(product);
		tempOrderitem.setAmount(amount);
		tempOrderitem.setPrice(product.getSellprice()*amount);

		return tempOrderitem;
	}

	/**
	 * 获取用户全部订单（分页）
	 */
	@Override
	public PageModel<Order> getOrders(Customer customer, int pageNo, int pageSize) {

		String where = "where customer.id = ?";
		Object[] queryParams = {customer.getId()};
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("id", "desc");//为Map集合赋值
		return orderDao.find(where, queryParams, orderby, pageNo, pageSize);	
	}

	/**
	 * 根据订单号获取订单
	 */
	@Override
	public Order getOrderById(String orderId) {

		return orderDao.get(orderId);
	}

	/**
	 * 添加cookie
	 * @return Cookie
	 */
	@Override
	public Cookie addCookie(Customer customer) {

		Cookie cookie = new Cookie(CUSTOMER_COOKIE, customer.getUsername() + "," + customer.getPassword());  
		System.out.println("添加cookie:"+customer.getUsername() + "," + customer.getPassword());  
		cookie.setMaxAge(3600 * 24 * 1);// cookie保存一天  
		return cookie;  
	}

	/**
	 * 获取cookie
	 * @return Cookie
	 */
	@Override
	public boolean getCookie(HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();  
		System.out.println("cookies: " + cookies);  
		if (cookies != null) {  
			for (Cookie cookie : cookies) {  
				System.out.println("cookie: " + cookie.getName()+"-"+cookie.getValue());  
				if (CUSTOMER_COOKIE.equals(cookie.getName())) {  
					String value = cookie.getValue();  
					if (StringUtils.isNotBlank(value)) {  
						String[] split = value.split(",");  
						String username = split[0];  
						String password = split[1];  
						System.out.println(username+"+"+password);
						Customer customer = loginValid(username, password); 
						if (customer != null) {
							System.out.println("loginSuccess");
							HttpSession session = request.getSession();  
							session.setAttribute("customer", customer);//将用户信息保存在Session对象中
							return true;  
						}  
					}  
				}  
			}  
		}  
		return false;
	}

	/**
	 * 删除cookie
	 * @return Cookie
	 */
	@Override
	public Cookie delectCookie(HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();  
		if (cookies != null) {  
			for (Cookie cookie : cookies) {  
				if (CUSTOMER_COOKIE.equals(cookie.getName())) {  
					cookie.setValue("");  
					cookie.setMaxAge(0);  
					return cookie;  
				}  
			}  
		}  
		return null;  
	}


}


