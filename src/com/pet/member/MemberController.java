package com.pet.member;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.member.SessionInfo;

@Controller("member.memberController")
public class MemberController {
   @Autowired
   private MemberService service;
   
   @RequestMapping(value="/member/login", method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> loginSubmit(
         HttpSession session,
         @RequestParam(value="userId") String userId,
         @RequestParam(value="pwd") String pwd
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
         HttpSession session
         ) throws Exception{
      
      String root=session.getServletContext().getRealPath("/");
      String pathname=root+File.separator+"uploads"+File.separator+"profile";
            
      int result=0;
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
   public ModelAndView themeprofile(
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
      ModelAndView mav= new ModelAndView(".member.blog");
      return mav;      
   }
   

   
   
}