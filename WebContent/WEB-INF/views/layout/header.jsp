<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link href="<%=cp%>/res/css/gsdk-base.css" rel="stylesheet" type="text/css" />
<!--  <script type="text/javascript" src="<%=cp%>/res/js/jquery.form.js"></script> -->
<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>

<style type="text/css"> 
/* .zeta-menu-bar {
  background: hotpink;
  display: inline-block;
  width: 100%;
} */
.zeta-menu { margin: 0; padding: 0; width: 130px;}
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: pink; }
.zeta-menu li.expand { background: white; }
.zeta-menu li.expand>a { color: hotpink; }
.zeta-menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu li ul li{
	padding: 20px;
	width: 100%;
}
.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 100%;
  top: 0;
  width: 180px;
  background: white;
}
/* .zeta-menu ul li { float: none;  } */
.zeta-menu ul li.expand { background: #ddd; }
.zeta-menu ul li.expand a { color: black; }
.zeta-menu ul a { color: black; }

</style>

<script type="text/javascript">
/* $(function(){
	$("ul.sub").hide();
	  $("ul.menu li").click(function(e){
		 $("ul:not(:animated)",this).slideDown("fast"); 
	  },
	  function(e){
		$("ul",this).slideUp("fast");  
	  });
}); */
$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+"▶" );
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});

function loginSend(){
    var url="<%=cp%>/member/login";       
    var params="louserId="+$("#louserId").val()+"&lopwd="+$("#lopwd").val()
     $.ajax({
    	url:url
    	,data:params
    	,type:"post"
    	,dataType:"json"
    	,success:function(data){
    		if(data.state=="false") {
    			shakeModal();
    		} else {    			
    			location.href="<%=cp%>";
    		}
    		
    	}
     });
}
function registerMember(){
    var url="<%=cp%>/member/register";       
    // var f=$("#joinForm");
    var f=$("form")[2];
    checked();   
    
    var formData=new FormData(f);
    
     $.ajax({
    	url:url
    	,type:"post"
    	,processData:false
    	,contentType:false
    	,data:formData
    	,dataType:"json"
    	,success:function(data){
    		if(data.state=="false") {
    		
    		} else {     		  			
    			location.href="<%=cp%>";
    		}
    		
    	}
     });
}

function userIdCheck(){
	var userId=$("#userId").val();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
		shakeModalMember("아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.");
		$("#userId").focus();
		return false;
	}
	
	var url="<%=cp%>/memeber/userIdCheck";
	var params="userId="+userId;
	$.ajax({
		url:url
		,type:"POST"
		,data:params
		,dataType:"json"
		,success:function(data){
			if(data.passed=="true"){
				
			}else{
				shakeModalMember(userId+"아이디는 사용이 불가능합니다.");
				$("#userId").focus();
			}
		}
	});
}

function checked() {
	var f=$("form")[2];
	var str;
	
	str=f.upload.value;
	if(!str){
		shakeModalMember('사진을 등록하세요!');
		return false;
	}
	
	str=f.userId.value;
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) {		
		f.userId.focus();
		userIdCheck();
		return false;
	}
	
	str = f.pwd.value;
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		f.pwd.focus();
		shakeModalMember('패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야합니다!');
		return false;
	}
	
	if(f.pwd_confirm.value != str) {
		f.pwd_confirm.focus();
		shakeModalMember('비밀번호를 동일하게 입력하세요!');
		return false;
	} 
	   str = f.userName.value;
	    if(!/^[가-힣]{2,4}$/.test(str)) {
	        f.userName.focus();
	        shakeModalMember('이름이 잘못된 형식입니다!');
	        return false;
	    }
	
    str = f.email.value;
    if(!isValidEmail(str)) {
        f.email.focus();
        shakeModalMember('이메일 형식이 잘못되었습니다!');
        return false;
    }
    str = f.birth.value;
    if(!isValidDateFormat(str)) {
        f.birth.focus();
        shakeModalMember('생일형식이 잘못 되었습니다. "1991-12-23" 이렇게 입력!');
        return false;
    }
    str = f.phone.value;
    if(!/^\d{3}-\d{3,4}-\d{4}$/.test(str)) {
        f.phone.focus();
        shakeModalMember('전화 번호 형식을 확인하세요!');
        return false;
    }    
    f.checking.value="true";
    return true;
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("아이디 또는 패스워드가 일치하지 않습니다.");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}

