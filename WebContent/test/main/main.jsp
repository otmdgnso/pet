<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="travel, trip, store, shopping, siteweb, cart">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700,700italic' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'/>


        <link href="<%=cp%>/res/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/animate.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/settings_slide2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />
        
 		<script src="<%=cp%>/res/js/jquery-1.12.3.min.js" type="text/javascript"></script>
		<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js" type="text/javascript"></script>
		<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>
</head>
<body>
<div id="loader-wrapper">
        <div id="loader"></div>
    </div>
    <section class='section-top-header'>
      <div class='top-header'>
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                    <div class='top-contact'><i class="fa fa-phone"></i><span>+12 123 456 789</span><i class="fa fa-envelope"></i><span>info@travego.com</span></div>
                    <div class='top-login'><i class="fa fa-plus"></i><a class='reg-top' href='#'>Register</a><i class="fa fa-lock"></i><a href='#'>Login</a>
                        <div class="header-lang">
				            <a href="#"><img alt="" src="<%=cp%>/res/images/flags/en.gif"/></a>
				            <div class="langs-drop" style="display: none;">
					            <div><a href="#" class="langs-item en">english</a></div>
					            <div><a href="#" class="langs-item fr">francais</a></div>
					            <div><a href="#" class="langs-item de">deutsch</a></div>
					            <div><a href="#" class="langs-item it">italiano</a></div>
				            </div>
			            </div>
                    </div>
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
					<a class="logo" href="#"><img src="<%=cp%>/res/images/logo.jpg" alt=""/></a>
				</li>		
                
				<li>
					<a class="top-menu-txt" href="#">Home</a>
                    <div class="grid-container3 blue-link">
						<ul>
							<li><a href="index.html">Home Layout</a></li>
                            <li><a href="homepage1.html">Home Layout1</a></li>
							<li><a href="homepage2.html">Home Layout2</a></li>
							<li><a href="homepage3.html">Home Layout3</a></li>
                            <li><a href="homepage4.html">Home Layout4</a></li>
                            <li><a href="homepage5.html">Home Layout5</a></li>
                            <li><a href="homepage_oxy_slider.html">Home Oxy Slider</a></li>
                            <li><a href="homepage_map.html">Home Map</a></li>
						</ul>
					</div>
				</li>
				
				<!-- resume -->
				<li class="center">
					<a class="top-menu-txt" href="#">Destination</a>
					<div class="grid-container10 destination">
                        <form>
							<fieldset>					
								<div class="row">
									<section class="col col-md-3 destination-img">	
											<img src="<%=cp%>/res/images/continent/continent_1.png" alt="" />
                                            <h3>North America</h3>
                                            <ul>
                                              <li><a href="guide.html">Canada</a></li>
                                              <li><a href="guide.html">Hawai</a></li>
                                              <li><a href="guide.html">Alaska</a></li>
                                            </ul>
									</section>
									<section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/continent/continent_2.png" alt="" />
                                        <h3>South America</h3>
                                            <ul>
                                              <li><a href="guide.html">Brazil</a></li>
                                              <li><a href="guide.html">Argentina</a></li>
                                              <li><a href="guide.html">Jamaica</a></li>
                                              <li><a href="guide.html">Columbia</a></li>
                                              <li><a href="guide.html">Peru'</a></li>
                                            </ul>
									</section>
                                    <section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/continent/continent_3.png" alt="" />
                                        <h3>Africa</h3>
                                            <ul>
                                              <li><a href="guide.html">Marocco</a></li>
                                              <li><a href="guide.html">Tunisia</a></li>
                                              <li><a href="guide.html">Egipt</a></li>
                                              <li><a href="guide.html">Kenya</a></li>
                                              <li><a href="guide.html">Tanzania</a></li>
                                            </ul>
									</section>
                                    <section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/continent/continent_4.png" alt="" />
                                        <h3>Europe</h3>
                                            <ul>
                                              <li><a href="guide.html">Italy</a></li>
                                              <li><a href="guide.html">France</a></li>
                                              <li><a href="guide.html">Greece</a></li>
                                              <li><a href="guide.html">Spain</a></li>
                                              <li><a href="guide.html">Germany</a></li>
                                            </ul>
									</section>
                                    <section class="col col-md-3 destination-img">
										<img src="<%=cp%>/res/images/continent/continent_5.png" alt="" />
                                        <h3>Asia</h3>
                                            <ul>
                                              <li><a href="guide.html">Australia</a></li>
                                              <li><a href="guide.html">China</a></li>
                                              <li><a href="guide.html">India</a></li>
                                              <li><a href="guide.html">Indonesia</a></li>
                                              <li><a href="guide.html">Singapore</a></li>
                                            </ul>
									</section>
								</div>
							</fieldset>						
						</form>
					</div>
				</li>
				<!--/ resume -->
                <!-- hotels -->
				<li>
					<a class="top-menu-txt" href="list-trip.html">Hotels</a>
				</li>
				<!--/ hotels -->
                <!-- hotels -->
				<li>
					<a class="top-menu-txt" href="list-fly.html">Fly</a>
				</li>
				<!--/ hotels -->
				<!-- page -->
				<li class="center">
					<a class="top-menu-txt" href="#">Pages</a>
					<div class="grid-container7 destination blue-link">
                        <form>
							<fieldset>					
								<div class="row">
									<section class="col col-md-4">	
                                            <h3>Standard</h3>
                                            <ul>
                                              <li><a href="about.html">About Us 1</a></li>
                                              <li><a href="about2.html">About Us 2</a></li>
                                              <li><a href="services1.html">Services 1</a></li>
                                              <li><a href="services2.html">Services 2</a></li>
                                              <li><a href="information.html">Information</a></li>
                                            </ul>
									</section>
									<section class="col col-md-4">
                                        <h3>Extra</h3>
                                            <ul>
                                              <li><a href="list-trip.html">Catalog</a></li>
                                              <li><a href="details.html">Details</a></li>
                                              <li><a href="gallery-4col.html">Gallery 4 Col</a></li>
                                              <li><a href="gallery-3col.html">Gallery 3 Col</a></li>
                                              <li><a href="gallery-2col.html">Gallery 2 Col</a></li>
                                              
                                            </ul>
									</section>
                                    <section class="col col-md-4">
                                        <h3>Special</h3>
                                            <ul>
                                              <li><a href="blog.html">Blog</a></li>
                                              <li><a href="blog-lft-col.html">Blog Left Sidebar</a></li>
                                              <li><a href="blog-rgh-col.html">Blog Right Sidebar</a></li>
                                              <li><a href="guide.html">Travego Guide</a></li>
                                              <li><a href="meteo.html">Tracego Weather</a></li>
                                            </ul>
									</section>
								</div>
							</fieldset>						
						</form>
						
					</div>
				</li>
				<!--/ page -->
				
				<!-- contacts -->
				<li>
					<a class="top-menu-txt" href="contact.html"><i class="fa fa-phone"></i>Contacts</a>
					<div class="grid-container3 blue-link">
						<ul>
							<li><a href="contact.html"><i class="fa fa-twitter"></i>Twitter</a></li>
							<li><a href="contact.html"><i class="fa fa-facebook"></i>Facebook</a></li>
							<li><a href="contact.html"><i class="fa fa-google-plus"></i>Google Plus</a></li>
						</ul>
					</div>
				</li>
				<!--/ contacts -->
				
				<!-- weather -->
				<li class="weather">
					<a class="top-menu-txt" href="meteo.html"><i class="fa fa-cloud"></i>Weather</a>
				</li>
				<!--/ weather -->
			</ul>
			<!--/ mega menu -->
          </div>
          
          <nav id="mobile-menu-01" class="mobile-menu">
                <div class="line-logo">
					    <a class="logo" href="#"><img src="<%=cp%>/res/images/logo.jpg" alt=""/></a><i class="fa fa-bars"></i>
				    </div>	
                <div class="clear"></div>
                <ul class="travel-mega-menu-mobile">		

				<!-- about -->
				<li class="line-mini-menu k-opn">
					<a class="top-menu-txt" href="#">Home</a>
                    <div class="grid-container3 collapse blue-link">
						<ul>
							<li><a href="index.html">Home Layout</a></li>
                            <li><a href="homepage1.html">Home Layout1</a></li>
							<li><a href="homepage2.html">Home Layout2</a></li>
							<li><a href="homepage3.html">Home Layout3</a></li>
                            <li><a href="homepage_oxy_slider.html">Home Oxy Slider</a></li>
                            <li><a href="homepage_map.html">Home Map</a></li>
						</ul>
					</div>
				</li>
				<!--/ about -->
				
				<!-- resume -->
				<li class="line-mini-menu k-opn">
					<a class="top-menu-txt" href="#">Destination</a>
					<div class="grid-container10 destination collapse blue-link">
                        <form>
							<fieldset>					
								<div class="row">
									<section class="col destination-img">	
											
                                            <h3>North America</h3>
                                            <ul>
                                              <li><a href="guide.html">Canada</a></li>
                                              <li><a href="guide.html">Hawai</a></li>
                                              <li><a href="guide.html">Alaska</a></li>
                                            </ul>
									</section>
									<section class="col destination-img">
										
                                        <h3>South America</h3>
                                            <ul>
                                              <li><a href="guide.html">Brazil</a></li>
                                              <li><a href="guide.html">Argentina</a></li>
                                              <li><a href="guide.html">Jamaica</a></li>
                                              <li><a href="guide.html">Columbia</a></li>
                                              <li><a href="guide.html">Peru'</a></li>
                                            </ul>
									</section>
                                    <section class="col destination-img">
										
                                        <h3>Africa</h3>
                                            <ul>
                                              <li><a href="guide.html">Marocco</a></li>
                                              <li><a href="guide.html">Tunisia</a></li>
                                              <li><a href="guide.html">Egipt</a></li>
                                              <li><a href="guide.html">Kenya</a></li>
                                              <li><a href="guide.html">Tanzania</a></li>
                                            </ul>
									</section>
                                    <section class="col destination-img">
										
                                        <h3>Europe</h3>
                                            <ul>
                                              <li><a href="guide.html">Italy</a></li>
                                              <li><a href="guide.html">France</a></li>
                                              <li><a href="guide.html">Greece</a></li>
                                              <li><a href="guide.html">Spain</a></li>
                                              <li><a href="guide.html">Germany</a></li>
                                            </ul>
									</section>
                                    <section class="col destination-img">
										
                                        <h3>Asia</h3>
                                            <ul>
                                              <li><a href="guide.html">Australia</a></li>
                                              <li><a href="guide.html">China</a></li>
                                              <li><a href="guide.html">India</a></li>
                                              <li><a href="guide.html">Indonesia</a></li>
                                              <li><a href="guide.html">Singapore</a></li>
                                            </ul>
									</section>
								</div>
							</fieldset>						
						</form>
					</div>
				</li>
				<!--/ resume -->
                <!-- hotels -->
				<li class="k-opn">
					<a class="top-menu-txt" href="list-trip.html">Hotels</a>
				</li>
				<!--/ hotels -->
                <!-- hotels -->
				<li class="k-opn">
					<a class="top-menu-txt" href="list-fly.html">Fly</a>
				</li>
				<!--/ hotels -->
				<!-- page -->
				<li class="line-mini-menu k-opn">
					<a class="top-menu-txt" href="#">Pages</a>
					<div class="grid-container7 destination collapse blue-link">
                        <form>
							<fieldset>					
								<div class="row">
									<section class="col">	
                                            <h3>Standard</h3>
                                            <ul>
                                              <li><a href="about.html">About Us 1</a></li>
                                              <li><a href="about2.html">About Us 2</a></li>
                                              <li><a href="services1.html">Services 1</a></li>
                                              <li><a href="services2.html">Services 2</a></li>
                                              <li><a href="information.html">Information</a></li>
                                            </ul>
									</section>
									<section class="col">
                                        <h3>Extra</h3>
                                            <ul>
                                              <li><a href="list-trip.html">Catalog</a></li>
                                              <li><a href="details.html">Details</a></li>
                                              <li><a href="gallery-4col.html">Gallery 4 Col</a></li>
                                              <li><a href="gallery-3col.html">Gallery 3 Col</a></li>
                                              <li><a href="gallery-2col.html">Gallery 2 Col</a></li>
                                              
                                            </ul>
									</section>
                                    <section class="col">
                                        <h3>Special</h3>
                                            <ul>
                                              <li><a href="blog.html">Blog</a></li>
                                              <li><a href="blog-lft-col.html">Blog Left Sidebar</a></li>
                                              <li><a href="blog-rgh-col.html">Blog Right Sidebar</a></li>
                                              <li><a href="guide.html">Travego Guide</a></li>
                                              <li><a href="meteo.html">Tracego Weather</a></li>
                                            </ul>
									</section>
								</div>
							</fieldset>						
						</form>
						
					</div>
				</li>
				<!--/ page -->
				
				<!-- contacts -->
				<li class="line-mini-menu k-opn">
					<a class="top-menu-txt" href="contact.html"><i class="fa fa-phone"></i>Contacts</a>
					<div class="grid-container3 collapse blue-link">
						<ul>
							<li><a href="contact.html"><i class="fa fa-twitter"></i>Twitter</a></li>
							<li><a href="contact.html"><i class="fa fa-facebook"></i>Facebook</a></li>
							<li><a href="contact.html"><i class="fa fa-google-plus"></i>Google Plus</a></li>
						</ul>
					</div>
				</li>
				<!--/ contacts -->
				
				<!-- weather -->
				<li class="k-opn">
					<a class="top-menu-txt" href="meteo.html"><i class="fa fa-cloud"></i>Weather</a>
				</li>
				<!--/ weather -->
			</ul>
			<!--/ mega menu -->
          </nav>

        </div>
    </section>
	
      <section class="top-content">
        <div class="container-slider removeslide">
          <div class="container-reservation inside-slider">
           <div class="container">
            <div class="row">
              <div class="col-md-12">
                       <!-- 맡기기 검색 -->
                            <section id="reservation-form" class="reservation-color-form pos-inside-slide">
                              <div class="container-form-chose">
                                  <div class="col-md-12">  

                                   <!--개 맡기기 검색-->
                                   <div class="reservation-tabs">
                                        <div id="message"></div>
                                        <div class="row">
                                           <ul class="nav nav-tabs search-opt">
                                                    <li class="active"><a href="#hotels-tab" data-toggle="tab"><img alt="" src="<%=cp%>/res/img/bone.png"> 맡기기  </a></li>
                                                    <li class=""><a href="#auction-tab" data-toggle="tab"><img alt="" src="<%=cp%>/res/img/won.png"> 경매 검색</a></li>
                                                    <li class=""><a href="#sell-tab" data-toggle="tab"><img alt="" src="<%=cp%>/res/img/open-box.png"> 분양 검색</a></li>
                                                </ul>
                                        </div>
                                    </div>
                                    <div class="tab-content">
                                    <form id="hotels-tab" class="tab-pane form-inline reservation-hotel active" method="post" name="reservationform">
                                      <div class="row">
                                        <div class="col-sm-2 step-where">
                                          <div class="form-group">
                                            <h3><img alt="" src="<%=cp%>/res/img/book.png"> Where?</h3>
                                            <label for="adress">주소 입력</label>
                                            <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="본인의 주소를 입력하세요. 시, 도, 구까지 입력"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                            <input type="text" class="form-control" placeholder="City, region" id="adress" name="destination">
                                          </div>
                                        </div>
                                        <div class="col-sm-4 step-check">
                                          <h3><img alt="" src="<%=cp%>/res/img/clock.png"> When?</h3>
                                            <div class="col-sm-6 cc-in" style="padding-left:0">
                                              <div class="form-group">
                                                <label for="checkin">맡길 날짜</label>
                                                <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="맡기고 싶은 날짜 검색"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                                <div class="content-checkin-data">
                                                    <i class="fa fa-calendar infield"></i>
                                                    <input name="checkIn" type="text" id="checkin" value="" class="form-control checkin" placeholder="Check-in"/>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col-sm-6 cc-out" style="padding-left:0">
                                              <div class="form-group">
                                                <label for="checkout">찾을 날짜</label>
                                                <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="반려동물 되찾아갈 날짜"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                                <div class="content-checkin-data">
                                                    <i class="fa fa-calendar infield"></i>
                                                    <input name="checkout" type="text" id="checkOut" value="" class="form-control checkout" placeholder="Check-out"/>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 step-who" style="padding-left:0">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> Who?</h3>
                                            <div class="col-sm-4 room-book" style="padding-left:0">
                                              <div class="form-group">
                                                <label for="room">DOG or CAT</label>
                                                <select class="form-control" name="species" id="species">
                                                  <option class="opt-default" selected="selected" disabled="disabled">PET</option>
                                                  <option value="dog">DOG</option>
                                                  <option value="cat">CAT</option>
                                                </select>
                                              </div>
                                            </div>
                                            <div class="col-sm-4 adult-book">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>How many</label>
                                                  <!--<i class="fa fa-user infield"></i>-->
                                                        <select name="pet_su" id="pet_su" class="form-control">
                                                        <option disabled="disabled" selected="selected">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3 이상</option>
                                                      </select>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 colbtn">
                                          <button type="submit" class="btn btn-primary btn-block">Search Now</button>
                                        </div>
                                      </div>
                                    </form>
                                    <!--********************* 경매 검색 ********************-->
                                    <form id="auction-tab" class="tab-pane form-inline reservation-flight" method="post" name="auctionSearch">
                                      <div class="row">
                                        <div class="col-sm-4 flight-where" >
                                          <div class="form-group" >
                                            <h3> <img alt="" src="<%=cp%>/res/img/product.png"> 검색 상품</h3>
                                            <label for="auctionSubject">상품 명</label>
                                            <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="검색할 상품 입력"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                            <input type="text" class="form-control" placeholder="상품 이름" id="subject" name="subject" >
                                          </div>
                                        </div>
                                        <div class="col-sm-4 fly-who">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> Who?</h3>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>Dog or Cat</label>
                                                  
                                                      <select name="species" id="species" class="form-control">
                                                        <option value="dog">DOG</option>
                                                        <option value="cat">CAT</option>
                                                      </select>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 colbtn">
                                          <button type="submit" class="btn btn-primary btn-block">Search Now</button>
                                        </div>
                                      </div>
                                    </form>
                                    
                                        <!--********************* 분양 검색 ********************-->
                                    <form id="sell-tab" class="tab-pane form-inline reservation-flight" method="post" name="auctionSearch">
                                      <div class="row">
                                        <div class="col-sm-4 flight-where">
                                          <div class="form-group">
                                            <h3> <img alt="" src="<%=cp%>/res/img/dogplay.png">펫 검색</h3>
                                            <label for="auctionSubject">통합 검색</label>
                                            <input type="text" class="form-control" placeholder="품종을 입력하세요" id="species" name="species" >
                                          </div>
                                        </div>
                                        <div class="col-sm-4 fly-who">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> Who?</h3>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>Dog or Cat</label>
                                                  
                                                      <select name="species" id="species" class="form-control">
                                                        <option value="dog">DOG</option>
                                                        <option value="cat">CAT</option>
                                                      </select>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 fly-who">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> 가격 검색</h3>
                                             <p><input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;"></p>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">
                                                <div id="slider-range" style="width: 300px;"></div>
                                              </div>
                                            </div>
                                        </div>
                                           
                                        <div class="col-sm-2 colbtn">
                                          <button type="submit" class="btn btn-primary btn-block">Search Now</button>
                                        </div>
                                      </div>
                                    </form>
                                    </div><!--Close tab-content form-->
                                  </div>
                                
                              </div>
                      </section>
              </div>
            </div>
           </div>
           </div>
           <div class="home-page removeslide">
             <!-- SLIDER -->
                <div class="fullwidthbanner-container">
                    <div class="fullwidthbanner">
                    <video autoplay="" loop="" class="fillWidth fadeIn animated" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background" style="width: 100%; height: 100%;">
					    <source src="<%=cp%>/res/video/puppy.mp4"  type="video/mp4">
					</video>
					
					 <video autoplay="" loop="" class="fillWidth fadeIn animated" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background">
					    <source src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Traffic-blurred2.mp4" type="video/mp4">
					</video>
						
						<ul>
                        
                        
                            <!-- FADE -->
                            <!-- <li data-transition="fade" data-slotamount="10" data-thumb="">
                                <img src="http://placehold.it/1920x800" alt=""/>
                            </li> -->

                            <!-- SLIDEUP -->
                         <!--    <li data-transition="slideup" data-slotamount="7" data-thumb="">
                                <img src="http://placehold.it/1920x800" alt=""/>
                            </li> -->

                            <!-- SLIDEDOWN -->
                            <!-- <li data-transition="slidedown" data-slotamount="7" data-thumb="">
                                <img src="http://placehold.it/1920x800" alt=""/>
                            </li> -->
                        </ul>
                        <div class="tp-bannertimer"></div>
                    </div>
                </div>
                <!-- SLIDER END -->
           </div>
        </div>
