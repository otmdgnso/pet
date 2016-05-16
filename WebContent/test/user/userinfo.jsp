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
        <link href="css/meteo/example.css" rel="stylesheet" type="text/css" />
        <!--Gallery-->
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
                    <h2 class="title-about">Travel Guide</h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li>/</li>
                    <li><a href="#">PAGES</a></li>
                    <li>/</li>
                    <li class="active">Travel Guide</li>
                </ul>
             </div>
          </div>
      </div>
    </section>
<section id="guide">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
              <div id="horizontalTab">
                    <ul>
                        <li><a href="#tab-1">General Info</a></li>
                        <li><a href="#tab-2">Culture</a></li>
                        <li><a href="#tab-3">Night Clubs</a></li>
                        <li><a href="#tab-4">Gastronomy</a></li>
                        <li><a href="#tab-5">Best places</a></li>
                        <li><a href="#tab-6">Weather</a></li>
                    </ul>

                    <div id="tab-1">
                       <div class="city-info-content">
                        <div class="info-box-guide">
                            <ul>
                                <li><label>Country:</label>Italy</li>
                                <li><label>City:</label>Rome</li>
                                <li><label>Area:</label>1287,36 km²</li>
                                <li><label>Weather:</label>21°C, Wind</li>
                                <li><label>Local time:</label>Mon 3:24 pm</li>
                                <li><label>Currency:</label>Euro</li>
                                <li><label>Language:</label>Italian</li>
                                <li><label>Population:</label>2874 million</li>
                            </ul>
                        </div>
                        <img src="http://placehold.it/1600x800" alt="" />
                        </div>
                        <h3>General Information About Rome</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu scelerisque eros. Fusce ante orci, hendrerit sit amet metus sit amet, venenatis sodales felis. Morbi vel mi in leo dignissim convallis in a neque. Suspendisse sollicitudin nibh non dapibus condimentum. Etiam sit amet arcu ultricies, porttitor justo eget, scelerisque urna. Praesent non ligula nec ligula euismod condimentum eget sed augue. Ut feugiat, turpis id sollicitudin vestibulum, tellus massa adipiscing nisl, quis cursus nisl arcu vel ipsum.</p>
                        <p>Praesent eros turpis, commodo vel justo at, pulvinar mollis eros. Mauris aliquet eu quam id ornare. Morbi ac quam enim. Cras vitae nulla condimentum, semper dolor non, faucibus dolor. Vivamus adipiscing eros quis orci fringilla, sed pretium lectus viverra. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec nec velit non odio aliquam suscipit. Sed non neque faucibus, condimentum lectus at, accumsan enim. Fusce pretium egestas cursus. Etiam consectetur, orci vel rutrum volutpat, odio odio pretium nisiodo tellus libero et urna. Sed commodo ipsum ligula, id volutpat risus vehicula in. Pellentesque non massa eu nibh posuere bibendum non sed enim. Maecenas lobortis nulla sem, vel egestas dui ullamcorper ac.</p>
                    </div>
                    <div id="tab-2">
                        
                        <div class="col-md-5 histo-img"><img src="http://placehold.it/450x260" alt="" /></div>
                        <div class="col-md-7 guide-story-info">
                            <h3 style="margin-top:0">Rome History</h3>
                            <p>Quisque sodales sodales lacus pharetra bibendum. Etiam commodo non velit ac rhoncus. Mauris euismod purus sem, ac adipiscing quam laoreet et. Praesent vulputate ornare sem vel scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit gravida. Proin ante massa, ornare accumsan ultricies et, posuere sit amet magna. Praesent dignissim, enim sed malesuada luctus, arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec tristique mi turpis, et sodales nibh gravida eu. Etiam odio risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean ultricies 
                            dolor est, a congue ante dapibus varius. Nulla at auctor nunc. Curabitur accumsan feugiat felis ut pretium. Praesent semper semper nisi, eu cursus augue.</p>
                        </div>
                        <div class="clear"></div>
                        <h3>Rome Culture</h3>
                        <div class="col-md-5 culture-img"><img src="http://placehold.it/400x200" alt="" /></div>
                        <div class="col-md-7 histo-img">
                            <p>Quisque sodales sodales lacus pharetra bibendum. Etiam commodo non velit ac rhoncus. Mauris euismod purus sem, ac adipiscing quam laoreet et. Praesent vulputate ornare sem vel scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit gravida. Proin ante massa, ornare accumsan ultricies et, posuere sit amet magna. Praesent dignissim, enim sed malesuada luctus, arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec tristique mi turpis, et sodales nibh gravida eu. Etiam odio risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean ultricies 
                            dolor est, a congue ante dapibus varius. Nulla at auctor nunc. Curabitur accumsan feugiat felis ut pretium. Praesent semper semper nisi, eu cursus augue.</p>
                        </div>
                    </div>
                    <div id="tab-3">
                        <div class="col-md-3 histo-img">
                            <img src="http://placehold.it/300x200" alt="" />
                            <p class="local-name">El Birro Disco Pub</p>
                            <p>Every day: 8:00pm to 3:00am </p>
                         </div>
                        <div class="col-md-3 histo-img">
                            <img src="http://placehold.it/300x200" alt="" />
                            <p class="local-name">After Dinner</p>
                            <p>Every day: 8:00pm to 3:00am </p>
                        </div>
                        <div class="col-md-3 histo-img">
                            <img src="http://placehold.it/300x200" alt="" />
                            <p class="local-name">After Dinner</p>
                            <p>Every day: 8:00pm to 3:00am </p>
                        </div>
                        <div class="col-md-3 histo-img">
                            <img src="http://placehold.it/300x200" alt="" />
                            <p class="local-name">Il Barocco</p>
                            <p>Every day: 8:00pm to 3:00am </p>
                        </div>

                        <div class="night-desc"><p>Mauris facilisis elit ut sem eleifend accumsan molestie sit amet dolor. Pellentesque dapibus arcu eu lorem laoreet, vitae cursus metus mattis. Nullam eget porta enim, eu rutrum magna. Duis quis tincidunt sem, sit amet faucibus magna. Integer commodo, turpis consequat fermentum egestas, leo odio posuere dui, elementum placerat eros erat id augue. Nullam at eros eget urna vestibulum malesuada vitae eu mauris. Aliquam interdum rhoncus velit, quis scelerisque leo viverra non. Suspendisse id feugiat dui. 
                        Nulla in aliquet leo. Proin vel magna sed est gravida rhoncus. Mauris lobortis condimentum nibh, vitae bibendum tortor vehicula ac. Curabitur posuere arcu eros.</p></div>
                       
                        <div class="night-desc">
                        <h3>Warnings</h3>
                        <p>Mauris facilisis elit ut sem eleifend accumsan molestie sit amet dolor. Pellentesque dapibus arcu eu lorem laoreet, vitae cursus metus mattis. Nullam eget porta enim, eu rutrum magna. Duis quis tincidunt sem, sit amet faucibus magna. Integer commodo, turpis consequat fermentum egestas, leo odio posuere dui, elementum placerat eros erat id augue. Nullam at eros eget urna vestibulum malesuada vitae eu mauris. Aliquam interdum rhoncus velit, quis scelerisque leo viverra non. Suspendisse id feugiat dui. 
                        Nulla in aliquet leo. Proin vel magna sed est gravida rhoncus. Mauris lobortis condimentum nibh, vitae bibendum tortor vehicula ac. Curabitur posuere arcu eros.</p></div>
                    </div>
                    <div id="tab-4">
                        <div class="col-md-3 histo-img"><img src="http://placehold.it/300x200" alt="" /></div>
                        <div class="col-md-9">
                            <h3>Pasta</h3>
                            <p>Quisque sodales sodales lacus pharetra bibendum. Etiam commodo non velit ac rhoncus. Mauris euismod purus sem, ac adipiscing quam laoreet et. Praesent vulputate ornare sem vel scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit gravida. Proin ante massa, ornare accumsan ultricies et, posuere sit amet magna. Praesent dignissim, enim sed malesuada luctus, arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec tristique mi turpis, et sodales nibh gravida eu. Etiam odio risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean ultricies 
                            dolor est, a congue ante dapibus varius. Nulla at auctor nunc.</p>
                        </div>
                        <div class="clear"></div><br />
                        <div class="col-md-3 histo-img"><img src="http://placehold.it/300x200" alt="" /></div>
                        <div class="col-md-9">
                            <h3>Pizza</h3>
                            <p>Quisque sodales sodales lacus pharetra bibendum. Etiam commodo non velit ac rhoncus. Mauris euismod purus sem, ac adipiscing quam laoreet et. Praesent vulputate ornare sem vel scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit gravida. Proin ante massa, ornare accumsan ultricies et, posuere sit amet magna. Praesent dignissim, enim sed malesuada luctus, arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec tristique mi turpis, et sodales nibh gravida eu. Etiam odio risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean ultricies 
                            dolor est, a congue ante dapibus varius. Nulla at auctor nunc.</p>
                        </div>
                        <div class="clear"></div><br />
                        <div class="col-md-3 histo-img"><img src="http://placehold.it/300x200" alt="" /></div>
                        <div class="col-md-9">
                            <h3>Vino</h3>
                            <p>Quisque sodales sodales lacus pharetra bibendum. Etiam commodo non velit ac rhoncus. Mauris euismod purus sem, ac adipiscing quam laoreet et. Praesent vulputate ornare sem vel scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit gravida. Proin ante massa, ornare accumsan ultricies et, posuere sit amet magna. Praesent dignissim, enim sed malesuada luctus, arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec tristique mi turpis, et sodales nibh gravida eu. Etiam odio risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean ultricies 
                            dolor est, a congue ante dapibus varius. Nulla at auctor nunc</p>
                        </div>
                    </div>
                    <div id="tab-5">
                        <p>Proin dignissim faucibus odio sollicitudin sagittis. Phasellus aliquet, erat vitae mollis consectetur, enim lectus ornare libero, et porta mi dui eu tellus. Morbi lobortis, elit at euismod porta, magna lacus mattis massa, a lacinia ligula risus et lectus. Sed et aliquam ligula. Nunc venenatis orci magna, quis facilisis sem porta non. Nunc sodales arcu in consectetur malesuada. Maecenas varius justo lacus, scelerisque viverra tellus luctus eu. Nam imperdiet ultricies suscipit. Ut urna mauris, eleifend quis lacinia non, mollis id libero. Praesent pharetra viverra ipsum at posuere. Quisque commodo tortor nec hendrerit faucibus. Fusce convallis urna et vehicula tincidunt. Duis sed vehicula justo, eu placerat nisi. Donec facilisis augue non turpis semper, eget condimentum mauris malesuada. Nunc in dignissim mi, sed laoreet felis.</p>
                    </div>
                    <div id="tab-6">
                        <h3>Italy Weather <span>(more info <a href="meteo.html">travego meteo</a>)</span></h3>
                        <p>Quisque sodales sodales lacus pharetra bibendum. Etiam commodo non velit ac rhoncus. Mauris euismod purus sem, ac adipiscing quam laoreet et. Praesent vulputate ornare sem vel scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit gravida. Proin ante massa, ornare accumsan ultricies et, posuere sit amet magna. Praesent dignissim, enim sed malesuada luctus, arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec tristique mi turpis, et sodales nibh gravida eu. Etiam odio risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean ultricies 
                            dolor est, a congue ante dapibus varius. Nulla at auctor nunc</p>
                        <div id="meteo-guide"></div>
                    </div>
          </div><!--Close col 12 -->

      </div>
          <!--Counter -->
			    <div class="col-md-12 content-number-left">
                    <div class="col-md-3 number-structure-left">
                        <div class="col-xs-4 count-ico n-color3">
                            <i class="fa fa-car"></i>
                        </div>
                        <div class="col-xs-8 n-number">
                            <span class="counter" style="display: inline-block;">112</span>
                            <p>TRANSPORT OPTIONS</p>
                        </div>            
                    </div>
                    <div class="col-md-3 number-structure-left">
                        <div class="col-xs-4 count-ico n-color1">
                            <i class="fa fa-bed"></i>
                        </div>
                        <div class="col-xs-8 n-number">
                            <span class="counter" style="display: inline-block;">342</span>
                            <p>5 STAR HOTELS</p>
                         </div>           
                    </div>
                    <div class="col-md-3 number-structure-left">
                    <div class="col-xs-4 count-ico n-color2">
                        <i class="fa fa-glass"></i>
                    </div>
                    <div class="col-xs-8 n-number">
                        <span class="counter" style="display: inline-block;">595</span>
                        <p>NIGHT CLUBS </p>
                     </div>           
                    </div>
                    
                    <div class="col-md-3 number-structure-left">
                    <div class="col-xs-4 count-ico n-color4">
                        <i class="fa fa-coffee"></i>
                    </div>
                    <div class="col-xs-8 n-number">
                        <span class="counter" style="display: inline-block;">182</span>
                        <p>CAFE' ROYAL</p>
                    </div>            
                    </div>
                </div>	
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
<script>
$(function () {
    "use strict";
        var mobile_nav = $("#mobile-menu-01 li.line-mini-menu");
        mobile_nav.click(function () {
            $(this).children('div').addClass("active");
            $(this).children('div').toggle(1000);
        });

        var mobile_open = $("#mobile-menu-01 .line-logo i.fa-bars");
        mobile_open.click(function () {
            $("#mobile-menu-01 .travel-mega-menu-mobile").toggle(1000);
        });
});
</script>
    
