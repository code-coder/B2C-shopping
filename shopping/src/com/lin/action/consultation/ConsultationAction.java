package com.lin.action.consultation;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lin.action.BaseAction;
import com.lin.entity.product.Consultation;
import com.lin.model.PageModel;

@Scope("prototype")
@Controller
public class ConsultationAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	/**
	 * δ�ش������б�
	 * @return
	 * @throws Exception
	 */
	public String unansweredConsultation() throws Exception
	{
		pageModel = adminService.getUnansweredConsultations(pageNo, pageSize);
		return "unansweredConsultation_list";
	}
	
	/**
	 * �ѻش������б�
	 * @return
	 * @throws Exception
	 */
	public String answeredConsultation() throws Exception
	{
		pageSize = 6;
		pageModel = adminService.getAnsweredConsultations(pageNo, pageSize);
		return "answeredConsultation_list";
	}
	
	/**
	 * �ظ�����
	 * @return
	 * @throws Exception
	 */
	public String answerConsultation() throws Exception
	{	
		consultation = adminService.getConsultationById(consultation.getId());
		return "answer";
	}
	
	/**
	 * ����ظ�
	 * @return
	 * @throws Exception
	 */
	public String saveAnswer() throws Exception
	{	
		if(consultation.getAnswered() != null && consultation.getAnswered() )
		{
			adminService.saveAnswerConsultation(consultation);
			return answeredConsultation();
		}
		else
		{
			adminService.saveAnswerConsultation(consultation);
			return unansweredConsultation();
		}
		
	}
	
	
	//���� 
	private Consultation consultation;
	//�����б���ҳ��
	private PageModel<Consultation> pageModel;
	public Consultation getConsultation() {
		return consultation;
	}
	public void setConsultation(Consultation consultation) {
		this.consultation = consultation;
	}
	public PageModel<Consultation> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<Consultation> pageModel) {
		this.pageModel = pageModel;
	}
	
}