</section>




<!-- TOP OFFERTS -->

<section id="top-offerts" class="box-tr-square">
   <div class="container">
      <div class="row">
         <div class="col-md-12 effect-5 effects">
            
               <div class="text-center top-txt-title">
                    <h2>THIS MONTH</h2>
                    <p>HOT HOST</p>
     			 </div>
                <!-- FIFTH EXAMPLE -->
                <div class="col-md-4 view view-fifth">
                    <figure class="triggerAnimation animated" data-animate="fadeInDown">
                        <div class="img">
                            <img src="http://placehold.it/640x462" alt=""/>
                            <div class="overlay">
                              <div class="expand discount">
                                <a href="#" class="expand discount">25%</a>
                                <a href="#" class="expand discount textdisc">discount</a>
                              </div>
                            </div>
                        </div>
                     </figure>
                    <div class="mask">
                        <div class="main">
                          <div class="trip-title"><h3>Hilton Hotel</h3><br /><p>Paris</p></div>
                          <div class="price"><p>From</p>€ 499</div>
                        </div>
                       <div class="content">
                          <p><span>A modern hotel room in Star Hotel</span> Nunc tempor erat in magna pulvinar fermentum.
                            malesuada metus.</p>
                          <div class="row">
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Private balcony</li>
                                <li><i class="fa fa-check-circle"></i> Sea view</li>
                              </ul>
                            </div>
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Free Wi-Fi</li>
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Bathroom</li>
                              </ul>
                            </div>
                          </div>
                          <a href="details.html" class="btn btn-primary btn-block">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 view view-fifth">
                    <figure class="triggerAnimation animated" data-animate="fadeInDown">
                       <div class="img">
                            <img src="http://placehold.it/640x462" alt=""/>
                            <div class="overlay">
                                <a href="#" class="expand discount">35%</a>
                                <a href="#" class="expand discount textdisc">discount</a>
                            </div>
                        </div>
                     </figure>
                    <div class="mask">
                        <div class="main">
                          <div class="trip-title"><h3>Meriot Hotel</h3><br /><p>Prague</p></div>
                          <div class="price"><p>From</p>€ 270</div>
                        </div>
                       <div class="content">
                          <p><span>A modern hotel room in Star Hotel</span> Nunc tempor erat in magna pulvinar fermentum.
                            malesuada metus.</p>
                          <div class="row">
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Private balcony</li>
                                <li><i class="fa fa-check-circle"></i> Sea view</li>
                              </ul>
                            </div>
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Free Wi-Fi</li>
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Bathroom</li>
                              </ul>
                            </div>
                          </div>
                          <a href="details.html" class="btn btn-primary btn-block">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 view view-fifth">
                    <figure class="triggerAnimation animated" data-animate="fadeInDown">
                        <div class="img">
                            <img src="http://placehold.it/640x462" alt=""/>
                            <div class="overlay">
                                <a href="#" class="expand discount">10%</a>
                                <a href="#" class="expand discount textdisc">discount</a>
                            </div>
                        </div>
                    </figure>
                    <div class="mask">
                        <div class="main">
                          <div class="trip-title"><h3>Burgi Hotel</h3><br /><p>Bali</p></div>
                          <div class="price"><p>From</p>€ 799</div>
                        </div>
                       <div class="content">
                          <p><span>A modern hotel room in Star Hotel</span> Nunc tempor erat in magna pulvinar fermentum.
                            malesuada metus.</p>
                          <div class="row">
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Private balcony</li>
                                <li><i class="fa fa-check-circle"></i> Sea view</li>
                              </ul>
                            </div>
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Free Wi-Fi</li>
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Bathroom</li>
                              </ul>
                            </div>
                          </div>
                          <a href="details.html" class="btn btn-primary btn-block">Read More</a>
                        </div>
                    </div>
                </div>
            </div><!--Close col 12 -->
        </div>
    </div>
 </section>   

 <section class='parallax-home'>
    <div class="container">
      <div class="row">
      <div class="col-md-4 middle-text-adv">
         <h3>Why Travego</h3>
         <div class="line-left"></div>
         <p>A modern hotel room in Star Hotel Nunc tempor erat in magna pulvinar fermentum. malesuada metus.</p>
         <p>A modern hotel room in Star Hotel Nunc tempor erat in magna pulvinar fermentum. malesuada metus.</p>
      </div>
        <div class='col-md-8'>
           <div class='col-md-6'>
              <div class='grid-info'>
                <div class='grid-icon'><i class="fa fa-taxi"></i></div>
                <h5 class="grid-title ">TAXI DISCOUNT</h5>
                <div class="grid-desc"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus facilisis cvallis.</p></div>
             </div>
           </div>   
           <div class='col-md-6'>
              <div class='grid-info'>
                <div class='grid-icon'><i class="fa fa-unlock-alt"></i></div>
                <h5 class="grid-title ">TRUST AND SECURITY</h5>
                <div class="grid-desc"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus facilisis cvallis.</p></div>
              </div>
           </div>
        
           <div class='col-md-6'>
             <div class='grid-info'>
                <div class='grid-icon'><i class="fa fa-cutlery"></i></div>
                <h5 class="grid-title ">BEST FOOD</h5>
                <div class="grid-desc"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus facilisis cvallis.</p></div>
             </div>
           </div>
         
           <div class='col-md-6'>
             <div class='grid-info'>
                <div class='grid-icon'><i class="fa fa-futbol-o"></i></div>
                <h5 class="grid-title ">BEST SPORTS</h5>
                <div class="grid-desc"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus facilisis cvallis.</p></div>
             </div>
           </div>
        </div>
     </div>
    </div>
 </section>    

 <!-- LAST MINUTES -->

