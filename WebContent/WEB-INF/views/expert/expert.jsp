<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
 
<script src="<%=cp%>/res/js/modernizr.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>

 <!--Carousel-->
 <script src="<%=cp%>/res/js/carousel/modernizr.custom.js" type="text/javascript"></script>
 <script src="<%=cp%>/res/js/carousel/jquery.cbpContentSlider.min.js" type="text/javascript"></script>
 <script>
$(function () {
    "use strict";
    $('#cbp-contentslider').cbpContentSlider();
});
</script>
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

 <script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>
 
<div id="loader-wrapper">
        <div id="loader"></div>
    </div>

    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">Blog Full</h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li>/</li>
                    <li><a href="#">PAGES</a></li>
                    <li>/</li>
                    <li class="active">Blog Full</li>
                </ul>
             </div>
          </div>
      </div>
    </section>
<section id="blog">
   <div class="container">
      <div class="row">
         <div class="col-md-12 effect-5 effects">

	                        <div class="blog-view view-fifth">
                                   <div class="img">
                                        <div class="entry-date">
                                                    <label class="date">22</label>
                                                    <label class="month">OCTOBER</label>
                                                    <p>12 comments</p>
                                                </div>
                                        <img src="http://placehold.it/2000x1000" alt=""/>
                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div class="blog-img-title">
                                      <h3>Standard single image post</h3>
                                      
                                      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stand dummy text ever since the 1500s, when an unknown printer took a galley of type and 
                                      scrambled it to make a neque a tortor tempor in porta sem vulputate. Donec varius felis fermentum nis type specimen book. It has survived not only five centuries.</p>

                                      <ul class="blog-info">  
                                        <li><i class="fa fa-user"></i>POSTED BY : <a href="#"> Robert Doe</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i>30 comments</a></li>
                                        <li><a href="#"><i class="fa fa-heart"></i>22 Likes</a></li>
                                      </ul>
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
