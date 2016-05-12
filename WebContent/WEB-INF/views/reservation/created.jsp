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
		if(mpde=="created")
			f.action="<%=cp%>/reservation/created";
		else if(mode=="update")
			f.action="<%=cp%>/reservation/update";
			
		return true;
	}
</script>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">예약하기</h2>
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
			<div id="message"></div>
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
						<i class="fa fa-calendar infield"></i><input name="checkin" type="text" id="checkin" value="${dto.checkIn}" style="margin:0 auto; width:100%;" class="form-control checkin" placeholder="Check-in" />
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
						<i class="fa fa-calendar infield"></i> <input name="checkout" type="text" id="checkout" value="${dto.checkOut}" style="margin:0 auto; width:100%;" class="form-control checkout" placeholder="Check-out" />
					</div>
					</div>
					</div>
					</div>
					
					<!-- checkIn, checkOut이 선택될 경우 -->
					<div class="form-group" style="margin:0 auto; width:60%" align="center">		               															
						<!-- 몇박 --><input type="text" readonly="readonly" id="period" name="period" value="(${dto.checkIn}-${dto.checkOut})박" style="color:#8C8C8C; border: 0px; text-align:center"/>
					</div>
				</div>


				
				<!-- 펫수 -->
				<div class="col-sm-4 step-check">				
					<div class="separator" style="width:100%"></div>
					<div class="col-sm-4 step-who" style="padding-left: 0">
						<h3>맡길 펫 수</h3>											
					<div class="col-sm-4 step-check">				
					<div class="form-group" >
					<div class="guests-select" style="margin:0 auto; width:25%" align="center">
						<select name="petcount" id="petcount" class="form-control">
							<option value="1" disabled="disabled" selected="selected">1</option>
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
						
					<div class="form-group" style="margin:0 auto; width:40%" align="center">
                    	<table style="width: 400px; margin: 0px auto; border-spacing: 0px;">
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>기본료</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" id="price1" value="300,000원" style="text-align:center"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>서비스 수수료</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" id="price2" value="30,000원" style="text-align:center"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="30%"><label>총합계</label></td>
                     			<td align="center" width="70%"><input class="form-control" type="text" id="price3" value="330,000원" style="text-align:center"></td>
                    	</table>                                     
                     </div>
                     </div>
                     
				<div class="col-sm-2 colbtn">
					<button type="submit" class="btn btn-primary btn-block">예약하기</button>
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