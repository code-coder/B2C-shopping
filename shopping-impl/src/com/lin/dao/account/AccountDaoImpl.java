package com.lin.dao.account;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.account.Account;

@Transactional
public class AccountDaoImpl extends DaoSupport<Account> implements AccountDao {

	@Override
	public void save(Account account) {
		
		if(account.getBalance() == null)
		{
			account.setBalance(0f);
		}
		getHibernateTemplate().save(account);
	}

	@Override
	public void saveOrUpdate(Account account) {

		if(account.getBalance() == null)
		{
			account.setBalance(0f);
		}
		if(account.getPassword() == null)
			account.setPassword("123456");
		
		getHibernateTemplate().saveOrUpdate(account);
	}

	
}
