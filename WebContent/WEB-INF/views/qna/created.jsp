<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">질문하기</h2>
	</div>
	</div>
	</div>
	</div>
</section>

<section class="top-we-are">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:90%;" align="center">
	<div class="text-center top-txt-title" align="center">

			
	<div class="bs-write">
    <table class="table" style=" color:black">
    <tr>
    <td class="td1">작성자명</td>
    <td class="td2 col-md-5 col-sm-5">
    <p class="form-control-static">${sessionScope.member.userName}</p>
    </td>
    <td class="td1" align="center"></td>
    <td class="td2 col-md-5 col-sm-5">
    </td>
    </tr>
    <tr>
    <td class="td1">제목</td>
    <td colspan="3" class="td3">
    <input type="text" name="subject" class="form-control input-sm" value="${dto.subject}" required="required">
    </td>
    </tr>
    <tr>
    <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
    </tr>
    <tr>
    <td colspan="4" class="td4">
    <textarea id="content" name="content" class="form-control" rows="15" style="max-width: 99%;">${dto.content}</textarea>
    </td>
    </tr>

                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/qna/list';"> 취소 </button>
                                  
                                  <c:if test="${mode=='update'}">
                                      <input type="hidden" name="num" value="${dto.num}">
                                      <input type="hidden" name="page" value="${page}">
                                  </c:if>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
			
						
	</div>
	</div>
	</div>
	</div>
</section>