<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
table {
	background-color:#f5f5f5;
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: center;
}

</style>

<section class="top-we-are" style="height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="cbp-vm-switcher cbp-vm-view-list">
	<div class="separator" style="width:100%"></div>       
		<h3>전문가에게 묻기 </h3>
	<div class="separator" style="width:100%"></div>  
		<!-- 검색 -->
		
		<div class="form-group" style="margin:0 auto; width:100%;" align="center">
			<form name="searchForm"  method="post">
			<table style="width: 50%; margin: 0px auto; border-spacing: 0px;">
				<tr align="center" height="50px">
					<td align="center" width="10%">
							<select class="form-control input-sm" name="searchKey" >
						      <option value="subject">제목</option>
						      <option value="userName">작성자</option>
						      <option value="content">내용</option>
						      <option value="created">등록일</option>
						  </select>
					</td>	
					<td align="center" width="30%"><input type="text" class="form-control input-sm input-search" name="searchValue"></td>
					<td align="center" width="10%"><button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button></td>
				</tr>
			</table>
			</form>		
		</div>
		
		<!-- 테이블 -->
		<div class="form-group" style="margin:0 auto; width:80%; padding-top: 20px;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" style="background-color: #ffffff">
	           	  <td align="center" width="5%"><label>번호</label></td>
	              <td align="center" width="25%"><label>제목</label></td>
	              <td align="center" width="5%"><label>작성자</label></td>
	              <td align="center" width="10%"><label>날짜</label></td>
	              <td align="center" width="5%"><label>조회수</label></td>              
	           </tr>
	           
	           <tr align="center">
	           	  <td align="center" style="color: #A6A6A6;">1</td>
	              <td align="center" style="color: #A6A6A6;">질문입니다.</td>
	              <td align="center" style="color: #A6A6A6;">강하나</td>
	              <td align="center" style="color: #A6A6A6;">2016/06/07</td>	          
	              <td align="center" style="color: #A6A6A6;">0</td>	             
	           </tr>          
	        </table> 
	        <input type="hidden" value="${dto.hostNum}">         
		</div>
	</div>
	<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="form-group" style="margin:0 auto; width:80%; height:60px " align="center">
		<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; color: #A6A6A6;">
            <c:if test="${dataCount==0 }">
                  	등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
               ${paging}
            </c:if>
        </div>   
        </div>    
	</div>
	</div>
	</div>
	</div>  
</section>