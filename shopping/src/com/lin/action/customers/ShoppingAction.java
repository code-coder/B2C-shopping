package com.lin.action.customers;

import java.io.File;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.account.Account;
import com.lin.entity.account.Tradingitem;
import com.lin.entity.cart.Cart;
import com.lin.entity.customer.Customer;
import com.lin.entity.customer.ShoppingAddress;
import com.lin.entity.order.Order;
import com.lin.model.PageModel;
import com.lin.model.Password;
import com.lin.util.MD5Util;
import com.lin.util.StringUitl;

/**
 * shoppingAction
 * @author lin
 *
 */

@Scope("prototype")
@Controller
public class ShoppingAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 我的商城
	 * @return
	 * @throws Exception
	 */
	public String myShopping() throws Exception
	{
		if(session.getAttribute("customer") !=null)
		{
			customer = (Customer) session.getAttribute("customer");
			cart = customerService.getCart(customer);
			account = customerService.getAccount(customer);
			orders = customerService.getOrders(customer, pageNo, pageSize);
		}
		
		return "myShopping";
	}

	/**
	 * 修改个人资料
	 * @return
	 * @throws Exception
	 */
	public String modifyInfo() throws Exception
	{
		if(session.getAttribute("customer") != null)
		{
			customer = (Customer) session.getAttribute("customer");
		}
		
		return "modifyCutomserInfo";
	}
	
	/**
	 * 储存修改好的信息
	 * @return
	 * @throws Exception
	 */
	public String saveInfo() throws Exception
	{
		Customer oldCustomer = (Customer) session.getAttribute("customer");
		if(oldCustomer.getId().equals(customer.getId())){
			if(customer.getSex() != null)
				oldCustomer.setSex(customer.getSex());
			if(customer.getAddress() != null)
				oldCustomer.setAddress(customer.getAddress());
			if(customer.getRealname() != null)
				oldCustomer.setRealname(customer.getRealname());
		}
			
		customerService.saveCustomer(oldCustomer, null);
		session.setAttribute("customer", oldCustomer);
		
		return myShopping();
	}
	
	/**
	 * 修改登陆密码
	 * @return
	 * @throws Exception
	 */
	public String modifyPassword() throws Exception
	{
		return "modifyCutomserPassword";
	}
	
	/**
	 * 保存修改登陆密码
	 * @return
	 * @throws Exception
	 */
	public String savePassword() throws Exception
	{
		if(customerService.validPassword((Customer)session.getAttribute("customer"), MD5Util.MD5(customer.getPassword())) == false)
		{
			addFieldError("error", "密码输入错误");
			return "modifyCutomserPassword";
		}
		if(password == null || password.getNewpassword() == null || password.getNewpassword().isEmpty())
		{
			addFieldError("error", "新密码不能为空");
			return "modifyCutomserPassword";
		}
		if(password.getRepassword() == null || password.getRepassword().isEmpty() || !password.getNewpassword().equals(password.getRepassword()))
		{
			addFieldError("error", "两次密码输入不一致");
			return "modifyCutomserPassword";
		}
		
		Customer newCustomer = customerService.savePassword((Customer)session.getAttribute("customer"), MD5Util.MD5(password.getNewpassword()));
		session.setAttribute("customer", newCustomer);
		return "mddifyPasswordSuccess";
	}
	
	/**
	 * 修改头像
	 * @return
	 * @throws Exception
	 */
	public String modifyHeadPortrait() throws Exception
	{
		return "modifyCutomserHeadPortrait";
	}
	
	/**
	 * 保存上传头像
	 * @return
	 * @throws Exception
	 */
	public String saveHeadPortrait() throws Exception
	{
		System.out.println(headPortrait == null);
		Customer newCustomer = customerService.saveHeadPortrait((Customer)session.getAttribute("customer"), headPortrait);
		session.setAttribute("customer", newCustomer);
		return myShopping();
	}
	
	/**
	 * 交易账号
	 * @return
	 * @throws Exception
	 */
	public String account() throws Exception
	{
		account = customerService.getAccount((Customer)session.getAttribute("customer"));
		pageModel = customerService.getTradingRecord((Customer)session.getAttribute("customer"), pageNo, pageSize);
		return "account";
	}
	
	/**
	 * 充值
	 * @return
	 * @throws Exception
	 */
	public String recharge() throws Exception
	{
		return "recharge";
	}
	
	/**
	 * 保存充值
	 * @return
	 * @throws Exception
	 */
	public String saveRecharge() throws Exception
	{
		customerService.saveRecharge((Customer)session.getAttribute("customer"), tradingitem);
		return "recharge_success";
	}
	
	/**
	 * 充值校验
	 */
	public void validateSaveRecharge()
	{
		if(StringUitl.validateFloat(tradingitem.getMoney()) == false)
		{
			addFieldError("error", "请重新输入充值金额");
		}	
		if(!customerService.validPayPassword((Customer)session.getAttribute("customer"), account.getPassword()))
		{
			addFieldError("error", "支付密码错误");
		}
	}
	
	/**
	 * 查看交易记录
	 * @return
	 * @throws Exception
	 
	public String viewTradingRecord() throws Exception
	{
		account = customerService.getAccount((Customer)session.getAttribute("customer"));
		pageModel = customerService.getTradingRecord((Customer)session.getAttribute("customer"), pageNo, pageSize);
		return "tradingRecord";
	}
	*/
	 
	/**
	 * 修改支付密码
	 * @return
	 * @throws Exception
	 */
	public String modifyPayPassword() throws Exception
	{
		return "modifyPayPassword";
	}
	
	/**
	 * 保存修改支付密码
	 * @return
	 * @throws Exception
	 */
	public String savePayPassword() throws Exception
	{
		if(customerService.validPayPassword((Customer)session.getAttribute("customer"), account.getPassword()) == false)
		{
			addFieldError("error", "支付密码输入错误");
			return "modifyPayPassword";
		}
		if(password == null || password.getNewpassword() == null || password.getNewpassword().isEmpty())
		{
			addFieldError("error", "新密码不能为空");
			return "modifyPayPassword";
		}
		if(password.getRepassword() == null || password.getRepassword().isEmpty() || !password.getNewpassword().equals(password.getRepassword()))
		{
			addFieldError("error", "两次密码输入不一致");
			return "modifyPayPassword";
		}
		
		 customerService.savePayPassword((Customer)session.getAttribute("customer"), password.getNewpassword());
		return "mddifyPayPasswordSuccess";
	}
	
	/**
	 * 收货地址
	 * @return
	 * @throws Exception
	 */
	public String shoppingAddress() throws Exception
	{
		shoppingAddresses = customerService.getSavedShoppingAdderess((Customer)session.getAttribute("customer"));
		return "shoppingAddress";
	}
	
	/**
	 * 保存收货地址
	 * @return
	 * @throws Exception
	 */
	public String saveShoppingAddress() throws Exception
	{
		if(!StringUitl.validateString(shoppingAddress.getConsignee()))
		{
			addFieldError("error", "收件人不能为空");
			return shoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getMobile()))
		{
			addFieldError("error", "手机号码不能为空");
			return shoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getAddress()))
		{
			addFieldError("error", "地址不能为空");
			return shoppingAddress();
		}
		
		
		customerService.saveShoppingAddress((Customer)session.getAttribute("customer"), shoppingAddress);
		return shoppingAddress();
	}
	
	/**
	 *修改收货地址 
	 * @return
	 * @throws Exception
	 */
	public String modifyShoppingAddress() throws Exception
	{
		shoppingAddress = customerService.getModifyShoppingAddress(shoppingAddress.getId());
		return "modifyShoppingAddress";
	}
	
	/**
	 * 保存修改的收货地址
	 * @return
	 * @throws Exception
	 */
	public String saveModifyedShoppingAddress() throws Exception
	{
		if(!StringUitl.validateString(shoppingAddress.getConsignee()))
		{
			addFieldError("error", "收件人不能为空");
			return modifyShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getMobile()))
		{
			addFieldError("error", "手机号码不能为空");
			return modifyShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getAddress()))
		{
			addFieldError("error", "地址不能为空");
			return modifyShoppingAddress();
		}
		
		customerService.saveModifyShoppingAddress((Customer)session.getAttribute("customer"), shoppingAddress);
		return shoppingAddress();
	}
	
	/**
	 *删除收货地址 
	 * @return
	 * @throws Exception
	 */
	public String delectShoppingAddress() throws Exception
	{
		customerService.delectShoppingAddress(shoppingAddress.getId());
		return shoppingAddress();
	}
	
	/**
	 * 设为默认地址
	 * @return
	 * @throws Exception
	 */
	public String setShoppingAddressIsDefault() throws Exception
	{
		customerService.setShoppingAddressIsDefault((Customer)session.getAttribute("customer"), shoppingAddress.getId());
		return shoppingAddress();
	}
	
	

	//用户
	private Customer customer;
	//修改的密码
	private Password password;
	//上传的头像
	private File headPortrait;
	//交易账户
	private Account account;
	//交易项目 
	private Tradingitem tradingitem;
	//交易记录(分页)
	private PageModel<Tradingitem> pageModel;
	//购物车
	private Cart cart;
	//收货地址
	private ShoppingAddress shoppingAddress;
	//已保存的收货地址
	private PageModel<ShoppingAddress> shoppingAddresses;
	//所以订单
	private PageModel<Order> orders;
	
	//getter and setter
	public Customer getCustomer() {
		return customer;
	}

	public ShoppingAddress getShoppingAddress() {
		return shoppingAddress;
	}

	public void setShoppingAddress(ShoppingAddress shoppingAddress) {
		this.shoppingAddress = shoppingAddress;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Password getPassword() {
		return password;
	}

	public void setPassword(Password password) {
		this.password = password;
	}

	public File getHeadPortrait() {
		return headPortrait;
	}

	public void setHeadPortrait(File headPortrait) {
		this.headPortrait = headPortrait;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Tradingitem getTradingitem() {
		return tradingitem;
	}

	public void setTradingitem(Tradingitem tradingitem) {
		this.tradingitem = tradingitem;
	}

	public PageModel<Tradingitem> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Tradingitem> pageModel) {
		this.pageModel = pageModel;
	}

	public PageModel<ShoppingAddress> getShoppingAddresses() {
		return shoppingAddresses;
	}

	public void setShoppingAddresses(PageModel<ShoppingAddress> shoppingAddresses) {
		this.shoppingAddresses = shoppingAddresses;
	}

	public PageModel<Order> getOrders() {
		return orders;
	}

	public void setOrders(PageModel<Order> orders) {
		this.orders = orders;
	}
	
}
