<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">

$(function(){
	listPage(1);
	
});
//댓글 추가
function sendReply() {	
	var f=document.cmtform;
	var score=f.score.value;
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}
	
	var hostNum="${dto.hostNum}";
	var content=$.trim($("#content").val());
	var completeNum="${vo.completeNum}";
	if(! content) {
		alert("내용을 입력하세요.");
		$("#content").focus();
		return false;
	}
	
	var params="hostNum="+hostNum;
	params+="&content="+content;
	params+="&completeNum="+completeNum;
	params+="&score="+score;
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/house/createdReply"
		,dataType:"json"
		,data:params
		,success:function(data) {
			$("#content").val("");
			var state=data.state;
			if(state=="true") {
				ajaxReviewList();
			} else if(state=="false") {
				alert("댓글은 한번씩만 입력이 가능합니다.");
			}
		}
		, error:function(e) {
			alert(e.responseText);
		}
	});
}

var locked=0;

function show(star){
	if(locked)
		return;
	var i;
	var image;
	var el;
	
	for(i=1; i<=star; i++){
		image='image'+i;
		el=document.getElementById(image);
		el.src="<%=cp%>/res/image/staryellow.png";
	}
}
function noshow(star){
	if(locked)
		return;
	var i;
	var image;
	var el;
	
	for(i=1; i<=star; i++){
		image='image'+i;
		el=document.getElementById(image);
		el.src="<%=cp%>/res/image/stargray.png";
	}
}

function lock(star){
	show(star);
	locked=1;
}

function mark(star){
	lock(star);
	/* alert("선택2"+star); */
	
	document.cmtform.score.value=star;
}
</script>

<!-- 시작 -->
<span style="color: #3EA9CD; font-weight: bold; font-size: 20px;">
후기 ${countReview}개   (${avgScore}점)
<c:if test="${avgScore==0}">
   <img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==0.5}">
	<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px">
    <img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==1.0}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==1.5}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==2.0}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">	
</c:if>
<c:if test="${avgScore==2.5}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellowhalf1.png"  width="22px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==3.0}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==3.5}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==4.0}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		
</c:if>
<c:if test="${avgScore==4.5}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellowhalf1.png" width="22px"> 		
</c:if>
<c:if test="${avgScore==5.0}">
   <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px"> 		
</c:if>

</span>
	
	
	<!-- 별점 -->
          <form name="cmtform">  
            <c:if test="${sessionScope.member.memberNum != NULL || sessionScope.member.userId=='admin'}">
            <div class="separator" style="width:100%; padding: 0px;"></div>
            <div class="bbs-reply">
	           <div class="bbs-reply-write"> 
	               <table style="width: 100%;">
	               <tr>   
		              <%--  <td align="center" width="10%" rowspan="2" style="text-align: center;">
							<img src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="70px;">
						</td>	 --%>			
						<td id="star" align="center" width="15%">		               		
							<img id="image1" onclick="mark(1)" onmouseover="show(1);" onmouseout="noshow(1);" src="<%=cp%>/res/image/stargray.png" width="15px">							
							<img id="image2" onclick="mark(2)" onmouseover="show(2);" onmouseout="noshow(2);" src="<%=cp%>/res/image/stargray.png" width="15px">
							<img id="image3"  onclick="mark(3);" onmouseover="show(3);" onmouseout="noshow(3);" src="<%=cp%>/res/image/stargray.png" width="15px">
							<img id="image4" onclick="mark(4);" onmouseover="show(4);" onmouseout="noshow(4);" src="<%=cp%>/res/image/stargray.png" width="15px">
							<img id="image5"  onclick="mark(5);" onmouseover="show(5);" onmouseout="noshow(5);" src="<%=cp%>/res/image/stargray.png" width="15px">								     
						 
						</td>												
						<td align="center" width="75%" rowspan="2" style="text-align: center;">
							<textarea id="content" class="form-control" rows="3" cols="50"></textarea>
						</td>
					</tr>
					<tr>					
						<td align="center" width="20%">평점을 입력해주세요.</td>					
					</tr>					
				</table>   
				<input type="hidden" name="score" value="0">
		 <c:if test="${not empty vo.completeNum}">		 
				<div align="right" style="padding: 10px;"><button type="button" class="btn btn-primary btn-sm" onclick="sendReply();"> 등록 <span class="glyphicon glyphicon-ok"></span></button></div>   
	    </c:if>       
	           </div>
	       </div>       
           </c:if>
           </form>
<!-- 리뷰 -->
<div class="separator" style="width:100%; padding: 0px;"></div>

<div style="clear:both; margin-top:5px; padding: 10px; min-height: 150px;">
<table style="width: 100%; min-height: 100px; margin: 0px auto; border-spacing: 0px;">
<c:forEach var="dto" items="${listReview}">
	<tr height='30'>
		<td align="center" width="20%" >
			<img style="height: 80px;" src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="70px;">
		</td>
		<td align="left" width="60%" style="padding-top: 20px;"> 
		 <span style="font-weight: bold;">
	<c:if test="${dto.score==1}">	 
	 평점 : <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		 
	</c:if>	
	<c:if test="${dto.score==2}">	 
	 평점 : <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		 
	</c:if>	
	 <c:if test="${dto.score==3}">	 
	 평점 : <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		 
	</c:if>	
	<c:if test="${dto.score==4}">	 
	 평점 : <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/stargray.png" width="20px"> 		 
	</c:if>	
	<c:if test="${dto.score==5}">	 
	 평점 : <img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" width="20px"> 		 
	</c:if>	
		 </span>
			<br><br>${dto.content}
		</td>
		<td align="right" width="20%">
		${dto.created}
		<c:if test="${sessionScope.member.memberNum==dto.num || sessionScope.member.userId=='admin'}"><br>
		 <a onclick='deleteReview("${dto.reviewnum}")'>삭제</a>
		</c:if>
		</td>
		
	</tr>
	<tr height='50' style="border-bottom: 1px solid #DBDBDB;">
		<td align="center" width="20%" >${dto.userName}</td>
		<td align="left" width="60%" ><input type="hidden"></td>
		<td align="right" width="20%" ><input type="hidden"></td>
	</tr>
</c:forEach>
</table>

<!-- 페이징처리 -->
<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; color: #A6A6A6;">
            <c:if test="${reviewDataCount==0 }">
                  	등록된 후기가 없습니다.                	
            </c:if>
            

            
            <!-- 댓글 페이징 -->	
            <c:if test="${reviewDataCount!=0 }">	
           <!--  <div class="separator" style="width:100%; padding: 0px;"></div>	 -->	
               ${paging}
            </c:if>
		</div>
</div>     

</div>
