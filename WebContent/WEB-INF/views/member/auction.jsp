<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


	<div class="cbp-vm-switcher cbp-vm-view-list">
	<div class="separator" style="width:70%"></div>       
		<h4 align="center">입찰 목록</h4>
	<div class="separator" style="width:70%"></div> 		
								
            <!--여기서 forEach시작 -->
			
				                                                         
      <!-- 테이블 -->
		<div class="form-group" style="margin:0 auto; width:70%; padding-top: 20px;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; padding-bottom: 10px;">
	           <tr align="center" height="50px" style="background-color: #ffffff">
	              <td align="center" width="5%"><label>번호</label></td>
	              <td align="center" width="20%"><label>제목</label></td>
	              <td align="center" width="5%"><label>작성자</label></td>
	              <td align="center" width="10%"><label>입찰액</label></td>
	              <td align="center" width="10%"><label>경매종료일</label></td>              
	           </tr>
	           
	           <tr align="center" height="40px">
	              <td align="center" style="color: #A6A6A6;">5</td>
	              <td align="center" style="color: #A6A6A6;">고양이의 로망!!징검다리 놀이터!!!</td>
	              <td align="center" style="color: #A6A6A6;">김재환</td>
	              <td align="center" style="color: #A6A6A6;">50,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-22</td>	             
	           </tr>          
	           <tr align="center" height="40px">
	              <td align="center" style="color: #A6A6A6;">4</td>
	              <td align="center" style="color: #A6A6A6;">고양이 전용 샴푸입니다!</td>
	              <td align="center" style="color: #A6A6A6;">장승훈</td>
	              <td align="center" style="color: #A6A6A6;">20,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-30</td>	             
	           </tr>          
	           <tr align="center" height="40px">
	              <td align="center" style="color: #A6A6A6;">3</td>
	              <td align="center" style="color: #A6A6A6;">숑숑터널</td>
	              <td align="center" style="color: #A6A6A6;">안지아</td>
	              <td align="center" style="color: #A6A6A6;">10,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-07-31</td>	             
	           </tr>          
	           <tr align="center" height="40px">
	              <td align="center" style="color: #A6A6A6;">2</td>
	              <td align="center" style="color: #A6A6A6;">고급진 강아지 목줄 팝니다</td>
	              <td align="center" style="color: #A6A6A6;">김수정</td>
	              <td align="center" style="color: #A6A6A6;">10,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-07-02</td>	             
	           </tr>          
	           <tr align="center" height="40px">
	              <td align="center" style="color: #A6A6A6;">1</td>
	              <td align="center" style="color: #A6A6A6;">강아지 쿠션 팔아요.</td>
	              <td align="center" style="color: #A6A6A6;">강하늘</td>
	              <td align="center" style="color: #A6A6A6;">10,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-07-01</td>	             
	           </tr>          
	        </table> 
		</div>
   			<!-- 페이징처리 -->
		<div class="clear:both" align="center">	
			<ul class="pagination">
				  <li><a href="#" class="active">1</a></li>
			</ul>
     </div>
   </div> 
		