<section id="lastminute-offerts" class="box-tr-square">
   <div class="container">
      <div class="row">
            <div class="text-center">
                    <h2>Last Minute</h2>
                    <p>Find your favorite place, feel more than home</p>
     			 </div>
            <div class="col-md-12 effect-5 effects">
              <div class="col-md-4 view view-fifth">
                     <figure class="triggerAnimation animated" data-animate="fadeInDown">
                        <div class="img">
                            <img src="http://placehold.it/640x462" alt=""/>
                            <div class="overlay">
                                <a href="#" class="expand discount">20%</a>
                                <a href="#" class="expand discount textdisc">discount</a>
                            </div>
                        </div>
                      </figure>
                    <div class="mask">
                         <div class="main">
                          <div class="trip-title"><h3>Hilton Hotel</h3><br /><p>London</p></div>
                          <div class="price"><p>From</p>€ 499</div>
                        </div>
                       <div class="content">
                          <p><span>A modern hotel room in Star Hotel</span> Nunc tempor erat in magna pulvinar fermentum.
                            malesuada metus.</p>
                          <div class="row">
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Private balcony</li>
                                <li><i class="fa fa-check-circle"></i> Sea view</li>
                              </ul>
                            </div>
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Free Wi-Fi</li>
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Bathroom</li>
                              </ul>
                            </div>
                          </div>
                          <a href="details.html" class="btn btn-primary btn-block">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 view view-fifth">
                    <figure class="triggerAnimation animated" data-animate="fadeInDown">
                        <div class="img">
                            <img src="http://placehold.it/640x462" alt=""/>
                            <div class="overlay">
                                <a href="#" class="expand discount">15%</a>
                                <a href="#" class="expand discount textdisc">discount</a>
                            </div>
                        </div>
                    </figure>
                    <div class="mask">
                        <div class="main">
                          <div class="trip-title"><h3>Ruka Hotel</h3><br /><p>Zanzibar</p></div>
                          <div class="price"><p>From</p>€ 550</div>
                        </div>
                       <div class="content">
                          <p><span>A modern hotel room in Star Hotel</span> Nunc tempor erat in magna pulvinar fermentum.
                            malesuada metus.</p>
                          <div class="row">
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Private balcony</li>
                                <li><i class="fa fa-check-circle"></i> Sea view</li>
                              </ul>
                            </div>
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Free Wi-Fi</li>
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Bathroom</li>
                              </ul>
                            </div>
                          </div>
                          <a href="details.html" class="btn btn-primary btn-block">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 view view-fifth">
                    <figure class="triggerAnimation animated" data-animate="fadeInDown">
                        <div class="img">
                            <img src="http://placehold.it/640x462" alt=""/>
                            <div class="overlay">
                                <a href="#" class="expand discount">10%</a>
                                <a href="#" class="expand discount textdisc">discount</a>
                            </div>
                        </div>
                     </figure>
                    <div class="mask">
                        <div class="main">
                          <div class="trip-title"><h3>Losi Hotel</h3><br /><p>Madrid</p></div>
                          <div class="price"><p>From</p>€ 299</div>
                        </div>
                       <div class="content">
                          <p><span>A modern hotel room in Star Hotel</span> Nunc tempor erat in magna pulvinar fermentum.
                            malesuada metus.</p>
                          <div class="row">
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Private balcony</li>
                                <li><i class="fa fa-check-circle"></i> Sea view</li>
                              </ul>
                            </div>
                            <div class="col-xs-6">
                              <ul class="list-unstyled">
                                <li><i class="fa fa-check-circle"></i> Free Wi-Fi</li>
                                <li><i class="fa fa-check-circle"></i> Incl. breakfast</li>
                                <li><i class="fa fa-check-circle"></i> Bathroom</li>
                              </ul>
                            </div>
                          </div>
                          <a href="details.html" class="btn btn-primary btn-block">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
