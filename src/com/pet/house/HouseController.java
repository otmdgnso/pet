package com.pet.house;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
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
import com.pet.pay.Pay;
import com.pet.pay.PayService;

@Controller("house.houseController")
public class HouseController {
	@Autowired
	private HouseService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private LocationService locationService;
	@Autowired
	private PayService payservice;
	
	// 검색 결과 창
	@RequestMapping(value="/house/list")
	public ModelAndView list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="orderList", defaultValue="") String orderList,
			@RequestParam(value="addressHouse",defaultValue="") String address,
			@RequestParam(value="checkInHouse",defaultValue="") String checkIn,
			@RequestParam(value="checkOutHouse",defaultValue="") String checkOut,
			@RequestParam(value="speciesHouse",defaultValue="") String species,
			@RequestParam(value="pet_suHouse",defaultValue="") String pet_su
			) throws Exception {
				
		String cp=req.getContextPath();
		
		int numPerPage = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		 // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
        map.put("orderList", orderList);
        map.put("address", address);
        map.put("checkIn", checkIn);
        map.put("checkOut", checkOut);
        map.put("species", species);
        map.put("pet_su", pet_su);

        dataCount = service.dataCount(map);
        
        if(dataCount != 0)
            total_page = myUtil.pageCount(numPerPage,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * numPerPage + 1;
        int end = current_page * numPerPage;
        map.put("start", start);
        map.put("end", end);

        // 글 리스트
        List<House> list = service.listHouse(map);
        
        String params = "";
        String urlList = cp+"/house/list";
        String urlHouseinfo=cp+"/house/houseinfo?page="+current_page;
        if(searchValue.length()!=0) {
        	params = "searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
        }
        
        if(params.length()!=0) {
        	urlList=cp+"/house/list?"+params;
        	urlHouseinfo=cp+"/house/houseinfo?page="+current_page+"&"+params;
        }
        
        
        ModelAndView mav=new ModelAndView(".house.list");
        mav.addObject("list", list);
        mav.addObject("urlHouseinfo", urlHouseinfo);
        mav.addObject("page", current_page);
        mav.addObject("dataCount", dataCount);
        mav.addObject("total_page", total_page);
        mav.addObject("paging", myUtil.paging(current_page, total_page, urlList));
        
        return mav;
        
	}
	
	// 호스팅 등록
	@RequestMapping(value="/house/join", method=RequestMethod.GET)
	public ModelAndView houseJoinInput() throws Exception{
		List<Location> list = locationService.listCategory1();	
				
		ModelAndView mav = new ModelAndView(".house.join");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="/house/join", method=RequestMethod.POST)
	public ModelAndView houseJoinSubmit(
			House dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setHostNum(info.getMemberNum());		
				
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"house";
		
		service.insertHouseInfo(dto, pathname);
		service.insertHostPetInfo(dto);				
		/*info.setHostNum(dto.getHostNum());
		session.setAttribute("member", info);
		dto.setHostNum(info.getHostNum());*/
	
		ModelAndView mav = new ModelAndView(".house.join");
		return mav;
	}
	
	// 호스팅 등록시 필요한 카테고리 
	@RequestMapping(value="/house/listCategory2", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listCategory2(String category1) throws Exception{
		List<Location> list = locationService.listCategory2(category1);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	
	// 호스팅한 집 정보
	@RequestMapping(value="/house/houseinfo") 
	public ModelAndView houseInfo(
			@RequestParam(value="hostNum") int hostNum
			,Review vo,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		House dto=service.readHouseInfo(hostNum);
		
		//사진파일
		List<House> readFile=service.readHousePhoto(hostNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostNum", dto.getNum());		
		
		map.put("num", info.getMemberNum());
		vo=service.readReview(map);
		
		info.setHostNum(hostNum);
		
		ModelAndView mav = new ModelAndView(".house.houseinfo");
		mav.addObject("hostNum",hostNum);
		mav.addObject("dto", dto);
		mav.addObject("vo", vo);
		mav.addObject("info",info);
		mav.addObject("readFile",readFile);

		return mav;
	}
	// 호스팅한 집, 예약 받은 정보
	@RequestMapping(value="/house/house_reservation")
	public ModelAndView houseReservationInfo(
			HttpServletRequest req,
			Pay dto,
			@RequestParam int hostNum,
			@RequestParam(value="page", defaultValue="1") int current_page
			) throws Exception{	
		String cp = req.getContextPath();
		int numPerPage=2;
		int total_page=0;
		
		Map<String, Object> map=new HashMap<>();
		
		int dataCount=payservice.reserveCount(hostNum);
		if(dataCount!=0)
			total_page=myUtil.pageCount(numPerPage, dataCount);

		//다른사람이 자료삭제해서 페이지 변하게된 경우
		if(total_page<=current_page)
			current_page=total_page;
		//리스트에 출력할 데이터
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		map.put("hostNum", hostNum);
		
		
		List<Pay> list=payservice.listReserve(map);
		
		//리스트 번호
		int listNum, n=0;
		Iterator<Pay> it=list.iterator();
		while(it.hasNext()){
			Pay data=it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String params="";
		String listUrl;
		
		if(params.length()==0) {
			listUrl = cp+"/house/house_reservation?hostNum="+hostNum;
		} else {
			listUrl = cp+"house/house_reservation?hostNum="+hostNum +params;
		}
		
		ModelAndView mav = new ModelAndView(".house.house_reservation");
		mav.addObject("list",list);
		mav.addObject("dataCount",dataCount);
		mav.addObject("page",current_page);
		mav.addObject("paging",myUtil.paging(current_page, total_page, listUrl));
		return mav;
	}
	
	//호스팅관리에서 예약 거절
	@RequestMapping(value="/house/deleteReserve")
	public ModelAndView deleteReserve(
			Pay dto,
			@RequestParam int reservationNum,
			@RequestParam int hostNum
			) throws Exception{
		
		payservice.deletePay(reservationNum);
		
		ModelAndView mav=new ModelAndView("redirect:/house/house_reservation?hostNum="+hostNum);
		return mav;
	}
	
	//호스팅관리에서 예약 수락
	@RequestMapping(value="/house/updateReserve")
	public ModelAndView updateReserve(			
			@RequestParam int reservationNum,
			@RequestParam int hostNum,
			Pay dto
			) throws Exception{
		
		String accept="accept";
		dto.setAccept(accept);
		payservice.updateReserve(reservationNum);
		
		System.out.println(dto.getAccept());
		
		ModelAndView mav=new ModelAndView("redirect:/house/house_reservation?hostNum="+hostNum);
		mav.addObject("accept",accept);
		return mav;
	}
	/*@RequestMapping(value="/house/updateReserve", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateReserve(			
			@RequestParam int reservationNum,
			@RequestParam int hostNum,
			Pay dto
			) throws Exception{
		
		String accept="accept";
		dto.setAccept(accept);
		payservice.updateReserve(reservationNum);
		
		System.out.println(dto.getAccept());
		
		Map<String, Object> model=new HashMap<>();
		
		return model;
	}*/
	
	
	//댓글 리스트
	@RequestMapping(value="/house/review") 
	public ModelAndView listReview(
			@RequestParam(value="hostNum", defaultValue="") int hostNum
			,@RequestParam(value="pageNo", defaultValue="1") int current_page,
			House dto,			
			HttpSession session,
			Review vo
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		int numPerPage=10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostNum", hostNum);
		
		dataCount=service.reviewDataCount(map);
		
		
		total_page=myUtil.pageCount(numPerPage, dataCount);
		if(current_page>total_page)
			current_page=total_page;
				
		//리스트에 출력할 데이터		
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		map.put("hostNum", hostNum);
		
		List<Review> list=service.listReview(map);		
		
		map.put("hostNum", hostNum);
		map.put("num", info.getMemberNum());
		vo=service.readReview(map);				
		
		ModelAndView mav=new ModelAndView("/house/review");
		mav.addObject("listReview", list);
		mav.addObject("pageNo", current_page);
		mav.addObject("reviewDataCount", dataCount);
		mav.addObject("total_page", total_page);
		mav.addObject("paging", myUtil.paging(current_page, total_page));		
		mav.addObject("dto",dto);
		mav.addObject("vo",vo);
		return mav;
	}

	//댓글 입력
	@RequestMapping(value="/house/createdReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			@RequestParam int hostNum,
			@RequestParam(value="content", defaultValue="") String content,
			Review dto,
			@RequestParam int completeNum,
			@RequestParam int score
			) throws Exception{
		
		String state="false";
		int result=0;
		result=service.insertReview(dto);
		if(result==1){
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/house/review/delete") 
	@ResponseBody
	public String delete(
			@RequestParam(value="reviewnum") int reviewnum
			) throws Exception {
		
		service.deleteReview(reviewnum);
		
		return "";
	}
	
	//호스팅 수정
	@RequestMapping(value="/house/update", method=RequestMethod.GET)
	public ModelAndView update(
			@RequestParam int hostNum,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null){
			return new ModelAndView("redirect:/");
		}
				
		House dto = service.readHouseInfo(hostNum);
		List<House> list=service.readHousePhoto(hostNum);
		String sp=service.readHostPetInfo(hostNum);
		
		ModelAndView mav=new ModelAndView(".house.join");
		mav.addObject("mode", "update");
		mav.addObject("dto",dto);
		mav.addObject("list",list);
		mav.addObject("sp",sp);
		return mav;		
	}
	
	@RequestMapping(value="/house/delete")
	public String delete(
			HttpSession session,
			@RequestParam(value="hostNum") int hostNum
			) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator + "house";
		
		service.deleteHouseInfo(hostNum, pathname);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/house/update",method=RequestMethod.POST)
	public String updateSubmit(
			House dto,
			HttpSession session,
			@RequestParam int hostNum
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null){
			return "redirect:/";
		}	
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"house";
		
		service.updateHouseInfo(dto, pathname);
		service.updateHostPetInfo(dto);
		
		return "redirect:/house/list";		
	}
	
	//사진 삭제
	@RequestMapping(value="/house/deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(
			HttpSession session,
			@RequestParam(value="saveFilename") String saveFilename
			) throws Exception{
		
		Map<String, Object> map= new HashMap<>();
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator + "house";
		
		// 해당 파일 삭제
		service.deleteHousePic(saveFilename, pathname);
		
		return map;
	}	
	

}
