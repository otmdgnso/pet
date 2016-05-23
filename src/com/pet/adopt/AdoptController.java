package com.pet.adopt;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import net.sf.json.JSONObject;

@Controller("adopt.adoptController")
public class AdoptController {
	@Autowired
	private AdoptService service;
	
	@Autowired
	private MyUtil myutil;
	
	@RequestMapping(value="/adopt/created", method=RequestMethod.GET)
	public ModelAndView create(
			HttpSession session
			) throws Exception {
		ModelAndView mav = new ModelAndView(".adopt.created");
		mav.addObject("mode","created");
		return mav;
	}
	
	@RequestMapping(value="/adopt/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Adopt dto
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"adopt";
		
		dto.setNum(info.getMemberNum());
		service.insertPreSale(dto, pathname);

		return "redirect:/adopt/list";
	}
	
	@RequestMapping(value="/adopt/list")
	public ModelAndView list(HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="orderList", defaultValue="") String orderList
			) throws Exception {
		String cp = req.getContextPath();
		
		int numPerPage = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET ����� ���
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		// ��ü ������ ��
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("orderList", orderList);
		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page= myutil.pageCount(numPerPage, dataCount);
		
		// �ٸ� ����� �ڷḦ �����Ͽ� ��ü �������Ǽ��� ��ȭ �� ���
		if (total_page<current_page)
			current_page = total_page;
		
		// ����Ʈ�� ����� �����͸� ��������
		int start = (current_page - 1) * numPerPage +1;
		int end = current_page * numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Adopt> list = service.listPreSale(map);
		
		// ����Ʈ�� ��ȣ
		int listNum, n=0;
		Iterator<Adopt> it=list.iterator();
		while(it.hasNext()) {
			Adopt data = it.next();
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
			listUrl = cp+"/adopt/list";
			articleUrl = cp+"/adopt/article?page=" +current_page;
		} else {
			listUrl = cp+"adopt/list?" +params;
			articleUrl = cp+"adopt/article?page=" + current_page + "&" +params;
		}
		
		ModelAndView mav = new ModelAndView(".adopt.list");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",myutil.paging(current_page, total_page, listUrl));
		
		return mav;
	}
	
	@RequestMapping(value="adopt/article", method=RequestMethod.GET)
	public ModelAndView article(
			@RequestParam(value="preSaleNum") int preSaleNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue
			) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		// ��ȸ�� ����
		service.preUpdateHitCount(preSaleNum);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("preSaleNum", preSaleNum);
		
		int dataCountReply=service.dataCountPreReply(map);
		// �ش� ���ڵ� ��������
		Adopt dto = service.readPreSale(preSaleNum);
		if(dto==null)
			return new ModelAndView("redirect:.adopt.list?page="+page);
		
		// ���뿡 ���� �ֱ�
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// ����
		List<Adopt> readPreFile=service.readPreFile(preSaleNum);
		
		String params = "page="+page;
		if(searchValue.length()!=0) {
			params += "&searchKey=" + searchKey +
					"&searchValue=" +URLEncoder.encode(searchValue,"utf-8");
		}
		
		ModelAndView mav= new ModelAndView(".adopt.article");
		mav.addObject("dto",dto);
		mav.addObject("readPreFile",readPreFile);
		mav.addObject("dataCountReply", dataCountReply);
		mav.addObject("page",page);
		mav.addObject("params",params);
		
		return mav;
	}
	
	@RequestMapping(value="/adopt/delete")
	public String delete (
			HttpSession session,
			@RequestParam(value="preSaleNum") int preSaleNum,
			@RequestParam(value="page") String page
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator + "adopt";
		
		// �ڷ� ����
		service.deletePreSale(preSaleNum, pathname);
		
		return "redirect:/adopt/list?page="+page;
	}
	
	@RequestMapping(value="/adopt/update",method=RequestMethod.GET)
	public ModelAndView updateForm(
			@RequestParam(value="preSaleNum") int preSaleNum,
			@RequestParam(value="page") String page
			) throws Exception {
		Adopt dto = service.readPreSale(preSaleNum);
		if(dto==null)
			return new ModelAndView("redirect:.adopt.list?page="+page);
		
		List<Adopt> readPreFile = service.readPreFile(preSaleNum);
		
		ModelAndView mav=new ModelAndView(".adopt.created");
		mav.addObject("mode","update");
		mav.addObject("page",page);
		mav.addObject("dto",dto);
		mav.addObject("readPreFile",readPreFile);
		return mav;
	}
	
	@RequestMapping(value="/adopt/update", method=RequestMethod.POST)
	public String updateSubmit(
			HttpSession session,
			Adopt dto,
			@RequestParam(value="page") String page
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator +"adopt";
		
		// ���� �ϱ�
		service.updatePreSale(dto, pathname);
		
		return "redirect:/adopt/list?page="+page;
	}
	
	@ResponseBody
	@RequestMapping(value="/adopt/deleteFile")
	public Map<String, Object> deleteFile (
			HttpSession session,
			@RequestParam(value="saveFilename") String saveFilename
			) throws Exception {
		Map<String, Object> map= new HashMap<>();
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator + "adopt";
		
		// �ش� ���� ����
		service.deletePreFile(saveFilename, pathname);
		
		return map;
	}
	
	// ���� �߰�
	@RequestMapping(value="/adopt/insertReply",method=RequestMethod.POST)
	public void insertReply(
			HttpServletResponse resp,
			HttpSession session,
			Reply dto
			) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		String state="true";
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			dto.setNum(info.getMemberNum());
			int result=service.insertPreReply(dto);
			if(result==0)
				state="false";
		}
		
		// �۾� ����� json���� ����
		JSONObject job = new JSONObject();
		job.put("state", state);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print(job.toString());
	}
	
	// ��� ����Ʈ
	@RequestMapping(value="/adopt/listReply")
	public ModelAndView listReply(
			@RequestParam(value="preSaleNum") int preSaleNum,
			@RequestParam(value="pageNo",defaultValue="1") int current_page
			) throws Exception {
		int numPerPage=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("preSaleNum", preSaleNum);
		
		dataCount=service.dataCountPreReply(map);
		total_page=myutil.pageCount(numPerPage, dataCount);
		if(current_page>total_page)
			total_page=current_page;
		
		// ����Ʈ�� ����� ������
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		List<Reply> list=service.listPreReply(map);
		
		// ���͸� <br>
		Iterator<Reply> it=list.iterator();
		while(it.hasNext()) {
			Reply dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging=myutil.paging(current_page, total_page);
		
		ModelAndView mav=new ModelAndView("adopt/listReply");
		
		// jsp�� �ѱ� ������
		mav.addObject("list",list);
		mav.addObject("pageNo",current_page);
		mav.addObject("dataCountReply",dataCount);
		mav.addObject("paging",paging);
		
		return mav;
	}
	
	@RequestMapping(value="/adopt/postReplyCount",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postReplyCount(
			@RequestParam(value="preSaleNum") int preSaleNum
			) throws Exception {
		// AJAX(JSON) - ��� ���� (��� ����ϸ� ������ �ٷ� �ٲ�)
		System.out.println("ss");
		int count=0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("preSaleNum", preSaleNum);
		
		count=service.dataCountPreReply(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("count", count);
		
		return model;
	}
	
	// ��� ����
	@RequestMapping(value="/adopt/deleteReply",method=RequestMethod.POST)
	public void deleteReply(
			HttpServletResponse resp,
			HttpSession session,
			@RequestParam(value="replyNum") int replyNum,
			@RequestParam(value="userId") String userId
			) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		String state="false";
		if(info==null) {
			state="loginFail";
		} else if(info.getUserId().equals("admin")
				|| info.getUserId().equals(userId)) {
			service.deletePreReply(replyNum);
			state="true";
		}
		
		// �۾� ����� json���� ����
		JSONObject job=new JSONObject();
		job.put("state", state);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print(job.toString());
	}
}
