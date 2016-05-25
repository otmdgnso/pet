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
	
	@RequestMapping(value="/message/send", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendSubmit(
			HttpSession session, Message dto) throws Exception {
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
			Message dto
			) throws Exception {
		// 받은 쪽지 리스트
		String cp = req.getContextPath();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		int numPerPage = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("userId", info.getUserId());
		dataCount = service.dataCountReceive(map);
		
		if (dataCount != 0)
			total_page= myUtil.pageCount(numPerPage, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지의수가 변화 된 경우
		if (total_page<current_page)
			current_page = total_page;
		System.out.println("ㅇㅇ"+dataCount);
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * numPerPage +1;
		int end = current_page * numPerPage;
		map.put("start", start);
		map.put("end", end);
		List<Message> list = service.listReceive(map);
		
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
		
		ModelAndView mav = new ModelAndView(".message.list");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",myUtil.paging(current_page, total_page, listUrl));
		mav.addObject("searchKey",searchKey);
		mav.addObject("searchValue",searchValue);
		return mav;
	}
	
	/*// 받은 쪽지 리스트 / 보낸 쪽지 리스트
	@RequestMapping(value="/message/listMessage")
	@ResponseBody
	public Map<String, Object>  listMessage(HttpSession session,
			@RequestParam(value="mode", defaultValue="listReceive") String mode,
			@RequestParam(value="pageNo",defaultValue="1")int current_page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		// 보낸 쪽지 리스트
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		// 페이징 처리
		int numPerPage=10;
		int total_page=0;
		int dataCount=0;
		
		// 전체 게시물의 수
		Map<String, Object> map= new HashMap<String,Object>();
		map.put("searchKey", searchKey);
	    map.put("searchValue", searchValue);
	    map.put("userId", info.getUserId());
	    
	    if(mode.equals("listReceive")) {
	    	dataCount=service.dataCountReceive(map);
	    }
	    
	    // 전체 페이지 수
	    total_page=myUtil.pageCount(numPerPage, dataCount);
	    
	    if(current_page>total_page)
	    	current_page=total_page;
	    
	    // 리스트
	    int start=numPerPage*(current_page)+1;
	    int end=numPerPage*current_page;
	    
	    map.put("start", start);
	    map.put("end", end);
	    
	    List<Message> list=null;
	    if(mode.equals("listReceive")) {
	    	list=service.listReceive(map);
	    }
	    for(Message dto:list) {
	    	if(dto.getConfirmCreated()==null)
	    		dto.setConfirmCreated("");
	    }
	    
	    String paging=myUtil.paging(current_page, total_page);
	    
	    // 작업 결과를 JSON으로 전송
	    Map<String, Object> model= new HashMap<>();
	    model.put("mode", mode);
	    model.put("list", list);
	    model.put("dataCount", dataCount);
	    model.put("pageNO", current_page);
	    model.put("paging", paging);
	    model.put("searchKey", searchKey);
	    model.put("searchValue", searchValue);
	    
	    return model;
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
