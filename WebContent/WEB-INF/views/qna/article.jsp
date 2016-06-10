<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
	color: black;
    padding: 8px;
}
</style>

<section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">전문가에게 묻기</h2>
                </div>
             </div>
          </div>
      </div>
</section>


<section class="top-we-are" style="min-height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="table-responsive" style="clear: both; padding-top: 80px;"> 
	
	       <table>
       <tr>
<%--                 		<td>
<c:if test="${sessionScope.member.userId==dto.userId}">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateBoard();">수정</button>
</c:if>
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">	                		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteBoard();">삭제</button>
</c:if>                		    
                		</td> --%>
                		 <td colspan="2" align="right">
                		    <button type="button" class="btn btn-primary btn-sm" onclick="javascript:location.href='<%=cp%>/qna/list?${params}';"> 목록으로 </button>
                		</td>
                	</tr>
</table>
	<table class="table">
                     <tr align="center" style="background-color: #ffffff">
                         <th colspan="2" style="text-align: center;">
                                ${dto.subject}
                         </th>
                     </tr>
                     <tr>
                         <td style="text-align: left;">
                             이름 : <%-- ${dto.userName} --%>
                         </td>
                         <td style="text-align: right;">
                          ${dto.created}<i>|</i>조회 ${dto.hitCount}
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                              ${dto.content}
                         </td>
                     </tr>                                                                                 	
            </table>
	
	
	</div>
	
		<div class="bbs-reply">
           <div class="bbs-reply-write">

           	       <div style="float: left;"><span style="font-weight: bold; color: #A6A6A6;">댓글쓰기</span><span style="color: #A6A6A6;"> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span></div>
           	       <div style="float: right; text-align: right;"></div>

               <table style="padding-top: 10px;">
           			<tr>
           			<td width="90%"><textarea id="content" class="form-control" rows="3" ></textarea></td>
                    <td width="10%"><button type="button" class="btn btn-default btn-sm wbtn" style="width: 100%; height: 100%" onclick="sendReply();"> 댓글등록 <span class="glyphicon glyphicon-ok"></span></button></td>
                    </tr>
               </table>           
           </div>
       
<div style="clear: both; padding-top: 20px;">
    <div style="float: left;"><span style="color: #3EA9CD; font-weight: bold;">댓글 1개</span><span style="color: #A6A6A6;">[댓글 목록, 1/1 페이지]</span></div>
    <div style="float: right; text-align: right;"></div>
</div>
              
<div style="clear: both; padding-top: 5px;">

    <!-- 리플 내용 리스트 시작 -->
    <div style="clear:both; margin-top:5px; padding: 10px; border: #d5d5d5 solid 1px; min-height: 130px;  color : black">
        <div style="clear: both;">
            <div style="float: left;">전문가 | 2016/06/09</div>
        </div>
        <div style="clear: both; padding: 5px 0 5px 0px;  min-height: 70px;">
            강아지가 스트레스를 받았을 경우 그러한 증상이 나타 날 수가 있습니다. 스트레스를 풀 수 있도록 함께 산책을 해보세요.
        </div>
        <div style="clear: both; min-height: 30px;">
            <div style="float: left;">
                <button type="button" class="btn btn-primary btn-sm" onclick="$">답글</button>
            </div>                        
        </div>

        <!-- 답글 시작 -->
        <div id="replyAnswerLayout${vo.replyNum}" style="display: none;">
            <div style="clear: both; margin-top:10px; padding: 5px; border-top: #d5d5d5 solid 1px;">
                <textarea id="replyContent${vo.replyNum}" class="form-control" rows="3" required="required"></textarea>
            </div>
            <div style="text-align: right; padding-top: 7px;">
                <button type="button" class="btn btn-primary btn-sm" onclick="sendReplyAnswer('${vo.num}', '${vo.replyNum}')"> 답글등록 </button>
            </div>

            <!-- 답글 리스트 -->       
            <div id="listReplyAnswer${vo.replyNum}" style="padding-top: 5px;"></div>
        </div> <!-- 답글 끝 -->
                        
    </div>  <!-- 리플 내용 리스트 끝 -->
</div>
              
<div style="clear: both; padding-top: 10px; text-align: center;">
    ${paging}
</div>

	</div>
	</div>
	</div>  
</section>