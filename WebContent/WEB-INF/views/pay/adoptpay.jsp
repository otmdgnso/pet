<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function adoptPay() {
	var f=document.adoptPayForm;
	
	var name= f.name.value;
	if (!name) {
		f.name.focus();
		return false;
	}
	
	f.action="<%=cp%>/pay/paycomplete";
	f.submit();
}

$(function(){
	var price=${dto.price};
	var deposit=${dto.deposit};
	var amount=price+deposit;
	$("#amount").html(amount);
})
</script>

<body>
<form name="adoptPayForm">
<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">결제</h2>
	</div>
	</div>
	</div>
	</div>
</section>


<section id="top-list-trip">
<div class="container">
<div class="row">  
<div class="col-md-12 details-hotel" style="width: 80%; min-height: 350px; padding: 20px; background: none;">              

<!-- 주문정보 -->			
<div class="col-sm-4 fly-who" style="width: 30%;  background: white;">
<div class="tab-content">	
	<!-- 집사진 -->
	<div class="main-details bx-about2 noowlf">
	<div id="bigimg" style="display:none; position: absolute;left:100px;top:100px; overflow:hidden; border: 0px solid; #ff6600;" align="center"></div>
		<div id="bx-pager">
			<c:forEach var="dto" items="${readFile}" begin="0" varStatus="status">
				<a data-slide-index="${status.index}" href=""><img style="width: 150px; height: 105px;" src="<%=cp%>/uploads/house/${dto.saveFilename}"></a>
			</c:forEach>
			<!-- 임시 사진 --><img src="<%=cp%>/res/image/catdog.JPG">
		</div>
	</div>
        
    <!-- 호스트정보 -->           
    <div>
	    <div style="width: 100%; height: 100px;">
	    			<table style="width: 100%; 	margin: 0px auto; border-spacing: 10px;">
	                	<tr>				
							<td align="center" width="30%"><h3 style="color: black">제목 : ${dto.subject}</h3></td>
						</tr>
						<tr>
							<td align="center" width="30%" style="color: #8C8C8C;">판매자 아이디 : ${dto.userId}</td>
						</tr>
					</table>				
		</div>
	</div>
	
	<!-- 예약 정보 -->
	<span style="color: black;"></span>
	<div class="form-group" style="margin:0 auto; width:100%" align="center">
                    	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
                    		<tr>
                    			<td align="center" width="50%"><label>기본료</label></td>
                     			<td align="center" width="50%"><label>${dto.price}</label></td>
                    		</tr>
                    		<tr>
                    			<td align="center" width="50%"><label>보증금</label></td>
                     			<td align="center" width="50%"><label>${dto.deposit}</label></td>
                    		</tr>                                       		           
                    	</table>                                     
     </div>
	<div class="separator" style="width:100%"></div>
	<div class="form-group" style="margin:0 auto; width:100%" align="center">
                    	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
                    		<tr>
								<td align="center" width="50%"><h3 style="color: black">합계</h3></td>
								<td align="center" width="50%" id="amount"><h3 style="color: black"></h3></td>
							</tr>
						</table>
	</div>
	</div>
	</div>	
				
	<!-- 결제 -->		
	<div class="col-sm-4 fly-who" style="width: 70%" align="center">
	<h3>결제</h3>
	<div class="separator" style="width:70%"></div>
	<div class="tab-content">
	<div class="form-group">
	<label for="checkin">결제 방법</label>
		<div class="guests-select" style="margin:0 auto; width:30%" align="center">
						<select name="pet_su" id="pet_su" class="form-control">
								<option value="" selected="selected">신용/체크카드</option>
								<option value="1">무통장입금</option>
						</select>
		</div>
	</div>
															
	<div class="form-group">
		<label for="checkin">카드 종류</label>
					<div class="guests-select" style="margin:0 auto; width:30%" align="center">
						<select name="pet_su" id="pet_su" class="form-control">
								<option value="" selected="selected">비씨카드</option>
								<option value="1">삼성카드</option>
								<option value="1">신한카드</option>
								<option value="1">하나카드</option>
								<option value="1">국민카드</option>
						</select>
					</div>
	</div>
	</div>		
	
	<!-- 결제정보 -->					
	<div>				
	<div class="form-group" style="margin:0 auto; width:30%" align="center">
    <label>이름</label>
    <input class="form-control" type="text" name="name" id="cost" value="" style="text-align:center">                                   
    </div>
    </div>
                     
    <!-- 안내 -->  
    <div class="separator" style="width:70%"></div>
    <div align="center">
    	<button type="button" class="btn btn-primary btn-block" style="width: 30%" onclick="adoptPay();">결제하기</button>
    	<label>결제하기를 클릭하시면 회원님의 결제 수단으로 요금이 부과됩니다.</label>
    </div>	  
    
</div>   
</div>
</div>
</div>
</section>
</form>
</body>
</html>