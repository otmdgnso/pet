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

ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 2px 8px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    font-size: 18px;
}

ul.pagination li a.active {
    background-color: #eee;
    color: black;
    border: 1px solid #ddd;
}

ul.pagination li a:hover:not(.active) {background-color: #ddd;}
</style>

	<div class="txt-sort">
		<p>Sort result:</p>
	</div>
			<div class="click-nav">
				<ul class="no-js">
					<li><a href="<%=cp %>/auction/bidList"  class="clicker">입찰한 물품</a>	</li>
			</ul>
		</div>
	<div class="click-nav-location">
        <ul class="no-js">
            <li>
             	<a href="<%=cp %>/auction/auctionMyList" class="clicker">경매 리스트</a>
            </li>
        </ul>
   </div>
	                   	                        
				
								
            <!--여기서 forEach시작 -->
			
				                                                         
      <!-- 테이블 -->
		<div class="form-group" style="margin:0 auto; width:80%; padding-top: 20px;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" style="background-color: #ffffff">
	              <td align="center" width="5%"><label>번호</label></td>
	              <td align="center" width="30%"><label>제목</label></td>
	              <td align="center" width="5%"><label>작성자</label></td>
	              <td align="center" width="10%"><label>입찰액</label></td>
	              <td align="center" width="5%"><label>경매종료일</label></td>              
	           </tr>
	           
	           <tr align="center">
	              <td align="center" style="color: #A6A6A6;">1</td>
	              <td align="center" style="color: #A6A6A6;">고양이 놀이터 판매합니다.</td>
	              <td align="center" style="color: #A6A6A6;">남기태</td>
	              <td align="center" style="color: #A6A6A6;">50,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-22</td>	             
	           </tr>          
	           <tr align="center">
	              <td align="center" style="color: #A6A6A6;">2</td>
	              <td align="center" style="color: #A6A6A6;">강아지 사료 필요하신분~~</td>
	              <td align="center" style="color: #A6A6A6;">장승훈</td>
	              <td align="center" style="color: #A6A6A6;">100,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-07</td>	             
	           </tr>          
	           <tr align="center">
	              <td align="center" style="color: #A6A6A6;">3</td>
	              <td align="center" style="color: #A6A6A6;">고양이 놀이터 판매합니다.</td>
	              <td align="center" style="color: #A6A6A6;">냥이사랑</td>
	              <td align="center" style="color: #A6A6A6;">50,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-22</td>	             
	           </tr>          
	           <tr align="center">
	              <td align="center" style="color: #A6A6A6;">4</td>
	              <td align="center" style="color: #A6A6A6;">고양이 놀이터 판매합니다.</td>
	              <td align="center" style="color: #A6A6A6;">냥이사랑</td>
	              <td align="center" style="color: #A6A6A6;">50,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-22</td>	             
	           </tr>          
	           <tr align="center">
	              <td align="center" style="color: #A6A6A6;">5</td>
	              <td align="center" style="color: #A6A6A6;">고양이 놀이터 판매합니다.</td>
	              <td align="center" style="color: #A6A6A6;">냥이사랑</td>
	              <td align="center" style="color: #A6A6A6;">50,000</td>	          
	              <td align="center" style="color: #A6A6A6;">2016-06-22</td>	             
	           </tr>          
	        </table> 
		</div>
   			<!-- 페이징처리 -->
		<div class="clear:both" align="center">	
			<ul class="pagination">
				  <li><a href="#" class="active">목록</a></li>
				  <li><a href="#">1</a></li>
				  <li><a href="#">...</a></li>
				  <li><a href="#">5</a></li>
			</ul>
     </div>
    
		