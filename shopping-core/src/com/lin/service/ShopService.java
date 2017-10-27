package com.lin.service;

import java.util.List;

import com.lin.entity.customer.Customer;
import com.lin.entity.product.Category;
import com.lin.entity.product.Consultation;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Productinfo;
import com.lin.entity.product.Secondcategory;
import com.lin.model.PageModel;

/**
 * 商店业务逻辑接口
 * @author Administrator
 *
 */
public interface ShopService {
	

	public List<Category> getCatalogue(); //获取所以分类信息
	public Category getCategory(int categoryId); //获取单个分类的信息
	
	public PageModel<Productinfo> getProductsByCategoryId(int categoryId, int pageNo, int pageSize);//根据商品类获取商品分页
	public PageModel<Productinfo> getProductsBySearchword(String Searchword, int pageNo, int pageSize);//根据搜索信条获取商品分页
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderByDefault(int categoryId, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据商品类和价格区间获取商品分页并默认排序
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByDefault(String Searchword, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据搜索信条获和价格区间取商品分页并默认排序
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderBySellcount(int categoryId, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据商品类获和价格区间取商品分页并按销量排序
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderBySellcount(String Searchword, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据搜索信条获和价格区间取商品分页并按销量排序
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderBySellprice(int categoryId, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据商品类获和价格区间取商品分页并按价格排序
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderBySellprice(String Searchword, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据搜索信条获和价格区间取商品分页并按价格排序
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderByClickcount(int categoryId, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据商品类获和价格区间取商品分页并按人气排序
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByClickcount(String Searchword, 
			Float minPrice, Float maxPrice, int pageNo, int pageSize);//根据搜索信条获和价格区间取商品分页并按人气排序
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderBy(int categoryId,
			Float minPrice, Float maxPrice, String orderOption, String direction, int pageNo, int pageSize);
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderBy(String Searchword, 
			Float minPrice, Float maxPrice, String orderOption, String direction, int pageNo, int pageSize);
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByTime(
			int categoryId, Float minPrice, Float maxPrice, int pageNo,int pageSize);
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByIndex(
			int categoryId, Float minPrice, Float maxPrice, int pageNo,int pageSize);
	public void addConsultation(Productinfo product, Customer customer, Consultation consultation);//添加留言
	public Productinfo productBeSelected(int productId);//选择(点击进入)商品
	public PageModel<Consultation> getProductConsultations(Productinfo product, int pageNo, int pageSize);//获取商品作用留言
	Productcategory getProductCategory(int productCategoryId);
	Secondcategory getSecondCategory(int secondcategoryId);
	
	
}
