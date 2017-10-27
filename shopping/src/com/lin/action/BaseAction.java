package com.lin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.lin.service.AdminService;
import com.lin.service.CustomerService;
import com.lin.service.ShopService;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware, ServletContextAware {

	
	private static final long serialVersionUID = 1L;
	public static final String RES = "/shopping";
	//��ƷͼƬ·��
	public static final String UPLOADSRC = RES + "/upload/";
	//ͷ��·��
	public static final String HEADSRC = RES + "/headPortrait/";
	
	//���ý����
	public static final String LIST = "list";
	public static final String MODIFY = "modify";
	public static final String MODIFY_SUCCESS = "modify_success";
	public static final String ADD = "add";
	public static final String ADD_SUCCESS = "add_success";
	public static final String SELECT = "select";
	public static final String QUERY = "query";
	public static final String INDEX = "index";
	public static final String MAIN = "main";
	public static final String MANAGER = "manager";
	public static final String REGIST = "regist";
	public static final String MANAGER_LOGIN = "managerLogin";
	public static final String CUSTOMER_LOGIN = "customerLogin";
	public static final String LOGOUT = "logout";
	
	
	/*
	 * ע��Service
	 */
	@Autowired
	protected AdminService adminService;
	@Autowired
	protected CustomerService customerService;
	@Autowired 
	protected ShopService shopService;
	
	//context
	protected HttpServletResponse response;
	protected HttpServletRequest request;
	protected HttpSession session;
	protected ServletContext application;
	
	//��ҳҳ����ҳ��С Ĭ�ϵ�һҳ һҳ8�����
	protected int pageNo = 1;
	protected int pageSize = 9;
	protected String cid;
	
	//��󶩵�
	public static final int maxOrders = 50;
	
	
	public static String getRes() {
		return RES;
	}

	public static String getHeadSrc() {
		return HEADSRC;
	}

	//getter and setter
	public int getPageNo() {
		return pageNo;
	}

	public static String getUploadsrc() {
		return UPLOADSRC;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public void setServletContext(ServletContext application) {
		// TODO Auto-generated method stub
		this.application = application;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
		this.session = this.request.getSession();
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
}
