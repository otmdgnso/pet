<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<section class="top-we-are" style="height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			

	<div class="separator" style="width:100%"></div>       
		<h4>위시리스트</h4>
	<div class="separator" style="width:100%"></div>  


<!-- 테이블 -->
<div class="form-group" style="margin:0 auto; width:80%;" align="center">
<div style="width: 90%; height:100%; background-color:#FFF2F2; padding: 30px;" align="center">
<div style="width: 95%; height:180px; background-color: #FFFFFF; padding: 30px;">
	<div class="col-md-5 histo-img">
		<img src="http://placehold.it/450x260"/>
	</div>
	<div class="col-md-7 guide-story-info">
		<h4 style="margin-top: 0">강하나의 집</h4>
		<p>강하나, 주소</p>		
	</div>
	<div class="col-md-7 guide-story-info">
		<h4 style="margin-top: 0">가격</h4>
	</div>	
</div>  
<div class="separator" style="width:100%"></div>  
<div style="width: 100%; height:10px;"></div>
<div style="width: 95%; height:180px; background-color: #FFFFFF; padding: 30px;">
	<div class="col-md-5 histo-img">
		<img src="http://placehold.it/450x260"/>
	</div>
	<div class="col-md-7 guide-story-info">
		<h4 style="margin-top: 0">강하나의 집</h4>
		<p>강하나, 주소</p>		
	</div>
	<div class="col-md-7 guide-story-info">
		<h4 style="margin-top: 0">가격</h4>
	</div>	
</div> 
</div>   

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
</div>
</div>
</div>

</section>                   