<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
</script>

<section class="top-we-are" style="height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="cbp-vm-switcher cbp-vm-view-list">
	<div class="separator" style="width:100%"></div>       
		<h4>분양목록</h4>
	<div class="separator" style="width:100%"></div>  
		<!-- 검색 -->
		<div class="form-group" style="margin:0 auto; width:100%;" align="center">
			<form name="searchForm"  method="post">
			<table style="width: 70%; margin: 0px auto; border-spacing: 0px;">
				<tr align="center" height="50px">
					<td align="center" width="40%">
							<i class="fa fa-smile-o" aria-hidden="true"></i><label>품종 : </label>
							<input type="text" name="searchHost" id="searchHost" class="boxTF">
					</td>	
					<td align="center" width="10%"><i class="fa fa-smile-o" aria-hidden="true"></i><label>분류 : </label></td>
					<td align="center" width="10%"><input type="radio" name="searchState" value="all" checked="checked"><label>all</label></td>
					<td align="center" width="10%"><input type="radio" name="searchState" value="wait"><label>wait</label></td>
					<td align="center" width="10%"><input type="radio" name="searchState" value="accept"><label>accept</label></td>
					<td align="center" width="15%"><input type="button" value="검색" class="btn" onclick="searchList()"></td>
				</tr>
			</table>
			</form>		
		</div>
		
		<!-- 테이블 -->
		<div class="form-group" style="margin:0 auto; width:80%;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%"><label>상태</label></td>
	              <td align="center" width="15%"><label>품종</label></td>
	              <td align="center" width="20%"><label>제목</label></td>
	              <td align="center" width="15%"><label>판매자</label></td>
	              <td align="center" width="20%"><label>날짜</label></td>              
	              <td align="center" width="10%"></td>
	           </tr>
	           
	           <c:forEach var="dto" items="${list}">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%" style="color: #A6A6A6;">${dto.accept}</td>
	              <td align="center" width="15%" style="color: #6ABC64;">${dto.species}</td>
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.subject}</td>
	              <td align="center" width="15%" style="color: #A6A6A6;"><a href="<%=cp%>/adopt/article?page=&preSaleNum=${dto.preSaleNum}">${dto.userId}</a></td>	          
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.created}</td>
	           </tr>

	           </c:forEach>  
	           
	        </table>      
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