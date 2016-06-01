<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>  
      #locationField {
        height: 20px;
        margin-bottom: 2px;
      }
    	
   #photo{
   background-image: url('/img/large/3.png');
   }
   
   #main1{
   opacity: 1;  
   }
  
</style>

<script type="text/javascript">
$(function(){
	$('#video').mouseup(function(){		
		 $('#main1').toggle(); 
	});
	
	$('#checkInHouse').change(function(){		
		var date= $('#checkInHouse').val();
		var y=date.substring(6,10);
		var m=date.substring(3,5);
		var d=date.substring(0,2);
		var df=y+"/"+m+"/"+d;
		$('#checkInHouse').val(df);
	});
	
	$('#checkOutHouse').change(function(){		
		var date= $('#checkOutHouse').val();
		var y=date.substring(6,10);
		var m=date.substring(3,5);
		var d=date.substring(0,2);
		var df=y+"/"+m+"/"+d;
		$('#checkOutHouse').val(df);
	});

	$(function () {
	    "use strict";
	    $('#Grid1').mixItUp();
	});
});

function adoptSearch() {
	var f=document.adoptForm;
	var typeAdopt=f.typeAdopt.value;
	var speciesAdopt=f.speciesAdopt.value;
	
	var minPrice=$("#slider-range").slider("values", 0)*10000;
	var maxPrice=$("#slider-range").slider("values", 1)*10000;
	var params="searchValue=main&type="+typeAdopt+"&species="+speciesAdopt+"&minPrice="+minPrice+"&maxPrice="+maxPrice;
	f.action="<%=cp%>/adopt/list?"+params;
	f.submit();
}

function auctionSearch() {
	var f=document.auctionForm;
	var subjectAuction=f.subjectAuction.value;
	var speciesAuction=f.speciesAuction.value;
	
	var params="searchValue=main&subject="+subjectAuction+"&species="+speciesAuction;
	f.action="<%=cp%>/auction/list?"+params;
	f.submit();
}

function houseSearch() {
	var f=document.houseForm;
	var addressHouse=f.addressHouse.value;
	var checkInHouse=f.checkInHouse.value;
	var checkOutHouse=f.checkOutHouse.value;
	var speciesHouse=f.speciesHouse.value;
	var pet_suHouse=f.pet_suHouse.value;
	
	var params="searchValue=main&address="+addressHouse+"&checkIn="+checkInHouse+"&checkOut="+checkOutHouse+"&species="+speciesHouse+"&pet_su="+pet_suHouse;
	f.action="<%=cp%>/house/list?"+params;
	f.submit();
}

</script>

<section class="top-content">
        <div class="container-slider removeslide">
          <div id="main1" class="container-reservation inside-slider">
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
                                    <form id="hotels-tab" class="tab-pane form-inline reservation-hotel active" method="post" name="houseForm">
                                      <div class="row">
                                      
                                        <div class="col-sm-4 step-where">
                                          <div class="form-group">
                                            <h3><img alt="" src="<%=cp%>/res/img/book.png"> Where?</h3>
                                            <label for="adress">주소 입력</label>
                                            <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="본인의 주소를 입력하세요. 시, 도, 구까지 입력"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                            <!-- 자동완성 -->
                                            <input id="addressHouse" name="addressHouse" placeholder="Enter your address" onFocus="geolocate()" type="text" class="form-control"></input>                                          </div>
                                        </div>
                                        <div class="col-sm-4 step-check">
                                          <h3><img alt="" src="<%=cp%>/res/img/clock.png"> When?</h3>
                                            <div class="col-sm-6 cc-in" style="padding-left:0">
                                              <div class="form-group">
                                                <label for="checkin">맡길 날짜</label>
                                                <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="맡기고 싶은 날짜 검색"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                                <div class="content-checkin-data">
                                                    <i class="fa fa-calendar infield"></i>
                                                    <input name="checkInHouse" type="text" id="checkInHouse" value="" class="form-control checkin" placeholder="Check-in"/>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col-sm-6 cc-out" style="padding-left:0">
                                              <div class="form-group">
                                                <label for="checkout">찾을 날짜</label>
                                                <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="반려동물 되찾아갈 날짜"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                                <div class="content-checkin-data">
                                                    <i class="fa fa-calendar infield"></i>
                                                    <input name="checkOutHouse" type="text" id="checkOutHouse" value="" class="form-control checkout" placeholder="Check-out"/>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 step-who" style="padding-left:0">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> Who?</h3>
                                            <div class="col-sm-4 room-book" style="padding-left:0">
                                              <div class="form-group">
                                                <label for="room">DOG or CAT</label>
                                                <select class="form-control" name="speciesHouse" id="speciesHouse">
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
                                                        <select name="pet_suHouse" id="pet_suHouse" class="form-control">
                                                        <option value="1">1</option>
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
                                          <button type="button" class="btn btn-primary btn-block" onclick="houseSearch();">검색</button>
                                        </div>
                                      </div>
                                    </form>
                                  
