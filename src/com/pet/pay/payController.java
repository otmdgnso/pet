package com.pet.pay;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.adopt.AdoptService;
import com.pet.member.SessionInfo;
import com.pet.message.Message;
import com.pet.message.MessageService;

@Controller("pay.payController")
public class payController {
	
	@Autowired
	MessageService messageservice;
	
	@Autowired
	AdoptService adoptservice;

	@RequestMapping(value="/pay/reservepay")
	public ModelAndView list() throws Exception {
		ModelAndView mav=new ModelAndView(".pay.reservepay");
		return mav;
	}
	
	@RequestMapping(value="/pay/paycomplete")
	public ModelAndView complete() throws Exception {
		ModelAndView mav=new ModelAndView(".pay.paycomplete");
		return mav;
	}	
	
	@RequestMapping(value="/pay/requestAdopt")
	public void requestAdopt (Message mto,
			HttpSession session,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(value="preSaleNum") int preSaleNum
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		mto.setSendUserId("�ý���_�о�");
		mto.setReceiveUserId(info.getUserId());
		mto.setSubject("�о��� ��û�ϼ˽��ϴ�.");
		String msg="<a href=http://localhost:9090/pet/adopt/article"+"?page="+page+"&preSaleNum="+preSaleNum+">��û�� �ۺ���</a>";
		msg+="<br><a href=http://localhost:9090/pet/pay/adoptpay?preSaleNum="+preSaleNum +">�����ϱ�</a>";
		mto.setContent(msg);
		
		messageservice.insertMessage(mto);
	}
	
	@RequestMapping(value="/pay/adoptpay")
	public ModelAndView listAdopt(HttpSession session,
			@RequestParam(value="preSaleNum") int preSaleNum
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		ModelAndView mav=new ModelAndView(".pay.adoptpay");
		return mav;
	}
}
