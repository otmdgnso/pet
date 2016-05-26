<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function sendCheck() {
	var f=document.sendForm;
	
	var receiveUserId=f.receiveUserId.value;
	if(!receiveUserId) {
		f.receiveUserId.focus();
		return false;
	}
	
	var subject= f.subject.value;
	if(!subject) {
		f.subject.focus();
		return false;
	}
	
	var content= f.content.value;
	if(!content) {
		f.content.focus();
		return false;
	}
	
	var url="<%=cp%>/message/send_ok";
	var params="subject="+subject+"&content="+content +"&receiveUserId=" +receiveUserId;
	
	$.ajax({
		type:"POST",
		url:url,
		data:params,
		dataType:"json",
		success:function(data){
			
		
		$("#messageReceiveUserId").val("");
		$("#messageContent").val("");
		$("#messageSubject").val("");
		alert("메시지를 전송했습니다.");
	},
	error:function(e) {
		alert(e.responseText);
	}
});
}
</script>

<div class="night-desc">
                     <form name="sendForm">
                        <h3 style="text-align: center;"><img alt="" src="<%=cp%>/res/images/asterisk.png"
											style="width: 64px;"> &nbsp; 메시지 보내기</h3>
											
											<div align="center">
						<table style="text-align: left;margin-left: 290px; margin-right: 290px; ">
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/name.png"
															style="width: 64px;"> 받을 사람 :
													</h4></td>
												<td>
												<input id="messageReceiveUserId" type="text" name="receiveUserId" style="border-color:skyblue; width: 100%; height: 50%; font-size: 16px;">
												</td>
											</tr>
											
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/email.png"
															style="width: 64px;"> 제 목 :
													</h4></td>
												<td>
												<input type="text" id="messageSubject" name="subject" style="border-color:skyblue; width: 100%; height: 50%; font-size: 16px;">
												</td>
											</tr>
											

											<tr
												style="border-bottom: 2px; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/email.png"
															style="width: 64px;"> 내용 :
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td colspan="2">
												<textarea id="messageContent" name="content" rows="8" cols="50%" style="border-color:skyblue; font-size: 16px;"></textarea>
												</td>
												</tr>
											<tr style="text-align: center;">
												<!--    <td><h3><input class="btn btn-default btn-register"  type="button" onclick="update();" value="수정하기"></h3> -->

												<td><h4>
														<a onclick="sendCheck();">보내기</a>
													</h4></td>												
											</tr>
										</table>
										</div>
										</form>
										</div>