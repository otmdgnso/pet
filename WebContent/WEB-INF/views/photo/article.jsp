<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style> 
.dot {color:red;border-style:dotted;}

span{
	
}
</style>

<script type="text/javascript">
function deletePhoto(photoNum) {
	alert("${sessionScope.member.hostNum}");
	if(confirm("사진 게시글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/photo/delete?photoNum="+photoNum+"&page=${page}&saveFilename=${dto.saveFilename}";
		location.href=url;
	}
}

$(function(){
	listPage(1);
	photoReplyCount();
});

function listPage(page){
	var url="<%=cp%>/photo/listReply";
	var photoNum="${dto.photoNum}";
	
	$.post(url,{photoNum:photoNum, pageNo:page}, function(data){
		$("#listReply").html(data);		
	});
}

function sendPhotoReply(){
	
	var photoNum="${dto.photoNum}";
	var content=$("#content").val().trim();
	
	var url="<%=cp%>/photo/insertReply";
	var params="photoNum="+photoNum+"&content="+content;
	
	if(!content){
		$("#content").focus();
		return;
	}
	
	$.ajax({
		url:url
		,type:"post"
		,data:params
		,dataType:"json"
		,success:function(data){
			if(data.state=="true"){
			$("#content").val("");
			listPage(1);
			photoReplyCount();
			}else{
				alert("오류");
			}				
		}
		,error:function(e){
			alert(e.responseText);
		}
	});
}
	
//댓글 갯수
function photoReplyCount(){
	var photoNum="${dto.photoNum}";
	var url="<%=cp%>/photo/photoReplyCount";
	$.post(url, {photoNum:photoNum}, function(data){
		var count=data.count;
		$("#photoReplyCountView").text("댓글 "+count);
	},"json");
}	

//댓글 삭제
function deleteReply(replyNum, page,userId){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		return false;
	}
	if(confirm("댓글을 삭제하시겠습니까?")){
		var url="<%=cp%>/photo/deleteReply";
		$.post(url,{replyNum:replyNum, userId:userId},function(data){
			var state=data.state;
			if(state=="true"){
			listPage(page);
			photoReplyCount();
			}
		},"json");
	}
}

//좋아요
function photoLike(){
	var url="<%=cp%>/photo/photoLike";
	var params="photoNum="+${dto.photoNum}+"&num="+${num};
	
	$.ajax({
		url:url
		,type:"post"
		,data:params
		,dataType:"json"
		,success:function(data){
			var likee=data.likee;
			if(likee=="0") {
				$("#likeTitleId").text("좋아요");
			} else {
				$("#likeTitleId").text("좋아요 취소");
			}
		
			if(data.state=="true"){			
				CountLike();
			}
		}
	});
}

function CountLike(){
	var url="<%=cp%>/photo/countLike";
	var params="photoNum="+${dto.photoNum};
	$.ajax({
		url:url
		,type:"post"
		,data:params
		,dataType:"json"
		,success:function(data){
			if(data.state=="true"){
				var count=data.count;
				$("#likeCountId").text(count);
			}else if(data.de=="true"){
				
			}
		}
	});
}
</script>

<body>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">포토 갤러리</h2>
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

						<h3 style="font-size: 20pt;">게시글</h3>
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
			
		<div style="font-size: 14pt; color: orange;" >
            <div class="col-sm-6 cc-in" style="padding-left: 0; text-align: left;">
         ${dto.subject} &nbsp;| <span style="font-size: 10pt;">종별 : ${dto.species}</span>
         </div>
         <div class="col-sm-6 cc-in" style="padding-left: 0; text-align: right;">
         <span style="font-size:10pt; text-align: right;">${dto.created}</span>
         
        	 </div>
         </div>
			<br>
				<hr size="1" style="width: 100%;">
		<div style="text-align:left; font-size: 12pt; color: orange;">작성자 : ${dto.userName}</div>		
			<br>			
			<br>			
					
			 <div>	
				<img style="width: 100%;" src="<%=cp%>/uploads/photo/${dto.saveFilename}"><br><br>
			 </div>					
		   <div style="color: black; font-size: 11pt; text-align: left;">
		   	 ${dto.content}
		   </div>					
				<div class="form-group" style="margin:0 auto;" align="center">
                    	                                
                     </div>
                     </div>		
					
						  <div style="padding-top: 100px;">
							  <div align="left">								
									<span id="photoReplyCountView" 
										style="font-size: 14px; color:orange; font-weight:bold;">(댓글 ${dataCountReply}개)  </span>
									<span style="color:black; font-size: 14px;"> |   조회수 ${dto.hitCount}  | </span> &nbsp;
								
								    <a style="cursor: pointer;" onclick="photoLike();"><span id="likeTitleId" style="color: black; font-size: 10pt;">${likee=="true" ? "좋아요 취소":"좋아요"}</span></a>
								    <span id="likeCountId" style="color: black; font-size: 10pt;">${count}</span>							
							  </div>
								<div id="listReply"></div>
								<div>									
									<div style="text-align: right; padding-top: 10px;">
										<button type="button" onclick="sendPhotoReply();">
											댓글등록 <span class="glyphicon glyphicon-ok"></span>
										</button>
									</div>
								</div>

							</div>
					
				</form>
				</div>
				<!--Close tab-content form-->
				</div>
				</div>
				

							


						</section>
   		
		<div style="text-align: right;">
		  <c:if test="${sessionScope.member.userId=='admin'|| sessionScope.member.userId==dto.userId}">
			<button type="button" style="width: 10%;" onclick="deletePhoto(${dto.photoNum});">삭제</button>		 	
		  </c:if>	
		  <c:if test="${sessionScope.member.userId==dto.userId}">
			<button type="button" style="width: 10%;" onclick="javascript:location.href='<%=cp%>/photo/update?photoNum=${dto.photoNum}&page=${page}'">수정</button>
		  </c:if>
			<button type="button"  style="width: 10%;" onclick="javascript:location.href='<%=cp%>/photo/photo?page=${page}'">목록</button>
		</div>
	
	<!-- Reservation form -->
				
	</div>
	</div>
	</div>
	</div>
</section>
</body>