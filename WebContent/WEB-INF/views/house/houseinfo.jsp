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
						<td align="center" width="30%">
						<img src="<%=cp%>/uploads/profile/20160518162814458843974403881.GIF" class="avatar img-circle img-thumbnail" width="100px;">
						</td>
						<td align="center" width="70%"><h3 style="color:tomato;">subject</h3></td>
					</tr>
				</table>
				</div>
			</div>
				
			<div class="separator" style="width:100%"></div>
				<section class="ac-container">
                <div style="width: 100%; height: 40px;"><button type="button" class="btn btn-danger" style="width: 100%; height: 50px;"><i class="fa fa-bolt" aria-hidden="true"></i> 	예약하기</button></div>
                </section>
                
                <section class="ac-container">
				    <div style="width: 100%; height: 40px;">
				    	<button type="button" class="btn btn-default" style="width: 100%; height: 50px;"><i class="fa fa-heart-o" aria-hidden="true"></i> 위시리스트에 담기</button>				   			
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
			</div><!-- /main -->
            <div class="col-md-12 details-hotel" style="height: 600px;">
              <p><i class="fa fa-map-o" aria-hidden="true"></i> 주소</p>
              <div class="separator" style="width:100%"></div>
              <p><i class="fa fa-krw" aria-hidden="true"></i> 비용</p>
              <div class="separator" style="width:100%"></div>
              <p><i class="fa fa-paw" aria-hidden="true"></i> 시설</p>
              <div class="separator" style="width:100%"></div>	
              <p><i class="fa fa-check-square-o" aria-hidden="true"></i> 내용</p>
            </div>
           </div><!--Close col 12 -->
          </div>
        </div>
</section>      