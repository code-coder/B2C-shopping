package com.lin.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.lin.entity.customer.Customer;
import com.lin.entity.product.Category;
import com.lin.entity.product.Consultation;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Productinfo;
import com.lin.entity.product.Secondcategory;
import com.lin.model.PageModel;
import com.lin.service.BaseService;
import com.lin.service.ShopService;
import com.lin.util.StringUitl;

/**
 * 商店业务逻辑实现类
 * @author Administrator
 *
 */
@Scope("prototype")
@Service("shopService")
public class ShopServiceImpl extends BaseService implements ShopService{

	/**
	 * 获取一级商品类目录
	 * @return List<Productcategory>
	 */
	@Override
	public List<Category> getCatalogue() {
		return categoryDao.getAll();
	}
	
	/**
	 * 获取二级商品类目录
	 * @return List<Productcategory>
	 */
	@Override
	public Secondcategory getSecondCategory(int secondcategoryId) {
		return secondcategoryDao.get(secondcategoryId);
	}

	/**
	 * 获得单个商品类
	 * @return Productcategory
	 */
	@Override
	public Category getCategory(int categoryId) {

		return categoryDao.get(categoryId);
	}
	
	/**
	 * 获取一个具体的商品类别（第三级类别）
	 */
	@Override
	public Productcategory getProductCategory(int productCategoryId) {
		return productcategoryDao.get(productCategoryId);
	}

	/**
	 * 根据商品类获取商品分页
	 * @return PageModel<Productinfo>
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsByCategoryId(int categoryId, int pageNo, int pageSize) {

		String where = "where productcategoryId = ?";
		Object[] queryParams = {categoryId};
		return productDao.find(pageNo, pageSize, where, queryParams);
	}

	/**
	 * 根据搜索信条获取商品分页
	 * @return PageModel<Productinfo>
	 * @param Searchword
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchword(String Searchword,
			int pageNo, int pageSize) {

		String where = "where name like ?";//查询的条件语句
		Object[] queryParams = {"%" + Searchword + "%" };//为参数赋值
		return productDao.find(pageNo, pageSize, where, queryParams );//执行查询方法
	}

	/**
	 * 根据商品类和价格区间获取商品分页并默认排序
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderByDefault(
			int categoryId, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsByCategoryIdAndPriceRangeOrderBy(categoryId, 
				minPrice, maxPrice, "id", "asc", pageNo, pageSize);
	}

	/**
	 * 根据搜索信条获和价格区间取商品分页并默认排序
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param Searchword
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByDefault(
			String Searchword, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsBySearchwordAndPriceRangeOrderBy(Searchword, 
				minPrice, maxPrice, "id", "asc", pageNo, pageSize);
	}

	/**
	 * 根据搜索信条获和价格区间取商品分页并按时间排序
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param Searchword
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByTime(
			int categoryId, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsByCategoryIdAndPriceRangeOrderBy(categoryId, 
				minPrice, maxPrice, "sellTime", "desc", pageNo, pageSize);
	}
	/**
	 * 根据搜索信条获和价格区间取商品分页并按首页值大小排序
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param Searchword
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByIndex(
			int categoryId, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsByCategoryIdAndPriceRangeOrderBy(categoryId, 
				minPrice, maxPrice, "homeIndex", "desc", pageNo, pageSize);
	}
	/**
	 * 根据商品类和价格区间获取商品分页并按销量排序(降序)
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderBySellcount(
			int categoryId, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsByCategoryIdAndPriceRangeOrderBy(categoryId, 
				minPrice, maxPrice, "sellcount", "desc", pageNo, pageSize);
	}

	/**
	 * 根据搜索信条和价格区间获取商品分页并按销量排序(降序)
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param Searchword
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderBySellcount(
			String Searchword, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsBySearchwordAndPriceRangeOrderBy(Searchword, 
				minPrice, maxPrice, "sellcount", "desc", pageNo, pageSize);
	}

	/**
	 * 根据商品类和价格区间获取商品分页并按价格排序(升序)
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderBySellprice(
			int categoryId, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsByCategoryIdAndPriceRangeOrderBy(categoryId, 
				minPrice, maxPrice, "sellprice", "asc", pageNo, pageSize);
	}

	/**
	 * 根据搜索信条和价格区间获取商品分页并按价格排序(升序)
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param Searchword
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderBySellprice(
			String Searchword, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsBySearchwordAndPriceRangeOrderBy(Searchword, 
				minPrice, maxPrice, "sellprice", "asc", pageNo, pageSize);
	}

	/**
	 * 根据商品类和价格区间获取商品分页并按人气(点击量)排序(降序)
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 */
	@Override
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderByClickcount(
			int categoryId, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsByCategoryIdAndPriceRangeOrderBy(categoryId, 
				minPrice, maxPrice, "clickcount", "desc", pageNo, pageSize);
	}

