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

<script type="text/javascript">
function searchList() { 
 	var searchHost = $("#searchHost").val();
 	var searchState = "";
 	
 	alert($("#searchState").val());
 
	$.ajax({
	  url: "<%=cp%>/reservation/list"
	  ,type:"post"
	  ,data : {searchHost:searchHost,searchState:"wait"}
	}).done(function(data) {
		$("#ajaxReserveList").html('');
		$("#ajaxReserveList").html(data);
	}); 
}

function deleteReservation(reservationNum) {
	var page="${page}";
	var params="reservationNum="+reservationNum+"&page="+page;
	var url="<%=cp%>/reservation/delete?"+params;
	
	if(confirm("정말 삭제할까요?")) {
		location.href=url;
	}
}

function updateReservation(reservationNum) {
	var page="${page}";
	var params="reservationNum="+reservationNum+"&page="+page;
	var url="<%=cp%>/reservation/update?"+params; 
	
	location.href=url;
}

//예약목록
$(document).ready(function(){

	// ajax 처리
	$.ajax({
	  url: "<%=cp%>/reservation/list"
	  //context: document.body
	}).done(function(data) {
		$("#ajaxReserveList").html(data);
	});

      $("#wizard-picture1").change(function(){
          readURL(this);
      });
});

function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();

           reader.onload = function (e) {
               $('#wizardPicturePreview1').attr('src', e.target.result).fadeIn('slow');
           }
           reader.readAsDataURL(input.files[0]);
       }
   }
function openUpdateModal(){
    showUpdateForm();
    setTimeout(function(){
        $('#updateModal').modal('show');    
    }, 230);
    
}

