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
                    <h2 class="title-about">전문가 이야기</h2>
                </div>
                
             </div>
          </div>
      </div>
</section>
<section id="blog">

   <div class="container">
      <div class="row">
         <div class="col-md-12 effect-5 effects">

				<div class="cbp-vm-options" style="width: 100%; height: 64px;">
                                 <div class="click-nav">
			                        <ul>
				                        <li><a class="clicker" href="#">모두 보기</a></li>
			                        </ul>
		                        </div>
                                <div class="click-nav">
			                        <ul>
				                        <li><a class="clicker" href="#">강아지</a></li>
			                        </ul>
		                        </div>
                                <div class="click-nav">
			                        <ul>
				                        <li><a class="clicker" href="#">고양이</a></li>
			                        </ul>
		                        </div>			
					</div>

<div class="blog-view view-fifth">
	<div class="img">
		<div class="entry-date" align="center">
			<img src="<%=cp%>/res/image/cat1.png" style="padding: 20px;">
			<p>고양이</p>
		</div>
		<img src="<%=cp%>/res/image/catmovie.gif" height="30px" style="padding-left: 40%; padding-top: 10px;"/>
	</div>
	<div class="blog-img-title">
		<h2 style="color: tomato">고양이에 관한 잘못된 상식</h2>
		<p>
		고양이는 항상 발로 착지한다?<br>그렇지 않아요.<br>
		고양이는 다른 과(科) 동물들에 비해 본능적으로 발이 먼저 땅에 닿도록 착지하며 비교적 높은 곳에서 떨어져도 살아남죠.<br>
		고층에서 떨어진 고양이가 살아남아 기네스북에 오른 고양이도 있답니다.<br>
		그러나 고양이들도 잘못 떨어져 뼈가 부러지는 경우가 있으며, 개체마다 차이는 있어요. <br>
		안전을 위해 발코니나 창문에서 떨어져 사고가 나지 않도록 보호막 등의 장비를 설치해야만 한답니다.
		</p>
		<ul class="blog-info">  
			<li><i class="fa fa-user"></i>POSTED BY : <a href="#">김기자</a></li>
			<li><a href="#"><i class="fa fa-comments"></i>30 comments</a></li>
			<li><a href="#"><i class="fa fa-heart"></i>22 Likes</a></li>
		</ul>
	</div>
</div>
                            
 
<div class="blog-view view-fifth">
	<div class="img">
		<div class="entry-date" align="center">
			<img src="<%=cp%>/res/image/cat1.png" style="padding: 20px;">
			<p>고양이</p>
		</div>
		<img src="<%=cp%>/res/image/imgcat1.JPG" style="width:80%;  height:400px; padding-left: 20%"/>
	</div>
	<div class="blog-img-title">
		<h2 style="color: tomato">냥이 눈을 보고 말해요 -3</h2>
		<br><br>
		<span style="color: green; font-size: 20px;">눈을 가늘게 뜨고 있을 때 </span><br>
		<p>
		나른한 상태에서 눈을 반쯤 감고 있는다.<br><br>
		<span style="color: green; font-size: 15px;">감정상태</span><br>
		'매우 기분이 좋아!' '나는 지금 만족스럽다~'<br><br>
		<span style="color: green; font-size: 15px;">상황</span><br>
		집사의 손길을 느끼면서 잠에 빠져들기 전.<br>
		</p>
		<ul class="blog-info">  
			<li><i class="fa fa-user"></i>POSTED BY : <a href="#">김기자</a></li>
			<li><a href="#"><i class="fa fa-comments"></i>5 comments</a></li>
			<li><a href="#"><i class="fa fa-heart"></i>17 Likes</a></li>
		</ul>
	</div>
