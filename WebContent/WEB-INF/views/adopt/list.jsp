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
        <link href="<%=cp%>/res/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/animate.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/settings_slide2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <!--Carousel-->
        <link href="<%=cp%>/res/css/carousel/component.css" rel="stylesheet" type="text/css" />

        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />
</head>
	<body>

    <div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">분양 게시판</h2>
                </div>
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
				                <li><a href="<%=cp%>/adopt/created">등록하기</a></li>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/4star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/5star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/5star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/3star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/4star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/3star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/3star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/4star.png" alt="" /></div>
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
                                      <div class="gallery-stars"><img src="<%=cp%>/res/images/3star.png" alt="" /></div>
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


	</body>
</html>