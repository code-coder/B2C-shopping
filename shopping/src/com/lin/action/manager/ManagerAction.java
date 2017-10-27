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
	 * ����Ա��½����
	 * @return String
	 * @throws Exception
	 */
	public String toLogin() throws Exception
	{
		return MANAGER_LOGIN;
	}
	
	/**
	 * ����Ա��½
	 * @return String
	 * @throws Exception
	 */
	public String login() throws Exception
	{
		if(adminService.loginValid(manager.getUsername(), manager.getPassword()))
		{
			session.setAttribute("admin", manager.getUsername());//������Ա��Ϣ������Session������
			return "loginSuccess";
		}
		else
		{
			addFieldError("error", "�û��������벻��ȷ��");//���ش�����ʾ��Ϣ
			return MANAGER_LOGIN;
		}
	}

	/**
	 * ����Ա��ҳ
	 * @return
	 * @throws Exception
	 */
	public String home() throws Exception
	{
		return "home";
	}
	
	/**
	 * ����Ա�˳���½
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
