package com.lin.action.product;

import java.io.File;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.customer.Customer;
import com.lin.entity.product.Category;
import com.lin.entity.product.Consultation;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Productinfo;
import com.lin.entity.product.Secondcategory;
import com.lin.model.PageModel;
import com.lin.util.StringUitl;

/**
 * productAction
 * @author lin
 *
 */
@Scope("prototype")
@Controller
public class ProductAction extends BaseAction {


	private static final long serialVersionUID = 1L;

//管理员
	/**
	 * 获得商品列表
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		pageModel = adminService.findProductList(pageNo, pageSize);
		return LIST;
	}

	/**
	 * 添加商品
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception
	{
		//-1表示查询所有
		productcategoryList = adminService.findProductCategoryList(-1, pageNo, pageSize);
		return ADD;
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
	 * 根据名称查找
	 * @return
	 * @throws Exception
	 */
	public String queryByName() throws Exception
	{
		if(!StringUitl.validateString(product.getName()))
		{
			addFieldError("error", "名称不能为空");
			return QUERY;
		}
		pageModel = adminService.queryProductByName(product.getName(), pageNo, pageSize);
		return LIST;
	}

	/**
	 * 删除商品
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception
	{
		
		adminService.delectProduct(product.getId());
		return list();
	}

	/**
	 * 修改商品信息
	 * @return
	 * @throws Exception
	 */
	public String modify() throws Exception
	{
		product = adminService.findProduct(product.getId());
		productcategoryList = adminService.findProductCategoryList(-1, pageNo, pageSize);
		return MODIFY;
	}

	/**
	 * 储存商品
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception
	{	
		if(!StringUitl.validateString(product.getName())){
			addFieldError("name", "商品名称不能为空！");
			return add();
		}
		if(!StringUitl.validateFloat(product.getBaseprice())){
			addFieldError("baseprice", "采购价格填写有误！");
			return add();
		}
		if(!StringUitl.validateFloat(product.getSellprice())){
			addFieldError("sellprice", "销售价格填写有误！");
			return add();
		}
		if(!StringUitl.validateString(product.getDescription())){
			addFieldError("name", "商品说明不能为空！");
			return add();
		}
		adminService.saveOrUpdateProduct(product,file);
		return ADD_SUCCESS;
	}
	
	public String saveModify() throws Exception
	{
		if(!StringUitl.validateString(product.getName())){
			addFieldError("name", "商品名称不能为空！");
			return modify();
		}
		if(!StringUitl.validateFloat(product.getBaseprice())){
			addFieldError("baseprice", "采购价格填写有误！");
			return modify();
		}
		if(!StringUitl.validateFloat(product.getSellprice())){
			addFieldError("sellprice", "销售价格填写有误！");
			return modify();
		}
		if(!StringUitl.validateString(product.getDescription())){
			addFieldError("description", "商品说明不能为空！");
			return modify();
		}	
		adminService.saveOrUpdateProduct(product,file);
		addFieldError("name", "修改成功！");
		return modify();
	}

//前台商城
	/**
	 * 商品被选中
	 * @return
	 * @throws Exception
	 */
	public String select() throws Exception
	{	
		if(cid == null || "".equals(cid)){
			Customer customer = (Customer)session.getAttribute("customer");
			if(customer != null)
				cid = customer.getId();
		}
		product = shopService.productBeSelected(product.getId());
		productCategory = product.getProductCategory();//这个三级分类里没有一级分类
		productCategory = shopService.getProductCategory(productCategory.getId()); //要走数据库去查一下一级分类
		pageSize = 10;
		consultations = shopService.getProductConsultations(product, pageNo, pageSize);
		return SELECT;
	}
	
	/**针对商品进行留言咨询
	 * 
	 * @return
	 * @throws Exception
	 */
	public  String consult() throws Exception
	{
		if((Customer)session.getAttribute("customer") != null)
		{
			shopService.addConsultation(product, (Customer)session.getAttribute("customer"), consultation);
		}
	
		return select();
	}
	
	/**
	 * 根据商品类Id查询所有商品信息
	 * @return String
	 * @throws Exception
	 */
	public String findByCategoryId() throws Exception{

		if(cid == null || "".equals(cid)){
			Customer customer = (Customer)session.getAttribute("customer");
			if(customer != null)
				cid = customer.getId();
		}
		if(productCategory.getId() != null){
			productCategory = shopService.getProductCategory(productCategory.getId());
			category = productCategory.getSecondcategory().getCategory();
			session.setAttribute("Searchword", productCategory.getName());
			session.setAttribute("orderOption", 1);
			pageModel = shopService.getProductsByCategoryId(productCategory.getId(), pageNo, pageSize);
			PageModel<Productinfo> newProduct = shopService.getProductsBySearchwordAndPriceRangeOrderByTime(productCategory.getId(), null, null, pageNo, pageSize);
			request.setAttribute("newProduct", newProduct);
		}
		if(9 !=pageSize){
			return "model";
		}
		return LIST;
	}

