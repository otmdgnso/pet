<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">예약하기</h2>
	</div>
	</div>
	</div>
	</div>
</section>

<section class="top-we-are" style="height:730px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="cbp-vm-switcher cbp-vm-view-list">
	<div class="separator" style="width:100%"></div>       
		<h3>예약목록</h3>
	<div class="separator" style="width:100%"></div>  
		<div class="form-group" style="margin:0 auto; width:80%; height=50%;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" height="50px">
	              <td align="center" width="15%"><label>상태</label></td>
	              <td align="center" width="20%"><label>위치</label></td>
	              <td align="center" width="15%"><label>호스트</label></td>
	              <td align="center" width="20%"><label>날짜</label></td>
	              <td align="center" width="20%"></td>
	           </tr>
	           
	           <c:forEach var="dto" items="${list}">
	           <tr align="center" height="50px">
	              <td align="center" width="15%" style="color: #6ABC64;">${dto.accept}</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.address}</td>
	              <td align="center" width="15%" style="color: #A6A6A6;">${dto.userName}</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.checkIn}~${dto.checkOut}</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">삭제</td>
	           </tr>
	           </c:forEach>  
	        </table>          
		</div>
	</div>
	<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="form-group" style="margin:0 auto; width:80%; height:50px " align="center">
		<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
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
</section>
</body>
</html>