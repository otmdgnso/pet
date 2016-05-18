<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
// 댓글 추가
function sendReply() {
	var uid="${sessionScope.member.userId}";
	if (! uid) {
		return false;
	}
	
	var preSaleNum="${dto.preSaleNum}"; // 해당 게시물의 번호
	var content=$.trim($('#content').val());
	if(! content ) {
		alert("내용을 입력하세요!!!");
		$("#content").focus();
		return false;
	}
}

function deletePreSale(preSaleNum) {
	if(confirm("분양 게시글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/adopt/delete?preSaleNum="+preSaleNum+"&page=${page}";
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
	
	<font color="blue">품종</font>
	<input type="text" name="type" readonly="readonly" value="${dto.type}">
	
	<font color="blue">암수</font>
	<input type="text" name="gender" readonly="readonly" value="${dto.gender}">
	
	<font color="blue">혈통서</font>
	<input type="text" name="lineage" readonly="readonly" value="${dto.lineage}">
	
	<font color="blue">개월수</font>
	<input type="text" name="month" readonly="readonly" value="${dto.month}">
	<br>
	<font color="blue">예방접종</font>
	<input type="text" name="vaccin" readonly="readonly" value="${dto.vaccin}">	
	
	<font color="blue">가격</font>
	<input type="text" name="price" readonly="readonly" value="${dto.price}">
	
	<font color="blue">보증금</font>
	<input type="text" name="deposit" readonly="readonly" value="${dto.deposit}">
	<br>
	
	<c:forEach var="vo" items="${readPreFile}">
	<img src="<%=cp%>/uploads/adopt/${vo.saveFilename}">
	</c:forEach>
	<ul class="filter group albumFilter">
	<li class="current">
	<a class="clicker" href="<%=cp%>/adopt/list?page=${page}">목록으로</a>
	</li>
	<li class="current">
	<a class="clicker" href="javascript:deletePreSale(${dto.preSaleNum});">삭제</a>
	</li>
	<li class="current">
	<a class="clicker" href="<%=cp%>/adopt/update?preSaleNum=${dto.preSaleNum}&page=${page}">수정</a>
	</li>
	</ul>
</form>
	<a>댓글보기</a>
	<div class="col-md-12 details-hotel" id="replyList">
	<p><input type="text" id="content" size="150px"> <a id="btnSend" onclick="sendReply()">등록</a></p>
	<p>작성자:admin 작성일:2014
	<br>메롱ㅋㅋ <a> 삭제 </a>
	</p>
	</div>
</div>
</section>

</body>