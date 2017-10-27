package com.lin.action.manager;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.manager.Manager;

/**
 * managerAction
 * @author lin
 *
 */
@Scope("prototype")
@Controller
public class ManagerAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	/**
	 * 管理员登陆界面
	 * @return String
	 * @throws Exception
	 */
	public String toLogin() throws Exception
	{
		return MANAGER_LOGIN;
	}
	
	/**
	 * 管理员登陆
	 * @return String
	 * @throws Exception
	 */
	public String login() throws Exception
	{
		if(adminService.loginValid(manager.getUsername(), manager.getPassword()))
		{
			session.setAttribute("admin", manager.getUsername());//将管理员信息保存在Session对象中
			return "loginSuccess";
		}
		else
		{
			addFieldError("error", "用户名或密码不正确！");//返回错误提示信息
			return MANAGER_LOGIN;
		}
	}

	/**
	 * 管理员主页
	 * @return
	 * @throws Exception
	 */
	public String home() throws Exception
	{
		return "home";
	}
	
	/**
	 * 管理员退出登陆
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception
	{
		if(session != null && session.getAttribute("admin") !=null){
			session.removeAttribute("admin");;
		}
		return MANAGER_LOGIN;
	}
	
	//Field
	private Manager manager;

	//getter and setter
	public Manager getManager() {
		return manager;
	}
	
	public void setManager(Manager manager) {
		this.manager = manager;
	}
}
