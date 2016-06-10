package com.pet.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.adopt.AdoptService;
import com.pet.house.House;
import com.pet.house.HouseService;
import com.pet.member.SessionInfo;
import com.pet.message.Message;
import com.pet.message.MessageService;

@Controller("pay.payController")
public class PayController {
	
	@Autowired
	MessageService messageservice;	
	@Autowired
	AdoptService adoptservice;
	@Autowired
	PayService payservice;
	@Autowired
	HouseService houseservice;

	@RequestMapping(value="/pay/reservepay")
	public ModelAndView list(
			Pay dto
			) throws Exception {
		
		int hostNum=188;
		int reservationNum=42;
		Map<String, Object> map=new HashMap<>();
		map.put("hostNum", hostNum);
		map.put("reservationNum", reservationNum);
		
		dto=payservice.listHost(map);
		
		
		ModelAndView mav=new ModelAndView(".pay.reservepay");		
		mav.addObject("dto",dto);
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
