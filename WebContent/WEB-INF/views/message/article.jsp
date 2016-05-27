<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		var mode = "${mode}";
		var page = "${page}";
		var searchKey = "${searchKey}";
		var searchValue = "${searchValue}";
		
		$("#btnArticleList").click(function(){
			var url="<%=cp%>/message/receive";
			$.get(url, {page:page, mode:mode, searchKey:searchKey, searchValue:searchValue}, function(data){
			var s=$.trim(data);
			
			var id;
			if(mode=="receive") {
				id="#tbListRecive";
				$(id).html("");
			} else {
				id="#tbListSend";
				$(id).html("");
			}
			$(id).html(data);	
			});
		   });
	});
	
function articleView(messageNum) {
	var page="${page}";
	var searchKey="${searchKey}";
	var searchValue="${searchValue}";
	
	var url="<%=cp%>/message/article";
	
	$.post(url, {messageNum:messageNum, page:page, searchKey:searchKey, searchValue:searchValue}, function(data){
		var s=$.trim(data);
		
		var id;
		id="#tbListRecive";
		$("#tbListRecive").html("");
		$(id).html(data);
	});
}
</script>

<div class="night-desc">
	<form name="sendForm">
		

		<div align="center">
		<c:if test="${mode=='receive'}">
			<table
				style="text-align: left; margin-left: 290px; margin-right: 290px;" id="tbListRecive">
				
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/name.png"
								style="width: 64px;"> 보낸 사람 :
						</h4></td>
					<td><input id="messageReceiveUserId" type="text"
						name="receiveUserId"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" readonly="readonly" value="${dto.sendUserId}">
					</td>
				</tr>
				
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/name.png"
								style="width: 64px;"> 받은 사람 :
						</h4></td>
					<td><input id="messageReceiveUserId" type="text"
						name="receiveUserId"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" value="${dto.receiveUserId}" readonly="readonly">
					</td>
				</tr>
				
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/calendar.png"
															style="width: 64px;"> 날짜 :
						</h4></td>
					<td><input id="messageReceiveUserId" type="text"
						name="receiveUserId"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" value="${dto.sendCreated}" readonly="readonly">
					</td>
				</tr>

				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/email.png"
								style="width: 64px;"> 제 목 :
						</h4></td>
					<td><input type="text" id="messageSubject" name="subject"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" readonly="readonly" value="${dto.subject}">
					</td>
				</tr>


				<tr style="border-bottom: 2px; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/email.png"
								style="width: 64px;"> 내용 :
						</h4></td>
				</tr>
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td colspan="2"><textarea id="messageContent" name="content"
							rows="8" cols="50%"
							style="font-size: 16px; border: none;" readonly="readonly">${dto.content}</textarea></td>
				</tr>
				<tr style="text-align: center;">
					<!--    <td><h3><input class="btn btn-default btn-register"  type="button" onclick="update();" value="수정하기"></h3> -->

					<td><h4>
							<a id="btnArticleList">목록으로</a>
						</h4></td>
				</tr>
			</table>
			</c:if>
			
			<c:if test="${mode=='send'}">
			<table
				style="text-align: left; margin-left: 290px; margin-right: 290px;" id="tbListSend">
				
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/name.png"
								style="width: 64px;"> 보낸 사람 :
						</h4></td>
					<td><input id="messageReceiveUserId" type="text"
						name="receiveUserId"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" readonly="readonly" value="${dto.sendUserId}">
					</td>
				</tr>
				
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/name.png"
								style="width: 64px;"> 받은 사람 :
						</h4></td>
					<td><input id="messageReceiveUserId" type="text"
						name="receiveUserId"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" value="${dto.receiveUserId}" readonly="readonly">
					</td>
				</tr>
				
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/calendar.png"
															style="width: 64px;"> 날짜 :
						</h4></td>
					<td><input id="messageReceiveUserId" type="text"
						name="receiveUserId"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" value="${dto.sendCreated}" readonly="readonly">
					</td>
				</tr>

				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/email.png"
								style="width: 64px;"> 제 목 :
						</h4></td>
					<td><input type="text" id="messageSubject" name="subject"
						style="width: 100%; height: 50%; font-size: 16px; border: none;" readonly="readonly" value="${dto.subject}">
					</td>
				</tr>


				<tr style="border-bottom: 2px; width: 100%; color: navy;">
					<td><h4>
							<img alt="" src="<%=cp%>/res/images/email.png"
								style="width: 64px;"> 내용 :
						</h4></td>
				</tr>
				<tr
					style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
					<td colspan="2"><textarea id="messageContent" name="content"
							rows="8" cols="50%"
							style="font-size: 16px; border: none;" readonly="readonly">${dto.content}</textarea></td>
				</tr>
				<tr style="text-align: center;">
					<!--    <td><h3><input class="btn btn-default btn-register"  type="button" onclick="update();" value="수정하기"></h3> -->

					<td><h4>
							<a id="btnArticleList">목록으로</a>
						</h4></td>
				</tr>
			</table>
			</c:if>
		</div>
	</form>
</div>