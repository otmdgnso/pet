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
<script type="text/javascript">
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
	
	f.action="<%=cp%>/adopt/created";
	
	return true;
}
</script>
<title>Insert title here</title>
</head>
<body>
<form name="boardForm" method="post" onsubmit="return check();">
<input type="text" class="form-control" placeholder="제목" name="subject"/>
<br>
<textarea rows="20" cols="160" placeholder="내용" name="content"></textarea>

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
	<button type="submit" class="btn btn-primary btn-block" style="width: 100px">
			등록하기
	</button>
</form>
</body>
</html>