<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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
        
         <div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">Gallery 3 Columns</h2>
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
	                        <div class="cat3 col-md-4 gallery-view view-fifth">
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
	
	                        <div class="cat2 col-md-4 gallery-view view-fifth">
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

	                        <div class="cat2 col-md-4 gallery-view view-fifth">
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
	                        
                            <div class="cat1 col-md-4 gallery-view view-fifth">
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

                            <div class="cat4 col-md-4 gallery-view view-fifth">
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

                            <div class="cat4 col-md-4 gallery-view view-fifth">
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


                            <div class="cat1 col-md-4 gallery-view view-fifth">
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

                            <div class="cat3 col-md-4 gallery-view view-fifth">
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

                            <div class="cat2 col-md-4 gallery-view view-fifth">
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
        