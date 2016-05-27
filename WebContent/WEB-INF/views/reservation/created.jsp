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
	function check() {
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
		
		var mode="${mode}";
		var page="${page}";
		if(mode=="created")
			f.action="<%=cp%>/reservation/created";
		else if(mode=="update")
			f.action="<%=cp%>/reservation/update?page="+page;
			
		return true;
	}
	
	$(function(){
		$("#pet_su").change(function() {
			var cost = $("#cost").val().trim().split("/");
			var pet_su = $("#pet_su").val().trim().split("/");
			var tax= cost*pet_su*0.1;
			var total= tax+cost*1;
			return $("#tax").val(tax), $("#total").val(total);
		});
		
		$("#checkin").change(function() {
			
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

			return $("#period").val(betweenDay+s);
			
		});
		
		$("#checkout").change(function() {
			
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

			return $("#period").val(betweenDay+s);
			
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
				<form id="hotels-tab" class="tab-pane form-inline reservation-hotel active" method="post" name="reservationform" onsubmit="return check();">
				<div class="row">
					
					<!-- 날짜 -->
					<div class="col-sm-4 step-check">
						<h3>날짜</h3>
					<div class="col-sm-6 cc-in" style="padding-left: 0">
					<div class="form-group">
						<label for="checkin">예약 시작일</label>
					<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="맡길 날짜를 선택하세요.">
						<i class="fa fa-info-circle fa-lg"></i>
					</div>
					<div class="content-checkin-data" style="margin:0 auto; width:60%" align="center">
						<i class="fa fa-calendar infield"></i><input name="checkIn" type="text" id="checkin" value="2000/01/01" style="margin:0 auto; width:100%;" class="form-control checkin" placeholder="ex: 2000/01/01" />
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
						<i class="fa fa-calendar infield"></i> <input name="checkOut" type="text" id="checkout" value="2000/01/01" style="margin:0 auto; width:100%;" class="form-control checkout" placeholder="ex: 2000/01/01" />
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
						<h3>펫 정보</h3>											
					<div class="col-sm-6 cc-in" style="padding-left: 0">			
					<div class="form-group">
						<label for="checkin">펫 종류</label>
					<div class="guests-select" style="margin:0 auto; width:60%" align="center">
						
						<select name="pet_type" id="pet_type" class="form-control">
							<c:if test="${mode=='created'}">
								<option value="" disabled="disabled" selected="selected">선택</option>
							</c:if>
							<c:if test="${mode=='update'}">
								<option value="${dto.pet_type}" disabled="disabled" selected="selected">${dto.pet_type}</option>
							</c:if>
								<option value="강아지">강아지</option>
								<option value="고양이">고양이</option>
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
							</c:if>
							<c:if test="${mode=='update'}">
								<option value="${dto.pet_su}" disabled="disabled" selected="selected">${dto.pet_su}</option>
							</c:if>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
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
                    			<td align="center" width="30%"><label>서비스 수수료</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="tax" id="tax" value="${tax}" style="text-align:center;" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>총합계</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" name="total" id="total" value="${total}" style="text-align:center" readonly="readonly"></td>
                    		</tr>                                       		           
                    	</table>                                     
                     </div>
                     </div>
                     
				<input type="hidden" name="num" value="${dto.num}">
                <input type="hidden" name="hostNum" value="${dto.hostNum}">
                <input type="hidden" name="totalCost" value="${dto.totalCost}">
				
				<div class="col-sm-2 colbtn">
				<c:if test="${mode=='created'}">		
					<button type="submit" class="btn btn-primary btn-block" style="float: left; width: 50%;">예약하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/member/blog#tab-3';">취소</button>
				</c:if>
				<c:if test="${mode=='update'}">
					<button type="submit" class="btn btn-primary btn-block" style="float: left; width: 50%;">수정하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/member/blog#tab-3';">취소</button>		
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