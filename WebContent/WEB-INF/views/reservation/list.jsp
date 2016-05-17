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

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/reservation/list";
	f.submit();
}

function deleteReservation(reservationNum) {
	var page="${page}";
	var params="reservationNum="+reservationNum+"&page="+page;
	var url="<%=cp%>/reservation/delete?"+params;
	
	if(confirm("정말 삭제할까요?")) {
		location.href=url;
	}
}

function updateReservation(reservationNum) {
	var page="${page}";
	var params="reservationNum="+reservationNum+"&page="+page;
	var url="<%=cp%>/reservation/update?"+params; 
	
	location.href=url;
}
</script>

</head>
<body>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">예약</h2>
	</div>
	</div>
	</div>
	</div>
</section>

<section class="top-we-are" style="height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="cbp-vm-switcher cbp-vm-view-list">
	<div class="separator" style="width:100%"></div>       
		<h3>예약목록</h3>
	<div class="separator" style="width:100%"></div>  
		<div class="form-group" style="margin:0 auto; width:80%; height=50%;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="50px">
					<td align="left" width="50%">
						<form name="searchForm" action="" method="post">
							  <select name="searchKey" class="selectField">
								  <option value="userName">호스트명</option>
								  <option value="accept">상태</option>
							</select>
							<input type="text" name="searchValue" class="boxTF">
							<input type="button" value=" 검 색 " class="btn" onclick="searchList()">
						</form>
					</td>
				</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%"><label>번호</label></td>
	              <td align="center" width="15%"><label>상태</label></td>
	              <td align="center" width="20%"><label>위치</label></td>
	              <td align="center" width="15%"><label>호스트</label></td>
	              <td align="center" width="20%"><label>날짜</label></td>              
	              <td align="center" width="10%"></td>
	           </tr>
	           
	           <c:forEach var="dto" items="${list}">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%" style="color: #A6A6A6;">${dto.listNum}</td>
	              <td align="center" width="15%" style="color: #6ABC64;">${dto.accept}</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.address}</td>
	              <td align="center" width="15%" style="color: #A6A6A6;">${dto.userName}</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.checkIn}~${dto.checkOut}</td>
	              <c:if test="${dto.accept != 'wait'}">
	              	<td align="center" width="10%" style="color: #A6A6A6;"><a onclick='deleteReservation(${dto.reservationNum});'>삭제</a></td>
	              </c:if>
	              <c:if test="${dto.accept == 'wait'}">
	              	<td align="center" width="10%" style="color: #A6A6A6;"><a onclick='updateReservation(${dto.reservationNum});'>변경</a></td>
	              </c:if>
	           </tr>

	           </c:forEach>  
	           
	        </table>          
		</div>
	</div>
	<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="form-group" style="margin:0 auto; width:80%; height:60px " align="center">
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