</section>      

<section id="parallax_slide" class="service2-prx">
   <div class="effect-over">
             <div class="bx-about2">
                <ul class="bxslider all-info-trip long-pannel">
                            <li>
  	    	                 <img src="http://placehold.it/1920x600" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">Paris <a href="#" class="btn btn-primary btn-gallery">Buy Now</a></div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                                <p class="trip-big-price"><span> € 399</span></p>
                             </div>
  	    		            </li>
  	    		            <li>
  	    	                 <img src="http://placehold.it/1920x600" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">Venice <a href="#" class="btn btn-primary btn-gallery">Buy Now</a></div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                                <p class="trip-big-price"><span> € 490</span></p>
                             </div>
  	    		            </li>
  	    		            <li>
  	    	                 <img src="http://placehold.it/1920x600" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">London <a href="#" class="btn btn-primary btn-gallery">Buy Now</a></div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                                <p class="trip-big-price"><span> € 270</span></p>
                             </div>
  	    		            </li>
  	    		            <li>
  	    	                 <img src="http://placehold.it/1920x600" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">Prague <a href="#" class="btn btn-primary btn-gallery">Buy Now</a></div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                                <p class="trip-big-price"><span> € 599</span></p>
                             </div>
  	    		            </li>
                      </ul>
             </div><!--Close col-md-12-->
    </div>
