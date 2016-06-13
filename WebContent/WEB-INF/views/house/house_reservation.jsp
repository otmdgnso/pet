<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
function deleteReserve(reservationNum){
	var url="<%=cp%>/house/deleteReserve?reservationNum="+reservationNum;
	
	if(confirm("거절 하시겠습니까?")){
		location.href=url;
	}	
}

function updateReserve(reservationNum,hostNum){
	 var url="<%=cp%>/house/updateReserve?reservationNum="+reservationNum+"&hostNum="+hostNum; 
<%-- 	var url="<%=cp%>/house/updateReserve";
	var params="reservationNum="+reservationNum+"&hostNum="+hostNum; --%>
	if(confirm("수락 하시겠습니까?")){
		location.href=url;
		<%-- $.ajax({
			url:url
			,data:params
			,dataType:"json"
			,type:"post"
			,success:function(){
				location.href="<%=cp%>/house/house_reservation?hostNum="+hostNum;
			}
		}); --%>
	}
}
</script>
<section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">예약 관리</h2>
                </div>
             </div>
          </div>
      </div>
</section>

<section class="top-we-are" style="height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="cbp-vm-switcher cbp-vm-view-list">
	<div class="separator" style="width:100%;"></div>       
		<h3>예약 받은 리스트  ${count}건</h3>
	<div class="separator" style="width:100%"></div> 
		<div class="form-group" style="margin:0 auto; width:100%;" align="center">
			<table style="width: 80%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%"><label>번호</label></td>
	              <td align="center" width="10%"><label>신청자</label></td>
	              <td align="center" width="10%"><label>종류</label></td>
	              <td align="center" width="10%"><label>신청 수</label></td>	              
	              <td align="center" width="10%"><label>총 금액</label></td>
	              <td align="center" width="20%"><label>날짜</label></td>              
	              <td align="center" width="10%"></td>
	           </tr>
	       <c:forEach var="dto" items="${list}" varStatus="status">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%" style="color: #A6A6A6;">${status.count}</td>
	              <td align="center" width="10%" style="color: #A6A6A6;">${dto.userName}</td>
	              <td align="center" width="10%" style="color: #A6A6A6;">${dto.pet_type}</td>
	              <td align="center" width="10%" style="color: #A6A6A6;">${dto.pet_su}</td>	
	              <td align="center" width="10%" style="color: #A6A6A6;">${dto.totalCost}</td>	          
	              <td align="center" width="20%" style="color: #A6A6A6;">${dto.checkIn}~${dto.checkOut}</td>
	      <c:if test="${dto.accept=='wait'}">
	      	      <td align="center" width="10%" style="color: #A6A6A6;"><a style="cursor: pointer;" onclick="updateReserve(${dto.reservationNum},${dto.hostNum});">수락</a> | 
	              <a style="cursor: pointer;" onclick="deleteReserve(${dto.reservationNum});">거절</a></td>
	      </c:if>  
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
