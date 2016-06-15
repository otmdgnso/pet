<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">


.button_example{
border:1px solid #CCCCCC;-webkit-box-shadow: #FEFFFF 0px 1px 1px ;-moz-box-shadow: #FEFFFF 0px 1px 1px ; box-shadow: #FEFFFF 0px 1px 1px ; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 15px;font-size:14px;font-family:arial, helvetica, sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: 0px 1px 0 rgba(255,255,255,1);font-weight:bold; color: #0262c2;
 background-color: #F7F5F6; background-image: -webkit-gradient(linear, left top, left bottom, from(#F7F5F6), to(#DDDDDD));
 background-image: -webkit-linear-gradient(top, #F7F5F6, #DDDDDD);
 background-image: -moz-linear-gradient(top, #F7F5F6, #DDDDDD);
 background-image: -ms-linear-gradient(top, #F7F5F6, #DDDDDD);
 background-image: -o-linear-gradient(top, #F7F5F6, #DDDDDD);
 background-image: linear-gradient(to bottom, #F7F5F6, #DDDDDD);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#F7F5F6, endColorstr=#DDDDDD);
}
</style>

<script type="text/javascript">
function auctionSearch() {
	var f=document.searchForm;
	var subject=f.subject.value;
	
	if(subject!="") {
	var params="searchValue=main&subject="+subject+"&species=dog";
	f.action="<%=cp%>/auction/list?"+params;
	f.submit();
	}else
		f.action="<%=cp%>/auction/list";
		f.submit();
}






</script>

<div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">경매</h2>
                </div>            
             </div>
          </div>
      </div>
    </section>
<section id="top-offerts">
   <div class="container">
      <div class="row">
         <div class="col-sm-4 col-md-3">
                <form name="searchForm" method="post" class="form-inline">
                <div class="search-results-title" style="padding-top: 20px;"><i class="fa fa-search"></i>
                		<input type="text" style="width: 70%" class="form-control input-sm input-search" id="subject" name="subject">
                		<button type="button" class="btn btn-info btn-sm btn-search" onclick="auctionSearch();">검색</button>
                </div>
                </form>
                <section class="ac-container">
                    <h3 class="desc-filter">Save time with filters:</h3>
				    <div>
					    <input id="ac-1" name="accordion-1" type="checkbox" />
					    <label for="ac-1">가격 범위 <i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></label>
					    <article class="ac-small">
						    <p>
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
					    <article class="ac-small">
						    <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>사료</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>미용</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>위생</p></div>
                            <div class="meals-trip"><p><i class="fa fa-check-square-o"></i>기구</p></div>
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
					                        <a class="clicker">가격순</a>
					                        <ul>
						                        <li><span class="btn sort active" data-sort="random">최신순 정렬</span></li>
						                        <li><span class="btn sort" data-sort="value:asc">오름차순 정렬</span></li>
						                        <li><span class="btn sort" data-sort="value:desc">내림차순 정렬</span></li>
					                        </ul>
				                        </li>
			                        </ul>
		                        </div>
                                <div class="click-nav">
			                        <ul class="no-js">
				                        <li>
					                        <a class="clicker">품종별</a>
					                        <ul>
                                                <li><span class="btn filter active" data-filter="all">개</span></li>
						                        <li><span class="btn filter" data-filter=".category-1">고양이</span></li>
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
	                        
			
								
					<div style="clear: both;">
                    <!--여기서 forEach시작 -->
                    
					<c:forEach var="dto" items="${list}">
					
					<!--  <div id="Grid" class="sandbox list-fly"> 사진크게나옴--> 
						<div class="mix category-1" data-value="1250">
							<div style="clear:both;">
							
                              <div class="cbp-vm-image img" align="left" >
                                    <img src="<%=cp%>/uploads/auction/${dto.saveFilename}" style="width: 380px; height: 300px"/>
                              </div>   
                                 
                                <div class="price-night" style="border-top: none;" align="left">
                                    <a href="${articleUrl}&auctionNum=${dto.auctionNum}"  class="button_example">${dto.subject}</a>
                                    <div style="clear:both; ">조회수&nbsp;&nbsp;:&nbsp;&nbsp;${dto.hitCount }</div>
									<div style="clear:both; ">경매끝나는날&nbsp;&nbsp;:&nbsp;&nbsp;${dto.aucEnd }</div>	
                                </div>
							</div>
						</div>
					</c:forEach>
			<!-- 여기서 forEach 끝 -->
	
						<ul class="pagination clearfix">
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


