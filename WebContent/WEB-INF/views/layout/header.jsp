<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div id="loader-wrapper">
        <div id="loader"></div>
    </div>
    <section class='section-top-header'>
      <div class='top-header'>
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                     <div class='top-contact'><i class="fa fa-phone"></i><span>02 336 8546~8</span><i class="fa fa-envelope"></i><span>info@pet.com</span></div>
                    <div class='top-login'><i class="fa fa-plus"></i><a data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">Register</a><i class="fa fa-lock"></i> <a data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">Log in</a></div>
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
					<a class="logo" href="<%=cp%>/main"><img src="<%=cp%>/res/images/icon/dog.JPG" width="40" alt=""/></a>
				</li>	
					
                <!-- 호스팅버튼 -->
				<li class="weather">
					<a class="top-menu-txt" href="#"></i>호스팅하기</a>
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
                                              <li><a href="<%=cp%>/reservation/created">예약하기</a></li>
                                              <li><a href="#">경매</a></li>
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
				</li>				
				<!--/ 메뉴 -->		
			</ul>
			<!--/ mega menu -->
          </div>
          
          <nav id="mobile-menu-01" class="mobile-menu">
                <div class="line-logo">
					    <a class="logo" href="#"><img src="<%=cp%>/res/images/logo.jpg" alt=""/></a><i class="fa fa-bars"></i>
				    </div>	
                <div class="clear"></div>
                <ul class="travel-mega-menu-mobile">		

				<!-- 호스팅버튼 -->
				<li class="weather">
					<a class="top-menu-txt" href="#"></i>호스팅하기</a>
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
                                <div class="social">
                                    <a id="facebook_login" class="circle facebook" href="/auth/facebook">
                                        <i class="fa fa-facebook fa-fw"></i>
                                    </a>
                                </div>
                                <div class="division">
                                    <div class="line l"></div>
                                      <span>or</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="post" action="/login" accept-charset="UTF-8">
                                    <input id="email" class="form-control" type="text" placeholder="Email" name="email">
                                    <input id="password" class="form-control" type="password" placeholder="Password" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="Login" onclick="loginAjax()">
                                    </form>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                             <div class="form">
                                <form method="post" html="{:multipart=>true}" data-remote="true" action="/register" accept-charset="UTF-8">
                                <input id="userId" class="form-control" type="text" placeholder="id" name="userId">
                                <input id="pwd" class="form-control" type="password" placeholder="Password" name="password">
                                <input id="password_confirmation" class="form-control" type="password" placeholder="Repeat Password" name="password_confirmation">
                                <input id="userName" class="form-control" type="text" placeholder="이름" name="userName">
                                <input id="phone" class="form-control" type="text" placeholder="010-1234-1234" name="tel">
                                <input id="email" class="form-control" type="text" placeholder="abc@abc.com" name="email">
                                <input id="birth" class="form-control" type="text" placeholder="1991-12-23" name="birth">
                                 <input id="profile" class="form-control" type="file">
                                <input class="btn btn-default btn-register" onclick="insertMember();" value="Create account">
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