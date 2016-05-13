<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
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
                    <h2>THE BEST PROMOTIONS</h2>
                    <p>Find your favorite place, feel more than home</p>
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

<!-- <section id="parallax_slide" class="service2-prx">
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
             </div>Close col-md-12
    </div>
</section> -->

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
