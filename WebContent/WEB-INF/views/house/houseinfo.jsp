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
    
    $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));
    
    ajaxReviewList();
    
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

//리뷰

function ajaxReviewList() {
	var url="<%=cp%>/house/review";
	var hostNum=${hostNum};
	var pageNo=1;
	$.post(url, {hostNum:hostNum, pageNo:pageNo}, function(data){
		$("#review").html(data);
	});
}

function deleteReview(reviewnum) {
	
	
	var url="<%=cp%>/house/review/delete";
	var params="reviewnum="+reviewnum;
	
	if(confirm("정말 삭제할까요?")) {
		
		$.ajax({
	         type:"POST"
	         ,url:url
	         ,data:params
	         ,success:function(data) {
	        	 ajaxReviewList();
	         }
	         ,error:function(e) {
	            //alert(e.responseText);
	         }
	      });
	}
}

function check_star(star){
	   
	   for(var i=1; i<=star;i++){
	         
	      var s = $("#star_"+i);
	      
	      s.src = "<%=cp%>/res/image/staryellow.png";
	   }
	   
	} 
	
//이미지 커지게 하기
function imgbigview(a,b){
	document.getElementById(b).getElementsByTagName("img")[0].src=a.href;
	if(document.getElementById(b).style.display=='block'){
		document.getElementById(b).style.display=='none';
	}else
		document.getElementById(b).style.display=='block';
}
//닫히게 하기
function hide(c){
	document.getElementById(c).style.display=='none';
}

var mlayoutPhoto=new PhotoImageViewer({
    target   : parent,
    cssurl   : "/common/storyphoto/original_viewer.css",
    //CAFESUS-4811 LCS 개선 
    gdid 	 : "90000004_019A822C00D59FF800000000",
    popupurl : "http://cafe.naver.com/common/storyphoto",
    allowRightMouseClick : false
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
						<td rowspan="2" align="center" width="30%">
						<img style="width: 90px; height: 100px;" src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="100px;">
						</td>
						<td align="center" width="30%"><h3 style="color:tomato;">${dto.subject}</h3></td>
					</tr>
					<tr>
						<td align="center" width="30%" style="color: #8C8C8C;">${dto.userName}</td>
				</table>
				</div>
			</div>
				<span style="color: black;">등록일 : ${dto.created}</span>
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
						<c:forEach var="dto" items="${readFile}" >
							<!-- <li><img src="http://placehold.it/840x460" alt=""/></li> -->
						  <a href="javascript_;;" onclick="window.open('<%=cp%>/uploads/house/${dto.saveFilename}','이름',
						  ' width=720,height=600,scrollbars=no,left=100,top=200'); return false">
						  <img style="width: 810px; height: 430px;"
								src="<%=cp%>/uploads/house/${dto.saveFilename}" alt=""  /></a>
						</c:forEach>
						<!-- 큰이미지 등장 -->
					</ul>
						<div id="bigimg" style="display:none;
							position: absolute;left:100px;top:100px; overflow:hidden; border: 0px
							solid; #ff6600;" align="center">
						</div>
					<div id="bx-pager">
						<c:forEach var="dto" items="${readFile}" begin="0" varStatus="status">
							<a data-slide-index="${status.index}" href=""><img style="width: 150px; height: 105px;"
								src="<%=cp%>/uploads/house/${dto.saveFilename}" alt="" /></a>
						</c:forEach>
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

			<!-- 후기 -->
            <div class="col-md-12 details-hotel" style="min-height: 100px; padding: 50px;">
              <div id="review"></div>
            </div>
           
            <!-- 리스트로 돌아가기 -->
            <div class="col-sm-8 col-md-9" style="margin-top: 30px; float: right;">
	           	<button type="button" class="btn btn-primary btn-block" style="float: right; width: 10%;" onclick="javascript:location.href='<%=cp%>/house/list';">목록</button>
	        </div>

          </div>
        </div>
        </div>
</section>
<form name="frmInof" method="post">
	<input type="hidden" name="hostNum" value="${dto.hostNum}" />
	<input type="hidden" name="cost" value="${dto.cost}" />
</form>      