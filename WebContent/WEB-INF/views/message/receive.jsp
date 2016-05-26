<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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
								<tr>
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
								
								<table style="width: 100%;">
								<tr>
									<td style="width: 20%;">
									<input type="checkbox" id="chkAll" style="width: 20%">
									</td>
									<c:if test="${mode=='receive'}">
									<td style="width: 20%;">보낸사람</td>
									</c:if>
									<c:if test="${mode=='send'}">
									<td style="width: 20%;">받은사람</td>
									</c:if>
									<td style="width: 20%;">제목</td>
									<c:if test="${mode=='receive'}">
									<td style="width: 20%;">받은날짜</td>
									</c:if>
									<c:if test="${mode=='send'}">
									<td style="width: 20%;">보낸날짜</td>
									</c:if>
									<td style="width: 20%;">확인날짜</td>
								</tr>
								
								<c:forEach var="dto" items="${list}">
								<tr>
									<td style="width: 20%;">
									<input type="checkbox" id="chkAll" style="width: 20%">
									</td>
									<c:if test="${mode=='receive'}">
									<td style="width: 20%;">${dto.sendUserId}</td>
									</c:if>
									<c:if test="${mode=='send'}">
									<td style="width: 20%;">${dto.receiveUserId}</td>
									</c:if>
									<td style="width: 20%;">${dto.subject}</td>
									<td style="width: 20%;">${dto.sendCreated}</td>
									<td style="width: 20%;">${dto.confirmCreated}</td>
								</tr>
								</c:forEach>
							</table>

						</form>
										</div>
										
