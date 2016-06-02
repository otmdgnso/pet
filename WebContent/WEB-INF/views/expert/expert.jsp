<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>

<html>
	<head>
    <title>Travego</title>
    <meta charset="utf-8">
    

</head>
	<body>
    

    <div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">Blog Full</h2>
                </div>
                
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
                                        <div class="entry-date" align="center">
                                                    <img src="<%=cp%>/res/image/cat1.png" style="padding: 20px;">
                                                    <p>수의사 : 김기자</p>
                                                </div>
                                        <img src="<%=cp%>/res/image/catmovie.gif" height="30px" style="padding-left: 40%; padding-top: 10px;"/>

                                    </div>
                                    <div class="blog-img-title">
                                      <h3>고양이에 관한 잘못된 상식</h3>
                                      
                                      <p>
고양이는 항상 발로 착지한다?<br>그렇지 않아요.<br>
고양이는 다른 과(科) 동물들에 비해 본능적으로 발이 먼저 땅에 닿도록 착지하며 비교적 높은 곳에서 떨어져도 살아남죠.<br>
고층에서 떨어진 고양이가 살아남아 기네스북에 오른 고양이도 있답니다.<br>
그러나 고양이들도 잘못 떨어져 뼈가 부러지는 경우가 있으며, 개체마다 차이는 있어요. <br>
안전을 위해 발코니나 창문에서 떨어져 사고가 나지 않도록 보호막 등의 장비를 설치해야만 한답니다.
</p>
                                      <ul class="blog-info">  
                                        <li><i class="fa fa-user"></i>POSTED BY : <a href="#"> Robert Doe</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i>30 comments</a></li>
                                        <li><a href="#"><i class="fa fa-heart"></i>22 Likes</a></li>
                                      </ul>
                                    </div>
                            </div>
	                                        <div class="overlay">
                                            <a href="#" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
	                        <div class="blog-view">
                                    <div class="entry-date">
                                                    <label class="date">22</label>
                                                    <label class="month">OCTOBER</label>
                                                    <p>07 comments</p>
                                                </div>
                                    <div class="bx-about2">

                                        <ul class="bxslider">
                                            <li><img src="http://placehold.it/1920x600" alt=""/></li>
  	    		                            <li><img src="http://placehold.it/1920x600" alt=""/></li>
  	    		                            <li><img src="http://placehold.it/1920x600" alt=""/></li>
  	    		                            <li><img src="http://placehold.it/1920x600" alt=""/></li>
                                        </ul>
                                     </div>
                                    <div class="blog-img-title">
                                      <h3>Slideshow post with slider</h3>
                                      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stand dummy text ever since the 1500s, when an unknown printer took a galley of type and 
                                      scrambled it to make a neque a tortor tempor in porta sem vulputate. Donec varius felis fermentum nis type specimen book. It has survived not only five centuries.</p>
                                      <ul class="blog-info">  
                                        <li><i class="fa fa-user"></i>POSTED BY : <a href="#"> Robert Doe</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i>30 comments</a></li>
                                        <li><a href="#"><i class="fa fa-heart"></i>22 Likes</a></li>
                                      </ul>
                                    </div>
                            </div>

	                        <div class="blog-view view-fifth">
                                     <div class="entry-date">
                                                    <label class="date">22</label>
                                                    <label class="month">OCTOBER</label>
                                                    <p>08 comments</p>
                                                </div>
                                    <div class="col-video">
                                            <div class="video-container">
                                                <iframe height="298" width="397" src="http://www.youtube.com/embed/308nBBeRV24?wmode=transparent&amp;showinfo=0&amp;autoplay=0&amp;rel=0" frameborder="0" allowfullscreen="true"></iframe>
                                            </div>
                                        </div>
                                    <div class="blog-img-title">
                                      <h3>YouTube Video Post</h3>
                                      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stand dummy text ever since the 1500s, when an unknown printer took a galley of type and 
                                      scrambled it to make a neque a tortor tempor in porta sem vulputate. Donec varius felis fermentum nis type specimen book. It has survived not only five centuries.</p>
                                      <ul class="blog-info">  
                                        <li><i class="fa fa-user"></i>POSTED BY : <a href="#"> Robert Doe</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i>30 comments</a></li>
                                        <li><a href="#"><i class="fa fa-heart"></i>22 Likes</a></li>
                                      </ul>
                                    </div>
                            </div>
                            <div class="blog-view view-fifth">
                                    <div class="entry-date">
                                            <label class="date">22</label>
                                            <label class="month">OCTOBER</label>
                                            <p>10 comments</p>
                                        </div>
                                    <div class="col-video">
                                        <div class="video-container">
                                            <iframe class="" src="//player.vimeo.com/video/110690554" frameborder="0" allowfullscreen></iframe>
                                        </div>
                                    </div>
                                    <div class="blog-img-title">
                                      <h3>Vimeo Video Post</h3>
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


	</body>
</html>