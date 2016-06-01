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
		alert("제목을 입력 하세요")

		return false;
	}
	
	var str= f.content.value;
	if(!str) {
		alert("내용을 입력 하세요")
		f.content.focus();
		return false;
	}
	
	
	var str= f.minPrice.value;
	if(str < 1000) {
		alert("최소가격은 1000원부터 입니다")
		return false;
	}
	if(!str) {
		f.minPrice.focus();
		return false;
	}
	
	var min=f.minPrice.value;
	var str= f.buyPrice.value;
	if(min > str) {
		alert("최소구매가 보다 커야합니다")
		return false;
	}
	if(!str) {
		f.buyPrice.focus();
		alert("최소구매가를 입력하세요")
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
		alert("물건 갯수를 입력하세요")
		return false;
	}
	if(str < 1 || str > 100){
		alert("갯수는 1~100개까지 가능합니다")
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
<section class="top-we-are">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:90%;" align="center">
	<div class="text-center top-txt-title" align="center">
	
		<section id="reservation-form" class="reservation-color-form pos-middle resv-plus-meteo">
			<div class="container-form-chose">
			<div class="col-md-12">
			<div class="reservation-tabs command-tabs">
			
			<div class="row"><ul class="nav nav-tabs search-opt"></ul></div>
			</div>
			
			<div class="tab-content">
				<form class="tab-pane form-inline reservation-hotel active" method="post" name="boardForm" enctype="multipart/form-data">
				<!-- 제목, 내용 -->
				<div class="col-sm-4 fly-who">
					
						<h3>경매 등록</h3>
						
					<div class="form-group" style="margin:0 auto;" align="center">
                    	<table style="width: 700px; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>제목</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="subject" value="${dto.subject}" style="text-align:center"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="10%"><label>내용</label></td>
                     			<td align="center" width="90%"><textarea rows="10" cols="34" class="form-control" name="content" style="text-align:center;">${dto.content}</textarea></td>
                    		</tr>      
                    	</table>                                     
                     </div>
                     </div>
						<!-- 분양 정보 -->
				<div class="col-sm-4 step-check">	
							
					<div class="col-sm-4 step-who" style="padding-left: 0">
					<div class="separator" style="width:100%"></div>
						<h3>경매 정보</h3>											
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">종류</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
																<select name="species">
																	<option value="개">개</option>
																	<option value="고양이">고양이</option>
																</select>
															</div>
					</div>
					</div>
						<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">카테고리명</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
																<select name="categoryName">
																	<option value="사료">사료</option>
																	<option value="미용">미용</option>
																	<option value="위생">위생</option>
																</select>
															</div>
					</div>
					</div>
					
					</div>
					<div class="form-group">
                    	<table style="width: 700px; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>카테고리번호</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="categoryNum" value="${dto.categoryNum}" style="text-align:center" placeholder="1(사료),2(미용),3(위생)"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>최소가격</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="minPrice" value="${dto.minPrice}" style="text-align:center" placeholder="1000원 이상"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>즉시구입가</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="buyPrice" value="${dto.buyPrice}" style="text-align:center;" placeholder="즉시 구매할 수 있는 금액"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>경매 종료일</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="aucEnd" value="${dto.aucEnd}" style="text-align:center;" placeholder="2016-06-22"></td>
                    		</tr>     
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>물건 수량</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="amount" value="${dto.amount}" style="text-align:center;" placeholder="숫자 입력"></td>
                    		</tr>                                   		           
                    	</table>                                     
                     </div>
                     
					<div class="col-sm-4 fly-who">
					<div class="separator" style="width:100%"></div>
						<h3>사진등록</h3>
						
	
	<div id="tbFile">
	<h3><input type="file" name="upload"></h3>
	</div>
	
	<c:if test="${mode=='update'}">
	<h3>첨부된 파일(사진 클릭시 삭제가능!!)</h3><br>
		<c:forEach var="vo" items="${readAuctionFile}">
		   <div id="fileview${vo.photoNum}">
			 <img src="<%=cp%>/uploads/auction/${vo.saveFilename}"  onclick="deleteFile('${vo.saveFilename}', ${vo.photoNum});">
			</div>
		</c:forEach>
	</c:if>
   </div>
</div>
                    		
			
				<c:if test="${mode=='created'}">
				<div class="col-sm-2 colbtn">
					<button type="button" class="btn btn-primary btn-block" onclick="check();">등록하기</button>
				</div>
				</c:if>
				
				<c:if test="${mode=='update'}">
				<div class="col-sm-2 colbtn">
					<button type="button" class="btn btn-primary btn-block" style="float: left; width: 50%;" onclick="check();">수정하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/auction/list';">취소</button>
					<input type="hidden" name="auctionNum" value="${dto.auctionNum}">
					<input type="hidden" name="page" value="${page}">		
				</div>
				</c:if>
				
				</form>
				</div>
				<!--Close tab-content form-->
				</div>
				</div>
		</section>
	<!-- Reservation form -->
				
	</div>
	</div>
	</div>
	</div>
</section>	
	
	
	

</body>
</html>