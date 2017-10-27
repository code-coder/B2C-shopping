package com.lin.action.product;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.product.Category;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Secondcategory;
import com.lin.model.PageModel;
import com.lin.util.StringUitl;

/**
 * categoryAction
 * @author lin
 *
 */
@Scope("prototype")
@Controller
public class CategoryAction extends BaseAction {


	private static final long serialVersionUID = 1L;


	/**
	 * 商品类列表
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		categoryList = adminService.findCategoryList(pageNo, pageSize);
		pageModel = categoryList;
		return LIST;
	}

	/**
	 * 添加商品类
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception
	{
		return INPUT;
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
		if(!StringUitl.validateString(category.getName()))
		{
			addFieldError("error", "名称不能为空");
			return QUERY;
		}
		pageModel = adminService.queryCategoryByName(category.getName(), pageNo, pageSize);
		return LIST;
	}
	
	/**
	 * 删除商品类
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception 
	{
		secondcategoryList =adminService.findSecondCategoryList(category.getId(), pageNo, pageSize);
		if(secondcategoryList.getTotalRecords()>0){
			addFieldError("secondcategoryIsNotEmpty", "该一级商品种类包含有二级商品种类，请先删除二级商品种类!");
			return list();
		}
		adminService.delectCategory(category.getId());
		return list();
	}
	public String secondcategoryDelect() throws Exception 
	{
		productcategoryList =adminService.findProductCategoryList(secondcategory.getId(), pageNo, pageSize);
		if(productcategoryList.getTotalRecords()>0){
			addFieldError("productcategoryIsNotEmpty", "该二级商品种类包含有三级商品种类，请先删除三级商品种类!");
			return modify();
		}
		adminService.delectSecondcategory(secondcategory.getId());
		return modify();
	}
	public String productcategoryDelect() throws Exception 
	{
		adminService.delectProductcategory(productcategory.getId());
		return secondcategoryModify();
	}
	/**
	 * 一级商品类管理
	 * @return
	 * @throws Exception
	 */
	public String modify() throws Exception
	{
		category = adminService.getCategory(category.getId());
		pageModel = adminService.findSecondCategoryList(category.getId(),pageNo, pageSize);
		return MODIFY;
	}

	/**
	 * 二级商品类管理
	 * @return
	 * @throws Exception
	 */
	public String secondcategoryModify() throws Exception
	{
		categoryList = adminService.findCategoryList(pageNo, pageSize);
		secondcategory = adminService.getSecondcategory(secondcategory.getId());
		category = adminService.getCategory(secondcategory.getCategory().getId());
		pageModel = adminService.findProductCategoryList(secondcategory.getId(),pageNo, pageSize);
		return "secondcategoryModify";
	}
	
	/**
	 * 三级商品类管理
	 * @return
	 * @throws Exception
	 */
	public String productcategoryModify() throws Exception
	{
		secondcategoryList = adminService.findSecondCategoryList(category.getId(), pageNo, pageSize);
		productcategory = adminService.getProductcategory(productcategory.getId());
		return "productcategoryModify";
	}
	/**
	 * 保存修改商品类信息
	 * @return
	 * @throws Exception
	 */
	public String modify_save() throws Exception
	{
		if(StringUitl.validateString(category.getName()) == false)
		{
			addFieldError("categoryNameIsNull", "商品种类名称不能为空");
			return MODIFY;
		}
		
		if(category.getId()==null){
			if(adminService.categoryIsUnique(category.getName()) == false)
			{
				addFieldError("existedCategory", "该商品种类已经存在！");	
				return MODIFY;
			}
			adminService.saveOrUpdateCategory(category);
			addFieldError("addSuccess","新增成功");
			return list();
		}else{
			adminService.saveOrUpdateCategory(category);
			addFieldError("modifySuccess","修改成功");
			return modify();
		}
		
		
	}
	
