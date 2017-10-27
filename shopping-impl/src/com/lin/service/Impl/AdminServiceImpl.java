package com.lin.service.Impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.lin.entity.customer.Customer;
import com.lin.entity.manager.Manager;
import com.lin.entity.order.Order;
import com.lin.entity.product.Category;
import com.lin.entity.product.Consultation;
import com.lin.entity.product.Productcategory;
import com.lin.entity.product.Productinfo;
import com.lin.entity.product.Secondcategory;
import com.lin.entity.product.Uploadfile;
import com.lin.model.PageModel;
import com.lin.service.AdminService;
import com.lin.service.BaseService;
import com.lin.util.StringUitl;

/**
 * 管理员业务逻辑实现类
 * 
 * @author lin
 * 
 */
@Scope("prototype")
@Service("adminService")
public class AdminServiceImpl extends BaseService implements AdminService {

	/**
	 * 管理员登陆验证
	 * 
	 * @return boolean
	 */
	@Override
	public boolean loginValid(String username, String password) {

		Manager loginManager = managerDao.login(username, password);
		if (loginManager != null)
			return true;
		else
			return false;
	}

	// 管理员管理用户服务
	/**
	 * 获取用户列表(分页)
	 * 
	 * @return PageModel<Customer>
	 */
	@Override
	public PageModel<Customer> findCustomerList(int pageNo, int maxResult) {

		return customerDao.find(pageNo, maxResult);
	}

	/**
	 * 根据用户名查找用户
	 */
	public PageModel<Customer> queryCustomerByUsername(String username,
			int pageNo, int maxResult) {

		String where = "where username like ?";
		Object[] queryParams = { username };
		return customerDao.find(pageNo, maxResult, where, queryParams);
	}

	/**
	 * 封号操作
	 */
	@Override
	public void banCustomer(String id) {

		Customer banCustomer = customerDao.get(id);
		banCustomer.setForbidden(true);
		;
		customerDao.saveOrUpdate(banCustomer);
	}

	/**
	 * 解封号操作
	 */
	@Override
	public void reopenCustomer(String id) {

		Customer reopenCustoemr = customerDao.get(id);
		reopenCustoemr.setForbidden(false);
		customerDao.saveOrUpdate(reopenCustoemr);
	}

	// 管理员管理商品种类服务
	/**
	 * 获取一级商品类列表(分页)
	 * 
	 * @return PageModel<Category>
	 */
	@Override
	public PageModel<Category> findCategoryList(int pageNo, int maxResult) {
		return categoryDao.find(pageNo, maxResult);
	}
	/**
	 * 获取二级商品类列表(分页)
	 * 
	 * @return PageModel<Category>
	 */
	@Override
	public PageModel<Secondcategory> findSecondCategoryList(int categoryId,int pageNo, int maxResult) {
		String where = "where parentId = ?";
		Object[] queryParams = {categoryId};
		return secondcategoryDao.find(pageNo, maxResult, where, queryParams);
	}
	/**
	 * 获取三级商品类列表(分页)
	 * 
	 * @return PageModel<Category>
	 */
	@Override
	public PageModel<Productcategory> findProductCategoryList(int secondcategoryId,int pageNo, int maxResult) {
		String where = "where parentId = ?";
		Object[] queryParams = {secondcategoryId};
		if(secondcategoryId<1)
			return productcategoryDao.find(pageNo, maxResult, null, null);
		return productcategoryDao.find(pageNo, maxResult, where, queryParams);
	}
	/**
	 * 根据名称查找商品类
	 */
	@Override
	public PageModel<Category> queryCategoryByName(String name,
			int pageNo, int maxResult) {

		String where = "where name like ?";
		Object[] queryParams = { "%" + name + "%" };
		return categoryDao.find(pageNo, maxResult, where, queryParams);
	}

	/**
	 * 根据Id获取一级商品类
	 */
	@Override
	public Category getCategory(int categoryId) {
		return categoryDao.get(categoryId);
	}
	
