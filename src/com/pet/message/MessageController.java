package com.pet.message;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.common.MyUtil;
import com.pet.member.SessionInfo;

@Controller("message.messageController")
public class MessageController {
	@Autowired
	private MessageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/message/send")
	public ModelAndView send(
			@RequestParam(value="hostNum", defaultValue="0") int hostNum,
			@RequestParam(value="userId", defaultValue="")String userId,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
			ModelAndView mav = new ModelAndView("/message/send");
			
			if(hostNum!=0) {
				userId= service.userNumSel(hostNum);
			}
			
			mav.addObject("userId",userId);
			mav.addObject("page",page);
			mav.addObject("searchKey",searchKey);
			mav.addObject("searchValue",searchValue);
			return mav;
	}
	
	@RequestMapping(value="/message/send_ok", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendSubmit(
			HttpSession session, Message dto
			) throws Exception {
		// 메시지 보내기
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		dto.setSendUserId(info.getUserId());
		
		service.insertMessage(dto);
		
		Map<String, Object> model = new HashMap<>();
		return model;
	
	}
	@RequestMapping(value="/message/list")
	public ModelAndView list(HttpServletRequest req,
			HttpSession session,
			@RequestParam(value="page",defaultValue="1")int current_page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="hostNum", defaultValue="0") int hostNum,
			Message dto
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(searchKey.length()==0) {
			searchKey="sendUserId";
		}

		ModelAndView mav=new ModelAndView(".message.list");
		mav.addObject("page", current_page);
		mav.addObject("hostNum", hostNum);
		mav.addObject("searchKey", searchKey);
		mav.addObject("searchValue", searchValue);
		return mav;
	}

	@RequestMapping(value="/message/receive")
	public ModelAndView receive(HttpServletRequest req,
			HttpSession session,
			@RequestParam(value="mode")String mode,
			@RequestParam(value="page",defaultValue="1")int current_page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		String cp = req.getContextPath();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		int numPerPage = 10;
		int total_page = 0;
		int dataCount = 0;
		List<Message> list=null;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		System.out.println(searchValue);
		map.put("searchValue", searchValue);
		map.put("userId", info.getUserId());
		if(mode.equals("receive")) {
			dataCount = service.dataCountReceive(map);
		} else if(mode.equals("send")) {
			dataCount = service.dataCountSend(map);
		} else if(mode.equals("system")) {
			dataCount = service.dataCountSystem(map);
		}
		
		if (dataCount != 0)
			total_page= myUtil.pageCount(numPerPage, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지의수가 변화 된 경우
		if (total_page<current_page)
			current_page = total_page;
		
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * numPerPage +1;
		int end = current_page * numPerPage;
		map.put("start", start);
		map.put("end", end);
		if(mode.equals("receive")) {
			list = service.listReceive(map);
		} else if(mode.equals("send")) {
			list = service.listSend(map);
		} else if(mode.equals("system")) {
			list = service.listSystem(map);
		}
		
		String params ="";
		String listUrl;
		String articleUrl;
		if(searchValue.length()!=0) {
			params = "searchKey=" +searchKey +
					"&searchValue=" + URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(params.length()==0) {
			listUrl = cp+"/message/list";
			articleUrl = cp+"/message/article?page=" +current_page;
		} else {
			listUrl = cp+"message/list?" +params;
			articleUrl = cp+"/message/article?page=" + current_page + "&" +params;
		}
		
		ModelAndView mav=new ModelAndView("/message/receive");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",myUtil.paging(current_page, total_page));
		mav.addObject("searchKey",searchKey);
		mav.addObject("searchValue",searchValue);
		mav.addObject("mode",mode);

		return mav;
	}

	@RequestMapping(value="/message/article")
	public ModelAndView article(
			@RequestParam(value="mode") String mode,
			@RequestParam(value="messageNum") int messageNum,
			@RequestParam(value="page",defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("messageNum", messageNum);
		
		Message dto=null;
		dto=service.readMessage(messageNum);
		
		if(mode.equals("receive") || mode.equals("system"))
			service.updateConfirmCreated(messageNum);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		ModelAndView mav=new ModelAndView("message/article");
		
		mav.addObject("dto",dto);
		mav.addObject("page",page);
		mav.addObject("mode",mode);
		return mav;
	}
	
	// 글보기에서 글삭제
	@RequestMapping(value="/message/delete", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest req,
			HttpSession session,
			Message dto,
			@RequestParam(value="mode") String mode,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		Map<String, Object> map=new HashMap<String,Object>();
		
		if(mode.equals("receive")) {
			map.put("field1", "receiveDelete");
			map.put("field2", "sendDelete");
		} else {
			map.put("field1", "sendDelete");
			map.put("field2", "receiveDelete");
		}
		
		map.put("messageNumList", dto.getMessageNums());
		
		service.deleteMessage(map);
		
		int current_page = Integer.parseInt(page);
		return receive(req, session, mode, current_page, searchKey, searchValue);
	}
	
	// 글보기에서 글삭제
		@RequestMapping(value="/message/messageDeleteChk", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> messageDeleteChk(HttpServletRequest req,
				HttpSession session,
				Message dto,
				@RequestParam(value="mode") String mode,
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="searchKey", defaultValue="") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue
				) throws Exception {
			Map<String, Object> map=new HashMap<String,Object>();
			
			if(mode.equals("receive") || mode.equals("system")) {
				map.put("field1", "receiveDelete");
				map.put("field2", "sendDelete");
			} else {
				map.put("field1", "sendDelete");
				map.put("field2", "receiveDelete");
			}
			map.put("messageNumList", dto.getMessageNums());
			
			service.deleteMessage(map);
			
			
			return map;
		}
	
		@RequestMapping(value="/message/userIdCheck", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> userIdCheck(
				HttpSession session, Message dto,
				@RequestParam(value="receiveUserId",defaultValue="")String userId
				) throws Exception {
			int result=service.userIdCheck(userId);
			
			Map<String, Object> model = new HashMap<>();
			model.put("result1", result);
			return model;
		
		}
		
		@RequestMapping(value="/message/userMessageCheck", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> userMessageCheck(HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId=info.getUserId();
			
			int userMessageCount= service.userMessageCheck(userId);
			
			Map<String, Object> model = new HashMap<>();
			model.put("userMessageCount", userMessageCount);
			return model;
		
		}

	
	
	
	
	
	
	
	
	
	
}
