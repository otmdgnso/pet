package com.pet.auction;

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

@Controller("auction.auctionController")
public class AuctionController {
	@Autowired
	private AuctionService service;
	
	@Autowired
	private MyUtil myutil;
	
	@RequestMapping(value="/auction/created", method=RequestMethod.GET)
	public ModelAndView created(
			HttpSession session
			) throws Exception {
		
		ModelAndView mav= new ModelAndView(".auction.created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value="/auction/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Auction dto
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"auction";
		
		dto.setNum(info.getMemberNum());
		service.insertAuction(dto, pathname);
		
		return "redirect:/auction/list";
	}
	@RequestMapping(value="/auction/list")
	public ModelAndView list(
				HttpServletRequest req,
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		String cp=req.getContextPath();
		
		int numPerPage=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {//GET 방식인경우
			searchValue=URLDecoder.decode(searchValue, "utf-8");
					}
		
		//전체 페이지수
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.auctiondataCount(map);
		if(dataCount != 0)
			total_page=myutil.pageCount(numPerPage, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지의수가 변화 된 경우
		if (total_page<current_page)
			current_page = total_page;
		
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * numPerPage +1;
		int end = current_page * numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Auction> list = service.listAuction(map);
		
		// 리스트의 번호
		int listNum, n=0;
		Iterator<Auction> it=list.iterator();
		while(it.hasNext()) {
			Auction data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
			n++;
		}
		
		String params ="";
		String listUrl;
		String articleUrl;
		if(searchValue.length()!=0) {
			params = "searchKey=" +searchKey +
					"&searchValue=" + URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(params.length()==0) {
			listUrl = cp+"/auction/list";
			articleUrl = cp+"/auction/article?page=" +current_page;
		} else {
			listUrl = cp+"auction/list?" +params;
			articleUrl = cp+"auction/article?page=" + current_page + "&" +params;
		}
		
		ModelAndView mav = new ModelAndView(".auction.list");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",myutil.paging(current_page, total_page, listUrl));
		
		return mav;
	}
	
	//상세보기
	@RequestMapping(value="auction/article", method=RequestMethod.GET)
	public ModelAndView article(
			@RequestParam(value="auctionNum") int auctionNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue
			) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		//조회수증가
		service.auctionUpdateHitCount(auctionNum);
		
		// 해당 레코드 가져오기
		Auction dto = service.readAuction(auctionNum);
		if(dto==null)
			return new ModelAndView("redirect:.auction.list?page="+page);
		
		// 내용에 엔터 넣기
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 파일
		List<Auction> readAuctionFile=service.readAuctionFile(auctionNum);
		
		String params = "page="+page;
		if(searchValue.length()!=0) {
			params += "&searchKey=" + searchKey +
					"&searchValue=" +URLEncoder.encode(searchValue,"utf-8");
		}
		
		ModelAndView mav= new ModelAndView(".auction.article");
		mav.addObject("dto",dto);
		mav.addObject("readAuctionFile",readAuctionFile);
		
		mav.addObject("page",page);
		mav.addObject("params",params);
		
		return mav;
	}
	@RequestMapping(value="/auction/delete")
	public String delete(
				HttpSession session,
				@RequestParam(value="auctionNum") int auctionNum,
				@RequestParam(value="page") String page
			) throws Exception {
		String root=session.getServletContext().getRealPath("/");
		String pathname=root + File.separator + "uploads" + File.separator+"auction";
		//자료삭제
		service.deleteAuction(auctionNum, pathname);
		
		
		return "redirect:/auction/list?page="+page;
		
	}
	
	@RequestMapping(value="/auction/update", method=RequestMethod.POST)
	public String updateSubmit(
				HttpSession session,
				Auction dto,
				@RequestParam(value="page") String page
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator +"auction";
		
		//수정하기
		service.updateAuction(dto, pathname);
		return "redirect:/auction/list?page="+page;
	}
	
	@ResponseBody
	@RequestMapping(value="/auction/deleteFile")
	public Map<String, Object> deleteFile(
			HttpSession session,
			@RequestParam(value="saveFilename") String saveFilename
			)throws Exception {
		Map<String, Object> map=new HashMap<>();
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator +"auction";
	//해당파일삭제
		service.deleteAuctionFile(saveFilename, pathname);
		
		return map;
	
	}
	
	
	
}
