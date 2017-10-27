package com.lin.action.customers;

import javax.servlet.http.Cookie;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.account.Account;
import com.lin.entity.account.Tradingitem;
import com.lin.entity.cart.Cart;
import com.lin.entity.customer.Customer;
import com.lin.model.PageModel;
import com.lin.model.Password;
import com.lin.util.MD5Util;
import com.lin.util.StringUitl;

/**
 * customerAction
 * @author lin
 *
 */

@Scope("prototype")
@Controller
public class CustomerAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	/**
	 * 返回用户列表
	 * @return String
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		pageModel = adminService.findCustomerList(pageNo,pageSize);
		return LIST;
	}

	/**
	 * 查找用户
	 * @return String
	 * @throws Exception
	 */
	public String query() throws Exception
	{
		return QUERY;
	}
	
	/**
	 * 根据用户名查找
	 * @return
	 * @throws Exception
	 */
	public String queryByUsername() throws Exception
	{
		if(!StringUitl.validateString(customer.getUsername()))
		{
			addFieldError("error", "用户名不能为空");
			return QUERY;
		}
		pageModel = adminService.queryCustomerByUsername(customer.getUsername(), pageNo, pageSize);
		return LIST;
	}
	/**
	 * 判断用户名是否唯一再储存用户
	 * @return String
	 * @throws Exception
	 */
	public String save() throws Exception
	{
		customer.setId(StringUitl.createCustomerId());
		String MD5_Password = MD5Util.MD5(customer.getPassword());
		customer.setPassword(MD5_Password);
		if(customerService.customerIsUnique(customer.getUsername()) == false)
		{
			addFieldError("existedCustomer", "该用户已经存在");
			return INPUT;
		}
		if(account==null)
			account=new Account();
		customerService.saveCustomer(customer, account);
		session.setAttribute("registedCustomer", customer);
		return "regist_success";
	}

	/**
	 * 对用户账号封号操作
	 * @return String
	 * @throws Exception
	 */
	public String ban() throws Exception
	{
		adminService.banCustomer(customer.getId());
		return list();
	}

	/**
	 * 对用户账户解封操作
	 * @return
	 * @throws Exception
	 */
	public String reopen() throws Exception
	{
		adminService.reopenCustomer(customer.getId());
		return list();
	}

	/**
	 * 查看交易记录
	 * @return
	 * @throws Exception
	 */
	public String viewTradingRecord() throws Exception
	{
		pageSize = 6;
		tradingRecord = customerService.getTradingRecord(customer, pageNo, pageSize);
		return "tradingRecord";
	}
	
	
	/**
	 * 用户注册
	 * @return String
	 * @throws Exception
	 */
	public String regist() throws Exception
	{
		return INPUT;
	}

	/**
	 * 前往登陆界面
	 * @return
	 * @throws Exception
	 */
	public String toLogin() throws Exception
	{
		return CUSTOMER_LOGIN;
	}

	/**
	 * 用户登陆
	 * @return String
	 * @throws Exception
	 */
	public String login() throws Exception
	{
		Customer registedCustomer = (Customer) session.getAttribute("registedCustomer");
		if(registedCustomer==null)
			customer= customerService.loginValid(customer.getUsername(), MD5Util.MD5(customer.getPassword()));
		else
			customer= customerService.loginValid(registedCustomer.getUsername(), registedCustomer.getPassword());
		if(customer == null)
		{
			System.out.println("error");
			addFieldError("error", "用户名或密码不正确！");//返回错误提示信息
		}
		else 
		{
			if(customer.getForbidden())
			{
				System.out.println("forbidden");
				addFieldError("forbidden", "该用户由于非法操作已被管理员禁止");//返回错误提示信息
			}
			else
			{
				if(keepLogin!=null && keepLogin)
				{
					Cookie cookie = customerService.addCookie(customer);
					response.addCookie(cookie);// 添加cookie到response中
				}
				session.setAttribute("customer", customer);//将用户信息保存在Session对象中
				//将购物车的数量放入session对象中
				Cart cart = customerService.getCart(customer);
				session.setAttribute("cart", cart);
				session.setAttribute("cartItemsNum",cart.getItemAmount());
				return INDEX;
			}
		}

		return toLogin();
	}

	/**
	 * 用户退出登陆
	 * @return String
	 * @throws Exception
	 */
	public String logout() throws Exception
	{
		if(session != null && session.getAttribute("customer") !=null)
		{
			session.removeAttribute("customer");
		}
		Cookie cookie = customerService.delectCookie(request);  
        if (cookie != null)  
        {
            response.addCookie(cookie);
        }
		return CUSTOMER_LOGIN;
	}
	
	/**
	 * 重置密码界面
	 * @return
	 */
	public String findPassword() {
		return "findPassword";
	}
	
	public String resetPassword() throws Exception{
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
		
		return toLogin();
	}
	

	//用户
	private Customer customer;
	//交易账户
	private Account account;
	//确认登陆密码
	private String reLoginPassword;
	//确认支付密码
	private String rePayPassword;
	// 分页组件
	private PageModel<Customer> pageModel;
	//免登陆
	private Boolean keepLogin;
	//用户交易记录
	private PageModel<Tradingitem> tradingRecord;
	//修改的密码
	private Password password;


	//setter and getter
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getReLoginPassword() {
		return reLoginPassword;
	}

	public void setReLoginPassword(String reLoginPassword) {
		this.reLoginPassword = reLoginPassword;
	}

	public String getRePayPassword() {
		return rePayPassword;
	}

	public void setRePayPassword(String rePayPassword) {
		this.rePayPassword = rePayPassword;
	}

	public PageModel<Customer> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Customer> pageModel) {
		this.pageModel = pageModel;
	}

	public Boolean getKeepLogin() {
		return keepLogin;
	}

	public void setKeepLogin(Boolean keepLogin) {
		this.keepLogin = keepLogin;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public PageModel<Tradingitem> getTradingRecord() {
		return tradingRecord;
	}

	public void setTradingRecord(PageModel<Tradingitem> tradingRecord) {
		this.tradingRecord = tradingRecord;
	}

	public Password getPassword() {
		return password;
	}

	public void setPassword(Password password) {
		this.password = password;
	}
	
}
