<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
 <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.blue_grey-red.min.css" />
  <script src="https://storage.googleapis.com/code.getmdl.io/1.0.0/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


<style>

.file_input_div {
  margin: auto;
  width: 250px;
  height: 40px;
}

.file_input { 
  float: left;
}

#file_input_text_div {
  width: 200px;
  margin-top: -8px;
  margin-left: 5px;
}

</style>

 <script src="<%=cp%>/res/js/tabs/jquery.responsiveTabs.js"
      type="text/javascript"></script>
   <script type="text/javascript">
      function tabContent(idx) {
    	  var url;
      	  var id;
      	  id=$("#tab-"+idx);
      	  if(idx==0) {
      		url="<%=cp%>/message/receive?mode=receive";
      	  } else if(idx==1) {
      		url="<%=cp%>/message/receive?mode=send";
      	  } else if(idx==2) {
      		url="<%=cp%>/message/send";
      	  } else if (idx==3) {
      		url="<%=cp%>/message/receive?mode=system";
      	  }
      		
      	  $.get(url, {}, function(data){
      		   id.html(data);
      	  });
      }
      
      $(function(){
    	  tabContent(0);
      });
      
   
      $(document)
            .ready(
                  function() {
                     "use strict";
                     $('#horizontalTab')
                           .responsiveTabs(
                                 {
                                    rotate : false,
                                    startCollapsed : 'accordion',
                                    collapsible : 'accordion',
                                    setHash : true,
                                    animation : 'slide',
                                    disabled : [ 4 ],
                                    activate : function(e, tab) {
                                    	
                                    	
                                    		tabContent(tab.id);
                                    	
                                    
                                    },
                                    activateState : function(e,
                                          state) {
                                       //console.log(state);
                                       $('.info')
                                             .html(
                                                   'Switched from <strong>'
                                                         + state.oldState
                                                         + '</strong> state to <strong>'
                                                         + state.newState
                                                         + '</strong> state!');
                                    }
                                 });

                  });
      

   </script>

<body>
   <div class="clear"></div>
   <section id="guide">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div id="horizontalTab" style="width: 100%; min-height: 600px;">
                  <ul>
                     <li><a href="#tab-0">받은 메시지</a></li>
                     <li><a href="#tab-1">보낸 메시지</a></li>
                     <li><a href="#tab-2">메시지 보내기</a></li>
                     <li><a href="#tab-3">시스템 메시지</a></li>
                  </ul>
				  <div id="tab-0" style="width: 100%; min-height: 600px;"></div>
				  
                  <div id="tab-1" style="width: 100%; min-height: 600px;"></div>
                  
                  <div id="tab-2" style="width: 100%; min-height: 600px;"></div>

                  <div id="tab-3" style="width: 100%; min-height: 600px;"></div>
                 
               </div>
               <!--Close col 12 -->

            </div>
         </div>
      </div>

   </section>




      
</body>
