<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!-- 시작 -->
<span style="color: #3EA9CD; font-weight: bold; font-size: 20px;">후기 3개 </span>
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
<div class="separator" style="width:100%; padding: 0px;"></div>

<!-- 평점 -->
<c:forEach var="dto" items="${listReview}">
<table style="width: 80%; margin: 0px auto; padding: 0px;">
	<tr>		
		<td align="center" width="10%"><p>청결도</p></td>
		<td align="center" width="10%"><p>${dto.clean}</p></td>
		<c:if test="${dto.clean}>'0'">
			<c:forEach begin="1" end="${dto.clean}">
				<td align="center" width="20%">
					<img src="<%=cp%>/res/image/stargray.png" width="15px">
				</td>      
			</c:forEach>  
		</c:if>
		<c:if test="${dto.clean}=='0'">
			<c:forEach begin="1" end="5">
			<td align="center" width="20%">
				<img src="<%=cp%>/res/image/stargray.png" width="15px">
			</td>      
			</c:forEach> 
		</c:if>
		   		              		
		<td align="center" width="10%"><p>가격</p></td>
		<td align="center" width="20%">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
		</td>       
		<td align="center" width="10%"><p>친절도</p></td>
		<td align="center" width="20%">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
			<img src="<%=cp%>/res/image/stargray.png" width="15px">
		</td>       
	</tr>
</table>
</c:forEach>
<!-- 리뷰 -->
<div class="separator" style="width:100%; padding: 0px;"></div>

<div style="clear:both; margin-top:5px; padding: 10px; border-bottom: #d5d5d5 solid 1px; min-height: 150px;">
<c:forEach var="dto" items="${listReview}">
<table style="width: 100%; min-height: 100px; margin: 0px auto; border-spacing: 10px;">
	<tr>
		<td align="center" width="20%">
			<img src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="70px;">
		</td>
		<td align="left" width="70%" style="margin-bottom:  5px; min-height: 50px;">
			${dto.content}
		</td>
		<td width="10%"></td>
	</tr>
	<tr>
		<td align="center" width="20%">${dto.userName}</td>
		<td align="left" width="70%">${dto.created}</td>

		<c:if test="${sessionScope.member.memberNum==dto.num || sessionScope.member.userId=='admin'}">
		<td width="10%"><a onclick='deleteReview("${dto.reviewnum}")'>삭제</a></td>
		</c:if>
	</tr>
</table>
<div class="separator" style="width:100%; padding: 0px;"></div>
</c:forEach>


<!-- 페이징처리 -->
<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; color: #A6A6A6;">
            <c:if test="${reviewDataCount==0 }">
                  	등록된 후기가 없습니다.
            </c:if>
            <c:if test="${reviewDataCount!=0 }">			
               ${paging}
            </c:if>
</div>
</div>     
</div>