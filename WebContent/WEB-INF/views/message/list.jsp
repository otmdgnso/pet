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



<body>
   <div class="clear"></div>
   <section id="guide">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div id="horizontalTab">
                  <ul>
                     <li><a href="#tab-1">받은 메시지</a></li>
                     <li><a href="#tab-2">보낸 메시지</a></li>
                     <li><a href="#tab-3">메시지 보내기</a></li>
                     <li><a href="#tab-4">시스템 메시지</a></li>
                  </ul>
						<div id="tab-1" >
							<h3 style="text-align: center;"><img alt="" src="<%=cp%>/res/images/asterisk.png"
											style="width: 64px;"> &nbsp; 받은 메시지</h3>
							
							
						<div align="center">
						<table style="text-align: left;margin-left: 290px; margin-right: 290px; ">
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/name.png"
															style="width: 64px;"> 보낸이 :
													</h4></td>
											</tr>
											
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/calendar.png"
															style="width: 64px;"> 받은 날짜 : ${dto.created }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/email.png"
															style="width: 64px;"> 내용 : ${dto.email }
													</h4></td>
											</tr>
											<tr style="text-align: center;">
												<!--    <td><h3><input class="btn btn-default btn-register"  type="button" onclick="update();" value="수정하기"></h3> -->

												<td><h4>
														<a href="javascript:void(0)" onclick="openUpdateModal();">수정하기</a>
													</h4></td>												
											</tr>
										</table>
										</div>
										
						</div>

                  <div id="tab-2">

                     <div class="col-md-5 histo-img">
                        <img src="http://placehold.it/450x260" alt="" />
                     </div>
                     <div class="col-md-7 guide-story-info">
                        <h3 style="margin-top: 0">Rome History</h3>
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
                           auctor nunc. Curabitur accumsan feugiat felis ut pretium.
                           Praesent semper semper nisi, eu cursus augue.</p>
                     </div>
                     <div class="clear"></div>
                     <h3>Rome Culture</h3>
                     <div class="col-md-5 culture-img">
                        <img src="http://placehold.it/400x200" alt="" />
                     </div>
                     <div class="col-md-7 histo-img">
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
                           auctor nunc. Curabitur accumsan feugiat felis ut pretium.
                           Praesent semper semper nisi, eu cursus augue.</p>
                     </div>
                  </div>
                  <div id="tab-3" style="width: 100%;">
                     
                     <div class="night-desc">
                        <h3 style="text-align: center;"><img alt="" src="<%=cp%>/res/images/asterisk.png"
											style="width: 64px;"> &nbsp; 메시지 보내기</h3>
											
											<div align="center">
						<table style="text-align: left;margin-left: 290px; margin-right: 290px; ">
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/name.png"
															style="width: 64px;"> 받을 사람 :
													</h4></td>
												<td>
												<input type="text" style="border: none; width: 100%; height: 50%; font-size: 16px;">
												</td>
											</tr>
											

											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/email.png"
															style="width: 64px;"> 내용 : ${dto.email }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td>
												<textarea rows="4" cols=""></textarea>
												</td>
												</tr>
											<tr style="text-align: center;">
												<!--    <td><h3><input class="btn btn-default btn-register"  type="button" onclick="update();" value="수정하기"></h3> -->

												<td><h4>
														<a href="javascript:void(0)" onclick="openUpdateModal();">보내기</a>
													</h4></td>												
											</tr>
										</table>
										</div>
                     </div>
                  </div>
                  <div id="tab-4">
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

   


   <script src="<%=cp%>/res/js/tabs/jquery.responsiveTabs.js"
      type="text/javascript"></script>
   <script type="text/javascript">
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
                                       $('.info')
                                             .html(
                                                   'Tab <strong>'
                                                         + tab.id
                                                         + '</strong> activated!');
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


      
</body>
