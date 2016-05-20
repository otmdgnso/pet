<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	$("body").on("change", "input[name='upload']", function(){
		if(! $(this).val())
			return;
		
		var s;
		s+="<input type='file' name='upload' class='boxTF'  size='61' style='height: 20px; color: blue;'>";
		
		$("#tbFile").append(s);
	});
});
$(function(){
	$("body").on("click", "input[name='plus']", function(){
		
		var s;
		s+="<input type='file' name='upload' class='boxTF' size='61' style='height: 20px; color: blue;'>";
		
		$("#tbFile").append(s);
	});
});


function check() {
	var f=document.boardForm;
	
	
	var str= f.subject.value;
	if(!str) {
		f.subject.focus();
		return false;
	}
	
	var str= f.content.value;
	if(!str) {
		f.content.focus();
		return false;
	}
	
	var str= f.minPrice.value;
	if(!str) {
		f.minPrice.focus();
		return false;
	}
	var str= f.buyPrice.value;
	if(!str) {
		f.buyPrice.focus();
		return false;
	}
	
	
	var str= f.aucEnd.value;
	if(!str) {
		f.aucEnd.focus();
		return false;
	}
	
	var str= f.amount.value;
	if(!str) {
		f.amount.focus();
		return false;
	}
	
	var str= f.categoryNum.value;
	if(!str) {
		f.categoryNum.focus();
		return false;
	}
	
	
	var mode="${mode}";
	if(f.upload.value!="") {
		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 가능합니다. !!!');
			return false;
		}
	}
	
	
	if(mode=="created")
		f.action="<%=cp%>/auction/created";
	else if(mode=="update")
		f.action="<%=cp%>/auction/update"
	
	f.submit();
}

<c:if test="${mode=='update'}">
function deleteFile(saveFilename, photoNum) {
	if(confirm("사진을 삭제 하시겠습니까?")) {
	    var url="<%=cp%>/auction/deleteFile";
	    $.post(url, {saveFilename:saveFilename}, function(data){
		    $("#fileview"+photoNum).remove();
	     }, "JSON");
	}
}
</c:if>
</script>
<title>Insert title here</title>
</head>
<body>

<section id="gallery">
	<div class="container">

<form name="boardForm" method="post" enctype="multipart/form-data">

<input type="text" class="form-control" placeholder="제목" name="subject"/>
<br>

<textarea rows="20" cols="160" placeholder="내용" name="content"></textarea>

<br>
	<font color="blue">최소가격</font>
	<input type="text" placeholder="최소가격을 입력하세요" name="minPrice">
	
	<font color="blue">즉시구입가</font>
	<input type="text" placeholder="즉시구입가를 입력하세요" name="buyPrice">
	
	<font color="blue">경매 끝나는날</font>
	<input type="text" placeholder="YYYY-MM-DD HH:mm:ss" name="aucEnd">

	
	<font color="blue">수량</font>
	<input type="text" placeholder="1~100" name="amount">
	
	<font color="blue">종</font>
	<select name="species">
		<option value="개">
		개
		</option>
		<option value="고양이">
		고양이
		</option>
	</select>
	
	<font color="blue">카테고리명</font>
	<select name="categoryName">
		<option value="사료">
		사료
		</option>
		<option value="미용">
		미용
		</option>
		<option value="위생">
		위생
		</option>
	</select>
	<br>
	
	<font color="blue">카테고리번호</font>
	<input type="text" placeholder="1(사료),2(미용),3(위생)" name="categoryNum">
	
	
	<div id="tbFile">
	<font color="blue">이미지첨부</font><br>
	<input type="file" name="upload" class="boxTF" size="61" style="height: 20px; color: blue;">
	</div>
	
	<!-- 사진 눌럿을때 삭제가능 (수정에서)-->
	<c:if test="${mode=='update'}">
	<font color="blue">첨부된 파일(사진 클릭시 삭제가능!!)</font><br>
		<c:forEach var="vo" items="${readAuctionFile}">
		   <div id="fileview${vo.photoNum}">
			 <img src="<%=cp%>/uploads/auction/${vo.saveFilename}"  onclick="deleteFile('${vo.saveFilename}', ${vo.photoNum});">
			</div>
		</c:forEach>
	</c:if>
	
	
	<br>
	<button type="button" onclick="check();" class="btn btn-primary btn-block" style="width: 100px">
			등록하기
	</button>
	
	
	<c:if test="${mode=='update'}">
		<input type="hidden" name="auctionNum" value="${dto.auctionNum}">
		<input type="hidden" name="page" value="${page}">
	</c:if>
</form>
</div>
</section>
</body>
</html>