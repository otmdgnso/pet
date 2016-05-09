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
                    <div class='top-login'><i class="fa fa-plus"></i><a class='reg-top' href='#'>Register</a><i class="fa fa-lock"></i><a href='#'>Login</a></div>
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
					<a class="logo" href="#"><img src="<%=cp%>/res/images/icon/dog.JPG" width="40" alt=""/></a>
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
                                              <li><a href="#">예약하기</a></li>
                                              <li><a href="#">경매</a></li>
                                              <li><a href="#">분양</a></li>
                                            </ul>
									</section>
                                    <section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/icon/professor.JPG" width="40" alt="" />
                                        <h3>전문가</h3>
                                            <ul>
                                              <li><a href="<%=cp%>/expert/expert">전문가 이야기</a></li>
                                              <li><a href="#">전문가에게 묻기</a></li>
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