function shakeModalMember(msg){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html(msg);
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}

</script>

<div id="loader-wrapper">
        <div id="loader"></div>
    </div>
    <section class='section-top-header'>
      <div class='top-header'>
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                     <div class='top-contact'><i class="fa fa-phone"></i><span>02 336 8546~8</span><i class="fa fa-envelope"></i><span>info@pet.com</span></div>
              <c:if test="${empty sessionScope.member}">
                    <div class='top-login'><i class="fa fa-plus"></i><a data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">Register</a><i class="fa fa-lock"></i> <a data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">Log in</a></div>
              </c:if>
              <c:if test="${not empty sessionScope.member}">
              		 <div class='top-login'><i class="fa fa-plus"><a href="<%=cp%>/message/list">메시지</a></i><span>${sessionScope.member.userName}</span>님
              		 <i class="fa fa-lock"></i> <a href="javascript:void(0)" onclick="location.href='<%=cp%>/member/logout'">Logout</a>
              		<i class="glyphicon glyphicon-user" style="color: white;"></i><a href="<%=cp%>/member/blog">마이페이지</a></div>
              </c:if>
              
              </div>
            </div>
        </div>
      </div>
    </section>
	<section>
      <div class="top-mega-menu">
        <div class="container">
      <!-- mega menu -->
			<ul class="travel-mega-menu travel-mega-menu-anim-scale travel-mega-menu-response-to-icons">		
                <li class="line-logo">
					<a class="logo" href="<%=cp%>"><img src="<%=cp%>/res/images/icon/dog.JPG" width="40"/></a>
				</li>
				<li class="line-logo">	
					<a class="logo" href="<%=cp%>"><img src="<%=cp%>/res/images/icon/title.jpg" height="40px"/></a>
				</li>	
                <!-- 호스팅버튼 -->
				<li class="weather">
					<a class="top-menu-txt" href="#">호스팅하기</a>
				</li>
				<!--/ 호스팅버튼 -->
				
				<!-- 메뉴 -->
				<li class="center">
					<a class="top-menu-txt" href="#">메뉴</a>
					<div class="grid-container10 destination">
                        <form>
							<fieldset>					
								<div class="row">
									<section class="col col-md-3 destination-img">	
											<img src="<%=cp%>/res/images/icon/menu.JPG" width="40" alt="" />
                                            <h3>메뉴</h3>
                                            <ul>
                                              <li><a href="<%=cp%>/house/list">예약</a></li>
                                              <li><a href="<%=cp%>/auction/list">경매</a></li>
                                              <li><a href="<%=cp%>/adopt/list">분양</a></li>
                                            </ul>
									</section>
                                    <section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/icon/professor.JPG" width="40" alt="" />
                                        <h3>전문가</h3>
                                            <ul>
                                              <li><a href="<%=cp%>/expert/expert">전문가 이야기</a></li>
                                              <li><a href="<%=cp%>/qna/qna">전문가에게 묻기</a></li>
                                            </ul>
									</section>
                                    <section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/icon/photo.JPG" width="40" alt="" />
                                        <h3>커뮤니티</h3>
                                            <ul>
                                              <li><a href="<%=cp%>/photo/photo">사진</a></li>
                                            </ul>
									</section>
								</div>
							</fieldset>						
						</form>
					</div>
				</li>
				
				<li>
					<a class="top-menu-txt" href="#">도움말</a>
				<div >
					 <ul class="zeta-menu">	
					 	<li><a href="#">호스팅방법</a>
					 		<ul>
					 			<li><p style="color: black; font-size: 15pt;">
					 						호스팅 방법? 샬라 샬라 샬라</p></li>
					 		</ul>
					 	</li>
						   
						<li><a href="#">경매방법</a>
							<ul>
								<li><p style="color: black; font-size: 15pt;">
					 						경매방법 호호호호호호</p></li>
							</ul>
						</li>		
						
						<li><a href="#">분양방법</a>
							<ul>
								<li><p style="color: black; font-size: 15pt;">
					 						분양방법 호호호호호호</p></li>
							</ul>
						</li>	
						
						<li><a href="#">예약방법</a>
							<ul>
								<li><p style="color: black; font-size: 15pt;">
					 						예약방법 호호호호호호</p></li>
							</ul>
						</li>						    
				    </ul>	
				</div>
				
				</li>				
				<!--/ 메뉴 -->		
			</ul>
			<!--/ mega menu -->
          </div>
          
          <nav id="mobile-menu-01" class="mobile-menu">
                <div class="line-logo">
					    <a class="logo" href="#"><img src="<%=cp%>/res/images/icon/dog.JPG" width="40" alt=""/></a><i class="fa fa-bars"></i>
				    </div>	
                <div class="clear"></div>
                <ul class="travel-mega-menu-mobile">		

				<!-- 호스팅버튼 -->
				<li class="weather">
					<a class="top-menu-txt" href="#">호스팅하기</a>
				</li>
				<!--/ 호스팅버튼 -->
				
				<!-- 메뉴 -->
				<li>
					<a class="top-menu-txt" href="#">예약하기</a>
				</li>
				
				<li>
					<a class="top-menu-txt" href="#">경매</a>
				</li>

				<li>
					<a class="top-menu-txt" href="#">분양</a>
				</li>
						
				<li>
					<a class="top-menu-txt" href="#">전문가</a>
                    <div class="grid-container3 blue-link">
						<ul>
							<li><a href="#">정보</a></li>
                            <li><a href="#">Q&A</a></li>
						</ul>
					</div>
				</li>

				<li>
					<a class="top-menu-txt" href="#">사진</a>
				</li>				
				<!--/ 메뉴 -->
			</ul>
			<!--/ mega menu -->
          </nav>

        </div>
    </section>
    
	<!-- 모달 팝업 -->
