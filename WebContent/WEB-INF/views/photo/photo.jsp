<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function searchList() {
		var f=document.photoSearchForm;
		f.action="<%=cp%>/photo/photo";
		f.submit();
}
</script>

<meta name="description" content="travel, trip, store, shopping, siteweb, cart">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700,700italic' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'/>

       
         <div class="clear"></div>
    <section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">Gallery 3 Columns</h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li>/</li>
                    <li><a href="#">PAGES</a></li>
                    <li>/</li>
                    <li class="active">Gallery</li>
                </ul>
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
				                <li data-filter="*" class="current"><a href="<%=cp%>/photo/photo?searchKey=species&searchValue=개">강아지만</a></li> 
				                <li data-filter=".cat1"><a href="<%=cp%>/photo/photo?searchKey=species&searchValue=고양이">고양이만</a></li> 
				                <li data-filter=".cat2"><a href="<%=cp%>/photo/photo">최신순</a></li> 
				                <li data-filter=".cat3"><a href="<%=cp%>/photo/photo?sortList=hitCount">조회순</a></li> 
				                <li data-filter=".cat4"><a href="<%=cp%>/photo/photo?sortList=likeCount">좋아요순</a></li>
				             	 <li><a href="<%=cp%>/photo/created">등록하기</a></li>
			                </ul> 
		                </dd>
	                </dl>
	                
	           <div align="center">
        		     <form name="photoSearchForm" method="post" class="form-inline">
						  <select name="searchKey" >
						      <option value="subject">제목</option>
						      <option value="userName">작성자</option>
						      <option value="content">내용</option>
						      <option value="created">등록일</option>
						  </select>
						  <input type="text" name="searchValue">
						  <button type="button"  onclick="searchList();"><span ></span> 검색</button>
        		     </form>
        		</div>
                <div class="portfolio albumContainer">
                	 <c:forEach var="dto" items="${list}">
	                        <div class="cat3 col-md-4 gallery-view view-fifth">
                                   <div class="img">
                                        <img src="<%=cp%>/uploads/photo/${dto.saveFilename}" style="width: 400px; height: 350px; "/>
                                        <div class="overlay">
                                            <a href="${articleUrl}&photoNum=${dto.photoNum}" class="expand">+</a>
                                            <a class="close-overlay hidden">x</a>
                                        </div>
                                    </div>
                                    <div align="left" class="gallery-img-title">
                                      <span style="color: black;">제목 : ${dto.subject}</span> &nbsp;
                                       <span style="color: orange; font-weight: bold;">[${dto.replyCount}]</span><br>
                                       <span style="color: black;">조회수 ${dto.hitCount}  |  ${dto.created}     |    좋아요 ${dto.likeCount}</span><br>
                                       <span style="color: black;">${dto.userId}  (${dto.userName})</span>
                                    </div>
                            </div>                           
					 </c:forEach>
	                      
                      </div>
          </div><!--Close col 12 -->

       </div>
       		<div align="center">
                    <ul class="pagination clearfix">
                      <!--   <li class="prev disabled"><a href="#">Previous</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li class="disabled"><span>...</span></li>
                        <li><a href="#">5</a></li>
                        <li class="next"><a href="#">Next</a></li> -->
                        <c:if test="${dataCount!=0}">
                        	${paging}
                        </c:if>
                    </ul>
          </div>
    </div>    
</section>      


        