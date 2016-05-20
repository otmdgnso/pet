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

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">분양 등록</h2>
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
				<form id="hotels-tab" class="tab-pane form-inline reservation-hotel active" method="post" name="reservationform" onsubmit="return check();">
				<div class="row">
					
					<!-- 날짜 -->
					<div class="col-sm-4 step-check">
						<h3>날짜</h3>
					<div class="col-sm-6 cc-in" style="padding-left: 0">
					<div class="form-group">
						<label for="checkin">예약 시작일</label>
					<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="맡길 날짜를 선택하세요.">
						<i class="fa fa-info-circle fa-lg"></i>
					</div>
					<div class="content-checkin-data" style="margin:0 auto; width:60%" align="center">
						<i class="fa fa-calendar infield"></i><input name="checkin" type="text" id="checkin" value="${dto.checkIn}" style="margin:0 auto; width:100%;" class="form-control checkin" placeholder="ex: 2000/01/01" />
					</div>
					</div>
					</div>
					<div class="col-sm-6 cc-out" style="padding-left: 0">
					<div class="form-group">
						<label for="checkout">예약 종료일</label>
					<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="데려갈 날짜를 선택하세요.">
						<i class="fa fa-info-circle fa-lg"> </i>
					</div>
					<div class="content-checkin-data" style="margin:0 auto; width:60%" align="center">
						<i class="fa fa-calendar infield"></i> <input name="checkout" type="text" id="checkout" value="${dto.checkOut}" style="margin:0 auto; width:100%;" class="form-control checkout" placeholder="ex: 2000/01/01" />
					</div>
					</div>
					</div>
					</div>
					
					<!-- 몇박 -->				
					<c:if test="${mode=='created'}">
					<div class="form-group" style="margin:0 auto; width:60%;" align="center">		               															
						<input type="text" readonly="readonly" id="period" name="period" value="" style="color:#8C8C8C; border: 0px; text-align:center"/>
					</div>
					</c:if>
					
					<c:if test="${mode=='update'}">
					<div class="form-group" style="margin:0 auto; width:60%;" align="center">		               															
						<input type="text" readonly="readonly" id="period" name="period" value="${dto.check_day}박" style="color:#8C8C8C; border: 0px; text-align:center"/>
					</div>
					</c:if>
				</div>
				
					<div class="separator" style="width:100%"></div>

				<!-- 펫 종류 -->
				<div class="col-sm-4 step-check">				
					<div class="col-sm-4 step-who" style="padding-left: 0">
						<h3>펫 정보</h3>											
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">펫 종류</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="pet_type" id="pet_type" class="form-control">
							<c:if test="${mode=='created'}">
								<option value="" disabled="disabled" selected="selected">선택</option>
							</c:if>
							<c:if test="${mode=='update'}">
								<option value="${dto.pet_su}" disabled="disabled" selected="selected">${dto.pet_su}</option>
							</c:if>
								<option value="개">개</option>
								<option value="고양이">고양이</option>
						</select>
					</div>
					</div>
					</div>
	
				
				<!-- 펫수 -->			
					<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">맡길 펫 수</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="pet_su" id="pet_su" class="form-control">
							<c:if test="${mode=='created'}">
								<option value="" disabled="disabled" selected="selected">선택</option>
							</c:if>
							<c:if test="${mode=='update'}">
								<option value="${dto.pet_su}" disabled="disabled" selected="selected">${dto.pet_su}</option>
							</c:if>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select>
					</div>
					</div>
					</div>
				</div>	
				</div>
                    		
				<!-- 가격 -->					
				<div class="col-sm-4 fly-who">
					<div class="separator" style="width:100%"></div>
						<h3>가격</h3>
						
					<div class="form-group" style="margin:0 auto; width:40%" align="center">
                    	<table style="width: 400px; margin: 0px auto; border-spacing: 0px;">
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>기본료</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="pay" id="pay" value="${dto.pay}" style="text-align:center" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>서비스 수수료</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="tax" id="tax" value="${tax}" style="text-align:center;" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>총합계</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="totalPrice" id="totalPrice" value="${total}" style="text-align:center" readonly="readonly"></td>
                    		</tr>                                       		           
                    	</table>                                     
                     </div>
                     </div>
                     
				<input type="hidden" name="num" value="${dto.num}">
                <input type="hidden" name="hostNum" value="${dto.hostNum}">

				<c:if test="${mode=='created'}">
				<div class="col-sm-2 colbtn">
					<button type="submit" class="btn btn-primary btn-block">예약하기</button>
				</div>
				</c:if>
				
				<c:if test="${mode=='update'}">
				<div class="col-sm-2 colbtn">
					<button type="submit" class="btn btn-primary btn-block" style="float: left; width: 50%;">수정하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/reservation/list';">취소</button>		
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