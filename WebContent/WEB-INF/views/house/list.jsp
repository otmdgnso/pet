<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
        <!--List-->
        <link href="<%=cp%>/res/css/list/component.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />


    <div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">집 구경</h2>
                </div>
             </div>
          </div>
      </div>
    </section>
<section id="top-list-trip">
   <div class="container">
      <div class="row">
         <div class="col-sm-4 col-md-3">
                <form name="searchForm" method="post" class="form-inline">
                <div class="search-results-title" style="padding-top: 20px;"><i class="fa fa-search"></i>
                		<input type="text" style="width: 70%" class="form-control input-sm input-search" name="searchValue">
                		<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">검색</button>
                </div>
                </form>
                <section class="ac-container">
                    <h3 class="desc-filter">필터</h3>
				    <div>
					    <input id="ac-1" name="accordion-1" type="checkbox" />
					    <label for="ac-1">가격 범위 <i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <p>
                              <!--<label for="amount">Price range:</label>-->
                              <input type="text" id="amount" readonly>
                            </p>
 
                            <div id="slider-range"></div>
					    </article>
				    </div>
				    <div>
					    <input id="ac-2" name="accordion-1" type="checkbox" checked/>
					    <label for="ac-2">평점 <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-medium">
						    <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/star.png" alt="1 Star"/><p>(975) result</p></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/2star.png" alt="2 Star"/><p>(1335) result</p></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/3star.png" alt="3 Star"/><p>(1732) result</p></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/4star.png" alt="4 Star"/><p>(665) result</p></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/5star.png" alt="5 Star"/><p>(412) result</p></div>
					    </article>
				    </div>
				    <div>
					    <input id="ac-3" name="accordion-1" type="checkbox" />
					    <label for="ac-3">펫 종류 <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>강아지</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>고양이</p></div>                          
					    </article>
				    </div>
				    <div>
					    <input id="ac-4" name="accordion-1" type="checkbox" />
					    <label for="ac-4">Property type <i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-large">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>All (1458)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Hotels (367)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Hostels (638)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Aparments (232)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Guest houses (128)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Bed and breakfasts (78)</p></div>
					    </article>
				    </div>
                    <div>
					    <input id="ac-5" name="accordion-1" type="checkbox" />
					    <label for="ac-5">Facility <i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-large">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>WiFi (1458)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Parking (667)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Terrace (238)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Spa Bath (232)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Pool (628)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Bed and breakfasts (78)</p></div>
					    </article>
				    </div>
			    </section>
            </div>
         <div class="col-sm-8 col-md-9 effect-5 effects">
            <div class="main-switcher">
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                    <div class="txt-sort"><p>정렬:</p></div>  
                                <div class="click-nav">
			                        <ul class="no-js">
				                        <li>
					                        <a class="clicker">가격</a>
					                        <ul>
						                        <li><span class="btn sort active" data-sort="random">Random</span></li>
						                        <li><span class="btn sort" data-sort="value:asc">Ascending</span></li>
						                        <li><span class="btn sort" data-sort="value:desc">Descending</span></li>
					                        </ul>
				                        </li>
			                        </ul>
		                        </div>
                                <div class="click-nav-location">
			                        <ul class="no-js">
				                        <li>
					                        <a class="clicker">위치</a>
					                        <ul>
                                                <li><span class="btn filter active" data-filter="all">All</span></li>
						                        <li><span class="btn filter" data-filter=".category-1">City</span></li>
						                        <li><span class="btn filter" data-filter=".category-2">Sea</span></li>
                                                <li><span class="btn filter" data-filter=".category-3">Middle</span></li>
					                        </ul>
				                        </li>
			                        </ul>
		                        </div>
					<div class="cbp-vm-options">
						<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid"><i class="fa fa-th-large"></i></a>
						<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list"><i class="fa fa-th-list"></i></a>
					</div>
					
					<!-- 왼쪽메뉴 -->
					
					<!-- 본문 -->
                    
					<ul id="Grid" class="sandbox">
						<li class="mix category-3" data-value="1250">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="<%=cp%>/uploads/profile/20160518162814458843974403881.GIF" style="width:338px; height:180px">
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>솜사탕</h3><img class="star-level" src="<%=cp%>/res/images/5star.png" alt="" />
                                    <div class="clear"></div>
                                    <p style="min-height: 30px;">강아지 동산</p>
                                    <div class="price-night"><span>수용가능 1마리</span><span class="price-n">10000원</span></div>   
                                    <a href="javascript:location.href='<%=cp%>/house/houseinfo';" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-2" data-value="850">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="<%=cp%>/uploads/profile/20160518162814458843974403881.GIF" style="width:338px; height:180px">
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>솜사탕</h3><img class="star-level" src="<%=cp%>/res/images/5star.png" alt="" />
                                    <div class="clear"></div>
                                    <p style="min-height: 30px;">강아지 동산</p>
                                    <div class="price-night"><span>수용가능 1마리</span><span class="price-n">10000원</span></div>   
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-3" data-value="700">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="<%=cp%>/uploads/profile/20160518162814458843974403881.GIF" style="width:338px; height:180px">
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>솜사탕</h3><img class="star-level" src="<%=cp%>/res/images/5star.png" alt="" />
                                    <div class="clear"></div>
                                    <p style="min-height: 30px;">강아지 동산</p>
                                    <div class="price-night"><span>수용가능 1마리</span><span class="price-n">10000원</span></div>   
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-1" data-value="1050">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>Playa Hotel</h3><img class="star-level" src="<%=cp%>/res/images/4star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                   <div class="price-night"><span>7 Night</span><span class="price-n">$1050</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-1" data-value="330">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>PORTALS PALACE</h3><img class="star-level" src="<%=cp%>/res/images/star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$330</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-1" data-value="480">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>BEACH RESORT</h3><img class="star-level" src="<%=cp%>/res/images/2star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$480</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-2" data-value="1100">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>BAOBAB Place</h3><img class="star-level" src="<%=cp%>/res/images/5star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$1100</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-3" data-value="560">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>ROULETTE </h3><img class="star-level" src="<%=cp%>/res/images/3star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$560</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-1" data-value="510">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>CORAL RESORT </h3><img class="star-level" src="<%=cp%>/res/images/3star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$510</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-2" data-value="1300">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>BLUE HOTEL</h3><img class="star-level" src="<%=cp%>/res/images/4star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$1300</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-2" data-value="650">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>DONG OCEAN</h3><img class="star-level" src="<%=cp%>/res/images/2star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$650</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-1" data-value="970">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="http://placehold.it/600x338" alt="img01"/>
                                    <div class="overlay">
                                        <a href="#" class="expand">+</a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption>
                                    <h3>Paul Place</h3><img class="star-level" src="<%=cp%>/res/images/3star.png" alt="" />
                                    <div class="clear"></div>
                                    <p>Chillwave hoodie ea gentrify aute sriracha consequat, cursus libero purus ac congue ar lorem.</p>
                                    <div class="price-night"><span>7 Night</span><span class="price-n">$970</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Read More</a>
                                </figcaption>
							</figure>
						</li>
					</ul>
				</div>
			</div><!-- /main -->
           </div><!--Close col 12 -->
          </div>
        </div>