</div>       
                            
                            
                            
                            
<div class="blog-view view-fifth">
	<div class="img">
		<div class="entry-date" align="center">
			<img src="<%=cp%>/res/image/cat1.png" style="padding: 20px;">
			<p>고양이</p>
		</div>
		<img src="<%=cp%>/res/image/imgcat2.JPG" style="width:80%;  height:400px; padding-left: 20%"/>
	</div>
	<div class="blog-img-title">
		<h2 style="color: tomato">냥이 눈을 보고 말해요 -2</h2>
		<br><br>
		<span style="color: purple; font-size: 20px;">좌우 눈의 크기가 다를 때 </span><br>
		<p>
		고양이는 눈을 부릅 뜰 때, 좌우 눈의 크기가 달라진다.<br><br>
		<span style="color: purple; font-size: 15px;">감정상태</span><br>
		'불안해!' '무서워'<br><br>
		<span style="color: purple; font-size: 15px;">상황</span><br>
		낯선 사람과 함께 또는 낯선 장소에 있을 때<br>
		</p>
		<ul class="blog-info">  
			<li><i class="fa fa-user"></i>POSTED BY : <a href="#">김기자</a></li>
			<li><a href="#"><i class="fa fa-comments"></i>8 comments</a></li>
			<li><a href="#"><i class="fa fa-heart"></i>11 Likes</a></li>
		</ul>
	</div>
</div>                              
                            

<div class="blog-view view-fifth">
	<div class="img">
		<div class="entry-date" align="center">
			<img src="<%=cp%>/res/image/cat1.png" style="padding: 20px;">
			<p>고양이</p>
		</div>
		<img src="<%=cp%>/res/image/imgcat3.JPG" style="width:80%;  height:400px; padding-left: 20%"/>
	</div>
	<div class="blog-img-title">
		<h2 style="color: tomato">냥이 눈을 보고 말해요 -1</h2>
		<br><br>
		<span style="color: blue; font-size: 20px;">좌우 눈의 크기가 다를 때 </span><br>
		<p>
		우리, 눈으로 대화해요<br><br>
		<span style="color: blue; font-size: 15px;">①빤히 쳐다보지 않는다.</span><br>
		고양이는 빤히 쳐다보는 것을 공격의 의미로 판단.<br>
		때문에 고양이와 눈을 마주치지 않는 사람에게 호감을 느낌<br><br>
		<span style="color: blue; font-size: 15px;">②눈으로 키스하다.</span><br>
		고양이가 어느 정도 거리를 두고 나른한 눈빛을 하고 있다면,<br>
		집사도 고양이처럼 졸린 듯한 눈빛으로 서서히 눈을 깜빡여보기.<br>
		만약 고양이가 따라서 눈을 깜빡인다면 키스 성공!
		</p>
		<ul class="blog-info">  
			<li><i class="fa fa-user"></i>POSTED BY : <a href="#">김기자</a></li>
			<li><a href="#"><i class="fa fa-comments"></i>18 comments</a></li>
			<li><a href="#"><i class="fa fa-heart"></i>37 Likes</a></li>
		</ul>
	</div>
</div>  
                         
                            
<div class="blog-view view-fifth">
	<div class="img">
		<div class="entry-date" align="center">
			<img src="<%=cp%>/res/image/dog1.png" style="padding: 20px;">
			<p>강아지</p>
		</div>
		<img src="<%=cp%>/res/image/imgdog1.JPG" style="width:80%;  height:400px; padding-left: 20%"/>
	</div>
	<div class="blog-img-title">
		<h2 style="color: tomato">안내견을 만났을 때 주의해야할 점</h2>
		<br><br>
		<p>
		국내 안내견은 대부분 리트리버 종이라서 듬직하고, 푸근하고, 멋있어요.<br><br>		
		그래서 쓰다듬거나, 먹을 것을 주려는 분들도 있는데요,<br>
		안내견한테는 그러면 절대 안됩니다.<br><br>
		자칫 주의력을 산만하게 해서 주인을 곤경에 빠트릴 수 있기 때문인데요.<br>
		그러니까, 예뻐도 쓰다듬거나 만지면 안되구요,<br>
		먹을 것을 주면 안 됩니다. 또, 안내견을 부르거나 말을 거는 것, 허락없이 사진을 찍는 것도 안됩니다.
		</p>
		<ul class="blog-info">  
			<li><i class="fa fa-user"></i>POSTED BY : <a href="#">김기자</a></li>
			<li><a href="#"><i class="fa fa-comments"></i>9 comments</a></li>
			<li><a href="#"><i class="fa fa-heart"></i>13 Likes</a></li>
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