​
                                    <!--********************* 경매 검색 ********************-->
                                    <form id="auction-tab" class="tab-pane form-inline reservation-flight" method="post" name="auctionForm">
                                      <div class="row">
                                        <div class="col-sm-4 flight-where" >
                                          <div class="form-group" >
                                            <h3> <img alt="" src="<%=cp%>/res/img/product.png"> 검색 상품</h3>
                                            <label for="auctionSubject">상품 명</label>
                                            <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="검색할 상품 입력"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                            <input type="text" class="form-control" placeholder="상품 이름" id="subjectAuction" name="subjectAuction" >
                                          </div>
                                        </div>
                                        <div class="col-sm-4 fly-who">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> Who?</h3>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>Dog or Cat</label>
                                                  
                                                      <select name="speciesAuction" id="speciesAuction" class="form-control">
                                                        <option value="dog">DOG</option>
                                                        <option value="cat">CAT</option>
                                                      </select>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 colbtn">
                                          <button type="button" class="btn btn-primary btn-block" onclick="auctionSearch();">검색</button>
                                        </div>
                                      </div>
                                    </form>
                                    
                                        <!--********************* 분양 검색 ********************-->
                                    <form id="sell-tab" class="tab-pane form-inline reservation-flight" method="post" name="adoptForm">
                                      <div class="row">
                                        <div class="col-sm-4 flight-where">
                                          <div class="form-group">
                                            <h3> <img alt="" src="<%=cp%>/res/img/dogplay.png">펫 검색</h3>
                                            <label for="auctionSubject">통합 검색</label>
                                            <input type="text" class="form-control" placeholder="품종을 입력하세요" id="type" name="typeAdopt" >
                                          </div>
                                        </div>
                                        <div class="col-sm-4 fly-who">
                                            <h3><img alt="" src="<%=cp%>/res/img/animal-prints.png"> Who?</h3>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>Dog or Cat</label>
                                                  
                                                      <select name="speciesAdopt" id="species" class="form-control">
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
                                          <button type="button" class="btn btn-primary btn-block" onclick="adoptSearch();">검색</button>
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
           <div id="video" class="home-page removeslide">
             <!-- SLIDER -->
                <div class="fullwidthbanner-container">
                    <div class="fullwidthbanner">
                    <video autoplay="" loop="" class="fillWidth fadeIn animated" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background" style="width: 100%; height: 100%;">
					    <source src="<%=cp%>/res/video/puppy.mp4"  type="video/mp4">
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

<!-- 호스트 시작 -->
<section style="width: 100%; margin-top: 100px;" class="box-tr-square">
<div class="container">
<div class="row">
  <div align="center" class="col-md-12 effect-5 effects">
  <span style="font-weight: bold; color: #747474; font-size: 28pt;">Hot House</span>
	<ul id="Grid1" class="sandbox" style="margin-top: 30px;">
		<c:forEach var="dto" items="${listHouse}">
			<li class="cat3 col-md-4 gallery-view view-fifth" style="width: 31.5%; float: left;">
				<div>
					<div class="cbp-vm-image img">
						<img src="<%=cp%>/uploads/house/${dto.saveFilename}"
							style="width: 338px; height: 180px">
						<div class="overlay" style="width: 83%;">
							<a href="<%=cp%>/house/houseinfo?hostNum=${dto.hostNum}" class="expand"><i
								class="fa fa-paw" aria-hidden="true"></i></a> <a
								class="close-overlay hidden">x</a>
						</div>
					</div>

					<div style="height: 200px; text-align: left; background-color:white;
											padding: 20px;">
						<h3>${dto.subject}</h3>
						<div class="clear"></div>
						<span style="color: #8C8C8C">${dto.userName},
							${dto.address}</span>
						<div class="price-night">
							<span style="color: #8C8C8C">수용가능 ${dto.capacity}마리</span><span
								class="price-n">${dto.cost}원</span>
						</div>

						<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
							<tr>
								<td align="left" width="50%" style="color: #8C8C8C"><img
									class="star-level" src="<%=cp%>/res/images/5star.png" />
									(${dto.reviewcnt})</td>
								<td align="right" width="50%" rowspan="2"><a
									href="<%=cp%>/house/houseinfo?hostNum=${dto.hostNum}"
									class="btn btn-primary btn-gallery" style="float: right;">더보기</a></td>
							</tr>
						</table>

					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	</div>
	</div>
	</div>
</section>
<!-- 호스트 끝 -->