	@Override
	public Secondcategory getSecondcategory(int secondcategoryId) {
		return secondcategoryDao.get(secondcategoryId);
	}

	@Override
	public Productcategory getProductcategory(int productcategoryId) {
		return productcategoryDao.get(productcategoryId);
	}
	

	/**
	 * 删除商品类
	 */
	@Override
	public void delectCategory(int id) {
//		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		/*Category category = categoryDao.get(id);
		Set<Productinfo> products = category.getProducts();
		for (Productinfo product : products) {
			product.setCategory(null);
			productDao.saveOrUpdate(product);
		}*/
		categoryDao.delete(id);
	}
	@Override
	public void delectSecondcategory(int id) {
		
		secondcategoryDao.delete(id);
	}
	@Override
	public void delectProductcategory(int id) {
		
		productcategoryDao.delete(id);
	}
	/**
	 * 验证商品类名是否唯一
	 * 
	 * @return boolean
	 */
	@Override
	public boolean categoryIsUnique(String categoryname) {
		return categoryDao.isUnique(categoryname);
	}
	@Override
	public boolean secondcategoryIsUnique(String secondcategoryName) {
		return secondcategoryDao.isUnique(secondcategoryName);
	}
	@Override
	public boolean productcategoryIsUnique(String productcategoryName) {
		return productcategoryDao.isUnique(productcategoryName);
	}

	/**
	 * 储存一级商品类
	 */
	@Override
	public void saveOrUpdateCategory(Category category) {
		category.setUpdateTime(new Date());
		categoryDao.saveOrUpdate(category);
	}
	@Override
	public void saveOrUpdateSecondcategory(Secondcategory secondcategory) {
		secondcategory.setUpdateTime(new Date());
		secondcategoryDao.saveOrUpdate(secondcategory);
	}
	@Override
	public void saveOrUpdateProductcategory(Productcategory productcategory) {
		productcategory.setUpdateTime(new Date());
		productcategoryDao.saveOrUpdate(productcategory);
	}
	// 管理员管理商品服务
	/**
	 * 获取商品列表(分页)
	 * 
	 * @return PageModel<Productinfo>
	 */
	@Override
	public PageModel<Productinfo> findProductList(int pageNo, int maxResult) {

		return productDao.find(pageNo, maxResult);
	}

	/**
	 * 根据名称查找商品
	 */
	public PageModel<Productinfo> queryProductByName(String name, int pageNo,
			int maxResult) {

		String where = "where name like ?";
		Object[] queryParams = { "%" + name + "%" };
		return productDao.find(pageNo, maxResult, where, queryParams);
	}