</section>

<section id="parallax-footer" class="price-color-log">
   <div class="effect-over">
        <div class="container">
           <div class="row">
             <div class="col-md-12">
                <div class="col-md-4 prices content-blue">
                    <div class="price-table-circle basic blue-prices">
                         <div class="price-circle">
                          <div class="price-title"><h3>Basic</h3></div>
                          <div class="price-money"><h3>$10<span>/month</span></h3></div>
                          <ul>
                           <li><p>Flight 5% discount</p></li>
                           <li><p>Hotel 3% discount</p></li>
                           <li><p>Sport Bagage free</p></li>
                           <li><p>5 Free driks</p></li>
                           <li><p>Excursion 5% discount</p></li>
                           <li class="price-info"><a href="">Sign up</a></li>
                          </ul>
                         
                         </div>
                     </div>
                </div>
           
                <div class="col-md-4 prices content-green">
                     <div class="price-table-circle medium green-prices">
                         <div class="price-circle">
                          <div class="price-title"><h3>Medium</h3></div>
                          <div class="price-money"><h3>$30<span>/month</span></h3></div>
                          <ul>
                           <li><p>Flight 10% discount</p></li>
                           <li><p>Hotel 10% discount</p></li>
                           <li><p>1 Children free</p></li>
                           <li><p>Excursion 8% discount</p></li>
                           <li><p>Soft Inclusive</p></li>
                           <li class="price-info"><a href="">Sign up</a></li>
                          </ul>
                          
                        </div>
                    </div>
                </div>
                <div class="col-md-4 prices content-red">
                    <div class="price-table-circle premium red-prices">
                        <div class="price-circle">
                          <div class="price-title"><h3>Premium</h3></div>
                          <div class="price-money"><h3>$50<span>/month</span></h3></div>
                          <ul>
                           <li><p>Flight 15% discount</p></li>
                           <li><p>Hotel 15% discount</p></li>
                           <li><p>2 Children free</p></li>
                           <li><p>Excursion 10% discount</p></li>
                           <li><p>All Inclusive</p></li>
                           <li class="price-info"><a href="">Sign up</a></li>
                          </ul>
                          
                         </div>
                     </div>
                </div>
             </div><!--Close col-md-12-->
           </div>
        </div>
    </div>
