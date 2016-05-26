<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	
<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<!--Carousel-->
<script src="<%=cp%>/res/js/carousel/modernizr.custom.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/carousel/jquery.cbpContentSlider.min.js" type="text/javascript"></script>
<script>
$(function () {
    "use strict";
    $('#cbp-contentslider').cbpContentSlider();
});
</script>
<!--slideshow-->
<script src="<%=cp%>/res/js/jquery.bxslider.js" type="text/javascript"></script>
<script>
$(function () {
    "use strict";
    $('.bxslider').bxSlider({
        pagerCustom: '#bx-pager'
    });
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

function checkCreated(hostNum) {
	var url="<%=cp%>/reservation/created";
	location.href=url+"?hostNum="+hostNum;
}

function checkCreated2() {
	var f = document.frmInof;
	f.action= "<%=cp%>/reservation/createdform";
	f.submit();
}

</script>

<div class="clear"></div>
  <section class="about-section-top">
     <div class="container">
        <div class="row">
           <div class="col-md-12">
             <div class="page-title pull-left">
                  <h2 class="title-about">House Details</h2>
              </div>
           </div>
        </div>
    </div>
  </section>
<section id="top-list-trip">
   <div class="container">
      <div class="row">
      
      
      <!-- 왼쪽 메뉴 -->
      
         <div class="col-sm-4 col-md-3">
               
           <div>
                <div style="width: 100%; height: 100px;">
                <table style="width: 100%; 	margin: 0px auto; border-spacing: 10px;">
                	<tr>
						<td rowspan="2" align="center" width="30%">
						<img src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="100px;">
						</td>
						<td align="center" width="70%"><h3 style="color:tomato;">${dto.subject}</h3></td>
					</tr>
					<tr>
						<td align="center" width="70%" style="color: #8C8C8C;">${dto.userName}</td>
				</table>
				</div>
			</div>
				
			<div class="separator" style="width:100%"></div>
				<section class="ac-container">
                <div style="width: 100%; height: 40px;"><button type="button" class="btn btn-danger" onclick="checkCreated2()" style="width: 100%; height: 50px;"><i class="fa fa-bolt" aria-hidden="true"></i> 	예약하기</button></div>
                </section>
                
                <section class="ac-container">
				    <div style="width: 100%; height: 40px;">
				    	<button type="button" class="btn btn-default" style="width: 100%; height: 50px;"><i class="fa fa-heart-o" aria-hidden="true"></i> 위시리스트에 담기</button>				   			
				    </div>				   
			    </section>
			    
			    <section class="ac-container">
				    <div style="width: 100%; height: 40px;">
				    	<button type="button" class="btn btn-default" style="width: 100%; height: 50px;"><i class="fa fa-commenting-o" aria-hidden="true"></i> 메시지 보내기</button>				   			
				    </div>				   
			    </section>
            </div>
             
         <!-- 본문 -->   
         <div class="col-sm-8 col-md-9">
            <div class="main-details bx-about2 noowlf">
				<ul class="bxslider">
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                  <li><img src="http://placehold.it/840x460" alt=""/></li>
                </ul>

                <div id="bx-pager">
                  <a data-slide-index="0" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="1" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="2" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="3" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="4" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="5" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="6" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                  <a data-slide-index="7" href=""><img src="http://placehold.it/100x55" alt=""/></a>
                </div>
			</div>
		
            <div class="col-md-12 details-hotel" style="min-height: 100px; padding: 50px;">
              <div><i class="fa fa-map-o" aria-hidden="true"></i> 주소</div><div align="right" style="text-align: center;"><input type="text" style="border: 0px; text-align: center; width: 40%;" readonly="readonly" value="${dto.address}"></div>
              <div class="separator" style="width:100%"></div>
              <div><i class="fa fa-krw" aria-hidden="true"></i> 비용 (1마리 기준) </div><div align="right" style="text-align: center;"><input type="text" style="border: 0px; text-align: center;" readonly="readonly" value="${dto.cost}원"></div>
              <div class="separator" style="width:100%"></div>
              <div><i class="fa fa-paw" aria-hidden="true"></i> 수용 가능 펫 수</div><div align="right" style="text-align: center;"><input type="text" style="border: 0px; text-align: center;" readonly="readonly" value="${dto.capacity}마리"></div>
              <div class="separator" style="width:100%"></div>	
              <div><i class="fa fa-check-square-o" aria-hidden="true"></i> 집 소개</div><div align="right" style="text-align: center;"><textarea rows="5%" cols="60%" readonly="readonly" style="border: #8C8C8C; text-align: center;">${dto.content}
              </textarea></div>
            </div>

            <div class="col-md-12 details-hotel" style="min-height: 100px; padding: 50px;">
              	<span style="color: #3EA9CD; font-weight: bold; font-size: 20px;">후기 3개 </span>
              			<img src="<%=cp%>/res/image/staryellow.png" width="20px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="20px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="20px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="20px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="20px">
              <div class="separator" style="width:100%; padding: 0px;"></div>
              <table style="width: 80%; margin: 0px auto; padding: 0px;">
              	<tr>
              		<td align="center" width="10%"><p>청결도</p></td>
              		<td align="center" width="20%">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              		</td>           		              		

              		<td align="center" width="10%"><p>가격</p></td>
              		<td align="center" width="20%">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              		</td>       

              		<td align="center" width="10%"><p>친절도</p></td>
              		<td align="center" width="20%">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              			<img src="<%=cp%>/res/image/staryellow.png" width="15px">
              		</td>       
              	</tr>
              </table>

              <div class="separator" style="width:100%; padding: 0px;"></div>
              
              	<div style="clear:both; margin-top:5px; padding: 10px; border-bottom:  #d5d5d5 solid 1px; min-height: 150px;">
       			<div style="clear: both;">
       				<table style="width: 100%; 	margin: 0px auto; border-spacing: 10px;">
                	<tr>
						<td align="center" width="20%">
							<img src="<%=cp%>/uploads/profile/20160518162814458843974403881.GIF" class="avatar img-circle img-thumbnail" width="70px;">
						</td>
						<td align="left" width="70%" style="margin-bottom:  5px;">
							Sean is a nice n helpful host, replied any question before n during the trip instantly. The location of the flat is perfect, so easy to getting around. The flat is clean n tidy, exactly as the pictures Sean show. Will come back again on my next visit.
						</td>
						<td width="10%"></td>
					</tr>
					<tr>
						<td align="center" width="20%">솜사탕</td>
						<td align="left" width="70%">2016/05/15</td>
						<td width="10%">삭제</td>
					</tr>
				</table>

            </div>
            </div>
            
            <div style="clear: both; padding-top: 10px; text-align: center;">
            	1
            </div>
            
           </div>
           
          </div>
        </div>
        </div>
</section>
<form name="frmInof" method="post">
	<input type="hidden" name="hostNum" value="${dto.hostNum}" />
	<input type="hidden" name="cost" value="${dto.cost}" />
</form>      