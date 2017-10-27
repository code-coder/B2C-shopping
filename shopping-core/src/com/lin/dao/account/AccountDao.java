package com.lin.dao.account;

import com.lin.dao.BaseDao;
import com.lin.entity.account.Account;

public interface AccountDao extends BaseDao<Account> {
	
	//重写保存方法
	public void save(Account account);//保存数据
	public void saveOrUpdate(Account account);//保存或修改数据
}
