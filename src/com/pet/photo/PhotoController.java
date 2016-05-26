package com.pet.photo;

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

@Controller("photo.photoController")
public class PhotoController {
	@Autowired
	private PhotoService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/photo/photo")
	public ModelAndView list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="sortList", defaultValue="") String sortList
			) throws Exception {		
		
		String cp=req.getContextPath();
		
		int numPerPage=9;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		//��ü ��������
		Map<String, Object> map=new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("sortList", sortList);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page=util.pageCount(numPerPage, dataCount);
		
		//�ٸ� ����� �ڷ�����ؼ� ��ü �������� ����Ǵ°��
		if(total_page<current_page)
			current_page=total_page;
		
		//����Ʈ�� ����� ������ ��������
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Photo> list=service.listPhoto(map);
		
		//����Ʈ ��ȣ
		int listNum, n=0;
		Iterator<Photo> it=list.iterator();
		while(it.hasNext()){
			Photo data=it.next();
			listNum = dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		String params="";
		String listUrl;
		String articleUrl;
		if(searchValue.length()!=0){
			params="searchKey="+searchKey+
					"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(params.length()==0){
			listUrl=cp+"/photo/photo";
			articleUrl=cp+"/photo/article?page="+current_page;
		}else{
			listUrl=cp+"/photo/photo?"+params;
			articleUrl=cp+"/photo/article?page="+current_page+"&"+params;
		}
		
		
		ModelAndView mav=new ModelAndView(".photo.photo");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",util.paging(current_page, total_page,listUrl));
		return mav;
	}
	
	@RequestMapping(value="/photo/created", method=RequestMethod.GET)
	public ModelAndView created(
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		ModelAndView mav=new ModelAndView(".photo.created");

		if(info==null){
			return mav=new ModelAndView("redirect:/");
		}
		
		mav.addObject("mode","created");
		return mav;
	}
	
	@RequestMapping(value="/photo/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Photo dto
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
				
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		dto.setNum(info.getMemberNum());
		service.insertPhoto(dto, pathname);
		return "redirect:/photo/photo";
	}
	
	@RequestMapping(value="/photo/article", method=RequestMethod.GET)
	public ModelAndView article(
			HttpSession session,
			@RequestParam(value="photoNum") int photoNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int num=info.getMemberNum();
		searchValue= URLDecoder.decode(searchValue,"utf-8");
		
		//��ȸ�� ����
		service.photoHitCount(photoNum);
		
		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", photoNum);
		
		Photo dto=service.readPhoto(photoNum);
		if(dto==null)
			return new ModelAndView("redirect:.photo.photo?page="+page);
		
		//���뿡 ����
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		String params="page="+page;
		if(searchValue.length()!=0){
			params+="&searchKey="+searchKey+
						"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		map.put("num", num);
		Photo vo=service.readPhotoLike(map);
		
		String likee="true";
		if(vo==null)
			likee="false";
		
		int count=service.photoCountLike(map);
		
		ModelAndView mav=new ModelAndView(".photo.article");
		mav.addObject("num",num);
		mav.addObject("dto",dto);
		mav.addObject("page",page);
		mav.addObject("params",params);
		
		mav.addObject("likee", likee);
		mav.addObject("count", count);
		
		return mav;
	}
	
	@RequestMapping(value="/photo/update", method=RequestMethod.GET)
	public ModelAndView updateForm(
			@RequestParam(value="photoNum") int photoNum,
			@RequestParam(value="page") String page
			) throws Exception{
		
		Photo dto=service.readPhoto(photoNum);
		if(dto==null)
			return new ModelAndView("redirect/:.photo.photo?page="+page);
		
		ModelAndView mav=new ModelAndView(".photo.created");
		mav.addObject("mode","update");
		mav.addObject("page",page);
		mav.addObject("dto",dto);	
		return mav;
	}
	
	@RequestMapping(value="/photo/update",method=RequestMethod.POST)
	public String updateSubmit(
			HttpSession session,
			Photo dto,
			@RequestParam(value="page") String page
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		//�����ϱ�
		service.updatePhoto(dto, pathname);
		
		return "redirect:/photo/photo?page="+page;
	}
	
	@RequestMapping(value="/photo/delete")
	public String delete(
			HttpSession session
			,@RequestParam(value="saveFilename", defaultValue="") String saveFilename
			,@RequestParam(value="photoNum") int photoNum
			,@RequestParam(value="page") String page
			) throws Exception{
						
		System.out.println(saveFilename);
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		service.deletePhoto(photoNum, pathname, saveFilename);
		
		return "redirect:/photo/photo?page="+page;
	}
	
	//���
	@RequestMapping(value="/photo/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) throws Exception{
				
		SessionInfo info=(SessionInfo)session.getAttribute("member");
				
		String state="false";
		int result=0;
		dto.setNum(info.getMemberNum());
		result=service.insertPhotoReply(dto);
		if(result==1)
			state="true";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;		
	}
	
	@RequestMapping(value="/photo/listReply")
	public ModelAndView listReply(
			@RequestParam int photoNum
			,@RequestParam(value="pageNo", defaultValue="1") int current_page
			) throws Exception{
		
		int numPerPage=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", photoNum);
		
		dataCount=service.dataCountPhotoReply(map);
		total_page=util.pageCount(numPerPage, dataCount);
		if(current_page>total_page)
			total_page=current_page;
		
		//����Ʈ�� ��� ������
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		List<Reply> list=service.listPhotoReply(map);
		
		//����ó��
		Iterator<Reply> it=list.iterator();
		while(it.hasNext()){
			Reply dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		String paging=util.paging(current_page, total_page);
				
		ModelAndView mav=new ModelAndView("photo/listReply");
		mav.addObject("list",list);
		mav.addObject("pageNo",current_page);
		mav.addObject("dataCountReply",dataCount);
		mav.addObject("paging",paging);
		
	
		return mav;
	}
	
	@RequestMapping(value="/photo/photoReplyCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyCount(
			@RequestParam(value="photoNum") int photoNum
			) throws Exception{
		
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", photoNum);
		count=service.dataCountPhotoReply(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("count", count);
		return model;
	}
	
	@RequestMapping(value="/photo/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam(value="replyNum") int replyNum,
			@RequestParam(value="userId") String userId
			) throws Exception{
		
		String state="false";
		int result=0;
		result=service.deletePhotoReply(replyNum);
		if(result==1)
			state="true";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	//���� ���ƿ� 
	@RequestMapping(value="/photo/photoLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> photoLike(
			Photo dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		int likee=0;
		
		if(info==null){
			state="loginFail";
		}else{
			dto.setNum(info.getMemberNum());
			int result=service.insertPhotoLike(dto);
			if(result==1){
				likee=1;
			}else if(result==0){
				service.deletePhotoLike(dto);
				likee=0;				
			}
		}
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("likee", likee);
		return model;
	}
	
	@RequestMapping(value="/photo/countLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLike(
			@RequestParam(value="photoNum") int photoNum
			) throws Exception{
		
		String state="true";
		int count=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", photoNum);
		count=service.photoCountLike(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		return model;
	}
}







