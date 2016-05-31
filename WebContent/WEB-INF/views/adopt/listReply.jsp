<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div align="center">
<table style='margin-top:20px; width: 100%; text-align:left; border-spacing: 0px; border-collapse: collapse; background-color: #EEEEEE; '>

<c:forEach var="dto" items="${list}">
<tr height='30' style='color:black;'>
    <td width='50%' style='padding-left: 20px; font-weight: bold;'>
       작성자: ${dto.userId}
    </td>
    <td width='50%' align='right' style='padding-right: 5px;'>
        ${dto.created} 
      <c:if test="${sessionScope.member.userId=='admin' ||sessionScope.member.userId==dto.userId}">
		| <a style="cursor: pointer;" onclick='deleteReply("${dto.replyNum}", "${pageNo}", "${dto.userId}");'>삭제</a>
	  </c:if>	
    </td>
</tr>
<tr height='50' style="border-bottom: 1px solid #DBDBDB; ">
    <td colspan='2' style='color:black; padding-left: 20px;' valign='top'>
       ${dto.content}
    </td>
</tr>
</c:forEach>
</table>


	<span>${paging}</span>
</div>