function showUpdateForm(){
   $('.loginBox').fadeOut('fast',function(){
        $('.registerBox1').fadeIn('fast');
       
        $('.modal-title').html('Register with');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
}

function updateMember(){
   var url="<%=cp%>/member/update";
   
   var f=document.upForm;   
   var formData=new FormData(f);
	
   updateCheck();
   
   $.ajax({
      url:url
      ,type:"post"
      ,processData:false
      ,contentType:false
      ,data:formData
      ,dataType:"json"
      ,success:function(data){
         var state=data.state;
         if(state=="false"){
         }else{
            location.href="<%=cp%>/member/blog";
         }
      }
   });
}

function updateCheck(){
	 var f=document.upForm;  
	 var str;
	 
	 str = f.pwd1.value;
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
			f.pwd1.focus();
			shakeModalMember('패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야합니다!');
			return false;
		}
		
		if(f.pwd_confirm1.value != str) {
			f.pwd_confirm1.focus();
			shakeModalMember('비밀번호를 동일하게 입력하세요!');
			return false;
		} 
		
		str = f.email11.value;
	    if(!isValidEmail(str)) {
	        f.email.focus();
	        shakeModalMember('이메일 형식이 잘못되었습니다!');
	        return false;
	    }
	    str = f.birth1.value;
	    if(!isValidDateFormat(str)) {
	        f.birth.focus();
	        shakeModalMember('생일형식이 잘못 되었습니다. "1991-12-23" 이렇게 입력!');
	        return false;
	    }
	    str = f.phone1.value;
	    if(!/^\d{3}-\d{3,4}-\d{4}$/.test(str)) {
	        f.phone.focus();
	        shakeModalMember('전화 번호 형식을 확인하세요!');
	        return false;
	    }    
	    
	    f.checking1.value="true";
	    return true;
		
}
function sendTheme(){
   
   var url="<%=cp%>/member/theme";
   var f=$("form")[3];   
   var formData=new FormData(f);
   
   $.ajax({
      url:url
      ,type:"post"
      ,processData:false
      ,contentType:false
      ,data:formData
      ,dataType:"json"
      ,success:function(data){
    	  if(data.state=="false"){
         alert("ssg");
    	  }else{
    		  location.href="<%=cp%>/member/blog";
    	  }
      }
   });
	
}

function shakeModalMember(msg){
    $('#updateModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html(msg);
             setTimeout( function(){ 
                $('#updateModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}


</script>

<body>
   <div class="clear"></div>
   <section id="guide">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div id="horizontalTab">
                  <ul>
                     <li><a href="#tab-1">INFO</a></li>
                     <li><a href="#tab-2">호스팅 목록</a></li>
                     <li><a href="#tab-3">예약 목록</a></li>
                     <li><a href="#tab-4">북마크 목록</a></li>
                     <li><a href="#tab-5">포토갤러리</a></li>
                     <li><a href="#tab-6">나의 QnA</a></li>
                  </ul>
						<div id="tab-1" >
							<div class="city-info-content">
								<div class="info-box-guide" style="width: 200px; height: 200px;">
									<img src="<%=cp%>/uploads/profile/${dto.profile}"
										class="avatar img-circle img-thumbnail">
								</div>
								<c:if test="${empty dto.themeprofile }">
									<img src="http://placehold.it/1600x800" alt="" />
								</c:if>
								<c:if test="${not empty dto.themeprofile }">
									<img src="<%=cp%>/uploads/theme/${dto.themeprofile}" alt="" />
								</c:if>

								<form name="updateTheme" method="post" enctype="multipart/form-data">
									<div class="file_input_div" style="float: right;">
										<div class="file_input">
											<label
												class="image_input_button mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-js-ripple-effect mdl-button--colored">
												<i class="material-icons">file_upload</i> <input
												id="file_input_file" class="none" type="file"
												style="display: none;" name="themeUpload" />
											</label>
										</div>
										<div id="file_input_text_div"
											class="mdl-textfield mdl-js-textfield textfield-demo">
											<input class="file_input_text mdl-textfield__input"
												type="text" disabled readonly id="file_input_text" /> <label
												class="mdl-textfield__label" for="file_input_text"></label>
										</div>
										<div style="float: right;">
											<button onclick="sendTheme();" class="btn btn-info btn-small">
												<i class="icon-white icon-chevron-right"></i>테마사진변경
											</button>
										</div>
									</div>
								</form>
							</div>
							<h3 style="text-align: center;"><img alt="" src="<%=cp%>/res/images/asterisk.png"
											style="width: 64px;"> &nbsp; Information</h3>
							
							
						<div align="center">
						<table style="text-align: left;margin-left: 290px; margin-right: 290px; ">
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/name.png"
															style="width: 64px;"> 이름 : ${dto.userName }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/birthday-cake.png"
															style="width: 64px;"> 생년월일 : ${dto.birth }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/calendar.png"
															style="width: 64px;"> 가입일 : ${dto.created }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/email.png"
															style="width: 64px;"> 이메일 : ${dto.email }
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
                  
                  
<div id="tab-3">
	<!-- 예약목록 -->		
	<!-- http://localhost:9090/pet/reservation/list -->
	<div id="ajaxReserveList"></div>
	
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
                  <div id="tab-5">
                     <p>Proin dignissim faucibus odio sollicitudin sagittis.
                        Phasellus aliquet, erat vitae mollis consectetur, enim lectus
                        ornare libero, et porta mi dui eu tellus. Morbi lobortis, elit
                        at euismod porta, magna lacus mattis massa, a lacinia ligula
                        risus et lectus. Sed et aliquam ligula. Nunc venenatis orci
                        magna, quis facilisis sem porta non. Nunc sodales arcu in
                        consectetur malesuada. Maecenas varius justo lacus, scelerisque
                        viverra tellus luctus eu. Nam imperdiet ultricies suscipit. Ut
                        urna mauris, eleifend quis lacinia non, mollis id libero.
                        Praesent pharetra viverra ipsum at posuere. Quisque commodo
                        tortor nec hendrerit faucibus. Fusce convallis urna et vehicula
                        tincidunt. Duis sed vehicula justo, eu placerat nisi. Donec
                        facilisis augue non turpis semper, eget condimentum mauris
                        malesuada. Nunc in dignissim mi, sed laoreet felis.</p>
                  </div>
                  <div id="tab-6">
                     <h3>
                        Italy Weather <span>(more info <a href="meteo.html">travego
                              meteo</a>)
                        </span>
                     </h3>
                     <p>Quisque sodales sodales lacus pharetra bibendum. Etiam
                        commodo non velit ac rhoncus. Mauris euismod purus sem, ac
                        adipiscing quam laoreet et. Praesent vulputate ornare sem vel
                        scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit
                        gravida. Proin ante massa, ornare accumsan ultricies et, posuere
                        sit amet magna. Praesent dignissim, enim sed malesuada luctus,
                        arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec
                        tristique mi turpis, et sodales nibh gravida eu. Etiam odio
                        risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur
                        tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed
                        vel luctus nisi, at mattis metus. Aenean ultricies dolor est, a
                        congue ante dapibus varius. Nulla at auctor nunc</p>
                     <div id="meteo-guide"></div>
                  </div>
               </div>
               <!--Close col 12 -->

            </div>
         </div>
      </div>

   </section>

   <section id="parallax" class="about-prx">  
     
      <div class="container">
       <div class="modal fade login" id="updateModal">
            <div class="modal-dialog login animated">
                <div class="modal-content">
                   <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        
                        <h4>회원 정보 수정</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form>
                                    <input class="form-control" type="text" placeholder="userId" name="userId">
                                    <input class="form-control" type="password" placeholder="pwd" name="pwd">
                                    <input class="btn btn-default btn-login" type="button" value="Login" onclick="loginSend()">
                                    </form>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox1" style="display:none;">
                             <div class="form">
                                <form name="upForm" enctype="multipart/form-data">
                                    <div class="card wizard-card ct-wizard-orange" >
                                  <div class="picture-container">
                                                <div class="picture">
                                                    <img src="<%=cp%>/uploads/profile/${dto.profile}" width="110px" height="100px"
                                                    class="picture-src" id="wizardPicturePreview1" title=""/>                                                    
                                                    <input type="file" id="wizard-picture1" name="upload" >
                                                </div>
                                                <h6>Choose Picture</h6>
                                           </div>
                                    <!--   <input id="wizard-picture" class="form-control" type="text" placeholder="id" name="wizard-picture"> -->
                                      <input id="userId1" class="form-control" type="text" value="${dto.userId}" name="userId" readonly="readonly" >
                                      <input id="pwd1" class="form-control" type="password" value="${dto.pwd}" name="pwd">
                                      <input id="pwd_confirm1" class="form-control" type="password" value="${dto.pwd}" name="pwd_confirm">
                                      <input id="userName1" class="form-control" type="text" value="${dto.userName}" name="userName" readonly="readonly">
                                      <input id="email11" class="form-control" type="text" value="${dto.email}" name="email">
                                      <input id="birth1" class="form-control" type="text" value="${dto.birth}" name="birth">
                                      <input id="phone1" class="form-control" type="text" value="${dto.phone}" name="phone">
                                       <input id="checking1" type="hidden" name="checking1">
                                       <input name="profile" type="hidden" value="${dto.profile}"> 
                                           </div>
                                <input class="btn btn-default btn-register" onclick="updateMember();" value="수정 완료">
                                
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>                        
                </div>
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
