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
	var uid="$sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}
	
	var hostNum="${dto.hostNum}";
	var content=$.trim($("#content").val());
	if(! content) {
		alert("내용을 입력하세요.");
		$("#content").focus();
		return false;
	}
	
	var params="hostNum="+hostNum;
	params+="&content="+content;
	
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/house/createdReply"
		,dataType:"json"
		,success:function(data) {
			$("#content").val("");
			
			var state=data.state;
			if(state=="true") {
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



</script>

<!-- 시작 -->
<span style="color: #3EA9CD; font-weight: bold; font-size: 20px;">후기 3개 </span>
	<img src="<%=cp%>/res/image/staryellow.png" id="star_1" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_2" width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_3"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_4"  width="20px">
	<img src="<%=cp%>/res/image/staryellow.png" id="star_5" width="20px">
	
	<!-- 별점 -->
            
            <c:if test="${sessionScope.member.memberNum != NULL || sessionScope.member.userId=='admin'}">
            <div class="separator" style="width:100%; padding: 0px;"></div>
            <div class="bbs-reply">
	           <div class="bbs-reply-write"> 
	               <table style="width: 100%;">
	               <tr>   
		               <td align="center" width="10%" rowspan="2" style="text-align: center;">
							<img src="<%=cp%>/uploads/profile/${dto.profile}" class="avatar img-circle img-thumbnail" width="70px;">
						</td>       
	               		<td align="center" width="15%">							
							<img src="<%=cp%>/res/image/stargray.png" id="star_1" onclick="javascript:check_star(1);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_2" onclick="javascript:check_star(2);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_3" onclick="javascript:check_star(3);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_4" onclick="javascript:check_star(4);" width="15px">
							<img src="<%=cp%>/res/image/stargray.png" id="star_5" onclick="javascript:check_star(5);" width="15px">								     
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
		<td width="10%"></td>
	</tr>
	<tr>
		<td align="center" width="20%">${dto.userName}</td>
		<td align="left" width="70%">${dto.created}</td>

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
