<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function() {
	$('#chkAll1').click(function() {
		if (this.checked) {
			$("input[type=checkbox]").each(function() { this.checked = true; });
		} else {
			$("input[type=checkbox]").each(function() { this.checked = false; });
		}
	});
	$('#chkAll2').click(function() {
		if (this.checked) {
			$("input[type=checkbox]").each(function() { this.checked = true; });
		} else {
			$("input[type=checkbox]").each(function() { this.checked = false; });
		}
	});
	$('#chkAll3').click(function() {
		if (this.checked) {
			$("input[type=checkbox]").each(function() { this.checked = true; });
		} else {
			$("input[type=checkbox]").each(function() { this.checked = false; });
		}
	});
});

function searchListMessage() {
	var mode="${mode}";
	var searchKey=$("#messageSearchKey1").val();
	var searchValue=$("#messageSearchValue1").val();
	
	var url="<%=cp%>/message/receive";
	$.post(url, {mode:mode, searchKey:searchKey, searchValue:searchValue}, function(data){
		var idx=1;
		if(mode=="receive")
			idx=0;
		else if(mode=="system")
			idx=3;
		var id=$("#tab-"+idx);
		id.html(data);
	});
}

function articleMessage(messageNum) {
	var mode="${mode}";
	var page=$("#page").val();
	var searchKey=$("#searchKey").val();
	var searchValue=$("#searchValue").val();
	
	var url="<%=cp%>/message/article";
	
	$.post(url, {messageNum:messageNum, mode:mode, page:page, searchKey:searchKey, searchValue:searchValue}, function(data) {
		var s=$.trim(data);
		var id;
		if(mode=="receive") {
			id="#tbListRecive";
			$(id).html("");
		} else if(mode=="send") {
			id="#tbListSend";
			$(id).html("");
		} else {
			id="#tbListSystem";
			$(id).html("");
		}
		$(id).html(data);
	});
}

function listPage(page) {
	var mode="${mode}";
	var searchKey=$("#searchKey").val();
	var searchValue=$("#searchValue").val();
	
	var url="<%=cp%>/message/receive";
	$.post(url, {mode:mode, page:page, searchKey:searchKey, searchValue:searchValue}, function(data){
		var idx=1;
		if(mode=="receive")
			idx=0;
		else if(mode=="system")
			idx=3;
		var id=$("#tab-"+idx);
		id.html(data);
	});
}

function deleteListMessage() {
	var mode="${mode}";
	var page=$("#page").val();
	var searchKey=$("#searchKey").val();
	var searchValue=$("#searchValue").val();
	
	var chks = $("input:checked");
	var cnt = chks.length;
	if(cnt==0) {
		alert("삭제할 항목을 먼저 선택 하세요 !!!");
		return;
	}
	
	if(! confirm("선택한 자료를 삭제 하시겠습니까 ? "))
		return;
	
	var url="<%=cp%>/message/messageDeleteChk";
	var params="mode="+mode+"&page="+page+"&searchKey="+searchKey+"&searchValue="+searchValue;
	$.each($(chks), function() {
		params += "&messageNums="+$(this).val();
	});
	
	$.ajax({
		type:"POST",
		url:url,
		data:params,
		dataType:"JSON",
		success:function(data) {
			var idx;
			if(mode=="receive"){
				idx=0;
				url="<%=cp%>/message/receive?mode=receive";
			} else if(mode=="send") {
				idx=1;
				url="<%=cp%>/message/receive?mode=send";
			} else {
				idx=3;
				url="<%=cp%>/message/receive?mode=system";
			}
				
			var id=$("#tab-"+idx);
			
			$.get(url, {}, function(data){
				id.html(data);
			});
		},
		error:function(e) {
			alert(e.responseText);
		}
		
	});
}
</script>
<c:if test="${mode=='receive'}">
<div id="tbListRecive">
<h3 style="text-align: center;">
	<img alt="" src="<%=cp%>/res/images/asterisk.png" style="width: 64px;">
	&nbsp;
	받은 메시지
</h3>


<div align="center" style="width: 100%;">
	<form>
		<table style="width: 100%;">
			<tr height="10px">
				<td style="width: 25%;"><button type="button"
						class="btn btn-default btn-sm" onclick="deleteListMessage();">삭제</button></td>
				<td align="right" style="width: 25%;"><select
					class="form-control input-sm" id="messageSearchKey1">
						<option value="sendUserId" ${searchKey=="sendUserId"?"selected='selected' ":"" }>보낸사람</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
				</select></td>
				<td style="width: 25%;" align="center"><input type="text"
					class="form-control input-sm input-search" id="messageSearchValue1"
					value="${searchValue}"></td>
				<td align="left" style="width: 25%;">
					<button type="button" class="btn btn-info btn-sm btn-search"
						onclick="searchListMessage();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</td>

			</tr>
		</table>

		<div class="separator" style="width: 100%"></div>

	
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%; height: 50px;"><input type="checkbox"
						id="chkAll1" style="width: 20%"></td>
					<td style="width: 20%; font-weight: bold;">보낸사람</td>
					<td style="width: 20%; font-weight: bold;">제목</td>
					<td style="width: 20%; font-weight: bold;">받은날짜</td>
					<td style="width: 20%; font-weight: bold;">확인날짜</td>
				</tr>

				<c:forEach var="dto" items="${list}">
					<tr>
						<td style="width: 20%; height: 10px;"><input type="checkbox"
							value="${dto.messageNum}" style="width: 20%"></td>
						<td style="width: 20%; height: 10px;">${dto.sendUserId}</td>
						<td style="width: 20%; cursor: pointer;"
							onclick="articleMessage(${dto.messageNum});">${dto.subject}</td>
						<td style="width: 20%;">${dto.sendCreated}</td>
						<td style="width: 20%;"><c:if
								test="${dto.confirmCreated==null}">
									읽지않음
									</c:if> ${dto.confirmCreated}</td>
					</tr>
				</c:forEach>
			</table>
	


		<div class="separator" style="width: 100%"></div>
		<div>${paging}</div>
	</form>
