package com.lin.dao.manager;

import java.util.List;

import com.lin.dao.DaoSupport;
import com.lin.entity.manager.Manager;


public class ManagerDaoImpl extends DaoSupport<Manager> implements ManagerDao {

	@Override
	public Manager login(String username, String password) {
		if(username != null && password != null){//如果用户名和密码不为空
			String where = "where username=? and password=?";//设置查询条件
			Object[] queryParams = {username,password};//设置参数对象数组
			List<Manager> list = this.find(-1, -1, where, queryParams).getList();//执行查询方法
			if(list != null && list.size() > 0){//如果list集合不为空
				return list.get(0);//返回List中的第一个存储对象
			}
		}
		return null;//返回空值
	}
	
	
}