<!-- 사진 시작 -->
<section id="photo" style="width: 100%;  margin-top: 100px;" class="box-tr-square">
<div class="container">
   <div class="row">
         <div align="center" class="col-md-12 effect-5 effects">
	   <span style="font-weight: bold; color: #747474; font-size: 28pt;">Hot Photo</span>

		<ul id="Grid" class="sandbox">
			<c:forEach var="dto" items="${list}">
				<div class="cat3 col-md-4 gallery-view view-fifth" style="width: 31.5%; float: left;">
					<div class="img">
						<img src="<%=cp%>/uploads/photo/${dto.saveFilename}"
							style="width: 400px; height: 350px;"/>
						<%-- <div class="overlay">
							<a href="<%=cp%>/photo/article" class="expand">+</a>
							<a class="close-overlay hidden">x</a>
						</div> --%>
					<div class="overlay">
                        <a href="<%=cp%>/photo/article?photoNum=${dto.photoNum}&page" class="expand discount">${dto.userName}</a>
                                <a style="color: #86E57F;" class="expand discount textdisc" >추천 ${dto.likeCount}</a>                    
					  </div>                                    
				</div>
					<div align="left" class="gallery-img-title">
						<span style="color: black;">제목 : ${dto.subject}</span> &nbsp; <span
							style="color: orange; font-weight: bold;">[${dto.replyCount}]</span><br>
						<span style="color: black;">조회수 ${dto.hitCount} |
							${dto.created} | 좋아요 ${dto.likeCount}</span><br> <span
							style="color: black;">${dto.userId} (${dto.userName})</span>
					</div>
				</div>
			</c:forEach>
			</ul>
				</div>
			</div>
		</div>
	
</section>
<!-- 사진 끝 -->

<!-- 분양시작 -->
<section style="width: 100%; margin-top: 100px;" class="box-tr-square">
	<div class="container">
		<div class="row">
			<div align="center" class="col-md-12 effect-5 effects">
				<span style="font-weight: bold; color: #747474; font-size: 28pt;">It's Pet</span>
				<ul class="sandbox">
				
					<c:forEach var="dto" items="${listAdopt}">
						<div class="cat3 col-md-4 gallery-view view-fifth"
							style="width: 31.5%; float: left;">
							<div class="img">
								<img src="<%=cp%>/uploads/adopt/${dto.saveFilename}"
									style="width: 380px; height: 300px" />
								<div class="overlay">
									<a
										href="<%=cp%>/adopt/article?preSaleNum=${dto.preSaleNum}&page"
										class="expand">IN</a> <a class="close-overlay hidden">x</a>
								</div>
							</div>
							<div align="left" class="gallery-img-title">
								<span style="color: black;">제목 : ${dto.subject}</span> &nbsp; <span
									style="color: orange; font-weight: bold;">[${dto.replyCount}]</span><br>
								<span style="color: black;">조회수 ${dto.hitCount} |
									${dto.created} </span><br> <span style="color: black;">${dto.userId}
								</span>
							</div>
						</div>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
</section>
<!-- 분양 끝 -->

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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL_yUn3yTe4MywkHS94ZkWiqxam9JF5nI&signed_in=true&libraries=places&callback=initAutocomplete"
        async defer></script>
<script>
function initAutocomplete() {
	  /* var map = new google.maps.Map(document.getElementById('map'), {
	    center: {lat: -33.8688, lng: 151.2195},
	    zoom: 13,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  }); */

	  // Create the search box and link it to the UI element.
	  var input = document.getElementById('addressHouse');
	  var searchBox = new google.maps.places.SearchBox(input);
	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	  // Bias the SearchBox results towards current map's viewport.
	  map.addListener('bounds_changed', function() {
	    searchBox.setBounds(map.getBounds());
	  });

	  var markers = [];
	  // Listen for the event fired when the user selects a prediction and retrieve
	  // more details for that place.
	  searchBox.addListener('places_changed', function() {
	    var places = searchBox.getPlaces();

	    if (places.length == 0) {
	      return;
	    }

	    // Clear out the old markers.
	    markers.forEach(function(marker) {
	      marker.setMap(null);
	    });
	    markers = [];

	    // For each place, get the icon, name and location.
	    var bounds = new google.maps.LatLngBounds();
	    places.forEach(function(place) {
	      var icon = {
	        url: place.icon,
	        size: new google.maps.Size(71, 71),
	        origin: new google.maps.Point(0, 0),
	        anchor: new google.maps.Point(17, 34),
	        scaledSize: new google.maps.Size(25, 25)
	      };

	      // Create a marker for each place.
	      markers.push(new google.maps.Marker({
	        map: map,
	        icon: icon,
	        title: place.name,
	        position: place.geometry.location
	      }));

	      if (place.geometry.viewport) {
	        // Only geocodes have viewport.
	        bounds.union(place.geometry.viewport);
	      } else {
	        bounds.extend(place.geometry.location);
	      }
	    });
	    map.fitBounds(bounds);
	  });
	}
</script>