</section>

<!--Banner Last Minute-->
<section class='last-minute-banner bb-blue'>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                 <div class='col-sm-9 col-md-9'>
                    <h1 class="l-main-banner-title">Last Minute Offer! <span>Hurry Up!</span></h1>
                    <p class="l-main2-banner-title">Contact Travego for have evry information about trip!</p>
                 </div>
                 <div class="col-sm-3 col-md-3 button-banner"><a class="shortcode_button btn_large btn_type1 left_icon" href="javascript:void(0);"><i class="fa fa-hand-o-right"></i>Learn More</a></div>
                </div>
            </div>
        </div>
</section>
<section id="footer">
    <div class="container">
            <div class="row">
                <div class="col-md-12">
                  <div class="col-md-3">
                    <img class='logo-footer' src='<%=cp%>/res/images/travego.png' alt='logo' />
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque arcu lorem, mattis quis convallis ac</p> 
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque arcu lorem, mattis quis convallis ac</p>   
                  </div>
                  <div class="col-md-3">
                    <h3>TRAVEL NEWS</h3>       
				        <div class="col-md-4 footer-small-img">
                            <img alt="" src="http://placehold.it/120x120"/>
                        </div>
                        <div class="col-md-8 footer-small-desc">
                            <a href="">Amazing Places</a>
                            <p>Mar 22, 2015 </p>
                            <a class='r-more' href="">read more</a>
                        </div>
                       <div class="clear"></div>
                        <div class="col-md-4 footer-small-img">
                            <img alt="" src="http://placehold.it/120x120"/>
                        </div>
                        <div class="col-md-8 footer-small-desc">
                            <a href="">Amazing Places</a>
                            <p>Mar 26, 2015</p>
                            <a class='r-more' href="">read more</a>
                        </div>
                    <div class="clear"></div>
                        <div class="col-md-4 footer-small-img">
                            <img alt="" src="http://placehold.it/120x120"/>
                        </div>
                        <div class="col-md-8 footer-small-desc">
                            <a href="">Amazing Places</a>
                            <p>Mar 26, 2015</p>
                            <a class='r-more' href="">read more</a>
                        </div>
                  </div>
                  <div class="col-md-3 footer-zone">
                        <h3>CONTACTS</h3>
                        <p><i class="fa fa-map-marker"></i>Address: Broadway Road 35-127</p>
                        <p><i class="fa fa-phone"></i>Phone: +001 3072341187</p>
                        <p><i class="fa fa-envelope-o"></i>Mail: info@lovetravel.com</p>
                        <p><i class="fa fa-globe"></i>travego@world.com</p>
                        <div class="socialfooter">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-google"></i></a></div>  
                  </div>
                  
                  <div class="col-md-3">
                    <h3>NEWSLETTER</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque arcu lorem, mattis quis convallis ac</p> 
                
                    <!--start form-->
                   <form class="newsletterfooter">
                	    <input type="text" />
                        <input type="submit" />
                        <i class="fa fa-angle-right"></i>
                    </form>
                  </div>
                </div>
           </div>
    </div>
  
    
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                    <div class="col-xs-6 copyright">Travego © 2015 Name All Rights Reserved </div>
                    <div class="col-xs-6 payment-card">
                        <i class="fa fa-2x fa-cc-visa"></i>
                        <i class="fa fa-2x fa-cc-mastercard"></i>
                        <i class="fa fa-2x fa-cc-amex"></i>
                        <i class="fa fa-2x fa-cc-paypal"></i>
                    </div>
              </div>
            </div>
        </div>
    </div>
