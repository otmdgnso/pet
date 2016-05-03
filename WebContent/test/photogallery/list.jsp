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
        <link href="css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
        <link href="css/animate.css" rel="stylesheet" type="text/css" />
        <link href="css/settings_slide2.css" rel="stylesheet" type="text/css" />
        <link href="css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <!--Carousel-->
        <link href="css/carousel/component.css" rel="stylesheet" type="text/css" />

        <link href="css/layout2.css" rel="stylesheet" type="text/css" />
        <link href="css/responsive.css" rel="stylesheet" type="text/css" />
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
				            <a href="#"><img alt="" src="images/flags/en.gif"/></a>
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
					<a class="logo" href="#"><img src="images/logo.jpg" alt=""/></a>
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
											<img src="images/continent/continent_1.png" alt="" />
                                            <h3>North America</h3>
                                            <ul>
                                              <li><a href="guide.html">Canada</a></li>
                                              <li><a href="guide.html">Hawai</a></li>
                                              <li><a href="guide.html">Alaska</a></li>
                                            </ul>
									</section>
									<section class="col col-md-3 destination-img">
										<img src="images/continent/continent_2.png" alt="" />
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
										<img src="images/continent/continent_3.png" alt="" />
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
										<img src="images/continent/continent_4.png" alt="" />
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
										<img src="images/continent/continent_5.png" alt="" />
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

          <!--Mobile Menu-->
          <nav id="mobile-menu-01" class="mobile-menu">
                <div class="line-logo">
					    <a class="logo" href="#"><img src="images/logo.jpg" alt=""/></a><i class="fa fa-bars"></i>
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
                    <h2 class="title-about">Gallery 2 Columns</h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li>/</li>
                    <li><a href="#">PAGES</a></li>
                    <li>/</li>
                    <li class="active">Gallery</li>
                </ul>
             </div>
          </div>
      </div>
    </section>
<section id="gallery">
   <div class="container">
      <div class="row">
         <div class="col-md-12 effect-5 effects">
            <dl class="group">
                        <dt></dt>
		                <dd>
			                <ul class="filter group albumFilter"> 
				                <li data-filter="*" class="current"><a href="#">SHOWALL</a></li> 
				                <li data-filter=".cat1"><a href="#">Countries</a></li> 
				                <li data-filter=".cat2"><a href="#">Beach</a></li> 
				                <li data-filter=".cat3"><a href="#">Island</a></li> 
				                <li data-filter=".cat4"><a href="#">Adventure</a></li> 
			                </ul> 
		                </dd>
	                </dl>

                <div class="portfolio albumContainer">
	                        <div class="cat3 col-md-6 gallery-view view-fifth">
                                   <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/4star.png" alt="" /></div>
                                    </div>
                            </div>
	
	                        <div class="cat2 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/5star.png" alt="" /></div>
                                    </div>
                            </div>

	                        <div class="cat2 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/5star.png" alt="" /></div>
                                    </div>
                            </div>
	                        
                            <div class="cat1 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/3star.png" alt="" /></div>
                                    </div>
                            </div>

                            <div class="cat4 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/4star.png" alt="" /></div>
                                    </div>
                            </div>

                            <div class="cat4 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/3star.png" alt="" /></div>
                                    </div>
                            </div>


                            <div class="cat1 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/3star.png" alt="" /></div>
                                    </div>
                            </div>

                            <div class="cat3 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/4star.png" alt="" /></div>
                                    </div>
                            </div>

                            <div class="cat2 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/3star.png" alt="" /></div>
                                    </div>
                            </div>
                           <div class="cat2 col-md-6 gallery-view view-fifth">
                                    <div class="img">
                                        <img src="http://placehold.it/1920x1080" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="gallery-img-title">
                                      <h3>ZANZIBAR - NUNGWI</h3>
                                      <div class="gallery-stars"><img src="images/3star.png" alt="" /></div>
                                    </div>
                            </div>
                      </div>
                    <ul class="pagination clearfix">
                        <li class="prev disabled"><a href="#">Previous</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li class="disabled"><span>...</span></li>
                        <li><a href="#">5</a></li>
                        <li class="next"><a href="#">Next</a></li>
                    </ul>
          </div><!--Close col 12 -->

       </div>
          
    </div>
        
</section>      

