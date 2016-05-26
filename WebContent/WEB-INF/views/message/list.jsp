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
                                    	
                                    	if(tab.id==0 || tab.id==1 || tab.id==2) {
                                    		tabContent(tab.id);
                                    	}
                                    
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
               <div id="horizontalTab">
                  <ul>
                     <li><a href="#tab-0">받은 메시지</a></li>
                     <li><a href="#tab-1">보낸 메시지</a></li>
                     <li><a href="#tab-2">메시지 보내기</a></li>
                     <li><a href="#tab-3">시스템 메시지</a></li>
                  </ul>
				  <div id="tab-0" style="width: 1074px;"></div>
				  
                  <div id="tab-1" style="width: 1074px;"></div>
                  
                  <div id="tab-2" style="width: 100%;"></div>

                  <div id="tab-3">
                     <div class="col-md-3 histo-img">
                        <img src="http://placehold.it/300x200" alt="" />
                     </div>
                     <div class="col-md-9">
                        <h3>Pasta</h3>
                        <p>Quisque sodales sodales lacus pharetra bibendum. Etiam
                           commodo non velit ac rhoncus. Mauris euismod purus sem, ac
                           adipiscing quam laoreet et. Praesent vulputate ornare sem vel
                           scelerisque. Ut dictum augue non erat lacinia, sed lobortis
                           elit gravida. Proin ante massa, ornare accumsan ultricies et,
                           posuere sit amet magna. Praesent dignissim, enim sed malesuada
                           luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
                           est. Donec tristique mi turpis, et sodales nibh gravida eu.
                           Etiam odio risus, porttitor non lacus id, rhoncus tempus
                           tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
                           sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
                           ultricies dolor est, a congue ante dapibus varius. Nulla at
                           auctor nunc.</p>
                     </div>
                     <div class="clear"></div>
                     <br />
                     <div class="col-md-3 histo-img">
                        <img src="http://placehold.it/300x200" alt="" />
                     </div>
                     <div class="col-md-9">
                        <h3>Pizza</h3>
                        <p>Quisque sodales sodales lacus pharetra bibendum. Etiam
                           commodo non velit ac rhoncus. Mauris euismod purus sem, ac
                           adipiscing quam laoreet et. Praesent vulputate ornare sem vel
                           scelerisque. Ut dictum augue non erat lacinia, sed lobortis
                           elit gravida. Proin ante massa, ornare accumsan ultricies et,
                           posuere sit amet magna. Praesent dignissim, enim sed malesuada
                           luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
                           est. Donec tristique mi turpis, et sodales nibh gravida eu.
                           Etiam odio risus, porttitor non lacus id, rhoncus tempus
                           tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
                           sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
                           ultricies dolor est, a congue ante dapibus varius. Nulla at
                           auctor nunc.</p>
                     </div>
                     <div class="clear"></div>
                     <br />
                     <div class="col-md-3 histo-img">
                        <img src="http://placehold.it/300x200" alt="" />
                     </div>
                     <div class="col-md-9">
                        <h3>Vino</h3>
                        <p>Quisque sodales sodales lacus pharetra bibendum. Etiam
                           commodo non velit ac rhoncus. Mauris euismod purus sem, ac
                           adipiscing quam laoreet et. Praesent vulputate ornare sem vel
                           scelerisque. Ut dictum augue non erat lacinia, sed lobortis
                           elit gravida. Proin ante massa, ornare accumsan ultricies et,
                           posuere sit amet magna. Praesent dignissim, enim sed malesuada
                           luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
                           est. Donec tristique mi turpis, et sodales nibh gravida eu.
                           Etiam odio risus, porttitor non lacus id, rhoncus tempus
                           tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
                           sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
                           ultricies dolor est, a congue ante dapibus varius. Nulla at
                           auctor nunc</p>
                     </div>
                  </div>
                 
               </div>
               <!--Close col 12 -->

            </div>
         </div>
      </div>

   </section>

   




      
</body>
