<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


       <%--  <link href="<%=cp%>/res/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <!--List-->
        <link href="<%=cp%>/res/css/list/component.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" /> --%>
<div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">검색 결과</h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="<%=cp%>">HOME</a></li>
                    <li>/</li>
                    <li class="active">검색 결과</li>
                </ul>
             </div>
          </div>
      </div>
    </section>
<section id="top-offerts">
   <div class="container">
      <div class="row">
         <div class="col-sm-4 col-md-3">
                <div class="search-results-title"><i class="fa fa-search"></i><p>1,322</p> <p>results found.</p></div>
                <section class="ac-container">
                    <h3 class="desc-filter">Save time with filters:</h3>
				    <div>
					    <input id="ac-1" name="accordion-1" type="checkbox" />
					    <label for="ac-1">가격 범위 <i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <p>
                              <!--<label for="amount">Price range:</label>-->
                              <input type="text" id="amount" readonly>
                            </p>
 
                            <div id="slider-range"></div>
					    </article>
				    </div>
				    
				    <div>
					    <input id="ac-3" name="accordion-1" type="checkbox" />
					    <label for="ac-3">종분류 <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>개</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>고양이</p></div>
					    </article>
				    </div>
				    <div>
					    <input id="ac-4" name="accordion-1" type="checkbox" />
					    <label for="ac-4">카테고리분류<i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-large">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>사료</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>미용</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>위생</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>United (232)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Lufthansa (128)</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Rayanir (78)</p></div>
					    </article>
				    </div>
                    <div>
					    <input id="ac-5" name="accordion-1" type="checkbox" />
					    <label for="ac-5">Flight Class<i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Economy</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>Business</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>First Class</p></div>
					    </article>
				    </div>
			    </section>
            </div>
         <div class="col-sm-8 col-md-9 effect-5 effects">
            <div class="main-switcher">
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-list">
                    <div class="txt-sort"><p>Sort result:</p></div>  
                                <div class="click-nav">
			                        <ul class="no-js">
				                        <li>
					                        <a class="clicker">가격</a>
					                        <ul>
						                        <li><span class="btn sort active" data-sort="random">Random</span></li>
						                        <li><span class="btn sort" data-sort="value:asc">Ascending</span></li>
						                        <li><span class="btn sort" data-sort="value:desc">Descending</span></li>
					                        </ul>
				                        </li>
			                        </ul>
		                        </div>
                                <div class="click-nav-location">
			                        <ul class="no-js">
				                        <li>
					                        <a class="clicker">품종</a>
					                        <ul>
                                                <li><span class="btn filter active" data-filter="all">All</span></li>
						                        <li><span class="btn filter" data-filter=".category-1">Delta</span></li>
						                        <li><span class="btn filter" data-filter=".category-2">Lufthansa</span></li>
                                                <li><span class="btn filter" data-filter=".category-3">United</span></li>
					                        </ul>
				                        </li>
			                        </ul>
		                        </div>
		                        <div class="click-nav-location">
		                        <ul class="no-js">
		                        <li>
		                            <a href="<%=cp%>/auction/created" class="clicker">등록하기</a>
		                            </li>
		                            </ul>
		                        </div>
	                        
				<!-- 	<div class="cbp-vm-options">
						<a href="#" class="cbp-vm-icon cbp-vm-grid" data-view="cbp-vm-view-grid"><i class="fa fa-th-large"></i></a>
						<a href="#" class="cbp-vm-icon cbp-vm-list cbp-vm-selected" data-view="cbp-vm-view-list"><i class="fa fa-th-list"></i></a>
					</div>
			 	</div>
					 -->
								
					<div style="clear: both;">
                    <!--여기서 forEach시작 -->
					<c:forEach var="dto" items="${list}">
					
					<!--  <div id="Grid" class="sandbox list-fly"> 사진크게나옴--> 
						<div class="mix category-1" data-value="1250">
							<div style="clear:both;">
							
                              <div class="cbp-vm-image img" align="left">
                                    <img src="<%=cp%>/uploads/auction/${dto.saveFilename}"/>
                              </div>   
                                 
                                <div class="price-night" style="border-top: none;" align="left">
                                    <h3>${dto.subject }</h3>
                                    <div style="clear:both; ">조회수&nbsp;&nbsp;:&nbsp;&nbsp;${dto.hitCount }</div>
                                    <div style="clear:both; ">종&nbsp;&nbsp;:&nbsp;&nbsp;${dto.species }</div>
                                    <a href="${articleUrl}&auctionNum=${dto.auctionNum}" class="btn btn-primary btn-gallery">상세보기</a>
                                </div> 
							</div>
						</div>
					<!-- </div> -->
						
						</c:forEach>
						<ul class="pagination clearfix">
						<!-- 여기서 forEach 끝 -->
						
						
						
                    	    <c:if test="${dataCount!=0}">
            					${paging}
         					</c:if>
                    	</ul>
                    
                    
					
				</div>
			</div><!-- /main -->
           </div><!--Close col 12 -->
          </div>
        </div>
        </div>
</section>      


<%-- <script src="<%=cp%>/res/js/modernizr.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>

<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>

<!--List-->
<script src="<%=cp%>/res/js/list/cbpViewModeSwitch.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/list/classie.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>

<script src="<%=cp%>/res/js/list/jquery.mixitup.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
    "use strict";
    $('#Grid').mixItUp();
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

<script>
$(function () {
    "use strict";
    // Clickable Dropdown
    $('.click-nav > ul').toggleClass('no-js js');
    $('.click-nav .js ul').hide();
    $('.click-nav .js').click(function (e) {
        $('.click-nav .js ul').slideToggle(200);
        $('.clicker').toggleClass('active');
        e.stopPropagation();
    });
    $(document).click(function () {
        if ($('.click-nav .js ul').is(':visible')) {
            $('.click-nav .js ul', this).slideUp();
            $('.clicker').removeClass('active');
        }
    });

    $('.click-nav-location > ul').toggleClass('no-js js');
    $('.click-nav-location .js ul').hide();
    $('.click-nav-location .js').click(function (e) {
        $('.click-nav-location .js ul').slideToggle(200);
        $('.clicker').toggleClass('active');
        e.stopPropagation();
    });
    $(document).click(function () {
        if ($('.click-nav-location .js ul').is(':visible')) {
            $('.click-nav-location .js ul', this).slideUp();
            $('.clicker').removeClass('active');
        }
    });
});
</script> --%>
