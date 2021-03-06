<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function updateReserve(){
		
		var url="<%=cp%>/reservation/ajaxUpdate";
		var data="reservationNum="+$("#reservationNum").val();
		data += "&totalCost="+$("#totalCost").val();
		data += "&hostNum="+$("#hostNum").val();
		data += "&num="+$("#num").val();
		data += "&pet_su="+$("#pet_su").val();
		data += "&checkOut="+$("#checkout").val();
		data += "&checkIn="+$("#checkin").val();
		data += "&pet_type="+$("#pet_type").val();
		data += "&tax="+$("#tax").val();
		data += "&tax1="+$("#tax1").val();
		
		$.ajax({
			
			url:url,
			data:data,
			type:"POST",
			success:function(data){
				alert('수정완료');
				window.location.href="<%=cp%>/member/blog#tab-2";				
			},
			error:function(e){
				//alert("에러");
			}
		});
	}

	function check() {
		var mode="${mode}";
		if(mode=="created") {
			var f=document.reservationform;
			
			var str=f.checkin.value;
			if(!str) {
				alert("예약 시작일을 선택하세요.");
				return false;
			}
			
			str=f.checkout.value;
			if(!str) {
				alert("예약 종료일을 선택하세요.");
				return false;
			}
			
			str=f.pet_type.value;
			if(!str) {
				alert("펫 종류를 선택하세요.");
				return false;
			}
			
			str=f.pet_su.value;
			if(!str) {
				alert("펫 수를 선택하세요.");
				return false;
			}
		}
		if(mode=="created") {
			f.action="<%=cp%>/reservation/created";
			alert("예약 신청이 완료되었습니다.");
		} else if(mode=="update")
			f.action="<%=cp%>/reservation/update";

		f.submit();
	}
	
$(function(){	
	var total=0;
	var cost=$("#cost").val().trim();
	var pet_su=0;
	var tax=0;
	var tax1=0;
	
	$("#checkin").change(function() {
		var date= $('#checkin').val();
		var y=date.substring(6,10);
		var m=date.substring(3,5);
		var d=date.substring(0,2);
		var df=y+"/"+m+"/"+d;
		$('#checkin').val(df);
		
		var s="박";
		
		var cinArray = $("#checkin").val().trim().split("/");
		var cinObj =  new Date(cinArray[0], Number(cinArray[1])-1, cinArray[2]); 
		
		var coutArray = $("#checkout").val().trim().split("/");
		var coutObj = new Date(coutArray[0], Number(coutArray[1])-1, coutArray[2]); 

		if(cinArray=="") {
			$("#period").val("예약 시작일을 입력하세요.");
			return;
		}
		
		if(coutArray=="") {
			$("#period").val("예약 종료일을 입력하세요.");
			return;
		}
		
		var betweenDay = (coutObj.getTime() - cinObj.getTime())/1000/60/60/24;

		/* return $("#period").val(betweenDay+s); */
		
	});
	
	$("#checkout").change(function() {
		var date= $('#checkout').val();
		var y=date.substring(6,10);
		var m=date.substring(3,5);
		var d=date.substring(0,2);
		var df=y+"/"+m+"/"+d;
		$('#checkout').val(df);
		
		var s="박";
		
		var cinArray = $("#checkin").val().trim().split("/");
		var cinObj =  new Date(cinArray[0], Number(cinArray[1])-1, cinArray[2]); 
		
		var coutArray = $("#checkout").val().trim().split("/");
		var coutObj = new Date(coutArray[0], Number(coutArray[1])-1, coutArray[2]); 

		if(cinArray=="") {
			$("#period").val("예약 시작일을 입력하세요.");
			return;
		}
		
		if(coutArray=="") {
			$("#period").val("예약 종료일을 입력하세요.");
			return;
		}
		
		
		var betweenDay = (coutObj.getTime() - cinObj.getTime())/1000/60/60/24;			
		
		if(betweenDay==0 || betweenDay==1){
			tax1=cost*0;
		}else if(betweenDay==2){
			tax1=cost*1;
		}else if(betweenDay==3){
			tax1=cost*2;
		}else if(betweenDay==4){
			tax1=cost*3;
		}else if(betweenDay==5){
			tax1=cost*4;
		}else if(betweenDay==6){
			tax1=cost*5;
		}else if(betweenDay==7){
			tax1=cost*6;
		}else if(betweenDay==8){
			tax1=cost*7;
		}else if(betweenDay==9){
			tax1=cost*8;
		}
		$("#tax1").val(tax1);
		total= tax+tax1+cost*1;
		var fees=tax+tax1;
		$("#fees").val(fees);
		$("#total").val(total);
		return $("#period").val(betweenDay+s);
		
	});
	
		$("#pet_su").change(function() {
		    pet_su = $("#pet_su").val().trim();
		    if(pet_su==1){
		    	tax=0;
			}else if(pet_su==2){
				tax=5000;
			}else if(pet_su==3){
				tax=10000;
			}else if(pet_su==4){
				tax=15000;
			}else if(pet_su==5){
				tax=20000;
			}
			
			/* var total= tax+tax1+cost*1; */
			//return $("#tax").val(tax), $("#total").val(total), $("#totalCost").val(total);
			
			$("#tax").val(tax);
			/* $("#total").val(total);
			$("#totalCost").val(total); */
			total= tax+tax1+cost*1;
			var fees=tax+tax1;
			$("#fees").val(fees);
			$("#total").val(total);
			$("#totalCost").val(total);
			return;
			
		});		
	});
