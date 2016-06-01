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
<script type="text/javascript">
$(function(){
	var s=location.href;
	if(s=="http://localhost:9090/pet/adopt/list?orderList=hitCount") {
	$('.albumFilter .current').removeClass('current');
	$('.albumFilter .5').addClass('current');
	} else if(s=="http://localhost:9090/pet/adopt/list?orderList=priceH") {
		$('.albumFilter .current').removeClass('current');
		$('.albumFilter .3').addClass('current');
	} else if(s=="http://localhost:9090/pet/adopt/list?orderList=priceL") {
		$('.albumFilter .current').removeClass('current');
		$('.albumFilter .4').addClass('current');
	} else if(s=="http://localhost:9090/pet/adopt/list?searchKey=species&searchValue=dog") {
		$('.albumFilter .current').removeClass('current');
		$('.albumFilter .1').addClass('current');
	} else if(s=="http://localhost:9090/pet/adopt/list?searchKey=species&searchValue=cat") {
		$('.albumFilter .current').removeClass('current');
		$('.albumFilter .2').addClass('current');
	}
});
</script>
	<body>

    <div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">분양</h2>
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
				                <li data-filter=".cat1" class="1"><a href="<%=cp%>/adopt/list?searchKey=species&searchValue=dog">강아지만</a></li> 
				                <li data-filter=".cat2" class="2"><a href="<%=cp%>/adopt/list?searchKey=species&searchValue=cat">고양이만</a></li> 
				                <li data-filter="*" class="current"><a href="<%=cp%>/adopt/list">최신순</a></li> 
				                <li data-filter=".cat3" class="3"><a href="<%=cp%>/adopt/list?orderList=priceH">가격 높은순</a></li>
				                <li data-filter=".cat4" class="4"><a href="<%=cp%>/adopt/list?orderList=priceL">가격 낮은순</a></li>  
				                <li data-filter=".cat5" class="5"><a href="<%=cp%>/adopt/list?orderList=hitCount">조회순</a></li> 
				                <li><a href="<%=cp%>/adopt/created">등록하기</a></li>
			                </ul> 
		                </dd>
	                </dl>

                <div class="portfolio albumContainer">
                		<c:forEach var="dto" items="${list}">
	                        <div class="cat3 col-md-4 gallery-view view-fifth">
                                   <div class="img">
                                        <img src="<%=cp%>/uploads/adopt/${dto.saveFilename}" style="width: 380px; height: 300px"/>
                                        <div class="overlay">
                                            <a href="${articleUrl}&preSaleNum=${dto.preSaleNum}" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div align="left" class="gallery-img-title">
                                      <span style="color: black;">제목 : ${dto.subject}</span> &nbsp;
                                       <span style="color: orange; font-weight: bold;">[${dto.replyCount}]</span><br>
                                       <span style="color: black;">조회수 ${dto.hitCount}  |  ${dto.created}     </span><br>
                                       <span style="color: black;">${dto.userId} </span>
                                    </div>
                            </div>
						</c:forEach>
	                        
                           
                      </div>
                      
                     
                    
          </div><!--Close col 12 -->
          <div align="center">
          <ul class="pagination clearfix">
                        <c:if test="${dataCount!=0}">
            				${paging}
         				</c:if>
                    </ul>
                    </div>

       </div>
          
    </div>
        
</section>      


	</body>
</html>