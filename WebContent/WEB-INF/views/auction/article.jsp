<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
function deleteAuction(auctionNum) {
	if(confirm("경매 게시글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/auction/delete?auctionNum="+auctionNum+"&page=${page}";
		location.href=url;
	}
}
</script>


<body>

<section id="gallery">
   <div class="container">
<form name="boardForm" method="post" enctype="multipart/form-data">
<input type="text" class="form-control" name="subject" size="200px" readonly="readonly" value="제목:${dto.subject} 아이디:${dto.userId} 날짜:${dto.created} 조회수:${dto.hitCount}"/>
<br>
<textarea rows="20" cols="160" name="content" readonly="readonly">${dto.content}</textarea>

<br>
	<font color="blue">종류</font>
	<input type="text" name="species" readonly="readonly" value="${dto.species}">
	
	
	<font color="blue">시작가격</font>
	<input type="text" name="minPrice" readonly="readonly" value="${dto.minPrice}">
	
	<font color="blue">즉시구매가</font>
	<input type="text" name="buyPrice" readonly="readonly" value="${dto.buyPrice}">
	<br>
	
	<c:forEach var="vo" items="${readAuctionFile}">
	<img src="<%=cp%>/uploads/auction/${vo.saveFilename}">
	</c:forEach>
	
	<div>
	<a class="clicker" href="javascript:deleteAuction(${dto.auctionNum});">삭제</a>
	</div>
	<div>
	<a class="clicker" href="<%=cp%>/auction/update?auctionNum=${dto.auctionNum}&page=${page}">수정</a>
	</div>
	
	<div>
	<a class="clicker" href="<%=cp%>/auction/list?page=${page}">목록으로</a>
	</div>
</form>
</div>
</section>

</body>