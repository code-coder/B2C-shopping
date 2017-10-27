package com.lin.dao.manager;

import com.lin.dao.BaseDao;
import com.lin.entity.manager.Manager;

public interface ManagerDao extends BaseDao<Manager> {
	public Manager login(String username, String password);
}
