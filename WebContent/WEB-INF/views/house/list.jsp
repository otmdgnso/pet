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
<!--List-->
<script src="<%=cp%>/res/js/list/cbpViewModeSwitch.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/list/classie.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>

<script src="<%=cp%>/res/js/list/jquery.mixitup.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	var s=location.href;
	if(s == "http://localhost:9090/pet/house/list") {
		$('')
	}
});

$(function () {
    "use strict";
    $('#Grid').mixItUp();
});
</script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;	
	f.action="<%=cp%>/house/list";
	f.submit();
}

function checkHouseinfo(hostNum) {
	var url="<%=cp%>/house/houseinfo";
	location.href=url+"?hostNum="+hostNum;
}
</script>

<!--List-->
<link href="<%=cp%>/res/css/list/component.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
<link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />


<div class="clear"></div>
<section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">집 구경</h2>
                </div>
             </div>
          </div>
      </div>
</section>

<section id="top-list-trip">
   <div class="container">
      <div class="row">
         <div class="col-sm-4 col-md-3">
                <form name="searchForm" method="post" class="form-inline">
                <div class="search-results-title" style="padding-top: 20px;"><i class="fa fa-search"></i>
                		<input type="text" style="width: 70%" class="form-control input-sm input-search" name="searchValue">
                		<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">검색</button>
                </div>
                </form>
                <section class="ac-container">
                    <h3 class="desc-filter">필터</h3>			  
				    <div>
					    <input id="ac-2" name="accordion-1" type="checkbox" checked/>
					    <label for="ac-2">평점 <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-medium">
						    <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/star.png" alt="1 Star"/></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/2star.png" alt="2 Star"/></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/3star.png" alt="3 Star"/></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/4star.png" alt="4 Star"/></div>
                            <div class="rating-trip"><i class="fa fa-check-square-o"></i><img src="<%=cp%>/res/images/5star.png" alt="5 Star"/></div>
					    </article>
				    </div>
				    <div>
					    <input id="ac-3" name="accordion-1" type="checkbox" />
					    <label for="ac-3">펫 종류 <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>강아지</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>고양이</p></div>                          
					    </article>
				    </div>				    
			    </section>
            </div>
         <div class="col-sm-8 col-md-9 effect-5 effects">
            <div class="main-switcher">
            
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
				<div class="cbp-vm-options" style="width: 100%; height: 64px;">
                    <div class="txt-sort"><p>정렬:</p></div>  
                                 <div class="click-nav">
			                        <ul>
				                        <li><a class="clicker" href="<%=cp%>/house/list">최신순</a></li>
			                        </ul>
		                        </div>
                                <div class="click-nav">
			                        <ul>
				                        <li><a class="clicker" href="<%=cp%>/house/list?orderList=costH">가격 높은순</a></li>
			                        </ul>
		                        </div>
                                <div class="click-nav">
			                        <ul>
				                        <li><a class="clicker" href="<%=cp%>/house/list?orderList=costL">가격 낮은순</a></li>
			                        </ul>
		                        </div>			
					</div>
					
					<!-- 왼쪽메뉴 -->
					
					<!-- 본문 -->
                    
					<ul id="Grid" class="sandbox">
						<c:forEach var="dto" items="${list}">
						<li class="mix category-3" data-value="1250">
							<figure>
                                <div class="cbp-vm-image img">
                                    <img src="<%=cp%>/uploads/house/${dto.saveFilename}" style="width:338px; height:180px">
                                    <div class="overlay">
                                        <a onclick='checkHouseinfo(${dto.hostNum});' class="expand"><i class="fa fa-paw" aria-hidden="true"></i></a>
                                        <a class="close-overlay hidden">x</a>
                                    </div>
                                </div>
								
								<figcaption style="height: 230px;">
                                    <h3>${dto.subject}</h3>
                                    <div class="clear"></div>
                                    <span style="color : #8C8C8C">${dto.userName}, ${dto.address}</span>
                                    <div class="price-night"><span style="color : #8C8C8C">수용가능 ${dto.capacity}마리</span><span class="price-n">${dto.cost}원</span></div>   
                                    
                                    <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
                                    	<tr>
                                    		<%-- <td align="left" width="50%" style="color:#8C8C8C"><img class="star-level" src="<%=cp%>/res/images/4star.png"/>${dto.avgScore} (${dto.reviewcnt})</td> --%>
                                    		<td align="left" width="50%" style="color:#8C8C8C">
                                    <c:if test="${dto.avgScore==0}">
										   <img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==0.5}">
											<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px">
										    <img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==1.0}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==1.5}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==2.0}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png"  width="20px">	
									</c:if>
									<c:if test="${dto.avgScore==2.5}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellowhalf1.png"  width="22px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==3.0}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==3.5}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
											<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==4.0}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
									</c:if>
									<c:if test="${dto.avgScore==4.5}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px"> 		
									</c:if>
									<c:if test="${dto.avgScore==5.0}">
										   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px">
											<img src="<%=cp%>/res/image/staryellow.png" width="20px"> 		
									</c:if>  
										<span>후기 갯수 : (${dto.reviewcnt})</span>                  		
                                     		</td>
                                    		<td align="right" width="50%" rowspan="2"><a onclick='checkHouseinfo(${dto.hostNum});' class="btn btn-primary btn-gallery" style="float: right;">더보기</a></td>
                                    	</tr>
                                    </table>
                                    
                                </figcaption>
							</figure>
						</li>
						</c:forEach>
					</ul>
					
					<div class="cbp-vm-switcher cbp-vm-view-list">
						<div class="form-group" style="margin:0 auto; width:80%; height:60px " align="center">
						<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; color: #A6A6A6;">
				            <c:if test="${dataCount==0 }">
				                  	등록된 게시물이 없습니다.
				            </c:if>
				            <c:if test="${dataCount!=0 }">
				                ${paging}
				            </c:if>
				        </div>   
				        </div>    
					</div>
					
				</div>
			</div><!-- /main -->
           </div><!--Close col 12 -->
          </div>
        </div>
</section>      
