package com.lin.action.interceptor;

import java.util.Map;

import com.lin.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/**
 * ����Ա��¼������
 * @author lin
 * 
 */
public class ManagerLoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// ��ȡActionContext
		ActionContext context = invocation.getInvocationContext();
		// ��ȡMap���͵�session
		Map<String, Object> session = context.getSession();
		// �ж��û��Ƿ��¼ 
		if(session.get("admin") != null){
			// ����ִ�з���
			return invocation.invoke();
		}
		// ���ص�¼
		return BaseAction.MANAGER_LOGIN;
	}
}
