<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

//댓글 보기 닫기
$(function(){
	$("#reply-open-close").click(function(){
		  if($("#reply-content").is(':visible')) {
			  $("#reply-content").fadeOut(100);
			  $("#reply-open-close").text("댓글 ▼");
		  } else {
			  $("#reply-content").fadeIn(100);
			  $("#reply-open-close").text("댓글 ▲");
		  }
	});
})

// 댓글 리스트
$(function(){
	listPage(1);
});

function listPage(page) {
	
	var url="<%=cp%>/adopt/listReply";
	var preSaleNum="${dto.preSaleNum}";
	$.post(url, {preSaleNum:preSaleNum, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
}

// 댓글 추가
function sendReply() {
	var uid="${sessionScope.member.userId}";
	if (! uid) {
		return;
	}
	var preSaleNum="${dto.preSaleNum}"; // 해당 게시물의 번호
	var content=$.trim($('#content').val());
	if(! content ) {
		alert("내용을 입력하세요!!!");
		$("#content").focus();
		return;
	}
	var params="preSaleNum=" +preSaleNum;
	params+="&content="+content;
	$.ajax({
		type:"post"
		,url:"<%=cp%>/adopt/insertReply"
		,data:params
		,dataType:"json"
		,success:function(data) {
			$("#content").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
				postReplyCount();
			} else if(state=="false") {
				alert("댓글을 등록하지 못했습니다. !!!");
			} 
		}
		
	});
}

// 댓글 개수
function postReplyCount() {
	var preSaleNum="${dto.preSaleNum}"; // 해당 게시물의 번호
	var url="<%=cp%>/adopt/postReplyCount";
	$.post (url, {preSaleNum:preSaleNum}, function(data) {
		var count=data.count;
		$("#postReplyCountView").text("("+count+"개)");
	}, "JSON");
}

function deletePreSale(preSaleNum) {
	if(confirm("분양 게시글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/adopt/delete?preSaleNum="+preSaleNum+"&page=${page}";
		location.href=url;
	}
}

// 댓글 삭제
function deleteReply(replyNum, page, userId) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		return false;
	}
	
	if(confirm("댓글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/adopt/deleteReply";
		$.post(url, {replyNum:replyNum, userId:userId},
		function(data){
			var state=data.state;
			listPage(page);
			postReplyCount();
		}, "json");
	}
}

function requestAdopt() {
	if(confirm("분양 신청을 하시겠습니까?")) {
		var f=document.boardForm;	
		var params="page=${page}&preSaleNum=${dto.preSaleNum}";
		var url="<%=cp%>/pay/adoptpay?"+params;
		
		f.action=url;
		f.submit();
	}
}
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
<h3 style="font-size: 30px">게시글</h3>
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
						<h3>작성자:${dto.userId} 작성일:${dto.created} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수:${dto.hitCount}</h3>
						
					<div class="form-group" style="margin:0 auto;" align="center">
                    	<table style="width: 70%; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>제목</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="subject" value="${dto.subject}" style="border:none; text-align:center" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="10%"><label>내용</label></td>
                     			<td align="center" width="90%"><textarea rows="10" cols="34" class="form-control" name="content" style="text-align:center;" readonly="readonly">${dto.content}</textarea></td>
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
						<input type="text" name="species" readonly="readonly" value="${dto.species}" style="text-align:center" class="form-control">
					</div>
					</div>
					</div>
			
					<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">성별</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<input type="text" name="gender" readonly="readonly" value="${dto.gender}" style="text-align:center" class="form-control">
					</div>
					</div>
					</div>
					
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">혈통서</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<input type="text" name="lineage" readonly="readonly" value="${dto.lineage}" style="text-align:center" class="form-control">
					</div>
					</div>
					</div>
					
					<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">예방접종</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<input type="text" name="vaccin" readonly="readonly" value="${dto.vaccin}" style="text-align:center" class="form-control">
					</div>
					</div>
					</div>
					</div>
					<div class="form-group">
                    	<table style="width: 70%; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>품종</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="type" value="${dto.type}" style="text-align:center" placeholder="개 혹은 고양이의 품종" readonly="readonly"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>개월수</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="month" value="${dto.month}" style="text-align:center;" placeholder="숫자 입력" readonly="readonly"></td>
                    		</tr>
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>가격</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="price" value="${dto.price}" style="text-align:center;" placeholder="숫자 입력" readonly="readonly"></td>
                    		</tr>     
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>보증금</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="deposit" value="${dto.deposit}" style="text-align:center;" placeholder="숫자 입력" readonly="readonly"></td>
                    		</tr>                                   		           
                    	</table>                                     
                     </div>
                     
					<div class="col-sm-4 fly-who">
					<div class="separator" style="width:100%"></div>
						<h3>사진</h3>
						<c:forEach var="vo" items="${readPreFile}">
						<img src="<%=cp%>/uploads/adopt/${vo.saveFilename}" align="left">
						</c:forEach>
					
                     </div>
			
				</div>
				
                    	<div class="col-sm-4 fly-who">
                    	<div class="col-sm-2 colbtn">
							<button type="button" class="btn btn-primary btn-block" style="float: left; width: 25%;" onclick="javacript:location.href='<%=cp%>/adopt/list?page=${page}';">목록</button>
							<c:if test="${sessionScope.member.userId!=dto.userId}">
							<button type="button" class="btn btn-primary btn-block" style="float: left; width: 25%;" onclick="requestAdopt();">분양 신청</button>
							</c:if>
							<c:if test="${sessionScope.member.userId=='admin'|| sessionScope.member.userId==dto.userId}">
							<button type="button" class="btn btn-primary btn-block" style="float: right; width: 25%;" onclick="deletePreSale(${dto.preSaleNum});">삭제</button>
							</c:if>
							<c:if test="${sessionScope.member.userId==dto.userId}">
							<button type="button" class="btn btn-primary btn-block" style="float: right; width: 25%;" onclick="javascript:location.href='<%=cp%>/adopt/update?preSaleNum=${dto.preSaleNum}&page=${page}';">수정</button>
							</c:if>
						</div>
                    	<div class="separator" style="width:100%"></div>
                    	</div>	
                    	<div align="left">
                    	<font id="reply-open-close" color="#ff590b" style="font-size: 16px;">
                    	댓글 ▼
                    	</font>
                    	<font id="postReplyCountView" color="#ff590b" style="font-size: 16px;">(${dataCountReply}개)</font>
                    	<br>
                    	<br>
						</div>
						
				</form>
				</div>
				
				<!--Close tab-content form-->
				</div>
				
				<div class="col-md-12 details-hotel" id="replyList">
	<p align="right"><textarea rows="6" cols="95" id="content" style="width: 200%;"></textarea> <a id="btnSend" onclick="sendReply();">등록</a></p>
		<div id="reply-content" style="display: none;">
			<div id="listReply"></div>
		</div>
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