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


        <link href="<%=cp%>/res/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/animate.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/settings_slide2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
        <!--List-->
        <link href="<%=cp%>/res/css/list/component.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />
</head>
	<body>
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
      <div class="top-mega-menu other-page">
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
					<a class="top-menu-txt" href="#_">Destination</a>
					<div class="grid-container10 destination">
                        <form action="#">
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
                        <form action="#">
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
					<a class="top-menu-txt" href="#_"><i class="fa fa-phone"></i>Contacts</a>
					<div class="grid-container3 blue-link">
						<ul>
							<li><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
							<li><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i>Google Plus</a></li>
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

          <!--Mobile Menu-->
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
    <div class="clear"></div>
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
                                    <img src="<%=cp%>/res/images/fly/1.png" alt="img01"/>
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
                                    <img src="<%=cp%>/res/images/fly/2.png" alt="img01"/>
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
                                    <img src="<%=cp%>/res/images/fly/3.png" alt="img01"/>
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
                                    <img src="<%=cp%>/res/images/fly/3.png" alt="img01"/>
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
                                    <img src="<%=cp%>/res/images/fly/1.png" alt="img01"/>
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
                                    <img src="<%=cp%>/res/images/fly/2.png" alt="img01"/>
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
                                    <img src="<%=cp%>/res/images/fly/3.png" alt="img01"/>
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

<section id="parallax_slide" class="service2-prx">
   <div class="effect-over">
             <div class="bx-about2">
                <ul class="bxslider">
                            <li>
  	    	                 <img src="<%=cp%>/res/images/trip/city2.jpg" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">Paris</div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                             </div>
  	    		            </li>
  	    		            <li>
  	    	                 <img src="<%=cp%>/res/images/trip/city5.jpg" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">Venice</div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                             </div>
  	    		            </li>
  	    		            <li>
  	    	                 <img src="<%=cp%>/res/images/trip/city3.jpg" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">London</div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                             </div>
  	    		            </li>
  	    		            <li>
  	    	                 <img src="<%=cp%>/res/images/trip/city4.jpg" alt=""/><div class="cover-slide-trip"></div>
                             <div class="trip-slide-price col-md-5">
                                <div class="trip-slide-text prague">Prague</div>
                                <p>Nestled between the Caribbean, the South Pacific, and the South Atlantic Oceans, South America is the wilder of the Americas, and a continent of superlatives...</p>
                             </div>
  	    		            </li>
                      </ul>
             </div><!--Close col-md-12-->
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
<script src="<%=cp%>/res/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>

<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>

<!--bxSlider-->
<script src="<%=cp%>/res/js/jquery.bxslider.js" type="text/javascript"></script>
<script>
$(document).ready(function () {
    "use strict";
    $('.bxslider').bxSlider({
        auto: true
    });
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
 </body>
</html>