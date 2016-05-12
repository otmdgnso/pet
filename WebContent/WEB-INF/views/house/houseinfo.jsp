<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="clear"></div>
  <section class="about-section-top">
     <div class="container">
        <div class="row">
           <div class="col-md-12">
             <div class="page-title pull-left">
                  <h2 class="title-about">House Details</h2>
              </div>
              <ul class="breadcrumbs pull-right">
                  <li><a href="/">HOME</a></li>
                  <li>/</li>
                  <li class="active">House Details</li>
              </ul>
           </div>
        </div>
    </div>
  </section>
<section id="top-list-trip">
   <div class="container">
      <div class="row">
         <div class="col-sm-4 col-md-3">
                <div class="search-results-title"><i class="fa fa-search"></i><p>1,322</p> <p>results found.</p></div>
                <section class="ac-container">
                    <h3 class="desc-filter">Save time with filters:</h3>
				    <div>
					    <input id="ac-1" name="accordion-1" type="checkbox" />
					    <label for="ac-1">Price range <i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
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
					    <label for="ac-2">Star rating <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
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
					    <label for="ac-3">Meals <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Breakfast included (1458)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Half board (367)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Self catering (678)</p></div>
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
         <div class="col-sm-8 col-md-9">
            <div class="main-details bx-about2 noowlf">
				<ul class="bxslider">
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                </ul>

                <div id="bx-pager">
                  <a data-slide-index="0" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="1" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="2" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="3" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="4" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="5" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="6" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="7" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                </div>
			</div><!-- /main -->
            <div class="col-md-12 details-hotel">
              <p>Located on the tropical island of Bora Bora, the beachfront St Regis Resort offers 2 swimming pools, 2 bars, 4 restaurants and a luxurious day spa. 
              All accommodation boasts a balcony offering panoramic views of the lagoon or surrounding islands.</p>
              <p>The St Regis Bora Bora Resort is a 10-minute drive from Mont Otemanu and Mont Pahia. 
              It is a 15-minute boat transfer from Bora Bora Airport. Vaitape Village can be reached via a 20-minute boat and car journey.</p>
              <p>The air-conditioned villas feature hand-carved Polynesian sculptures, exotic wooden décor and an Italian-marble 
              bathroom with a rain shower and bathtub. Some villas offer a private plunge pool, a hot tub or an outdoor shower.</p>
              <p>Suspended over the blue waters, Le Lagoon Restaurant offers Polynesian cuisine and views of Mount Otemanu. 
              Te-Pahu serves Mediterranean-style grilled dishes, while Sushi Take Restaurant offers sushi, seafood and sake. Far Niente boasts Italian cuisine.</p>
            </div>
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
<!--slideshow-->
<script src="<%=cp%>/res/js/jquery.bxslider.js" type="text/javascript"></script>
<script>
$(function () {
    "use strict";
    $('.bxslider').bxSlider({
        pagerCustom: '#bx-pager'
    });
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