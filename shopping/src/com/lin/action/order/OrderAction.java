package com.lin.action.order;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.account.Account;
import com.lin.entity.cart.Cart;
import com.lin.entity.cart.Cartitem;
import com.lin.entity.customer.Customer;
import com.lin.entity.customer.ShoppingAddress;
import com.lin.entity.order.Order;
import com.lin.entity.order.Orderitem;
import com.lin.model.PageModel;
import com.lin.util.StringUitl;

/**
 * orderAction
 * @author lin
 *
 */
@Scope("prototype")
@Controller
public class OrderAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	
	/**
	 * �����б�����Ա��
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		pageModel = adminService.findOrderList(pageNo, pageSize);
		return LIST;
	}
	
	/**
	 * ������Ʒ��
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception
	{
		return QUERY;
	}
	
	/**
	 * ���ݶ����Ų���
	 * @return
	 * @throws Exception
	 */
	public String queryByOrderId() throws Exception
	{
		if(!StringUitl.validateString(order.getOrderId()))
		{
			addFieldError("error", "�����Ų���Ϊ��");
			return QUERY;
		}
		pageModel = adminService.queryOrderByOrderId(order.getOrderId(), pageNo, pageSize);
		return LIST;
	}
	
	/**
	 * ɾ������������Ա��
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception
	{
		adminService.delectOrder(order.getOrderId());
		return list();
	}
	

	/**
	 * �˶Զ�����ֱ�ӹ���
	 * @return
	 * @throws Exception
	 */
	public String checkOrderFromDirectBuy() throws Exception
	{
		session.setAttribute("orderSource", "directBuy");
		shoppingAddresses = customerService.getSavedShoppingAdderess((Customer)session.getAttribute("customer"));
		if(orderitem!=null && orderitem.getAmount()!=null && orderitem.getProduct()!=null && orderitem.getProduct().getId()!=null)
		{
			orderitem = customerService.getTempOrderitem(orderitem.getProduct().getId(), orderitem.getAmount());
			session.setAttribute("orderitem", orderitem);
		}

		return "checkOrder";
	}

	/**
	 * �˶Զ��������ﳵ��
	 */
	public String checkOrderFromCart() throws Exception
	{
		String[] cartIds = new String[20];
		Set<Cartitem> buyItems = new HashSet<Cartitem>();
		Set<Cartitem> removeItems = new HashSet<Cartitem>();
		String[] amounts = request.getParameterValues("amount");
		String priceTotal=request.getParameter("priceTotal");
		cartIds = request.getParameterValues("cartId");
		float totalPrice = 0;
		if(!"".equals(priceTotal) && priceTotal!=null)
			totalPrice=Float.parseFloat(priceTotal);
		if(cartIds==null||cartIds.length<1){
			buyItems = (Set<Cartitem>) session.getAttribute("buyItems");
			if(buyItems.size()>0){
				int i =0;
				String[] a = new String[buyItems.size()];
				for(Cartitem item:buyItems){
					a[i]=item.getId()+"";
					totalPrice += item.getPrice();
					i++;
				}
				cartIds = a;
			}
		}

		if(cartIds != null && cartIds.length>0){
			cart = customerService.getCart((Customer)session.getAttribute("customer"));
			//�������������Ⱦ�ֱ����չ��ﳵ
			//�����������Ƴ�cart����û��ѡ�����Ʒ
			Set<Cartitem> cartItems =cart.getCartitems();
			if(cart.getCartitems().size()!=cartIds.length){ 
				Iterator<Cartitem> it = cartItems.iterator();
				while(it.hasNext()){
					Cartitem cartitem=(Cartitem) it.next();
					boolean remove = true;
					for(int i=0;i<cartIds.length;i++){
						if(cartitem.getId()==Integer.parseInt(cartIds[i])){
							remove=false;
							buyItems.add(cartitem);
							break;
						}
					}
					if(remove){
						removeItems.add(cartitem);
					}
				}
			}else{
				buyItems=cart.getCartitems();
			}
			if(!removeItems.isEmpty()){
				cartItems.removeAll(removeItems);
			}
		
		session.setAttribute("orderSource", "cart");
		session.setAttribute("buyItems", buyItems);
		session.setAttribute("totalPrice", totalPrice);
		shoppingAddresses = customerService.getSavedShoppingAdderess((Customer)session.getAttribute("customer"));
		
		
		return "checkOrder";
		}else{
			return "error";
		}
	}
	
	/**
	 * �����ջ���ַ
	 * @return
	 * @throws Exception
	 */
	public String newShoppingAddress() throws Exception
	{
		return "newShoppingAddress";
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
			return newShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getMobile()))
		{
			addFieldError("error", "�ֻ����벻��Ϊ��");
			return newShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getAddress()))
		{
			addFieldError("error", "��ַ����Ϊ��");
			return newShoppingAddress();
		}
		
		customerService.saveShoppingAddress((Customer)session.getAttribute("customer"), shoppingAddress);
		if(session.getAttribute("orderSource").equals("cart"))
		{
			return "checkOrderFromCart";
		}
		else
		{
			return "checkOrderFromDirectBuy";
		}
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
		
		customerService.saveShoppingAddress((Customer)session.getAttribute("customer"), shoppingAddress);
		if(session.getAttribute("orderSource").equals("cart"))
		{
			
			return checkOrderFromCart();
		}
		else
		{
			return checkOrderFromDirectBuy();
		}
	}

	/**
	 *ɾ���ջ���ַ 
	 * @return
	 * @throws Exception
	 */
	public String delectShoppingAddress() throws Exception
	{
		customerService.delectShoppingAddress(shoppingAddress.getId());
		if(session.getAttribute("orderSource").equals("cart"))
		{
			return checkOrderFromCart();
		}
		else
		{
			return checkOrderFromDirectBuy();
		}
	}
	
	/**
	 * �ύ����
	 * @return
	 * @throws Exception
	 */
	public String submitOrder() throws Exception
	{
		
		if(shoppingAddress==null || shoppingAddress.getId()==null)
		{
			addFieldError("error", "�ջ���ַ����Ϊ��");
			if(session.getAttribute("orderSource").equals("cart"))
			{
				return checkOrderFromCart();
			}
			else
			{
				return checkOrderFromDirectBuy();
			}
		}
		else
		{
			if(session.getAttribute("orderSource").equals("cart"))
			{
				Set<Cartitem> buyItems=(Set<Cartitem>) session.getAttribute("buyItems");
				float totalPrice=Float.parseFloat(session.getAttribute("totalPrice").toString());
				order = customerService.newOrderFromCart((Customer)session.getAttribute("customer"), shoppingAddress, buyItems, totalPrice);
				Cart newCart =customerService.clearCart((Customer)session.getAttribute("customer"), buyItems, totalPrice);
				session.setAttribute("cart", newCart);
			}
			else
			{
				order = customerService.newOrderFromDirect((Customer)session.getAttribute("customer"), 
						shoppingAddress, (Orderitem)session.getAttribute("orderitem"));
				session.removeAttribute("orderSource");
				session.removeAttribute("orderitem");
				
			}
		}
		return "pay";
	}
	
	/**
	 * Ϊ��������
	 * @return
	 * @throws Exception
	 */
	public String payForOrder() throws Exception
	{
		order = customerService.getOrderById(order.getOrderId());
		return "pay";
	}
	
	/**
	 * ���鸶��
	 * @return
	 * @throws Exception
	 */
	public String payValid() throws Exception
	{
		if(!customerService.validPayPassword((Customer)session.getAttribute("customer"), account.getPassword()))
		{
			addFieldError("error", "�����������");
			return payForOrder();
		}
		if(!customerService.payForOrder((Customer)session.getAttribute("customer"), order.getOrderId()))
		{
			return "payFailure";
		}

		return "paySuccess";
	}
	
	/**
	 * �ҵĶ���
	 * @return
	 * @throws Exception
	 */
	public String myOrder() throws Exception
	{
		pageModel = customerService.getOrders((Customer)session.getAttribute("customer"), pageNo, pageSize);
		return "myOrder";
	}
	
	/**
	 * �鿴��������
	 * @return
	 * @throws Exception
	 */
	public String viewOrderDetails() throws Exception
	{
		order = customerService.getOrderById(order.getOrderId());
		return "orderDetails";
	}
	
	/**
	 * �����ύ����
	 * @return
	 * @throws Exception
	 */
	public String submitError() throws Exception
	{
		return "submitError";
	}
	
	//�û�
	private Customer customer;
	//�ջ���ַ
	private ShoppingAddress shoppingAddress;
	//����
	private Order order;
	//������Ŀ
	private Orderitem orderitem;
	//���Զ���
	private PageModel<Order> pageModel;
	//�ѱ�����ջ���ַ
	private PageModel<ShoppingAddress> shoppingAddresses;
	//���ﳵ
	private Cart cart;
	//�����˻�
	private Account account;



	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public ShoppingAddress getShoppingAddress() {
		return shoppingAddress;
	}
	public void setShoppingAddress(ShoppingAddress shoppingAddress) {
		this.shoppingAddress = shoppingAddress;
	}
	public PageModel<ShoppingAddress> getShoppingAddresses() {
		return shoppingAddresses;
	}
	public void setShoppingAddresses(PageModel<ShoppingAddress> shoppingAddresses) {
		this.shoppingAddresses = shoppingAddresses;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Orderitem getOrderitem() {
		return orderitem;
	}
	public void setOrderitem(Orderitem orderitem) {
		this.orderitem = orderitem;
	}

	public PageModel<Order> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Order> pageModel) {
		this.pageModel = pageModel;
	}

	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
}
