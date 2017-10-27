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

//����Ա
	/**
	 * �����Ʒ�б�
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception
	{
		pageModel = adminService.findProductList(pageNo, pageSize);
		return LIST;
	}

	/**
	 * �����Ʒ
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception
	{
		//-1��ʾ��ѯ����
		productcategoryList = adminService.findProductCategoryList(-1, pageNo, pageSize);
		return ADD;
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
		if(!StringUitl.validateString(product.getName()))
		{
			addFieldError("error", "���Ʋ���Ϊ��");
			return QUERY;
		}
		pageModel = adminService.queryProductByName(product.getName(), pageNo, pageSize);
		return LIST;
	}

	/**
	 * ɾ����Ʒ
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception
	{
		
		adminService.delectProduct(product.getId());
		return list();
	}

	/**
	 * �޸���Ʒ��Ϣ
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
	 * ������Ʒ
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception
	{	
		if(!StringUitl.validateString(product.getName())){
			addFieldError("name", "��Ʒ���Ʋ���Ϊ�գ�");
			return add();
		}
		if(!StringUitl.validateFloat(product.getBaseprice())){
			addFieldError("baseprice", "�ɹ��۸���д����");
			return add();
		}
		if(!StringUitl.validateFloat(product.getSellprice())){
			addFieldError("sellprice", "���ۼ۸���д����");
			return add();
		}
		if(!StringUitl.validateString(product.getDescription())){
			addFieldError("name", "��Ʒ˵������Ϊ�գ�");
			return add();
		}
		adminService.saveOrUpdateProduct(product,file);
		return ADD_SUCCESS;
	}
	
	public String saveModify() throws Exception
	{
		if(!StringUitl.validateString(product.getName())){
			addFieldError("name", "��Ʒ���Ʋ���Ϊ�գ�");
			return modify();
		}
		if(!StringUitl.validateFloat(product.getBaseprice())){
			addFieldError("baseprice", "�ɹ��۸���д����");
			return modify();
		}
		if(!StringUitl.validateFloat(product.getSellprice())){
			addFieldError("sellprice", "���ۼ۸���д����");
			return modify();
		}
		if(!StringUitl.validateString(product.getDescription())){
			addFieldError("description", "��Ʒ˵������Ϊ�գ�");
			return modify();
		}	
		adminService.saveOrUpdateProduct(product,file);
		addFieldError("name", "�޸ĳɹ���");
		return modify();
	}

//ǰ̨�̳�
	/**
	 * ��Ʒ��ѡ��
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
		productCategory = product.getProductCategory();//�������������û��һ������
		productCategory = shopService.getProductCategory(productCategory.getId()); //Ҫ�����ݿ�ȥ��һ��һ������
		pageSize = 10;
		consultations = shopService.getProductConsultations(product, pageNo, pageSize);
		return SELECT;
	}
	
	/**�����Ʒ����������ѯ
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
	 * ������Ʒ��Id��ѯ������Ʒ��Ϣ
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
	 * ������������ģ����ѯ��Ʒ
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
				session.setAttribute("Searchword", "ȫ����Ʒ");
			}
			session.setAttribute("Searchword", Searchword);
			session.setAttribute("orderOption", 1);
			pageModel = shopService.getProductsBySearchword(Searchword, pageNo, pageSize);
			
		}
		return LIST;

	}

	/**
	 * Ĭ������
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
	 * ������������(����)
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
	 * ���ݼ۸�����(����)
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
	 * ��������(�����)����(����)
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
	//��ҳ����
	private PageModel<Productinfo> pageModel;
	// �ϴ��ļ�
	private File file;
	// �������
	private List<Category> categorys;
	//���ձ�����Ʒ��
	private PageModel<Productcategory> productcategoryList;
	private Category category;
	//������Ʒ��
	private Secondcategory secondCategory;
	//��Ʒ���
	private Productcategory productCategory;
	//��������
	private String Searchword = null;
	//��ͼ۸�
	private Float minPrice;
	//��߼۸�
	private Float maxPrice;
	//��Ʒ���п��ӻ���ѯ(��ҳ)
	private PageModel<Consultation> consultations;
	//����
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
