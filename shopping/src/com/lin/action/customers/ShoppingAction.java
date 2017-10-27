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
	 * �ҵ��̳�
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
	 * �޸ĸ�������
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
	 * �����޸ĺõ���Ϣ
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
	 * �޸ĵ�½����
	 * @return
	 * @throws Exception
	 */
	public String modifyPassword() throws Exception
	{
		return "modifyCutomserPassword";
	}
	
	/**
	 * �����޸ĵ�½����
	 * @return
	 * @throws Exception
	 */
	public String savePassword() throws Exception
	{
		if(customerService.validPassword((Customer)session.getAttribute("customer"), MD5Util.MD5(customer.getPassword())) == false)
		{
			addFieldError("error", "�����������");
			return "modifyCutomserPassword";
		}
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
		return "mddifyPasswordSuccess";
	}
	
	/**
	 * �޸�ͷ��
	 * @return
	 * @throws Exception
	 */
	public String modifyHeadPortrait() throws Exception
	{
		return "modifyCutomserHeadPortrait";
	}
	
	/**
	 * �����ϴ�ͷ��
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
	 * �����˺�
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
	 * ��ֵ
	 * @return
	 * @throws Exception
	 */
	public String recharge() throws Exception
	{
		return "recharge";
	}
	
	/**
	 * �����ֵ
	 * @return
	 * @throws Exception
	 */
	public String saveRecharge() throws Exception
	{
		customerService.saveRecharge((Customer)session.getAttribute("customer"), tradingitem);
		return "recharge_success";
	}
	
	/**
	 * ��ֵУ��
	 */
	public void validateSaveRecharge()
	{
		if(StringUitl.validateFloat(tradingitem.getMoney()) == false)
		{
			addFieldError("error", "�����������ֵ���");
		}	
		if(!customerService.validPayPassword((Customer)session.getAttribute("customer"), account.getPassword()))
		{
			addFieldError("error", "֧���������");
		}
	}
	
	/**
	 * �鿴���׼�¼
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
	 * �޸�֧������
	 * @return
	 * @throws Exception
	 */
	public String modifyPayPassword() throws Exception
	{
		return "modifyPayPassword";
	}
	
	/**
	 * �����޸�֧������
	 * @return
	 * @throws Exception
	 */
	public String savePayPassword() throws Exception
	{
		if(customerService.validPayPassword((Customer)session.getAttribute("customer"), account.getPassword()) == false)
		{
			addFieldError("error", "֧�������������");
			return "modifyPayPassword";
		}
		if(password == null || password.getNewpassword() == null || password.getNewpassword().isEmpty())
		{
			addFieldError("error", "�����벻��Ϊ��");
			return "modifyPayPassword";
		}
		if(password.getRepassword() == null || password.getRepassword().isEmpty() || !password.getNewpassword().equals(password.getRepassword()))
		{
			addFieldError("error", "�����������벻һ��");
			return "modifyPayPassword";
		}
		
		 customerService.savePayPassword((Customer)session.getAttribute("customer"), password.getNewpassword());
		return "mddifyPayPasswordSuccess";
	}
	
	/**
	 * �ջ���ַ
	 * @return
	 * @throws Exception
	 */
	public String shoppingAddress() throws Exception
	{
		shoppingAddresses = customerService.getSavedShoppingAdderess((Customer)session.getAttribute("customer"));
		return "shoppingAddress";
	}
	
	/**
	 * �����ջ���ַ
	 * @return
	 * @throws Exception
	 */
	public String saveShoppingAddress() throws Exception
	{
		if(!StringUitl.validateString(shoppingAddress.getConsignee()))
		{
			addFieldError("error", "�ռ��˲���Ϊ��");
			return shoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getMobile()))
		{
			addFieldError("error", "�ֻ����벻��Ϊ��");
			return shoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getAddress()))
		{
			addFieldError("error", "��ַ����Ϊ��");
			return shoppingAddress();
		}
		
		
		customerService.saveShoppingAddress((Customer)session.getAttribute("customer"), shoppingAddress);
		return shoppingAddress();
	}
	
	/**
	 *�޸��ջ���ַ 
	 * @return
	 * @throws Exception
	 */
	public String modifyShoppingAddress() throws Exception
	{
		shoppingAddress = customerService.getModifyShoppingAddress(shoppingAddress.getId());
		return "modifyShoppingAddress";
	}
	
	/**
	 * �����޸ĵ��ջ���ַ
	 * @return
	 * @throws Exception
	 */
	public String saveModifyedShoppingAddress() throws Exception
	{
		if(!StringUitl.validateString(shoppingAddress.getConsignee()))
		{
			addFieldError("error", "�ռ��˲���Ϊ��");
			return modifyShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getMobile()))
		{
			addFieldError("error", "�ֻ����벻��Ϊ��");
			return modifyShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getAddress()))
		{
			addFieldError("error", "��ַ����Ϊ��");
			return modifyShoppingAddress();
		}
		
		customerService.saveModifyShoppingAddress((Customer)session.getAttribute("customer"), shoppingAddress);
		return shoppingAddress();
	}
	
	/**
	 *ɾ���ջ���ַ 
	 * @return
	 * @throws Exception
	 */
	public String delectShoppingAddress() throws Exception
	{
		customerService.delectShoppingAddress(shoppingAddress.getId());
		return shoppingAddress();
	}
	
	/**
	 * ��ΪĬ�ϵ�ַ
	 * @return
	 * @throws Exception
	 */
	public String setShoppingAddressIsDefault() throws Exception
	{
		customerService.setShoppingAddressIsDefault((Customer)session.getAttribute("customer"), shoppingAddress.getId());
		return shoppingAddress();
	}
	
	

	//�û�
	private Customer customer;
	//�޸ĵ�����
	private Password password;
	//�ϴ���ͷ��
	private File headPortrait;
	//�����˻�
	private Account account;
	//������Ŀ 
	private Tradingitem tradingitem;
	//���׼�¼(��ҳ)
	private PageModel<Tradingitem> pageModel;
	//���ﳵ
	private Cart cart;
	//�ջ���ַ
	private ShoppingAddress shoppingAddress;
	//�ѱ�����ջ���ַ
	private PageModel<ShoppingAddress> shoppingAddresses;
	//���Զ���
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
