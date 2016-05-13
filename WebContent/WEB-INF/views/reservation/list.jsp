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
	<div class="separator" style="width:100%; height:80%;"></div>       
		<h3>예약목록</h3>
	<div class="separator" style="width:100%"></div>  
		<div class="form-group" style="margin:0 auto; width:80%" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" height="50px">
	              <td align="center" width="15%"><label>상태</label></td>
	              <td align="center" width="20%"><label>위치</label></td>
	              <td align="center" width="15%"><label>호스트</label></td>
	              <td align="center" width="20%"><label>날짜</label></td>
	              <td align="center" width="20%"></td>
	           </tr>
	           <tr align="center" height="30px">
	              <td align="center" width="15%" style="color: #6ABC64;">예약완료</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">서울 종로구 숭인동</td>
	              <td align="center" width="15%" style="color: #A6A6A6;">김샛별</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">2016/06/01~2016/06/03</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">삭제</td>
	           </tr>
	           <tr align="center" height="30px">
	              <td align="center" width="15%" style="color: #6ABC64;">예약대기중</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">서울 성북구 성북동</td>
	              <td align="center" width="15%" style="color: #A6A6A6;">강하늘</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">2016/06/07~2016/06/08</td>
	           	  <td align="center" width="20%" style="color: #A6A6A6;">변경|취소</td>
	           </tr>
	        </table>  
		</div>
	</div>
	</div>
	</div>
	</div>  
</section>
</body>
</html>