<script src="js/tabs/jquery.responsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    "use strict";
    $('#horizontalTab').responsiveTabs({
        rotate: false,
        startCollapsed: 'accordion',
        collapsible: 'accordion',
        setHash: true,
        animation: 'slide',
        disabled: [4],
        activate: function (e, tab) {
            $('.info').html('Tab <strong>' + tab.id + '</strong> activated!');
        },
        activateState: function (e, state) {
            //console.log(state);
            $('.info').html('Switched from <strong>' + state.oldState + '</strong> state to <strong>' + state.newState + '</strong> state!');
        }
    });

});
</script>
 <!--Carousel-->
<script src="js/carousel/modernizr.custom.js" type="text/javascript"></script>
<script src="js/carousel/jquery.cbpContentSlider.min.js" type="text/javascript"></script>
<script>
     $(function () {
         $('#cbp-contentslider').cbpContentSlider();
     });
		</script>

 <!--Counter-->

<script src="js/jquery.counterup.js" type="text/javascript"></script>  
<script type="text/javascript">
jQuery(document).ready(function ($) {
    "use strict";
    $('.counter').counterUp({
        delay: 40,
        time: 4000
    });
});
</script>

<!--Meteo-->
<script src="js/meteo/jquery.zweatherfeed.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function () {
    "use strict";
    $('#meteo-guide').weatherfeed(['ITXX0067', 'ITXX0028'], {
        unit: 'f',
	image: true,
	country: true,
	highlow: true,
	wind: true,
	humidity: true,
	visibility: true,
	sunrise: true,
	sunset: true
    });
});
</script>
	</body>
</html>