	/**
	 * 根据搜索信条和价格区间获取商品分页并按人气(点击量)排序(降序)
	 * @return PageModel<Productinfo>
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param categoryId 商品类Id
	 * @param pageNo 页数
	 * @param pageSize 页大小
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderByClickcount(
			String Searchword, Float minPrice, Float maxPrice, int pageNo, int pageSize) {

		return getProductsBySearchwordAndPriceRangeOrderBy(Searchword, 
				minPrice, maxPrice, "clickcount", "desc", pageNo, pageSize);
	}

	/**
	 * 根据搜索信条和价格区间获取商品分页并按传进的参数进行排序
	 * @return PageModel<Productinfo>
	 * @param categoryId 商品类Id
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param orderOption 排序依据(sellcount,sellprice,clickcount)
	 * @param direction 排序方向   asc=升序  desc=降序
	 * @param pageNo 页数
	 * @param pageSize 页大小
	 */
	@Override
	public PageModel<Productinfo> getProductsByCategoryIdAndPriceRangeOrderBy(
			int categoryId, Float minPrice, Float maxPrice, String orderOption, String direction, int pageNo, int pageSize) {

		if(StringUitl.validateFloat(minPrice) && StringUitl.validateFloat(maxPrice) && minPrice <= maxPrice)
		{
			String where = "where productcategoryId = ? and sellprice between ? and ?";
			Object[] queryParams = {categoryId,minPrice,maxPrice};
			Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
			orderby.put(orderOption, direction);//为Map集合赋值
			return productDao.find(where, queryParams, orderby, pageNo, pageSize);
		}
		else
		{
			String where = "where productcategoryId = ?";
			Object[] queryParams = {categoryId};
			Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
			orderby.put(orderOption, direction);//为Map集合赋值
			return productDao.find(where, queryParams, orderby, pageNo, pageSize);
		}
	}

	/**
	 * 根据搜索信条和价格区间获取商品分页并按传进的参数进行排序
	 * @return PageModel<Productinfo>
	 * @param Searchword 搜索信条
	 * @param minPrice 最低价格
	 * @param maxPrice 最高价格
	 * @param orderOption 排序依据(sellcount,sellprice,clickcount)
	 * @param direction 排序方向   asc=升序  desc=降序
	 * @param pageNo 页数
	 * @param pageSize 页大小
	 */
	@Override
	public PageModel<Productinfo> getProductsBySearchwordAndPriceRangeOrderBy(String Searchword, 
			Float minPrice, Float maxPrice, String orderOption, String direction, int pageNo, int pageSize) {

		if(StringUitl.validateFloat(minPrice) && StringUitl.validateFloat(maxPrice) && minPrice <= maxPrice)
		{
			String where = "where name like ? and sellprice between ? and ?";//查询的条件语句
			Object[] queryParams = {"%" + Searchword + "%" , minPrice , maxPrice};//为参数赋值
			Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
			orderby.put(orderOption, direction);//为Map集合赋值
			return productDao.find(where, queryParams, orderby, pageNo, pageSize);//执行查询方法
		}
		else
		{
			String where = "where name like ?";//查询的条件语句
			Object[] queryParams = {"%" + Searchword + "%"};//为参数赋值
			Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
			orderby.put(orderOption, direction);//为Map集合赋值
			return productDao.find(where, queryParams, orderby, pageNo, pageSize);//执行查询方法
		}
		
	}

	/**
	 * 商品被选中（点击）
	 */
	@Override
	public Productinfo productBeSelected(int productId) {

		Productinfo selectedProduct = productDao.get(productId);
		selectedProduct.setClickcount(selectedProduct.getClickcount()+1);
		productDao.update(selectedProduct);

		return selectedProduct;
	}

	/**
	 * 添加商品咨询
	 */
	@Override
	public void addConsultation(Productinfo product, Customer customer,
			Consultation consultation) {

		consultation.setProduct(product);
		consultation.setCustomer(customer);
		consultationDao.saveOrUpdate(consultation);
	}

	/**
	 * 获取商品的留言（分页）
	 */
	@Override
	public PageModel<Consultation> getProductConsultations(Productinfo product, int pageNo, int pageSize) {

		String where = "where product.id=? and showed=1";
		Object[] queryParams = {product.getId()};
		return consultationDao.find(pageNo, pageSize, where, queryParams);
	}
	
}
