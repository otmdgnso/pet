<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">


$(function(){
	
	
	
	checkTime();
	
});

//경매시간 체크
function checkTime(){
	var aucEnd = $("#aucEnd").val();
	var aucEnd = new Date(aucEnd);
	var nowTime = new Date();
	
	if(aucEnd < nowTime){
		alert('경매가 종료 되었습니다.');
		$("#bidInsertButton").attr("disabled","disabled");
		return false;
		
	}else {
		
		return true;
	}
		
}

function deleteAuction(auctionNum) {
	if(confirm("경매 게시글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/auction/delete?auctionNum="+auctionNum+"&page=${page}";
		location.href=url;
	}
}

//경매하기 버튼 클릭.
function checkBid(){
	
	if (!checkTime()){
		return;
	}
	
	var url="<%=cp%>/auction/insertBid"
	var bidPrice = $("#bidForm").val();
	var params="&bidPrice="+bidPrice+"&auctionNum=${dto.auctionNum}";
	
	
	//1. DB저장한다. (ajax)
	$.ajax({
		type:"POST",
		url:url,
		data:params,
		success:function(data) {
			
			
			if(bidPrice >= $("#buyPrice").val()){
				if(confirm("즉시구입하시겠습니까?")){
				}
				
				alert('즉시구입하셨습니다.');
				
			
				
				location.reload();
			}else{
				alert('입찰완료');
			}
			
			location.reload();
			
		},
		
		error:function(e) {
			alert("입찰에 실패하셨습니다");
		}
	});
	
}  


</script>


<body>
	<section class="top-we-are">
		<div class="container">
			<div class="row" style="margin: 0 auto; width: 80%;" align="center">
				<div class="col-md-12 effect-5 effects no-border-img"
					style="margin: 0 auto; width: 90%;" align="center">
					<div class="text-center top-txt-title" align="center">

						<!-- Reservation form -->
						<section id="reservation-form"
							class="reservation-color-form pos-middle resv-plus-meteo">
							<div class="container-form-chose">
								<div class="col-md-12">
									<div class="reservation-tabs command-tabs">

										<div class="row">
											<ul class="nav nav-tabs search-opt"></ul>
										</div>
									</div>

									<div class="tab-content">
										<form class="tab-pane form-inline reservation-hotel active"
											method="post" name="boardForm" enctype="multipart/form-data">
											<!-- 제목, 내용 -->
											<div class="col-sm-4 fly-who">

												<h3>경매</h3>

												<div class="form-group" style="margin: 0 auto;"
													align="center">
													<table
														style="width: 700px; margin: 0px auto; border-spacing: 0px; padding: 0px;">
														<tr height="40%">
															<td align="center" width="10%"><label>제목</label></td>
															<td align="center" width="90%"><input
																class="form-control" type="text" name="subject"
																value="${dto.subject}" style="text-align: center"
																readonly="readonly"></td>
														</tr>
														<tr align="center" height="40%">
															<td align="center" width="10%"><label>내용</label></td>
															<td align="center" width="90%"><textarea rows="10"
																	cols="34" class="form-control" name="content"
																	style="text-align: center;" readonly="readonly">${dto.content}</textarea></td>
														</tr>
													</table>
												</div>
											</div>
											<!-- 분양 정보 -->
											<div class="col-sm-4 step-check">

												<div class="col-sm-4 step-who" style="padding-left: 0">
													<div class="separator" style="width: 100%"></div>
													<h3>경매 정보</h3>
													<div class="col-sm-6 cc-in" style="padding-left: 0">
														<div class="form-group">
															<label for="checkin">종류</label>
															<div class="guests-select"
																style="margin: 0 auto; width: 60%" align="center"
																>
																<select name="species">
																	<option value="개">개</option>
																	<option value="고양이">고양이</option>
																</select>
															</div>
														</div>
													</div>
													<div class="col-sm-6 cc-out" style="padding-left: 0">
														<div class="form-group">
															<label for="checkin">카테고리명</label>
															<div class="guests-select"
																style="margin: 0 auto; width: 60%" align="center"
																>
																<select name="categoryName">
																	<option value="사료">사료</option>
																	<option value="미용">미용</option>
																	<option value="위생">위생</option>
																</select>
															</div>
														</div>
													</div>

												</div>
												<div class="form-group">
													<table
														style="width: 700px; margin: 0px auto; border-spacing: 0px; padding: 0px;">
														<tr height="40%">
															<td align="center" width="20%"><label>카테고리번호</label></td>
															<td align="center" width="80%"><input
																class="form-control" type="text" name="categoryNum"
																readonly="readonly" value="${dto.categoryNum}"
																style="text-align: center"></td>
														</tr>
														<tr height="40%">
															<td align="center" width="20%"><label>최소가격</label></td>
															<td align="center" width="80%"><input
																class="form-control" type="text" name="minPrice"
																readonly="readonly" value="${dto.minPrice}"
																style="text-align: center"></td>
														</tr>
														<tr height="40%">
															<td align="center" width="20%"><label>즉시구입가</label></td>
															<td align="center" width="80%"><input
																class="form-control" type="text" name="buyPrice" id="buyPrice"
																readonly="readonly" value="${dto.buyPrice}"
																style="text-align: center;"></td>
														</tr>
														<tr height="40%">
															<td align="center" width="20%"><label>경매 종료일</label></td>
															<td align="center" width="80%"><input id="aucEnd"
																class="form-control" type="text" name="aucEnd"
																readonly="readonly" value="${dto.aucEnd}"
																style="text-align: center;"></td>
														</tr>
														<tr height="40%">
															<td align="center" width="20%"><label>물건 수량</label></td>
															<td align="center" width="80%"><input
																class="form-control" type="text" name="amount"
																readonly="readonly" value="${dto.amount}"
																style="text-align: center;"></td>
														</tr>
														<tr height="40%">
															<td align="center" width="10%"><label>실시간 경매</label></td>
															<td align="center" width="10%"><label>경매입찰</label></td>
														</tr>
														<tr height="40%">
															<td align="center" width="10%">
															
																
																	<input id="bidForm" class="form-control" type="text" name="insertbidPrice"
																		value="${dto.bidPrice}" style="text-align: center">
																	<button id="bidInsertButton"   type="button" name="bidInsertButton" onclick="checkBid();"> 
																				입찰하기</button>
																
															</td>
															
															
															
															<td align="center" width="10%">
																<c:forEach var="bid" items="${listBid}" begin="0" end="4">
																	<c:if test="${bid.bidPrice == dto.buyPrice}">
																		<script>
																			$("#bidInsertButton").attr("disabled","disabled");
																			$("#bidInsertButton").text("입찰완료");
																		</script>
																	</c:if>
																	<label >${bid.bidPrice}를 입찰하셨습니다 </label><br>
																</c:forEach>
																
																<label>최종입찰가&nbsp;&nbsp;:&nbsp; ${listBid[0].bidPrice}원을입찰하셨습니다.</label>
															</td>
														</tr>
														<tr height="40%">
															<td align="center" width="10%"><label>
															경매종료일:</label></td>
															<td align="center" width="10%"><label>${dto.aucEnd }</label></td>
														</tr>
													</table>
												</div>


												<div class="col-sm-4 fly-who">
													<div class="separator" style="width: 100%"></div>
													<h3>물품 사진</h3>
													<c:forEach var="vo" items="${readAuctionFile}">
														<img src="<%=cp%>/uploads/auction/${vo.saveFilename}">
													</c:forEach>
												</div>

											</div>
											</form>
									</div>
								</div>

								<div class="col-sm-2 colbtn">
									<button type="button" class="btn btn-primary btn-block"
										style="float: left; width: 34%;"
										onclick="javacript:location.href='<%=cp%>/auction/list?page=${page}';">목록</button>
									<button type="button" class="btn btn-primary btn-block"
										style="float: right; width: 33%;"
										onclick="deleteAuction(${dto.auctionNum});">삭제</button>
									<button type="button" class="btn btn-primary btn-block"
										style="float: right; width: 33%;"
										onclick="javascript:location.href='<%=cp%>/auction/update?auctionNum=${dto.auctionNum}&page=${page}';">수정</button>
								</div>


							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>