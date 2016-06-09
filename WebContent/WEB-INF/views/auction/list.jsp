<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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
                <div class="search-results-title"><i class="fa fa-search"></i><p>${dataCount }</p> <p>의 결과를 찾았습니다</p></div>
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
							
                              <div class="cbp-vm-image img" align="left">
                                    <img src="<%=cp%>/uploads/auction/${dto.saveFilename}"/>
                              </div>   
                                 
                                <div class="price-night" style="border-top: none;" align="left">
                                    <h3>${dto.subject }</h3>
									<div style="clear:both; ">경매끝나는날&nbsp;&nbsp;:&nbsp;&nbsp;${dto.aucEnd }</div>	
                                    <div style="clear:both; ">조회수&nbsp;&nbsp;:&nbsp;&nbsp;${dto.hitCount }</div>
                                    <div style="clear:both; ">글쓴이&nbsp;&nbsp;:&nbsp;&nbsp;${dto.userName }</div>
                                    <a href="${articleUrl}&auctionNum=${dto.auctionNum}" class="btn btn-primary btn-gallery">더보기</a>
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


