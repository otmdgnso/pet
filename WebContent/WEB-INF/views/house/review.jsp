<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
//댓글 추가
function sendReply() {
	alert(score);
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
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/house/createdReply"
		,dataType:"json"
		,data:params
		,success:function(data) {
			$("#content").val("");
			alert("ㅎㅇ");
			var state=data.state;
			if(state=="true") {
				alert("gd");
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 등록하지 못했습니다.");
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
	alert("선택2"+star);
	/* if($("#star").change()){
		alert("ㅎㅇ");
	} */
	var score=star;
	alert(score);
	document.cmtform.star.value=star; 
}
</script>

<!-- 시작 -->
<span style="color: #3EA9CD; font-weight: bold; font-size: 20px;">후기 3개 </span>
	<img src="<%=cp%>/res/image/staryellow.png" id="star_12" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_22" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_32"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_42"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_52" width="20px">
	
	<!-- 별점 -->
          <form name="cmtform">  
            <c:if test="${sessionScope.member.memberNum != NULL || sessionScope.member.userId=='admin'}">
            <div class="separator" style="width:100%; padding: 0px;"></div>
            <div class="bbs-reply">
	           <div class="bbs-reply-write"> 
	               <table style="width: 100%;">
	               <tr>   
		               <td align="center" width="10%" rowspan="2" style="text-align: center;">
							<img src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="70px;">
						</td>       
	               		<%-- <td id="star" align="center" width="15%">		               		
							<img src="<%=cp%>/res/image/stargray.png" id="star_1" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_2" onclick="javascript:check_star(2);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_3" onclick="javascript:check_star(3);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_4" onclick="javascript:check_star(4);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_5" onclick="javascript:check_star(5);" width="15px">								     
						</td> --%>
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
				<div align="right" style="padding: 10px;"><button type="button" class="btn btn-primary btn-sm" onclick="sendReply();"> 등록 <span class="glyphicon glyphicon-ok"></span></button></div>   
	           </div>
	       </div>       
           </c:if>
           </form>
<!-- 리뷰 -->
<div class="separator" style="width:100%; padding: 0px;"></div>

<div style="clear:both; margin-top:5px; padding: 10px; min-height: 150px;">
<c:forEach var="dto" items="${listReview}">
<table style="width: 100%; min-height: 100px; margin: 0px auto; border-spacing: 10px;">
	<tr>
		<td align="center" width="20%">
			<img src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="70px;">
		</td>
		<td align="left" width="70%" style="margin-bottom:  5px; min-height: 50px;">
			${dto.content}
		</td>
		<td align="right" width="70%">${dto.created}</td>
		<td width="10%"></td>
	</tr>
	<tr>
		<td align="center" width="20%">${dto.userName}</td>

		<c:if test="${sessionScope.member.memberNum==dto.num || sessionScope.member.userId=='admin'}">
		<td width="10%"><a onclick='deleteReview("${dto.reviewnum}")'>삭제</a></td>
		</c:if>
	</tr>
</table>
</c:forEach>

<!-- 페이징처리 -->
<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; color: #A6A6A6;">
            <c:if test="${reviewDataCount==0 }">
                  	등록된 후기가 없습니다.                	
            </c:if>
            

            
            <!-- 댓글 페이징 -->	
            <c:if test="${reviewDataCount!=0 }">	
            <div class="separator" style="width:100%; padding: 0px;"></div>		
               ${paging}
            </c:if>
		</div>
</div>     

</div>
