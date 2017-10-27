package com.lin.action.customers;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.cart.Cart;
import com.lin.entity.cart.Cartitem;
import com.lin.entity.customer.Customer;

@Scope("prototype")
@Controller
public class CartAction extends BaseAction {

	private static final long serialVersionUID = 1L;


	/**
	 * 我的购物车
	 * @return
	 * @throws Exception
	 */
	public String myCart() throws Exception
	{
		Customer customer = (Customer) session.getAttribute("customer");
		cart = customerService.getCart(customer);
		session.setAttribute("cart", cart);
		return "myCart";
	}

	/**
	 * 清空购物车
	 * @return
	 * @throws Exception
	 */
	public String clearCart() throws Exception
	{
		Customer customer = (Customer) session.getAttribute("customer");
		Cart newCart = customerService.clearCart(customer);
		session.setAttribute("cart", newCart);
		return myCart();
	}

	/**
	 * 从我的购物车移除商品
	 * @return
	 * @throws Exception
	 */
	public String removeItem() throws Exception
	{
		Customer customer = (Customer) session.getAttribute("customer");
		Cart newCart =customerService.removeItemFromCart(customer, cartitem);
		//更新显示购物车的数量
		session.setAttribute("cart", newCart);
		return myCart();
	}

	public void updateCartItem(){
		Customer customer = (Customer) session.getAttribute("customer");
		Cart newCart = customerService.updateCartItem(customer, cartitem);
		session.setAttribute("cart", newCart);
	}
	
	/**
	 * 添加商品到我的购物车
	 * @return
	 * @throws Exception
	 */
	public String addItem()
	{
		try{
			Customer customer = (Customer) session.getAttribute("customer");
			Cart newCart =customerService.addItemToCart(customer, cartitem);
			//更新显示购物车的数量
			session.setAttribute("cart", newCart);
			return "addItem_success";
		}
		catch(Exception e)
		{
			return "addItem_failure";
		}
	}

	//购物车
	private Cart cart;
	//购物车商品
	private Cartitem cartitem;

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Cartitem getCartitem() {
		return cartitem;
	}

	public void setCartitem(Cartitem cartitem) {
		this.cartitem = cartitem;
	}
}
