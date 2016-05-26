<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function() {
	$('#chkAll').click(function() {
		if (this.checked) {
			$("#tbListMessage input[type=checkbox]").each(function() { this.checked = true; });
		} else {
			$("#tbListMessage input[type=checkbox]").each(function() { this.checked = false; });
		}
	});
});

function articleMessage(messageNum) {
	var mode=$("#mode").val();
	alert(mode);
}
</script>

<h3 style="text-align: center;"><img alt="" src="<%=cp%>/res/images/asterisk.png"
	style="width: 64px;"> &nbsp; 
	<c:if test="${mode=='receive'}">
	받은 메시지
	</c:if>
	<c:if test="${mode=='send'}">
	보낸 메시지
	</c:if>
	</h3>
							
							
						<div align="center" style="width: 100%;">
						<form>
							<table style="width: 100%;">
								<tr height="10px">
									<td style="width: 25%;"><button type="button" class="btn btn-default btn-sm" onclick="deleteListMessage();">삭제</button></td>
									<td align="right" style="width: 25%;">
									<select class="form-control input-sm" id="messageSearchKey">
										<c:if test="${mode=='receive'}">
										<option>보낸사람</option>
										</c:if>
										<c:if test="${mode=='send'}">
										<option>받은사람</option>
										</c:if>
										<option>제목</option>
										<option>내용</option>
									</select>
									</td>
									<td style="width: 25%;" align="center">
									<input type="text" class="form-control input-sm input-search" id="messageSearchValue" value="${searchValue}">
									</td>
									<td align="left" style="width: 25%;">
									 <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchListMessage();"><span class="glyphicon glyphicon-search"></span> 검색</button>
									</td>
									
								</tr>
								</table>
								
								<div class="separator" style="width:100%"></div>  
								
								<table style="width: 100%;" id="tbListMessage">
								<tr>
									<td style="width: 20%; height: 50px;">
									<input type="checkbox" id="chkAll" style="width: 20%">
									</td>
									<c:if test="${mode=='receive'}">
									<td style="width: 20%; font-weight: bold;">보낸사람</td>
									</c:if>
									<c:if test="${mode=='send'}">
									<td style="width: 20%; font-weight: bold;">받은사람</td>
									</c:if>
									<td style="width: 20%; font-weight: bold;">제목</td>
									<c:if test="${mode=='receive'}">
									<td style="width: 20%; font-weight: bold;">받은날짜</td>
									</c:if>
									<c:if test="${mode=='send'}">
									<td style="width: 20%; font-weight: bold;">보낸날짜</td>
									</c:if>
									<td style="width: 20%; font-weight: bold;">확인날짜</td>
								</tr>
								
								<c:forEach var="dto" items="${list}">
								<tr>
									<td style="width: 20%; height: 10px;">
									<input type="checkbox" value="${dto.messageNum}" style="width: 20%">
									</td>
									<c:if test="${mode=='receive'}">
									<td style="width: 20%; height: 10px;">${dto.sendUserId}</td>
									</c:if>
									<c:if test="${mode=='send'}">
									<td style="width: 20%;">${dto.receiveUserId}</td>
									</c:if>
									<td style="width: 20%; cursor: pointer;" onclick="articleMessage(${dto.messageNum});">${dto.subject}</td>
									<td style="width: 20%;">${dto.sendCreated}</td>
									<td style="width: 20%;">
									<c:if test="${dto.confirmCreated==null}">
									읽지않음
									</c:if>
									${dto.confirmCreated}
									</td>
								</tr>
								</c:forEach>
							</table>
							
							<div class="separator" style="width:100%"></div> 
							<div>
							${paging}
							</div>
						</form>
										</div>
										
