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
		s="<h3><input type='file' name='upload'></h3>";
		
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
		f.action="<%=cp%>/adopt/update";
	
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

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">분양</h2>
	</div>
	</div>
	</div>
	</div>
</section>

<section class="top-we-are">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:90%;" align="center">
	<div class="text-center top-txt-title" align="center">

	<!-- Reservation form -->
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
					
						<h3>게시글</h3>
						
					<div class="form-group" style="margin:0 auto;" align="center">
                    	<table style="width: 70%; margin: 0px auto; border-spacing: 0px; padding: 0px;">
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
						<h3>분양 정보</h3>											
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">종류</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="species" class="form-control">
								<option value="dog" ${dto.species=="dog"?"selected='selected'" : ""}>
									Dog
								</option>
								<option value="cat" ${dto.species=="cat"?"selected='selected'" : ""}>
									Cat
								</option>
						</select>
					</div>
					</div>
					</div>
			
					<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">성별</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="gender" class="form-control">
								<option value="암" ${dto.gender=="암"?"selected='selected'" : ""}>
									암
								</option>
								<option value="수" ${dto.gender=="수"?"selected='selected'" : ""}>
									수
								</option>
						</select>
					</div>
					</div>
					</div>
					
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">혈통서</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="lineage" class="form-control">
								<option value="유" ${dto.lineage=="유"?"selected='selected'" : ""}>
									유
								</option>
								<option value="무" ${dto.lineage=="무"?"selected='selected'" : ""}>
									무
								</option>
						</select>
					</div>
					</div>
					</div>
					
					<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">예방접종</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="vaccin" class="form-control">
							<option value="유" ${dto.vaccin=="유"?"selected='selected'" : ""}>
								유
							</option>
							<option value="무" ${dto.vaccin=="무"?"selected='selected'" : ""}>
								무
							</option>
						</select>
					</div>
					</div>
					</div>
					</div>
					<div class="form-group">
                    	<table style="width: 70%; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>품종</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="type" value="${dto.type}" style="text-align:center" placeholder="개 혹은 고양이의 품종"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>개월수</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="month" value="${dto.month}" style="text-align:center;" placeholder="숫자 입력"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>가격</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="price" value="${dto.price}" style="text-align:center;" placeholder="숫자 입력"></td>
                    		</tr>     
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>보증금</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="deposit" value="${dto.deposit}" style="text-align:center;" placeholder="숫자 입력"></td>
                    		</tr>                                   		           
                    	</table>                                     
                     </div>
                     
					<div class="col-sm-4 fly-who">
					<div class="separator" style="width:100%"></div>
						<h3>사진</h3>
						
	<div id="tbFile">
	<h3><input type="file" name="upload"></h3>
	</div>
	
	<c:if test="${mode=='update'}">
	<h3>첨부된 파일(사진 클릭시 삭제가능!!)</h3><br>
		<c:forEach var="vo" items="${readPreFile}">
		   <div id="fileview${vo.photoNum}">
			 <img src="<%=cp%>/uploads/adopt/${vo.saveFilename}"  onclick="deleteFile('${vo.saveFilename}', ${vo.photoNum});">
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
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/adopt/list';">취소</button>
					<input type="hidden" name="preSaleNum" value="${dto.preSaleNum}">
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