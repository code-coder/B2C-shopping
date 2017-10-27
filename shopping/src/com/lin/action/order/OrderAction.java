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
	 * 订单列表（管理员）
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		pageModel = adminService.findOrderList(pageNo, pageSize);
		return LIST;
	}
	
	/**
	 * 查找商品类
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception
	{
		return QUERY;
	}
	
	/**
	 * 根据订单号查找
	 * @return
	 * @throws Exception
	 */
	public String queryByOrderId() throws Exception
	{
		if(!StringUitl.validateString(order.getOrderId()))
		{
			addFieldError("error", "订单号不能为空");
			return QUERY;
		}
		pageModel = adminService.queryOrderByOrderId(order.getOrderId(), pageNo, pageSize);
		return LIST;
	}
	
	/**
	 * 删除订单（管理员）
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception
	{
		adminService.delectOrder(order.getOrderId());
		return list();
	}
	

	/**
	 * 核对订单（直接购买）
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
	 * 核对订单（购物车）
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
			//如果两者数量相等就直接清空购物车
			//如果不相等则移除cart对象没有选择的商品
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
	 * 新增收货地址
	 * @return
	 * @throws Exception
	 */
	public String newShoppingAddress() throws Exception
	{
		return "newShoppingAddress";
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
			return newShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getMobile()))
		{
			addFieldError("error", "手机号码不能为空");
			return newShoppingAddress();
		}
		if(!StringUitl.validateString(shoppingAddress.getAddress()))
		{
			addFieldError("error", "地址不能为空");
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
	 *删除收货地址 
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
	 * 提交订单
	 * @return
	 * @throws Exception
	 */
	public String submitOrder() throws Exception
	{
		
		if(shoppingAddress==null || shoppingAddress.getId()==null)
		{
			addFieldError("error", "收货地址不能为空");
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
	 * 为订单付款
	 * @return
	 * @throws Exception
	 */
	public String payForOrder() throws Exception
	{
		order = customerService.getOrderById(order.getOrderId());
		return "pay";
	}
	
	/**
	 * 检验付款
	 * @return
	 * @throws Exception
	 */
	public String payValid() throws Exception
	{
		if(!customerService.validPayPassword((Customer)session.getAttribute("customer"), account.getPassword()))
		{
			addFieldError("error", "密码输入错误");
			return payForOrder();
		}
		if(!customerService.payForOrder((Customer)session.getAttribute("customer"), order.getOrderId()))
		{
			return "payFailure";
		}

		return "paySuccess";
	}
	
	/**
	 * 我的订单
	 * @return
	 * @throws Exception
	 */
	public String myOrder() throws Exception
	{
		pageModel = customerService.getOrders((Customer)session.getAttribute("customer"), pageNo, pageSize);
		return "myOrder";
	}
	
	/**
	 * 查看订单详情
	 * @return
	 * @throws Exception
	 */
	public String viewOrderDetails() throws Exception
	{
		order = customerService.getOrderById(order.getOrderId());
		return "orderDetails";
	}
	
	/**
	 * 订单提交错误
	 * @return
	 * @throws Exception
	 */
	public String submitError() throws Exception
	{
		return "submitError";
	}
	
	//用户
	private Customer customer;
	//收货地址
	private ShoppingAddress shoppingAddress;
	//订单
	private Order order;
	//订单项目
	private Orderitem orderitem;
	//所以订单
	private PageModel<Order> pageModel;
	//已保存的收货地址
	private PageModel<ShoppingAddress> shoppingAddresses;
	//购物车
	private Cart cart;
	//交易账户
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
