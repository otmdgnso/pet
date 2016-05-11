package com.pet.auction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("auction.auctionController")
public class AuctionController {
   
   @RequestMapping(value="/auction/auction")
   public ModelAndView list() throws Exception {
      
      ModelAndView mav=new ModelAndView(".auction.auction");
      return mav;
   }
}