	/**
	 * 根据搜索信条模糊查询商品
	 * @return
	 * @throws Exception
	 */
	public String findBySearchword() throws Exception{

		if(cid == null || "".equals(cid)){
			Customer customer = (Customer)session.getAttribute("customer");
			if(customer != null)
				cid = customer.getId();
		}
		if(Searchword != null)
		{
			if(Searchword.isEmpty())
			{
				session.setAttribute("Searchword", "全部商品");
			}
			session.setAttribute("Searchword", Searchword);
			session.setAttribute("orderOption", 1);
			pageModel = shopService.getProductsBySearchword(Searchword, pageNo, pageSize);
			
		}
		return LIST;

	}

	/**
	 * 默认排序
	 * @return
	 * @throws Exception
	 */
	public String orderByDefault() throws Exception
	{
		session.setAttribute("orderOption", 1);
		if(productCategory!=null && productCategory.getId()!=null)
		{
			pageModel = shopService.getProductsByCategoryIdAndPriceRangeOrderByDefault(productCategory.getId(), 
					minPrice, maxPrice, pageNo, pageSize);
		}		
		if(Searchword !=null)
		{
			pageModel = shopService.getProductsBySearchwordAndPriceRangeOrderByDefault(Searchword, 
					minPrice, maxPrice, pageNo, pageSize);
		}

		return "model";
	}

	/**
	 * 根据销量排序(降序)
	 * @return
	 * @throws Exception
	 */
	public String orderBySellcount() throws Exception
	{
		session.setAttribute("orderOption", 2);
		if(productCategory!=null && productCategory.getId()!=null)
		{
			pageModel = shopService.getProductsByCategoryIdAndPriceRangeOrderBySellcount(productCategory.getId(), 
					minPrice, maxPrice, pageNo, pageSize);
		}		
		if(Searchword !=null)
		{
			pageModel = shopService.getProductsBySearchwordAndPriceRangeOrderBySellcount(Searchword, 
					minPrice, maxPrice, pageNo, pageSize);
		}

		return "model";
	}

	/**
	 * 根据价格排序(升序)
	 * @return
	 * @throws Exception
	 */
	public String orderBySellprice() throws Exception
	{
		session.setAttribute("orderOption", 3);
		if(productCategory!=null && productCategory.getId()!=null)
		{
			pageModel = shopService.getProductsByCategoryIdAndPriceRangeOrderBySellprice(productCategory.getId(), 
					minPrice, maxPrice, pageNo, pageSize);
		}		
		if(Searchword !=null)
		{
			pageModel = shopService.getProductsBySearchwordAndPriceRangeOrderBySellprice(Searchword, 
					minPrice, maxPrice, pageNo, pageSize);
		}

		return "model";
	}
	
	/**
	 * 根据人气(点击量)排序(降序)
	 * @return
	 * @throws Exception
	 */
	public String orderByClickcount() throws Exception
	{
		session.setAttribute("orderOption", 4);
		if(productCategory!=null && productCategory.getId()!=null)
		{
			pageModel = shopService.getProductsByCategoryIdAndPriceRangeOrderByClickcount(productCategory.getId(), 
					minPrice, maxPrice, pageNo, pageSize);
		}		
		if(Searchword !=null)
		{
			pageModel = shopService.getProductsBySearchwordAndPriceRangeOrderByClickcount(Searchword, 
					minPrice, maxPrice, pageNo, pageSize);
		}

		return "model";
	}




	//Field
	private Productinfo product;
	//分页工具
	private PageModel<Productinfo> pageModel;
	// 上传文件
	private File file;
	// 所有类别
	private List<Category> categorys;
	//接收表单的商品类
	private PageModel<Productcategory> productcategoryList;
	private Category category;
	//二级商品类
	private Secondcategory secondCategory;
	//商品类别
	private Productcategory productCategory;
	//搜索信条
	private String Searchword = null;
	//最低价格
	private Float minPrice;
	//最高价格
	private Float maxPrice;
	//商品所有可视化咨询(分页)
	private PageModel<Consultation> consultations;
	//留言
	private Consultation consultation;
	
	public PageModel<Productcategory> getProductcategoryList() {
		return productcategoryList;
	}

	public void setProductcategoryList(
			PageModel<Productcategory> productcategoryList) {
		this.productcategoryList = productcategoryList;
	}

	//getter and setter
	public Productinfo getProduct() {
		return product;
	}

	public void setProduct(Productinfo product) {
		this.product = product;
	}

	public PageModel<Productinfo> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Productinfo> pageModel) {
		this.pageModel = pageModel;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getSearchword() {
		return Searchword;
	}

	public void setSearchword(String Searchword) {
		this.Searchword = Searchword;
	}

	public Float getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}

	public Float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public PageModel<Consultation> getConsultations() {
		return consultations;
	}

	public void setConsultations(PageModel<Consultation> consultations) {
		this.consultations = consultations;
	}

	public Consultation getConsultation() {
		return consultation;
	}

	public void setConsultation(Consultation consultation) {
		this.consultation = consultation;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}

	public Productcategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(Productcategory productCategory) {
		this.productCategory = productCategory;
	}

	public Secondcategory getSecondCategory() {
		return secondCategory;
	}

	public void setSecondCategory(Secondcategory secondCategory) {
		this.secondCategory = secondCategory;
	}






}
