package com.pet.house;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.common.MyUtil;
import com.pet.member.Member;
import com.pet.member.SessionInfo;

@Controller("house.houseController")
public class HouseController {
	@Autowired
	private HouseService service;
	@Autowired
	private MyUtil myUtil;
	
	// �˻� ��� â
	@RequestMapping(value="house/list")
	public ModelAndView list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		String cp=req.getContextPath();
		
		int numPerPage = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		 // ��ü ������ ��
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(numPerPage,  dataCount) ;

        // �ٸ� ����� �ڷḦ �����Ͽ� ��ü ���������� ��ȭ �� ���
        if(total_page < current_page) 
            current_page = total_page;

        // ����Ʈ�� ����� �����͸� ��������
        int start = (current_page - 1) * numPerPage + 1;
        int end = current_page * numPerPage;
        map.put("start", start);
        map.put("end", end);

        // �� ����Ʈ
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
	
	/*// ȣ���� ���
	@RequestMapping(value="house/join", method=RequestMethod.GET)
	public ModelAndView houseJoinInput() throws Exception{
		List<Location> list = locationService.listCategory1();
		
		
		ModelAndView mav = new ModelAndView(".house.join");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="house/join", method=RequestMethod.POST)
	public ModelAndView houseJoinSubmit() throws Exception{
		ModelAndView mav = new ModelAndView(".house.join");
		return mav;
	}*/
	
	// ȣ���� ��Ͻ� �ʿ��� ī�װ� 
	/*@RequestMapping(value="house/listCategory2", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listCategory2(String category1) throws Exception{
		List<Location> list = locationService.listCategory2(category1);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}*/
	
	// ȣ������ �� ����(��α��������� ���� �ʿ�)
	@RequestMapping(value="house/houseinfo")
	public ModelAndView houseInfo(
			HttpSession session
			,@RequestParam(value="num") int num
			,@RequestParam(value="page") String page
			,@RequestParam(value="searchKey", defaultValue="hostName") String seachKey
			,@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		House dto=service.readHouseInfo(num);
		if(dto==null)
			return new ModelAndView("redirect:/houst/list?page="+page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", dto.getNum());
		
		ModelAndView mav = new ModelAndView(".house.houseinfo");
		mav.addObject("dto", dto);
		return mav;
	}
	// ȣ������ ��, ���� ���� ����(��α��������� ���� �ʿ�)
	@RequestMapping(value="house/house_reservation")
	public ModelAndView houseReservationInfo() throws Exception{
		ModelAndView mav = new ModelAndView(".house.house_reservation");
		return mav;
	}
	
	
	
}