<div class="container">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">HELP</h4>
				</div>
				<div class="modal-body" style="color: black;">
					 <table>
					 	<tr>
					 	gdgd
					 	</tr>
					 </table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 로그인, 로그아웃 시작 -->    
     <div class="container">
		 <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Login with</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form>
                                    <input id="louserId" class="form-control" type="text" placeholder="userId" name="userId">
                                    <input id="lopwd" class="form-control" type="password" placeholder="pwd" name="pwd">
                                    <input class="btn btn-default btn-login" type="button" value="Login" onclick="loginSend()">
                                    </form>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                             <div class="form">
                                <form id="joinForm" enctype="multipart/form-data" method="post">
                              		<div class="card wizard-card ct-wizard-orange" id="wizardProfile">
		                                     <div class="picture-container">
		                                          <div class="picture">
		                                              <img src="<%=cp%>/res/img/default-avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
		                                              <input type="file" id="wizard-picture" name="upload">
		                                          </div>
		                                          <h6>Choose Picture</h6>
		                                     </div>
		                              <!--   <input id="wizard-picture" class="form-control" type="text" placeholder="id" name="wizard-picture"> -->
		                                <input id="userId" class="form-control" type="text" placeholder="아이디는 5~10자, 첫글자는 영문자" name="userId" onchange="userIdCheck();">
		                                <input id="pwd" class="form-control" type="password" placeholder="하나 이상의 숫자나 특수문자가 포함" name="pwd">
		                                <input id="pwd_confirm" class="form-control" type="password" placeholder="Repeat Password" name="pwd_confirm">
		                                <input id="userName" class="form-control" type="text" placeholder="이름" name="userName">
		                                <input id="email1" class="form-control" type="text" placeholder="email 입력" name="email">
		                                <input id="birth" class="form-control" type="text" placeholder="생년 월일 입력" name="birth">
		                                <input id="phone" class="form-control" type="text" placeholder="010-0000-0000" name="phone">
		                              	<input id="checking" type="hidden" name="checking">
		                                     </div>
                                <input class="btn btn-default btn-register" onclick="registerMember();" value="Create account">
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>Looking to 
                                 <a href="javascript: showRegisterForm();">create an account</a>
                            ?</span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>Already have an account?</span>
                             <a href="javascript: showLoginForm();">Login</a>
                        </div>
                    </div>        
    		      </div>
		      </div>
		  </div>
    </div>
    <!-- 로그인, 로그아웃 끝 -->   
    
 <script src="<%=cp%>/res/js/reg/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/reg/wizard.js" type="text/javascript"></script>