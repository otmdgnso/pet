<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	$("body").on("click", "input[name='plus']", function(){
		
		var s;
		s+="<input type='file' name='upload' class='boxTF'  size='61' style='height: 20px; color: blue;'>";
		
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
	
	var str= f.type.value;
	if(!str) {
		f.type.focus();
		return false;
	}
	
	var str= f.month.value;
	if(!str) {
		f.month.focus();
		return false;
	}
	
	var str= f.price.value;
	if(!str) {
		f.price.focus();
		return false;
	}
	
	var str= f.deposit.value;
	if(!str) {
		f.deposit.focus();
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
		f.action="<%=cp%>/adopt/created";
	else if(mode=="update")
		f.action="<%=cp%>/adopt/update"
	
	f.submit();
}

<c:if test="${mode=='update'}">
function deleteFile(fileNum) {
	var url="<%=cp%>/adopt/deleteFile";
	$.post(url, {fileNum:fileNum}, function(data){
		$("#b"+fileNum).remove();
		$("#f"+fileNum).remove();
		
	}, "JSON");
}
</c:if>
</script>

<body>

<section id="gallery">
   <div class="container">
<form name="boardForm" method="post" enctype="multipart/form-data">
<input type="text" class="form-control" placeholder="제목" name="subject" size="200px"/>
<br>
<textarea rows="20" cols="160" placeholder="내용" name="content"></textarea>

<br>
	<font color="blue">종류</font>
	<select name="species">
		<option value="개">
		개
		</option>
		<option value="고양이">
		고양이
		</option>
	</select>
	
	<font color="blue">품종</font>
	<input type="text" placeholder="개 혹은 고양이의 품종" name="type">
	
	<font color="blue">암수</font>
	<select name="gender">
		<option value="암">
		암
		</option>
		<option value="수">
		수
		</option>
	</select>
	
	<font color="blue">혈통서</font>
	<select name="lineage">
		<option value="유">
		유
		</option>
		<option value="무">
		무
		</option>
	</select>
	
	<font color="blue">개월수</font>
	<input type="text" placeholder="숫자 입력" name="month">
	
	<font color="blue">예방접종</font>
	<select name="vaccin">
		<option value="유">
		유
		</option>
		<option value="무">
		무
		</option>
	</select>
	
	<br>
	
	<font color="blue">가격</font>
	<input type="text" placeholder="숫자 입력" name="price">
	
	<font color="blue">보증금</font>
	<input type="text" placeholder="숫자 입력" name="deposit">
	<br>
	
	<div id="tbFile">
	<font color="blue">첨부 (첫번째 사진이 대표사진)</font><br>
	<input type="button" name="plus" value="이미지 추가하기">
	<input type="file" name="upload" class="boxTF" size="61" style="height: 20px; color: blue;">
	</div>
	
	<c:if test="${mode=='update'}">
		<c:forEach var="vo" items="${readPreFile}">
			<font color="blue">첨부된 파일(사진 클릭시 삭제가능!!)</font><br>
			<img src="<%=cp%>/uploads/adopt/${vo.saveFilename}" onclick="javascript:location.href=deleteFile(fileNum)">
		</c:forEach>
	</c:if>
	
	<br>
	<button type="button" class="btn btn-primary btn-block" style="width: 100px" onclick="check();">
			등록하기
	</button>
	
	<c:if test="${mode=='update'}">
		<input type="hidden" name="preSaleNum" value="${dto.preSaleNum}">
		<input type="hidden" name="page" value="${page}">
	</c:if>
</form>
</div>
</section>

</body>