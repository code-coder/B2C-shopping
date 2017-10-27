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
	 * �����û��б�
	 * @return String
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		pageModel = adminService.findCustomerList(pageNo,pageSize);
		return LIST;
	}

	/**
	 * �����û�
	 * @return String
	 * @throws Exception
	 */
	public String query() throws Exception
	{
		return QUERY;
	}
	
	/**
	 * �����û�������
	 * @return
	 * @throws Exception
	 */
	public String queryByUsername() throws Exception
	{
		if(!StringUitl.validateString(customer.getUsername()))
		{
			addFieldError("error", "�û�������Ϊ��");
			return QUERY;
		}
		pageModel = adminService.queryCustomerByUsername(customer.getUsername(), pageNo, pageSize);
		return LIST;
	}
	/**
	 * �ж��û����Ƿ�Ψһ�ٴ����û�
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
			addFieldError("existedCustomer", "���û��Ѿ�����");
			return INPUT;
		}
		if(account==null)
			account=new Account();
		customerService.saveCustomer(customer, account);
		session.setAttribute("registedCustomer", customer);
		return "regist_success";
	}

	/**
	 * ���û��˺ŷ�Ų���
	 * @return String
	 * @throws Exception
	 */
	public String ban() throws Exception
	{
		adminService.banCustomer(customer.getId());
		return list();
	}

	/**
	 * ���û��˻�������
	 * @return
	 * @throws Exception
	 */
	public String reopen() throws Exception
	{
		adminService.reopenCustomer(customer.getId());
		return list();
	}

	/**
	 * �鿴���׼�¼
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
	 * �û�ע��
	 * @return String
	 * @throws Exception
	 */
	public String regist() throws Exception
	{
		return INPUT;
	}

	/**
	 * ǰ����½����
	 * @return
	 * @throws Exception
	 */
	public String toLogin() throws Exception
	{
		return CUSTOMER_LOGIN;
	}

	/**
	 * �û���½
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
			addFieldError("error", "�û��������벻��ȷ��");//���ش�����ʾ��Ϣ
		}
		else 
		{
			if(customer.getForbidden())
			{
				System.out.println("forbidden");
				addFieldError("forbidden", "���û����ڷǷ������ѱ�����Ա��ֹ");//���ش�����ʾ��Ϣ
			}
			else
			{
				if(keepLogin!=null && keepLogin)
				{
					Cookie cookie = customerService.addCookie(customer);
					response.addCookie(cookie);// ���cookie��response��
				}
				session.setAttribute("customer", customer);//���û���Ϣ������Session������
				//�����ﳵ����������session������
				Cart cart = customerService.getCart(customer);
				session.setAttribute("cart", cart);
				session.setAttribute("cartItemsNum",cart.getItemAmount());
				return INDEX;
			}
		}

		return toLogin();
	}

	/**
	 * �û��˳���½
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
	 * �����������
	 * @return
	 */
	public String findPassword() {
		return "findPassword";
	}
	
	public String resetPassword() throws Exception{
		if(password == null || password.getNewpassword() == null || password.getNewpassword().isEmpty())
		{
			addFieldError("error", "�����벻��Ϊ��");
			return "modifyCutomserPassword";
		}
		if(password.getRepassword() == null || password.getRepassword().isEmpty() || !password.getNewpassword().equals(password.getRepassword()))
		{
			addFieldError("error", "�����������벻һ��");
			return "modifyCutomserPassword";
		}
		
		Customer newCustomer = customerService.savePassword((Customer)session.getAttribute("customer"), MD5Util.MD5(password.getNewpassword()));
		session.setAttribute("customer", newCustomer);
		
		return toLogin();
	}
	

	//�û�
	private Customer customer;
	//�����˻�
	private Account account;
	//ȷ�ϵ�½����
	private String reLoginPassword;
	//ȷ��֧������
	private String rePayPassword;
	// ��ҳ���
	private PageModel<Customer> pageModel;
	//���½
	private Boolean keepLogin;
	//�û����׼�¼
	private PageModel<Tradingitem> tradingRecord;
	//�޸ĵ�����
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
