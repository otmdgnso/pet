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
		url="<%=cp%>/member/info";
	} else if(idx==1) {
		url="<%=cp%>/member/hosting";
	} else if(idx==4) {
		url="<%=cp%>/member/photo";
	} else if(idx==5) {
		url="<%=cp%>/member/auction";
	} else if(idx==6) {
		url="<%=cp%>/member/adopt";
	}
	$.get(url, {}, function(data){
		id.html(data);
	});
}

$(function(){
	tabContent(0);
});

$(document).ready(function() {
         "use strict";
         $('#horizontalTab')
               .responsiveTabs(
                     {
                        rotate : false,
                        startCollapsed : 'accordion',
                        collapsible : 'accordion',
                        setHash : true,
                        animation : 'slide',
                        activate : function(e, tab) {
                               if(tab.id!=2 && tab.id!=3)
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

function searchList() { 

 	var searchHost = $("#searchHost").val();
 	var searchState = "";
 	
 	
 	var searchState = $(':radio[name="searchState"]:checked').val();
 
	$.ajax({
	  url: "<%=cp%>/reservation/list"
	  ,type:"post"
	  ,data : {searchHost:searchHost,searchState:searchState}
	}).done(function(data) {
		$("#ajaxReserveList").html('');
		$("#ajaxReserveList").html(data);
	}); 
}

function auctionList() {
	$.ajax({
		url:"<%=cp%>/auction/list"
		,type:"post"
	}).done(function(data){
		$("#ajaxAuctionList").html('');
		$("#ajaxAuctionList").html(data);
	});
	
	
}

function deleteReservation(reservationNum) {
	var params="reservationNum="+reservationNum;
	var url="<%=cp%>/reservation/delete?"+params;
	
	if(confirm("정말 삭제할까요?")) {
		location.href=url;
	}
}

function updateReservation(reservationNum) {
	var params="reservationNum="+reservationNum;
	var url="<%=cp%>/reservation/update?"+params; 
	location.href=url;
}

function payReservation(reservationNum,hostNum){
	var params="reservationNum="+reservationNum;
	params += "&hostNum="+hostNum;
	var url="<%=cp%>/pay/reservepay?"+params;
	location.href=url;
}

//예약목록
$("#tab-2").ready(function(){

	// ajax 처리 - 예약목록
	$.ajax({
	  url: "<%=cp%>/reservation/list"
	}).done(function(data) {
		$("#ajaxReserveList").html(data);
	});

});	
//경매목록
$("#tab-5").ready(function(){

	// ajax 처리 - 예약목록
	$.ajax({
	  url: "<%=cp%>/auction/list"
	}).done(function(data) {
		$("#ajaxAuctionList").html(data);
	});

});	

$("#tab-3").ready(function(){
	// ajax 처리 - 북마트목록
	$.ajax({
	  url: "<%=cp%>/member/bookmark"
	}).done(function(data) {
		$("#ajaxBookmarkList").html(data);
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
                     <li><a href="#tab-0">INFO</a></li>
                     <li><a href="#tab-1">호스팅 목록</a></li>
                     <li><a href="#tab-2">예약 목록</a></li>
                     <li><a href="#tab-3">북마크 목록</a></li>
                     <li><a href="#tab-4">포토갤러리</a></li>
                     <li><a href="#tab-5">경매 목록</a></li>
                     <li><a href="#tab-6">분양 목록</a></li>
                  </ul>

				<div id="tab-0" style="width: 100%; min-height: 600px;"></div>
				<div id="tab-1" style="width: 100%; min-height: 600px;"></div>
				
				<div id="tab-2" style="width: 100%; min-height: 600px;">
					<div id="ajaxReserveList"></div>
				</div>
		
				<div id="tab-3" style="width: 100%; min-height: 600px;">
					<!-- 북마크 -->                     
				    <div id="ajaxBookmarkList"></div>
				</div>

				<div id="tab-5" style="width: 100%; min-height: 600px;">
					<div id="ajaxAuctionList"></div>
				</div>
				<div id="tab-6" style="width: 100%; min-height: 600px;"></div>
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



      
</body>
