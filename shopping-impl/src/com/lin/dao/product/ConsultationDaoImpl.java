package com.lin.dao.product;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import com.lin.dao.DaoSupport;
import com.lin.entity.product.Consultation;

@Transactional
public class ConsultationDaoImpl extends DaoSupport<Consultation> implements ConsultationDao {

	/**
	 * 保存商品
	 */
	@Override
	public void save(Consultation consultation) {
		
		if(consultation.getAnswered() == null)
			consultation.setAnswered(false);
		if(consultation.getShowed() == null)
			consultation.setShowed(false);
		if(consultation.getConsultingTime() == null)
			consultation.setConsultingTime(new Date());
		
		getHibernateTemplate().save(consultation);
	}

	@Override
	public void saveOrUpdate(Consultation consultation) {

		if(consultation.getAnswered() == null)
			consultation.setAnswered(false);
		if(consultation.getShowed() == null)
			consultation.setShowed(false);
		if(consultation.getConsultingTime() == null)
			consultation.setConsultingTime(new Date());
		
		getHibernateTemplate().saveOrUpdate(consultation);
	}

	
}
