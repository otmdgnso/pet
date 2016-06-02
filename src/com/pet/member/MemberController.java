package com.pet.member;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.pet.house.House;
import com.pet.house.HouseService;

import net.sf.json.JSONObject;

@Controller("member.memberController")
public class MemberController {
   @Autowired
   private MemberService service;
   @Autowired
   private HouseService houseService;
   @Autowired
   private MyUtil util;
   
   @RequestMapping(value="/member/login", method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> loginSubmit(
         HttpSession session,
         @RequestParam(value="louserId") String userId,
         @RequestParam(value="lopwd") String pwd
         ) throws Exception{

      Member dto=service.readMember(userId);
      String state = "true";
      String userName="no";
      if(dto==null||(!dto.getPwd().equals(pwd))){
          state="false";
      } else {
         userName=dto.getUserName();
         SessionInfo info = new SessionInfo();
         info.setUserId(dto.getUserId());
         info.setUserName(dto.getUserName());
         info.setMemberNum(dto.getNum());
         info.setPwd(dto.getPwd());
         session.setAttribute("member", info);
         
       /*
         //호스트 체크하기  
         House vo;
         vo.setHostNum(info.getHostNum());
         houseService.hostCheck(hostNum);*/
      }
      
      Map<String, Object> model=new HashMap<>();
      model.put("state", state);
      model.put("userName", userName);
      
      return model;
   }
   
   @RequestMapping(value="/member/logout")
   public String logout(
         HttpSession session
         ) throws Exception{
      
      session.removeAttribute("member");
      session.invalidate();
      
      return "redirect:/";
   }
   
   
   @RequestMapping(value="/member/register", method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> memberSubmit(
         Member dto,
         HttpSession session,
         @RequestParam String checking
         ) throws Exception{
            
      String root=session.getServletContext().getRealPath("/");
      String pathname=root+File.separator+"uploads"+File.separator+"profile";
      
      String checkresult="true";
      int result=0;
      if(checking.equals(checkresult))
      result=service.insertMemeber(dto, pathname);
      
      String state="true";
      if(result==0){
         state="false";
      }   
      
      Map<String , Object> model=new HashMap<>();
      model.put("state", state);
      
      return model;
   }
   
   @RequestMapping(value="/member/update",method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> update(
         Member dto,
         HttpSession session,
         @RequestParam String checking1
         ) throws Exception{
      
      String root=session.getServletContext().getRealPath("/");
      String pathname=root+File.separator+"uploads"+File.separator+"profile";
       
      String checkresult="true";
      int result=0;
     
      if(checking1.equals(checkresult))         
    	  result=service.updateMember(dto, pathname);
      
      String state="true";
      if(result==0){
         state="false";
      }
      
      Map<String, Object> model=new HashMap<>();
      model.put("state", state);
      return model;
   }
   
   @RequestMapping(value="/member/blog")
   public ModelAndView blog(
         HttpSession session      
         ) throws Exception{
      SessionInfo info= (SessionInfo)session.getAttribute("member");
      Member dto=service.readMember(info.getUserId());
      ModelAndView mav= new ModelAndView(".member.blog");
      mav.addObject("dto",dto);
      return mav;      
   }

   @RequestMapping(value="/member/delete")
   @ResponseBody
   public Map<String, Object> delete(
         Member dto
         ,HttpSession session,
         @RequestParam String pwd
         ) throws Exception{
	   
	SessionInfo info=(SessionInfo)session.getAttribute("member");
    	
	String state="true";	
	 if(!pwd.equals(info.getPwd())){
		 state="false";
     } else{
	 
	int result=0;
	result=service.deleteMember(info.getUserId());
	
	  session.removeAttribute("member");
      session.invalidate();
     }
      Map<String, Object> model=new HashMap<>();
      model.put("state", state);
      return model;
	
   }

   @RequestMapping(value="/member/theme")
   @ResponseBody
   public Map<String, Object> themeprofile(
         HttpSession session,
         Member dto
         ) throws Exception{
      
      SessionInfo info= (SessionInfo)session.getAttribute("member");
      dto.setUserId(info.getUserId());
      
      String root=session.getServletContext().getRealPath("/");
      String pathname=root+File.separator+"uploads"+File.separator+"theme";
      
      int result=0;
      result=service.updateTheme(dto, pathname);
      //System.out.println(result);
      String state="true";
      if(result==0){
         state="false";
      }
     Map<String, Object> model=new HashMap<>();
     model.put("state", state);
     return model;      
   }
   
   @RequestMapping(value="/memeber/userIdCheck", method=RequestMethod.POST)
   public void userIdCheck(
		   HttpServletResponse resp,
		   @RequestParam String userId
		   ) throws Exception{
	   
	   String passed="false";
	   Member dto=service.readMember(userId);
	   if(dto==null)
		   passed="true";
	   
	   JSONObject job=new JSONObject();
	   job.put("passed", passed);	   
	   
	   resp.setContentType("text/html;charset=utf-8");
	   PrintWriter out=resp.getWriter();
	   out.print(job.toString());
   }
   
   @RequestMapping(value="/member/bookmark")
   public ModelAndView booklist(
		   @RequestParam(value="page", defaultValue="1") int current_page
		   ) throws Exception {
	   
	   int numPerPage=10;
	   int total_page=0;
	   int dataCount=0;
	   
	   //전체페이지수
	   Map<String, Object> map=new HashMap<String, Object>();
	   dataCount=service.dataCount(map);
		
		if(dataCount!=0)
			total_page=util.pageCount(numPerPage, dataCount);
		
		//리스트에 출력할 데이터를 가져오기
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Bookmark> list=service.listBookmark(map);
		
		ModelAndView mav=new ModelAndView("/member/bookmark");
		mav.addObject("list", list);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",util.paging(current_page, total_page));
		return mav;
   }
   
}


