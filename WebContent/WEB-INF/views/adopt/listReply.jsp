<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<table style='width: 600px; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>

<c:forEach var="dto" items="${list}">
<tr height='30' bgcolor='#EEEEEE' style='border: 1px solid #DBDBDB;'>
    <td width='50%' style='padding-left: 5px;'>
        ${dto.userId}
    </td>
    <td width='50%' align='right' style='padding-right: 5px;'>
        ${dto.created} |
		<a onclick='deleteReply("${dto.replyNum}", "${pageNo}", "${dto.userId}");'>삭제</a>
    </td>
</tr>
<tr height='50'>
    <td colspan='2' style='padding: 5px;' valign='top'>
       ${dto.content}
    </td>
</tr>
</c:forEach>

<tr height='30'>
    <td colspan='2' align='center'>
    ${paging}
    </td>
</tr>    

</table>