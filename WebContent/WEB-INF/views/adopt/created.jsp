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
	
	if(mode=="created")
		f.action="<%=cp%>/adopt/created";
	else if(mode=="update")
		f.action="<%=cp%>/adopt/update"
	
	f.submit();
}

<c:if test="${mode=='update'}">
function deleteFile(saveFilename, photoNum) {
	if(confirm("사진을 삭제 하시겠습니까?")) {
	    var url="<%=cp%>/adopt/deleteFile";
	    $.post(url, {saveFilename:saveFilename}, function(data){
		    $("#fileview"+photoNum).remove();
	     }, "JSON");
	}
}
</c:if>
</script>

<body>

<section id="gallery">
   <div class="container">
<form name="boardForm" method="post" enctype="multipart/form-data">
<input type="text" class="form-control" placeholder="제목" name="subject" size="200px" value="${dto.subject}"/>
<br>
<textarea rows="20" cols="160" placeholder="내용" name="content">${dto.content}</textarea>

<br>
	<font color="blue">종류</font>
	<select name="species">
		<option value="개" ${dto.species=="개"?"selected='selected'" : ""}>
		개
		</option>
		<option value="고양이" ${dto.species=="고양이"?"selected='selected'" : ""}>
		고양이
		</option>
	</select>
	
	<font color="blue">품종</font>
	<input type="text" placeholder="개 혹은 고양이의 품종" name="type" value="${dto.type}">
	
	<font color="blue">암수</font>
	<select name="gender">
		<option value="암" ${dto.gender=="암"?"selected='selected'" : ""}>
		암
		</option>
		<option value="수" ${dto.gender=="수"?"selected='selected'" : ""}>
		수
		</option>
	</select>
	
	<font color="blue">혈통서</font>
	<select name="lineage">
		<option value="유" ${dto.lineage=="유"?"selected='selected'" : ""}>
		유
		</option>
		<option value="무" ${dto.lineage=="무"?"selected='selected'" : ""}>
		무
		</option>
	</select>
	
	<font color="blue">개월수</font>
	<input type="text" placeholder="숫자 입력" name="month" value="${dto.month}">
	
	<font color="blue">예방접종</font>
	<select name="vaccin">
		<option value="유" ${dto.vaccin=="유"?"selected='selected'" : ""}>
		유
		</option>
		<option value="무" ${dto.vaccin=="무"?"selected='selected'" : ""}>
		무
		</option>
	</select>
	
	<br>
	
	<font color="blue">가격</font>
	<input type="text" placeholder="숫자 입력" name="price" value="${dto.price}">
	
	<font color="blue">보증금</font>
	<input type="text" placeholder="숫자 입력" name="deposit" value="${dto.deposit}">
	<br>
	
	<div id="tbFile">
	<font color="blue">첨부 (첫번째 사진이 대표사진)</font><br>
	<input type="file" name="upload" id="file0" class="boxTF" size="61" style="height: 20px; color: blue;">
	</div>
	
	<c:if test="${mode=='update'}">
	<font color="blue">첨부된 파일(사진 클릭시 삭제가능!!)</font><br>
		<c:forEach var="vo" items="${readPreFile}">
		   <div id="fileview${vo.photoNum}">
			 <img src="<%=cp%>/uploads/adopt/${vo.saveFilename}"  onclick="deleteFile('${vo.saveFilename}', ${vo.photoNum});">
			</div>
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