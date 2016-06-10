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
       
           <div id="listReply"></div>
       </div>
       <div>
       <img src="<%=cp%>/res/image/replyli.png">
       </div>
       

	</div>
	</div>
	</div>  
</section>