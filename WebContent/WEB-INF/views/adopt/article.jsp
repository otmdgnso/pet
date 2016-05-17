<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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
	
	<button type="button" class="btn btn-primary btn-block" style="width: 100px" onclick="location.href=">
			목록으로
	</button>
</form>
</div>
</section>

</body>