	public String secondcategoryModify_save() throws Exception{
		if(StringUitl.validateString(secondcategory.getName()) == false)
		{
			addFieldError("secondcategoryNameIsNull", "二级商品种类名称不能为空");
			return modify();
		}
		if(StringUitl.validateString(category.getId().toString()) == false){
			addFieldError("categoryIdIsNull", "一级商品种类不能为空");
			return modify();
		}
		
		category = adminService.getCategory(category.getId());
		secondcategory.setCategory(category);
		if(secondcategory.getId()==null){
			if(adminService.secondcategoryIsUnique(secondcategory.getName()) == false)
			{
				addFieldError("existedCategory", "该商品种类已经存在！");	
				return modify();
			}
			adminService.saveOrUpdateSecondcategory(secondcategory);
			addFieldError("addSuccess","新增成功");
			return modify();
		}else{
			adminService.saveOrUpdateSecondcategory(secondcategory);
			addFieldError("modifySuccess","修改成功");
			return secondcategoryModify();
		}
		
	}
	public String productcategoryModify_save() throws Exception{
		if(StringUitl.validateString(productcategory.getName()) == false)
		{
			addFieldError("secondcategoryNameIsNull", "三级级商品种类名称不能为空");
			return secondcategoryModify();
		}
		if(StringUitl.validateString(secondcategory.getId().toString()) == false){
			addFieldError("categoryIdIsNull", "二级商品种类不能为空");
			return secondcategoryModify();
		}
		
		secondcategory = adminService.getSecondcategory(secondcategory.getId());
		category = new Category();
		category.setId(secondcategory.getCategory().getId());
		productcategory.setSecondcategory(secondcategory);
		if(productcategory.getId()==null){
			if(adminService.productcategoryIsUnique(productcategory.getName()) == false)
			{
				addFieldError("existedCategory", "该商品种类已经存在！");	
				return secondcategoryModify();
			}
			adminService.saveOrUpdateProductcategory(productcategory);
			addFieldError("addSuccess","新增成功");
			return secondcategoryModify();
		}else{
			adminService.saveOrUpdateProductcategory(productcategory);
			addFieldError("modifySuccess","修改成功");
			return productcategoryModify();
		}
		
		
	}
	/**
	 * 保存新添加的商品类信息
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception
	{
		adminService.saveOrUpdateCategory(category);
		return ADD_SUCCESS;
	}
	
	
	/**
	 * 保存新增商品类检验
	 * @throws Exception
	 */
	public void validateSave() throws Exception
	{
		
		if(StringUitl.validateString(category.getName()) == false)
			addFieldError("categoryNameIsNull", "商品种类名称不能为空");
		
		if(adminService.categoryIsUnique(category.getName()) == false)
			addFieldError("existedCategory", "该商品种类已经存在！");	
	}

	
	//商品类
	private PageModel pageModel;
	private Category category;
	private Secondcategory secondcategory;
	private Productcategory productcategory;
	//商品类列表（分页）
	private PageModel<Category> categoryList;
	private PageModel<Secondcategory> secondcategoryList;
	private PageModel<Productcategory> productcategoryList;
	//setter and getter



	public Category getCategory() {
		return category;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public Secondcategory getSecondcategory() {
		return secondcategory;
	}

	public void setSecondcategory(Secondcategory secondcategory) {
		this.secondcategory = secondcategory;
	}

	public Productcategory getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(Productcategory productcategory) {
		this.productcategory = productcategory;
	}

	public PageModel<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(PageModel<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public PageModel<Secondcategory> getSecondcategoryList() {
		return secondcategoryList;
	}

	public void setSecondcategoryList(PageModel<Secondcategory> secondcategoryList) {
		this.secondcategoryList = secondcategoryList;
	}



	public PageModel<Productcategory> getProductcategoryList() {
		return productcategoryList;
	}

	public void setProductcategoryList(
			PageModel<Productcategory> productcategoryList) {
		this.productcategoryList = productcategoryList;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	
}