</script>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">예약</h2>
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

	<!-- Reservation form -->
		<section id="reservation-form" class="reservation-color-form pos-middle resv-plus-meteo">
			<div class="container-form-chose">
			<div class="col-md-12">
			<div class="reservation-tabs command-tabs">
			
			<div class="row"><ul class="nav nav-tabs search-opt"></ul></div>
			</div>
			
			<div class="tab-content">
				<form id="hotels-tab" class="tab-pane form-inline reservation-hotel active" method="post" name="reservationform">
				<div class="row">
					
					<!-- 날짜 -->
					<div class="col-sm-4 step-check">
					
						<div class="form-group">
							<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="2박부터 추가요금 발생">
							<span style="font-size:15pt; color: orange;">날짜</span> <i class="fa fa-info-circle fa-lg"></i>
							</div>
						</div>
					<div class="col-sm-6 cc-in" style="padding-left: 0">
					<div class="form-group">
						<label for="checkin">예약 시작일</label>
					<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="맡길 날짜를 선택하세요.">
						<i class="fa fa-info-circle fa-lg"></i>
					</div>
					<div class="content-checkin-data" style="margin:0 auto; width:60%" align="center">
						<i class="fa fa-calendar infield"></i><input name="checkIn" type="text" id="checkin" value="${dto.checkIn}" style="margin:0 auto; width:100%;" class="form-control checkin" placeholder="ex: 2000/01/01" />
					</div>
					</div>
					</div>
					<div class="col-sm-6 cc-out" style="padding-left: 0">
					<div class="form-group">
						<label for="checkout">예약 종료일</label>
					<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="데려갈 날짜를 선택하세요.">
						<i class="fa fa-info-circle fa-lg"> </i>
					</div>
					<div class="content-checkin-data" style="margin:0 auto; width:60%" align="center">
						<i class="fa fa-calendar infield"></i> <input name="checkOut" type="text" id="checkout" value="${dto.checkOut}" style="margin:0 auto; width:100%;" class="form-control checkout" placeholder="ex: 2000/01/01" />
					</div>
					</div>
					</div>
					</div>
					
					<!-- 몇박 -->				
					<c:if test="${mode=='created'}">
					<div class="form-group" style="margin:0 auto; width:60%;" align="center">		               															
						<input type="text" readonly="readonly" id="period" name="period" value="" style="color:#8C8C8C; border: 0px; text-align:center"/>
					</div>
					</c:if>
					
					<c:if test="${mode=='update'}">
					<div class="form-group" style="margin:0 auto; width:60%;" align="center">		               															
						<input type="text" readonly="readonly" id="period" name="period" value="${dto.check_day}박" style="color:#8C8C8C; border: 0px; text-align:center"/>
					</div>
					</c:if>
				</div>
				
					<div class="separator" style="width:100%"></div>

				<!-- 펫 종류 -->
				<div class="col-sm-4 step-check">				
					<div class="col-sm-4 step-who" style="padding-left: 0">
						
						<div class="form-group">
							<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="2마리 이상부터 마리당 5천원씩 추가요금이 발생합니다.">
							<span style="font-size:15pt; color: orange;">펫 정보</span> <i class="fa fa-info-circle fa-lg"></i>
							</div>
						</div>
										
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">펫 종류</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						
						<select name="pet_type" id="pet_type" class="form-control">
							<c:if test="${mode=='created'}">
								<option value="" disabled="disabled" selected="selected">선택</option>
								<option value="dog">강아지</option>
								<option value="cat">고양이</option>
							</c:if>
							<c:if test="${mode=='update'}">
								<option value="dog" <c:if test="${dto.pet_type=='dog'}"> selected="selected" </c:if> > 강아지</option>
								<option value="cat" <c:if test="${dto.pet_type=='cat'}"> selected="selected" </c:if> >고양이</option>
							</c:if>							
						</select>						
					</div>
					</div>
					</div>
	
				
				<!-- 펫수 -->			
					<div class="col-sm-6 cc-out" style="padding-left: 0">											
					<div class="form-group">
						<label for="checkin">맡길 펫 수</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						<select name="pet_su" id="pet_su" class="form-control">
							<c:if test="${mode=='created'}">
								<option value="" disabled="disabled" selected="selected">선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</c:if>
							<c:if test="${mode=='update'}">						
								<option value="1" <c:if test="${dto.pet_su=='1'}"> selected="selected" </c:if> >1</option>
								<option value="2" <c:if test="${dto.pet_su=='2'}"> selected="selected" </c:if> >2</option>
								<option value="3" <c:if test="${dto.pet_su=='3'}"> selected="selected" </c:if> >3</option>
								<option value="4" <c:if test="${dto.pet_su=='4'}"> selected="selected" </c:if> >4</option>
								<option value="5" <c:if test="${dto.pet_su=='5'}"> selected="selected" </c:if> >5</option>
								</c:if>
						</select>
					</div>
					</div>
					</div>
				</div>	
				</div>
                    		
				<!-- 가격 -->					
				<div class="col-sm-4 fly-who">
					<div class="separator" style="width:100%"></div>
						<h3>가격</h3>
						
					<div class="form-group" style="margin:0 auto; width:50%" align="center">
                    	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>기본료</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="cost" id="cost" value="${dto.cost}" style="text-align:center" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>숙박 추가요금</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="tax1" id="tax1" value="${dto.tax1}" style="text-align:center;" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>펫 추가요금</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="tax" id="tax" value="${dto.tax}" style="text-align:center;" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>총합계</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="total" id="total" value="${dto.totalCost}" style="text-align:center" readonly="readonly"></td>
                    		</tr>                    	                                      		           
                    	</table>                                     
                     </div>
                     </div>
                 <input type="hidden" name="fees" id="fees" value="${dto.fees}">    
				<input type="hidden" name="num" id="num" value="${dto.num}">
                <input type="hidden" name="hostNum" id="hostNum" value="${dto.hostNum}">
                <input type="hidden" name="totalCost" id="totalCost" value="${dto.totalCost}">
                <c:if test="${mode=='update'}">
                <input type="hidden" name="reservationNum" id="reservationNum" value="${dto.reservationNum}">
	             	<%-- <c:if test="${dto.pet_type==''}"><input type="hidden" name="pet_type" id="pet_type" value="${dto.pet_type}"></c:if>
	          	 	<c:if test="${dto.pet_su==''}"> <input type="hidden" name="pet_su" id="pet_su" value="${dto.pet_su}"></c:if> --%>
				</c:if>
				
				<div class="col-sm-2 colbtn">
				<c:if test="${mode=='created'}">		
					<button type="button" class="btn btn-primary btn-block" style="float: left; width: 50%;" onclick="check();">예약하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/house/list';">취소</button>
				</c:if>
				<c:if test="${mode=='update'}">
					<button type="button" class="btn btn-primary btn-block" style="float: left;  width: 50%;" onclick="updateReserve();" >수정하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float:right; width: 50%;" onclick="javascript:location.href='<%=cp%>/member/blog#tab-2';">취소</button>	
				</c:if>
				</div>
				</form>
				</div>
				<!--Close tab-content form-->
				</div>
				</div>
		</section>
	<!-- Reservation form -->							
	</div>
	</div>
	</div>
	</div>
</section>
</body>
</html>