</div>

<input type="hidden" id="searchKey" value="${searchKey}">
<input type="hidden" id="searchValue" value="${searchValue}">
<input type="hidden" id="page" value="${page}">
</div>
</c:if>










<c:if test="${mode=='send'}">
<div id="tbListSend">
<h3 style="text-align: center;">
	<img alt="" src="<%=cp%>/res/images/asterisk.png" style="width: 64px;">
	&nbsp;
	보낸 메시지
</h3>


<div align="center" style="width: 100%;">
	<form>
		<table style="width: 100%;">
			<tr height="10px">
				<td style="width: 25%;"><button type="button"
						class="btn btn-default btn-sm" onclick="deleteListMessage();">삭제</button></td>
				<td align="right" style="width: 25%;"><select
					class="form-control input-sm" id="messageSearchKey">
							<option>받은사람</option>
						<option>제목</option>
						<option>내용</option>
				</select></td>
				<td style="width: 25%;" align="center"><input type="text"
					class="form-control input-sm input-search" id="messageSearchValue"
					value="${searchValue}"></td>
				<td align="left" style="width: 25%;">
					<button type="button" class="btn btn-info btn-sm btn-search"
						onclick="searchListMessage();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</td>

			</tr>
		</table>

		<div class="separator" style="width: 100%"></div>

	
							<table style="width: 100%;">
								<tr>
									<td style="width: 20%; height: 50px;">
									<input type="checkbox" id="chkAll2" style="width: 20%">
									</td>
									<td style="width: 20%; font-weight: bold;">받은사람</td>
									<td style="width: 20%; font-weight: bold;">제목</td>
									<td style="width: 20%; font-weight: bold;">보낸날짜</td>
									<td style="width: 20%; font-weight: bold;">확인날짜</td>
								</tr>
								
								<c:forEach var="dto" items="${list}">
								<tr>
									<td style="width: 20%; height: 10px;">
									<input type="checkbox" value="${dto.messageNum}" style="width: 20%">
									</td>
									<td style="width: 20%;">${dto.receiveUserId}</td>
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
	


		<div class="separator" style="width: 100%"></div>
		<div>${paging}</div>
	</form>
</div>

<input type="hidden" id="searchKey" value="${searchKey}">
<input type="hidden" id="searchValue" value="${searchValue}">
<input type="hidden" id="page" value="${page}">
</div>
</c:if>

<c:if test="${mode=='system'}">
<div id="tbListSystem">
<h3 style="text-align: center;">
	<img alt="" src="<%=cp%>/res/images/asterisk.png" style="width: 64px;">
	&nbsp;
	시스템 메시지
</h3>


<div align="center" style="width: 100%;">
	<form>
		<table style="width: 100%;">
			<tr height="10px">
				<td style="width: 25%;"><button type="button"
						class="btn btn-default btn-sm" onclick="deleteListMessage();">삭제</button></td>
				<td align="right" style="width: 25%;"><select
					class="form-control input-sm" id="messageSearchKey1">
						<option value="sendUserId" ${searchKey=="sendUserId"?"selected='selected' ":"" }>보낸사람</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
				</select></td>
				<td style="width: 25%;" align="center"><input type="text"
					class="form-control input-sm input-search" id="messageSearchValue1"
					value="${searchValue}"></td>
				<td align="left" style="width: 25%;">
					<button type="button" class="btn btn-info btn-sm btn-search"
						onclick="searchListMessage();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</td>

			</tr>
		</table>

		<div class="separator" style="width: 100%"></div>

	
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%; height: 50px;"><input type="checkbox"
						id="chkAll3" style="width: 20%"></td>
					<td style="width: 20%; font-weight: bold;">보낸사람</td>
					<td style="width: 20%; font-weight: bold;">제목</td>
					<td style="width: 20%; font-weight: bold;">받은날짜</td>
					<td style="width: 20%; font-weight: bold;">확인날짜</td>
				</tr>

				<c:forEach var="dto" items="${list}">
					<tr>
						<td style="width: 20%; height: 10px;"><input type="checkbox"
							value="${dto.messageNum}" style="width: 20%"></td>
						<td style="width: 20%; height: 10px;">${dto.sendUserId}</td>
						<td style="width: 20%; cursor: pointer;"
							onclick="articleMessage(${dto.messageNum});">${dto.subject}</td>
						<td style="width: 20%;">${dto.sendCreated}</td>
						<td style="width: 20%;"><c:if
								test="${dto.confirmCreated==null}">
									읽지않음
									</c:if> ${dto.confirmCreated}</td>
					</tr>
				</c:forEach>
			</table>
	


		<div class="separator" style="width: 100%"></div>
		<div>${paging}</div>
	</form>
</div>

<input type="hidden" id="searchKey" value="${searchKey}">
<input type="hidden" id="searchValue" value="${searchValue}">
<input type="hidden" id="page" value="${page}">
</div>
</c:if>