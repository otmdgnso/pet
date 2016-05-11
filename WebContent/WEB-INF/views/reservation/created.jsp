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
			f.action="<%=cp%>/created";
		else if(mode=="update")
			f.action="<%=cp%>/update";
			
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
			<div class="row">
				<div class="col-md-12 effect-5 effects no-border-img">
					<div class="text-center top-txt-title">

						<!-- Reservation form -->
						<section id="reservation-form"
							class="reservation-color-form pos-middle resv-plus-meteo">
							<div class="container-form-chose">
								<div class="col-md-12">

									<div class="reservation-tabs command-tabs">
										<div id="message"></div>
										<div class="row"><ul class="nav nav-tabs search-opt"></ul></div>
									</div>
									
									<div class="tab-content">
										<form id="hotels-tab"
											class="tab-pane form-inline reservation-hotel active"
											method="post" name="reservationform"
											onsubmit="return check();">
											<div class="row">
												<div class="col-sm-4 step-check">
													<h3>날짜</h3>
													<div class="col-sm-6 cc-in" style="padding-left: 0">
														<div class="form-group">
															<label for="checkin">예약 시작일</label>
															<div class="popover-icon" data-container="body"
																data-toggle="popover" data-trigger="hover"
																data-placement="right" data-content="맡길 날짜를 선택하세요.">
																<i class="fa fa-info-circle fa-lg"> </i>
															</div>
															<div class="content-checkin-data">
																<i class="fa fa-calendar infield"></i> <input
																	name="checkin" type="text" id="checkin" value=""
																	class="form-control checkin" placeholder="Check-in" />
															</div>
														</div>
													</div>
													<div class="col-sm-6 cc-out" style="padding-left: 0">
														<div class="form-group">
															<label for="checkout">예약 종료일</label>
															<div class="popover-icon" data-container="body"
																data-toggle="popover" data-trigger="hover"
																data-placement="right" data-content="데려갈 날짜를 선택하세요.">
																<i class="fa fa-info-circle fa-lg"> </i>
															</div>
															<div class="content-checkin-data">
																<i class="fa fa-calendar infield"></i> <input
																	name="checkout" type="text" id="checkout" value=""
																	class="form-control checkout" placeholder="Check-out" />
															</div>
														</div>
													</div>
												</div>
												
												 <div class="col-sm-4 fly-who">
                                            <div class="col-sm-4 adultfly">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>Adults</label>
                                                  <!--<i class="fa fa-user infield"></i>-->
                                                  <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="+18 years"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                                      <select name="adults" id="Select2" class="form-control">
                                                        <option disabled="disabled" selected="selected">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                      </select>
                  
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col-sm-4 child md-ch">
                                              <div class="form-group">
                                                <div class="guests-select">
                                                  <label>Kids</label>
                                                  <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="0 till 18 years"> <i class="fa fa-info-circle fa-lg"> </i> </div>
                                                      <select name="children" id="Select3" class="form-control">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                      </select>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col-sm-4 child">
                                              <div class="form-group">																
												<label for="room">기간</label>
												<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="선택하신 기간입니다.">
													<i class="fa fa-info-circle fa-lg"> </i>
												</div>
												<input type="text" class="form-control" readonly="readonly" id="period" name="period"></input>
											  </div>
											</div>
                                        </div>
									</div>
													<div class="col-sm-4 step-check">
													<div class="col-sm-4 step-who" style="padding-left: 0">
														<h3>펫</h3>
														
													<div class="col-sm-4 adult-book">
														<div class="form-group">
														<div class="text-center">
															<div class="guests-select">
																<label>맡길 펫 수</label>
																<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="5마리 이상일 경우 5 이상을 선택하세요.">
																	<i class="fa fa-info-circle fa-lg"> </i>
																</div>
																<select name="petcount" id="petcount" class="form-control">
																	<option disabled="disabled" selected="selected">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="3">4</option>
																	<option value="3">5 이상</option>
																</select>

															</div>
														</div>
														</div>
													</div>
													</div>
													<div class="col-sm-4 step-who" style="padding-left: 0">
														<h3>가격</h3>
													<div class="col-sm-4 child">
														<div class="form-group">
															<div class="guests-select">
																<label>가격</label>
																<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="선택 기간과 펫 수에 따른 가격입니다.">
																	<i class="fa fa-info-circle fa-lg"> </i>
																</div>
																<input type="text" class="form-control" readonly="readonly" id="period" name="period"></input>
															</div>
														</div>
													</div>
												</div>

												<div class="col-sm-2 step-where">
													<div class="form-group">
														<label for="destination1">메시지</label>
														<div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="호스트에게 남길 메시지를 입력하세요.">
															<i class="fa fa-info-circle fa-lg"> </i>
														</div>
														<input type="text" class="form-control" placeholder="메시지를 남기세요." id="destination1" name="destination" />
													</div>
												</div>

												<div class="col-sm-2 colbtn">
													<button type="submit" class="btn btn-primary btn-block">예약하기</button>
												</div>
											</div>
										</form>

									</div>
									<!--Close tab-content form-->
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>