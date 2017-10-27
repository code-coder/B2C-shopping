package com.lin.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.entity.product.Category;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Productinfo;
import com.lin.model.PageModel;
@Scope("prototype")
@Controller
public class HomeAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	

	@Override
	public String execute() throws Exception {
		
		if(session.getAttribute("customer") == null)
		{
			customerService.getCookie(request);
		}
		catalogue = shopService.getCatalogue();
		PageModel<Productinfo> featuredProduct1 = shopService.getProductsBySearchwordAndPriceRangeOrderByIndex(1, null, null, pageNo, pageSize);
		Productcategory feturedCategory1 =shopService.getProductCategory(1);
		request.setAttribute("featuredProduct1", featuredProduct1);
		request.setAttribute("feturedCategory1", feturedCategory1);
		PageModel<Productinfo> featuredProduct2 = shopService.getProductsBySearchwordAndPriceRangeOrderByIndex(2, null, null, pageNo, pageSize);
		Productcategory feturedCategory2 =shopService.getProductCategory(2);
		request.setAttribute("featuredProduct2", featuredProduct2);
		request.setAttribute("feturedCategory2", feturedCategory2);
		
		
		PageModel<Productinfo> newProduct = shopService.getProductsBySearchwordAndPriceRangeOrderByTime(1, null, null, pageNo, pageSize);
		request.setAttribute("newCategory1", feturedCategory1);
		request.setAttribute("newProduct", newProduct);
		request.setAttribute("catalogue", catalogue);
		session.setAttribute("catalogue", catalogue);
		return SUCCESS;
	}
	
private List<Category> catalogue;
	
	public List<Category> getCatalogue() {
		return catalogue;
	}

	public void setCatalogue(List<Category> catalogue) {
		this.catalogue = catalogue;
	}
}
