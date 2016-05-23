<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

function deletePreSale(preSaleNum) {
	if(confirm("분양 게시글을 삭제 하시겠습니까?")) {
		var url="<%=cp%>/adopt/delete?preSaleNum="+preSaleNum+"&page=${page}";
		location.href=url;
	}
}

</script>

<body>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">포토 갤러리</h2>
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

						<h3>게시글</h3>
	<!-- Reservation form -->
		<section id="reservation-form" class="reservation-color-form pos-middle resv-plus-meteo">
			<div class="container-form-chose">
			<div class="col-md-12">
			<div class="reservation-tabs command-tabs">
			
			<div class="row"><ul class="nav nav-tabs search-opt"></ul></div>
			</div>
			
			<div class="tab-content">
				<form class="tab-pane form-inline reservation-hotel active" method="post" name="boardForm" enctype="multipart/form-data">
				<!-- 제목, 내용 -->
				<div class="col-sm-4 fly-who">
				
				<div style="font-size: 14pt; color: orange;" >
			<%-- <h3 style="font-size: 14pt; text-align: left;">${dto.subject} &nbsp;| <font style="font-size: 10pt;">포토 갤러리</font>
			<font style="font-size:10pt;">${dto.created}</font> </h3>  --%>
			<span style="text-align: left; size: 14pt;">${dto.subject} &nbsp;| <font style="font-size: 10pt;">포토 갤러리</font></span>

			<font style="font-size:10pt; text-align: right;">${dto.created}</font>
			
			</div>
			
				<hr style="width: 100%;">
							
									
					<div class="form-group" style="margin:0 auto;" align="center">
					<img src="<%=cp%>/uploads/photo/${dto.saveFilename}"><br><br>
                    	<table style="width: 70%; margin: 0px auto; border-spacing: 0px; padding: 0px;">                    		
                    		
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>종별</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="subject" value="${dto.species}" style="text-align:center" readonly="readonly"></td>
                    		</tr>
                    		
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>제목</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="subject" value="${dto.subject}" style="text-align:center" readonly="readonly"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="10%"><label>내용</label></td>
                     			<td align="center" width="90%"><textarea rows="10" cols="34" class="form-control" name="content" style="text-align:center;" readonly="readonly">${dto.content}</textarea></td>
                    		</tr>                                     		           
                    	</table>                                     
                     </div>
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