</section>


<script src="<%=cp%>/res/js/modernizr.js" type="text/javascript"></script>

<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>
<!--Preload-->
<script type="text/javascript">
    $(document).ready(function ($) {
        "use strict";
        try {
            var myTimer = 0; clearTimeout(myTimer);
            myTimer = setTimeout(function () { $("#loader-wrapper").slideUp() }, 2000);
        } catch (err) {
        }
    });
</script>

<script src="<%=cp%>/res/js/jquery.themepunch.plugins.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
<script type="text/javascript">
var tpj = jQuery;
    tpj(document).ready(function () {
        "use strict";
        if (tpj.fn.cssOriginal !== undefined)
            tpj.fn.css = tpj.fn.cssOriginal;
        tpj('.fullwidthbanner').revolution(
        {
            delay: 9000,
            startwidth: 1170,
            startheight: 646,
            onHoverStop: "on",
            thumbWidth: 100,
            thumbHeight: 50,
            thumbAmount: 4,
            hideThumbs: 200,
            navigationType: 'none',
            navigationArrows: "verticalcentered", 	//nexttobullets, verticalcentered, none
            navigationStyle: "large",
            touchenabled: "on",
            navOffsetHorizontal: 0,
            navOffsetVertical: 20,
            fullWidth: "on",
            shadow: 0
        });
});
</script>



<!-- rangeSlider -->

<script type="text/javascript">
$(function() {
	$( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 100000,
      values: [ 20000, 50000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "￦" + $( "#slider-range" ).slider( "values", 0 ) +
      " - ￦" + $( "#slider-range" ).slider( "values", 1 ) );
  });
</script>


<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>

<!--bxSlider-->
<script src="<%=cp%>/res/js/jquery.bxslider.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    "use strict";
    $('.bxslider').bxSlider({
        auto: true
    });
});
</script>

 <script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>
</body>
</html>