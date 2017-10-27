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
	 * ��Ʒ���б�
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
	 * �����Ʒ��
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception
	{
		return INPUT;
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
	 * �������Ʋ���
	 * @return
	 * @throws Exception
	 */
	public String queryByName() throws Exception
	{
		if(!StringUitl.validateString(category.getName()))
		{
			addFieldError("error", "���Ʋ���Ϊ��");
			return QUERY;
		}
		pageModel = adminService.queryCategoryByName(category.getName(), pageNo, pageSize);
		return LIST;
	}
	
	/**
	 * ɾ����Ʒ��
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception 
	{
		secondcategoryList =adminService.findSecondCategoryList(category.getId(), pageNo, pageSize);
		if(secondcategoryList.getTotalRecords()>0){
			addFieldError("secondcategoryIsNotEmpty", "��һ����Ʒ��������ж�����Ʒ���࣬����ɾ��������Ʒ����!");
			return list();
		}
		adminService.delectCategory(category.getId());
		return list();
	}
	public String secondcategoryDelect() throws Exception 
	{
		productcategoryList =adminService.findProductCategoryList(secondcategory.getId(), pageNo, pageSize);
		if(productcategoryList.getTotalRecords()>0){
			addFieldError("productcategoryIsNotEmpty", "�ö�����Ʒ���������������Ʒ���࣬����ɾ��������Ʒ����!");
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
	 * һ����Ʒ�����
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
	 * ������Ʒ�����
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
	 * ������Ʒ�����
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
	 * �����޸���Ʒ����Ϣ
	 * @return
	 * @throws Exception
	 */
	public String modify_save() throws Exception
	{
		if(StringUitl.validateString(category.getName()) == false)
		{
			addFieldError("categoryNameIsNull", "��Ʒ�������Ʋ���Ϊ��");
			return MODIFY;
		}
		
		if(category.getId()==null){
			if(adminService.categoryIsUnique(category.getName()) == false)
			{
				addFieldError("existedCategory", "����Ʒ�����Ѿ����ڣ�");	
				return MODIFY;
			}
			adminService.saveOrUpdateCategory(category);
			addFieldError("addSuccess","�����ɹ�");
			return list();
		}else{
			adminService.saveOrUpdateCategory(category);
			addFieldError("modifySuccess","�޸ĳɹ�");
			return modify();
		}
		
		
	}
	
	public String secondcategoryModify_save() throws Exception{
		if(StringUitl.validateString(secondcategory.getName()) == false)
		{
			addFieldError("secondcategoryNameIsNull", "������Ʒ�������Ʋ���Ϊ��");
			return modify();
		}
		if(StringUitl.validateString(category.getId().toString()) == false){
			addFieldError("categoryIdIsNull", "һ����Ʒ���಻��Ϊ��");
			return modify();
		}
		
		category = adminService.getCategory(category.getId());
		secondcategory.setCategory(category);
		if(secondcategory.getId()==null){
			if(adminService.secondcategoryIsUnique(secondcategory.getName()) == false)
			{
				addFieldError("existedCategory", "����Ʒ�����Ѿ����ڣ�");	
				return modify();
			}
			adminService.saveOrUpdateSecondcategory(secondcategory);
			addFieldError("addSuccess","�����ɹ�");
			return modify();
		}else{
			adminService.saveOrUpdateSecondcategory(secondcategory);
			addFieldError("modifySuccess","�޸ĳɹ�");
			return secondcategoryModify();
		}
		
	}
	public String productcategoryModify_save() throws Exception{
		if(StringUitl.validateString(productcategory.getName()) == false)
		{
			addFieldError("secondcategoryNameIsNull", "��������Ʒ�������Ʋ���Ϊ��");
			return secondcategoryModify();
		}
		if(StringUitl.validateString(secondcategory.getId().toString()) == false){
			addFieldError("categoryIdIsNull", "������Ʒ���಻��Ϊ��");
			return secondcategoryModify();
		}
		
		secondcategory = adminService.getSecondcategory(secondcategory.getId());
		category = new Category();
		category.setId(secondcategory.getCategory().getId());
		productcategory.setSecondcategory(secondcategory);
		if(productcategory.getId()==null){
			if(adminService.productcategoryIsUnique(productcategory.getName()) == false)
			{
				addFieldError("existedCategory", "����Ʒ�����Ѿ����ڣ�");	
				return secondcategoryModify();
			}
			adminService.saveOrUpdateProductcategory(productcategory);
			addFieldError("addSuccess","�����ɹ�");
			return secondcategoryModify();
		}else{
			adminService.saveOrUpdateProductcategory(productcategory);
			addFieldError("modifySuccess","�޸ĳɹ�");
			return productcategoryModify();
		}
		
		
	}
	/**
	 * ��������ӵ���Ʒ����Ϣ
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception
	{
		adminService.saveOrUpdateCategory(category);
		return ADD_SUCCESS;
	}
	
	
	/**
	 * ����������Ʒ�����
	 * @throws Exception
	 */
	public void validateSave() throws Exception
	{
		
		if(StringUitl.validateString(category.getName()) == false)
			addFieldError("categoryNameIsNull", "��Ʒ�������Ʋ���Ϊ��");
		
		if(adminService.categoryIsUnique(category.getName()) == false)
			addFieldError("existedCategory", "����Ʒ�����Ѿ����ڣ�");	
	}

	
	//��Ʒ��
	private PageModel pageModel;
	private Category category;
	private Secondcategory secondcategory;
	private Productcategory productcategory;
	//��Ʒ���б���ҳ��
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