	/**
	 * 删除商品
	 */
	@Override
	public void delectProduct(int id) {
		Productinfo product = productDao.get(id);
		Iterator it = product.getUploadfiles().iterator();
		while (it.hasNext()) {
			Uploadfile uploadfile = (Uploadfile) it.next();
			uploadfileDao.delete(uploadfile.getId());
			if (uploadfile != null && uploadfile.getPath() != null) {
				// 删除上传的照片
				File oldFile = new File(ServletActionContext
						.getServletContext().getRealPath("/upload")
						+ "/"
						+ uploadfile.getPath());
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		productDao.delete(id);
	}

	/**
	 * 获取单个商品
	 */
	@Override
	public Productinfo findProduct(int id) {

		return productDao.get(id);
	}

	/**
	 * 储存或更新商品
	 */
	@Override
	public void saveOrUpdateProduct(Productinfo product, File file) {
		Uploadfile uploadfile = new Uploadfile();// 实例化对象
		if (file != null) {// 如果文件路径不为空
			// 获取服务器的绝对路径
			String path = ServletActionContext.getServletContext().getRealPath(
					"/upload");
			System.out.println(path);
			File dir = new File(path);
			if (!dir.exists()) {// 如果文件夹不存在
				dir.mkdir();// 创建文件夹
			}
			String fileName = StringUitl.getStringTime() + ".jpg";// 自定义图片名称
			FileInputStream fis = null;// 输入流
			FileOutputStream fos = null;// 输出流
			try {
				fis = new FileInputStream(file);// 根据上传文件创建InputStream实例
				fos = new FileOutputStream(new File(dir, fileName)); // 创建写入服务器地址的输出流对象
				byte[] bs = new byte[1024 * 4]; // 创建字节数组实例
				int len = -1;
				while ((len = fis.read(bs)) != -1) {// 循环读取文件
					fos.write(bs, 0, len);// 向指定的文件夹中写数据
				}
				Set<Uploadfile> uploadfiles = product.getUploadfiles();
				
				uploadfile.setId(product.getId());
				uploadfile.setPath(fileName);// 设置文件名称
				uploadfiles.add(uploadfile);
				product.setUploadfiles(uploadfiles);// 设置上传路径
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fos.flush();
					fos.close();
					fis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// 如果商品类别和商品类别ID不为空，则保存商品类别信息
		if (product.getProductCategory() != null
				&& product.getProductCategory().getId() != null) {
			
			Productcategory category = productcategoryDao.get(product.getProductCategory().getId());
			product.setProductCategory(category);
		}

		/*if (product.getUploadfile() != null
				&& product.getUploadfile().getId() != null) {
			Uploadfile uploadfile = uploadfileDao.get(product.getUploadfile()
					.getId());
			product.setUploadfile(uploadfile);
		} else {
			Uploadfile uploadfile = new Uploadfile();// 实例化对象
			uploadfile.setId(product.getId());
			uploadfileDao.saveOrUpdate(uploadfile);
			product.setUploadfile(uploadfile);// 设置上传路径
		}*/

		productDao.saveOrUpdate(product);
		if(uploadfile.getId()!=null){
			uploadfile.setProduct(product);
			uploadfile.setUploadTime(new Date());
			uploadfileDao.saveOrUpdate(uploadfile);
		}
	}

	/**
	 * 获取商品类列表(商品类下拉框数据源)
	 * 
	 * @return List<Productcategory>
	 */
	@Override
	public List<Category> getCategoryList() {

		return categoryDao.getAll();
	}

	/**
	 * 获取订单列表（分页）
	 * 
	 * @return PageModel<Order>
	 */
	@Override
	public PageModel<Order> findOrderList(int pageNo, int maxResult) {

		return orderDao.find(pageNo, maxResult);
	}

	/**
	 * 根据订单号查找订单
	 */
	public PageModel<Order> queryOrderByOrderId(String orderId, int pageNo,
			int maxResult) {

		String where = "where orderId like ?";
		Object[] queryParams = { orderId };
		return orderDao.find(pageNo, maxResult, where, queryParams);
	}

	/**
	 * 删除订单
	 */
	@Override
	public void delectOrder(String orderId) {

		orderDao.delete(orderId);
	}

	// 管理员管理留言咨询
	/**
	 * 获取未回答的留言（分页）
	 */
	@Override
	public PageModel<Consultation> getUnansweredConsultations(int pageNo,
			int pageSize) {

		String where = "where answered=0";
		return consultationDao.find(pageNo, pageSize, where, null);
	}

	/**
	 * 获取未回答的留言（分页）
	 */
	@Override
	public PageModel<Consultation> getAnsweredConsultations(int pageNo,
			int pageSize) {

		String where = "where answered=1";
		Map<String, String> orderby = new HashMap<String, String>();// 定义Map集合
		orderby.put("answeringTime", "desc");
		return consultationDao.find(where, null, orderby, pageNo, pageSize);
	}

	/**
	 * 回复留言
	 */
	@Override
	public void saveAnswerConsultation(Consultation consultation) {

		consultation.setAnswered(true);
		consultation.setAnsweringTime(new Date());
		consultation.setCustomer(customerDao.get(consultation.getCustomer()
				.getId()));
		consultation.setProduct(productDao.get(consultation.getProduct()
				.getId()));
		consultationDao.saveOrUpdate(consultation);
	}

	@Override
	public Consultation getConsultationById(int consultationId) {

		return consultationDao.get(consultationId);
	}

	

}