<section id="parallax" class="about-prx">
   <div class="effect-over">
        <div class="container">
           <div class="row">
             <div class="col-md-12">
                <div class="main">
				<div id="cbp-contentslider" class="cbp-contentslider">
					<ul>
						<li id="slide1">
							<h3 class="icon-wolf"><span>enezuela</span></h3>
							<div>
								<div class="cbp-content">
									<p>Veggies sunt bona vobis, proinde vos postulo esse magis desert raisin bush tomato soko salsify garbanzo horseradish cabbage burdock.</p>
									<p>Daikon artichoke gumbo azuki bean bok choy avocado winter purslane gram earthnut pea broccoli salsify squash plantain wattle seed wakame broccoli rabe bamboo shoot. Zucchini lotus root azuki bean epazote dulse pumpkin rutabaga spinach. Endive mung bean gumbo maize plantain rock melon.</p>
								</div>
							</div>
						</li>
						<li id="slide2">
							<h3 class="icon-rabbit"><span class="country-name1">ome</span></h3>
							<div>
								<div class="cbp-content">
									<p>Chicory collard greens tatsoi cress bamboo shoot broccoli rabe lotus root earthnut pea arugula okra welsh onion leek shallot courgette. Chard garlic fava bean pea sprouts gram spinach plantain tomatillo. Chicory garlic black-eyed pea gourd chickpea cucumber lotus root.</p>
									<p>Daikon artichoke gumbo azuki bean bok choy avocado winter purslane gram earthnut pea broccoli salsify squash plantain wattle seed wakame broccoli rabe bamboo shoot. Zucchini lotus root azuki bean epazote dulse pumpkin rutabaga spinach. Endive mung bean gumbo maize plantain rock melon.</p>
								</div>
							</div>
						</li>
						<li id="slide3">
							<h3 class="icon-aligator"><span class="country-name1">rgentine</span></h3>
							<div>
								<div class="cbp-content">
									<p>Tomato shallot broccoli rabe aubergine melon fava bean soybean sorrel. Tomatillo plantain wattle seed pea ricebean sorrel fennel welsh onion kakadu plum celery. Arugula radicchio garlic welsh onion kale celtuce tomato fava bean beet greens soybean burdock groundnut lentil broccoli rabe.</p>
								</div>
							</div>
						</li>
						<li id="slide4">
							<h3 class="icon-turtle"><span>urkey</span></h3>
							<div>
								<div class="cbp-content">
									<p>Yarrow bush tomato beetroot taro water chestnut komatsuna azuki bean. Parsnip artichoke water chestnut caulie carrot grape summer purslane brussels sprout fava bean tomatillo pea groundnut nori earthnut pea tigernut. Tigernut brussels sprout wakame tomatillo radicchio carrot maize swiss chard seakale melon grape broccoli pea sprouts kakadu plum plantain cauliflower. Gram salsify radicchio daikon courgette rock melon bunya nuts turnip greens. Cabbage black-eyed pea spinach asparagus plantain cress soybean spring onion salad artichoke pea garlic silver beet grape water spinach zucchini wakame summer purslane.</p>
								</div>
							</div>
						</li>
						<li id="slide5">
							<h3 class="icon-platypus"><span>rasil</span></h3>
							<div>
								<div class="cbp-content">
									<p>Potato watercress burdock spinach quandong jícama chard pea sprouts garlic celery turnip daikon kale lotus root sorrel coriander rock melon cabbage. Epazote salsify lentil rock melon eggplant cauliflower zucchini caulie catsear broccoli rabe pumpkin lettuce okra green bean squash seakale onion water chestnut. Sweet pepper peanut corn soko celery winter purslane.</p>
									<p>Daikon artichoke gumbo azuki bean bok choy avocado winter purslane gram earthnut pea broccoli salsify squash plantain wattle seed wakame broccoli rabe bamboo shoot. Zucchini lotus root azuki bean epazote dulse pumpkin rutabaga spinach. Endive mung bean gumbo maize plantain rock melon.</p>
								</div>
							</div>
						</li>
					</ul>
					<nav>
						<a href="#slide1" class="icon-wolf"><span>Venezuela</span></a>
						<a href="#slide2" class="icon-rabbit"><span>Rome</span></a>
						<a href="#slide3" class="icon-aligator"><span>Argentine</span></a>
						<a href="#slide4" class="icon-turtle"><span>Turkey</span></a>
						<a href="#slide5" class="icon-platypus"><span>Brasil</span></a>
					</nav>
				</div>
			  </div>
             </div><!--Close col-md-12-->
           </div>
        </div>
    </div>
</section>


<section id="footer">
    <div class="container">
            <div class="row">
                <div class="col-md-12">
                  <div class="col-md-3">
                    <img class='logo-footer' src='images/travego.png' alt='logo' />
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
<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="js/waypoints.min.js"></script>

<script src="js/gallery/isotope.js" type="text/javascript"></script>
<script>
/********************************************
PORTFOLIO
********************************************/
$(window).load(function () {
    "use strict";
    var $container = $('.albumContainer');
    $container.isotope({
        filter: '*',
        animationOptions: {
            duration: 750,
            easing: 'linear',
            queue: false
        }
    });

    $('.albumFilter li').click(function () {
        $('.albumFilter .current').removeClass('current');
        $(this).addClass('current');

        var selector = $(this).attr('data-filter');
        $container.isotope({
            filter: selector,
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
        return false;
    });
});
 </script>
 <!--Carousel-->
<script src="js/carousel/modernizr.custom.js" type="text/javascript"></script>
<script src="js/carousel/jquery.cbpContentSlider.min.js" type="text/javascript"></script>
 <script>
$(function () {
    "use strict";
    $('#cbp-contentslider').cbpContentSlider();
});
</script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script src="js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>

<script src="js/script.js" type="text/javascript"></script>


	</body>
</html>