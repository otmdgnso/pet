<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<STYLE> 
.dot {color:red;border-style:dotted;}
</STYLE>

<script type="text/javascript">
function deletePhoto(photoNum) {
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
		$("#photoReplyCountView").text("("+count+"개)");
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
			if(state=="true")
			listPage(page);
			photoReplyCount();
		},"json");
	}
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
         ${dto.subject} &nbsp;| <font style="font-size: 10pt;">종별 : ${dto.species}</font>
         </div>
         <div class="col-sm-6 cc-in" style="padding-left: 0; text-align: right;">
         <font style="font-size:10pt; text-align: right;">조회수: ${dto.hitCount} &nbsp;&nbsp;|&nbsp;&nbsp;${dto.created}</font>
         
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
				
						  <div>
							  <div align="left">								
									<font id="photoReplyCountView" color="#ff590b"
										style="font-size: 16px;">(${dataCountReply}개)</font>								
							  </div>
								<div id="listReply"></div>
								<div>
									<div align="center">
										<div style="clear: both; width: 100%; padding-top: 10px;">
											<textarea id="content" class="form-control" rows="3"
												required="required"></textarea>
										</div>
									</div>
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