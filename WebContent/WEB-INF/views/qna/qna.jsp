<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!doctype html>

<html>
	<head>
    <title>Travego</title>
 
    <meta charset="utf-8">
    <meta name="description" content="travel, trip, store, shopping, siteweb, cart">
    <meta name="viewport" content="width=device-width, initial-scale=1">

     <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700,700italic' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'/>


        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="css/animate.css" rel="stylesheet" type="text/css" />
        <link href="css/settings_slide2.css" rel="stylesheet" type="text/css" />
        <link href="css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
        <!--List-->
        <link href="css/list/component.css" rel="stylesheet" type="text/css" />
        <link href="css/layout2.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css" />

<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="js/waypoints.min.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script src="js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>

<!--bxSlider-->
<script src="js/jquery.bxslider.js" type="text/javascript"></script>
<script>
$(document).ready(function () {
    "use strict";
    $('.bxslider').bxSlider({
        auto: true
    });
});
</script>
<!--List-->
<script src="js/list/cbpViewModeSwitch.js" type="text/javascript"></script>
<script src="js/list/classie.js" type="text/javascript"></script>
<script src="js/script.js" type="text/javascript"></script>

<script src="js/list/jquery.mixitup.js" type="text/javascript"></script>
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

</head>
	<body>
  
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">Search Results</h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li>/</li>
                    <li class="active">Search Results</li>
                </ul>
             </div>
          </div>
      </div>
    </section>
<section id="top-offerts">
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
					    <input id="ac-3" name="accordion-1" type="checkbox" />
					    <label for="ac-3">Flight Stops <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>1 Stop</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>2 Stops</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>3 Stops</p></div>
					    </article>
				    </div>
				    <div>
					    <input id="ac-4" name="accordion-1" type="checkbox" />
					    <label for="ac-4">Airlines<i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-large">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>All (1458)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Delta Airlines (367)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Air France (638)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>United (232)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Lufthansa (128)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Rayanir (78)</p></div>
					    </article>
				    </div>
                    <div>
					    <input id="ac-5" name="accordion-1" type="checkbox" />
					    <label for="ac-5">Flight Class<i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Economy</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Business</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>First Class</p></div>
					    </article>
				    </div>
			    </section>
            </div>
         <div class="col-sm-8 col-md-9 effect-5 effects">
            <div class="main-switcher">
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-list">
                    <div class="txt-sort"><p>Sort result:</p></div>  
                                <div class="click-nav">
			                        <ul class="no-js">
				                        <li>
					                        <a class="clicker">Price</a>
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
					                        <a class="clicker">Airline</a>
					                        <ul>
                                                <li><span class="btn filter active" data-filter="all">All</span></li>
						                        <li><span class="btn filter" data-filter=".category-1">Delta</span></li>
						                        <li><span class="btn filter" data-filter=".category-2">Lufthansa</span></li>
                                                <li><span class="btn filter" data-filter=".category-3">United</span></li>
					                        </ul>
				                        </li>
			                        </ul>
		                        </div>
					<div class="cbp-vm-options">
						<a href="#" class="cbp-vm-icon cbp-vm-grid" data-view="cbp-vm-view-grid"><i class="fa fa-th-large"></i></a>
						<a href="#" class="cbp-vm-icon cbp-vm-list cbp-vm-selected" data-view="cbp-vm-view-list"><i class="fa fa-th-list"></i></a>
					</div>
                    
					<ul id="Grid" class="sandbox list-fly">
						<li class="mix category-1" data-value="1250">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/1.png" alt="img01"/>
                                </div>
								
								<figcaption>
                                    <h3>FR 6341</h3><span>Dublin</span> <span>Lanzarote</span><div class="clear"></div><span>06:10</span> <span>10:30</span><span><i class="fa fa-clock-o"></i>4 h 20 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>1 Stop</span><span class="price-n">$1250</span></div>   
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-2" data-value="850">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/2.png" alt="img01"/>
                                </div>
								<figcaption>
                                    <h3>FR 7124</h3><span>Manchester</span> <span>Rzeszow</span><div class="clear"></div><span>06:10</span> <span>9:55</span><span><i class="fa fa-clock-o"></i>3 h 20 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>1 Stop</span><span class="price-n">$850</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-3" data-value="700">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/3.png" alt="img01"/>
                                </div>
								<figcaption>
                                    <h3>ST 7124</h3><span>Dublin</span> <span>Madrid</span><div class="clear"></div><span>06:10</span> <span>10:00</span><span><i class="fa fa-clock-o"></i>4 h 00 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>2 Stops</span><span class="price-n">$700</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-3" data-value="1050">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/3.png" alt="img01"/>
                                </div>
								<figcaption>
                                    <h3>ST 7124</h3><span>Dublin</span> <span>Madrid</span><div class="clear"></div><span>06:10</span> <span>10:00</span><span><i class="fa fa-clock-o"></i>4 h 00 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>2 Stops</span><span class="price-n">$700</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-1" data-value="330">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/1.png" alt="img01"/>
                                </div>
								
								<figcaption>
                                    <h3>FR 6341</h3><span>Dublin</span> <span>Lanzarote</span><div class="clear"></div><span>06:10</span> <span>10:30</span><span><i class="fa fa-clock-o"></i>4 h 20 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>1 Stop</span><span class="price-n">$1250</span></div>   
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-2" data-value="480">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/2.png" alt="img01"/>
                                </div>
								<figcaption>
                                    <h3>FR 7124</h3><span>Manchester</span> <span>Rzeszow</span><div class="clear"></div><span>06:10</span> <span>9:55</span><span><i class="fa fa-clock-o"></i>3 h 20 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>1 Stop</span><span class="price-n">$850</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
                                </figcaption>
							</figure>
						</li>
						<li class="mix category-3" data-value="1100">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="images/fly/3.png" alt="img01"/>
                                </div>
								<figcaption>
                                    <h3>ST 7124</h3><span>Dublin</span> <span>Madrid</span><div class="clear"></div><span>06:10</span> <span>10:00</span><span><i class="fa fa-clock-o"></i>4 h 00 min</span>
                                    <div class="clear"></div>
                                    <div class="price-night"><span>2 Stops</span><span class="price-n">$700</span></div>
                                    <a href="#" class="btn btn-primary btn-gallery">Buy Now</a>
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


 </body>
</html>