</section>      

<script src="<%=cp%>/res/js/modernizr.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>


<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<!--Carousel-->
<script src="<%=cp%>/res/js/carousel/modernizr.custom.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/carousel/jquery.cbpContentSlider.min.js" type="text/javascript"></script>
 <script>
$(function () {
    "use strict";
    $('#cbp-contentslider').cbpContentSlider();
});
</script>
<!--List-->
<script src="<%=cp%>/res/js/list/cbpViewModeSwitch.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/list/classie.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>

<script src="<%=cp%>/res/js/list/jquery.mixitup.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
    "use strict";
    $('#Grid').mixItUp();
});
</script>
 <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script>
$(function () {
    "use strict";
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: 500,
        values: [75, 300],
        slide: function (event, ui) {
            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) +
    " - $" + $("#slider-range").slider("values", 1));
});
</script>

<script>
$(function () {
    "use strict";
    // Clickable Dropdown
    $('.click-nav > ul').toggleClass('no-js js');
    $('.click-nav .js ul').hide();
    $('.click-nav .js').click(function (e) {
        $('.click-nav .js ul').slideToggle(200);
        $('.clicker').toggleClass('active');
        e.stopPropagation();
    });
    $(document).click(function () {
        if ($('.click-nav .js ul').is(':visible')) {
            $('.click-nav .js ul', this).slideUp();
            $('.clicker').removeClass('active');
        }
    });

    $('.click-nav-location > ul').toggleClass('no-js js');
    $('.click-nav-location .js ul').hide();
    $('.click-nav-location .js').click(function (e) {
        $('.click-nav-location .js ul').slideToggle(200);
        $('.clicker').toggleClass('active');
        e.stopPropagation();
    });
    $(document).click(function () {
        if ($('.click-nav-location .js ul').is(':visible')) {
            $('.click-nav-location .js ul', this).slideUp();
            $('.clicker').removeClass('active');
        }
    });
});
</script>
