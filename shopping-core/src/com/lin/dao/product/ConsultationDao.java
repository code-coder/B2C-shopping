package com.lin.dao.product;

import com.lin.dao.BaseDao;
import com.lin.entity.product.Consultation;

public interface ConsultationDao extends BaseDao<Consultation>{
	
	//重写保存方法
	public void save(Consultation consultation);//保存数据
	public void saveOrUpdate(Consultation consultation);//保存或修改数据
}
