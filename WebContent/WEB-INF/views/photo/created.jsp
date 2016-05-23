<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
/* $(function(){
	var mode="${mode}";
	if(mode=="login"){
		openLoginModal();
	}
		
}); */

function photoCheck() {
	var f=document.photoForm;
	
	var str= f.species.value;
	if(!str) {
		f.species.focus();
		return false;
	}
	
	var str= f.subject.value;
	if(!str) {
		f.subject.focus();
		return false;
	}
	
	var str= f.content.value;
	if(!str) {
		f.content.focus();
		return false;
	}		
	
	var str=f.upload.value;
	if(!str){
		return false;
	}
	
	var mode="${mode}";
	
	if(mode=="created")
		f.action="<%=cp%>/photo/created";
	else if(mode=="update")
		f.action="<%=cp%>/photo/update";
	
	f.submit();
}

<c:if test="${mode=='update'}">
function deleteFile(saveFilename, photoNum) {
	if(confirm("사진을 삭제 하시겠습니까?")) {
	    var url="<%=cp%>/adopt/deleteFile";
	    $.post(url, {saveFilename:saveFilename}, function(data){
		    $("#fileview"+photoNum).remove();
	     }, "JSON");
	}
}
</c:if>
</script>

<body>

<section class="about-section-top">
	<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="page-title pull-left">
		<h2 class="title-about">분양 등록</h2>
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
				<form class="tab-pane form-inline reservation-hotel active" method="post" name="photoForm" enctype="multipart/form-data">
				<!-- 제목, 내용 -->
				<div class="col-sm-4 fly-who">
					
						<h3>게시글</h3>
						
					<div class="form-group" style="margin:0 auto;" align="center">
                    	<table style="width: 700px; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                    	
                    	<tr height="40%">
                    			<td align="center" width="10%"><label>종별</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="species" value="${dto.species}" style="text-align:center"></td>
                    		</tr>
                    		
                    		<tr height="40%">
                    			<td align="center" width="10%"><label>제목</label></td>
                     			<td align="center" width="90%"><input class="form-control" type="text" name="subject" value="${dto.subject}" style="text-align:center"></td>
                    		</tr>
                    		<tr align="center" height="40%">
                    			<td align="center" width="10%"><label>내용</label></td>
                     			<td align="center" width="90%"><textarea rows="10" cols="34" class="form-control" name="content" style="text-align:center;">${dto.content}</textarea></td>
                    		</tr>       
                    		
                    		<tr align="center" height="40%">
                    			<td align="center" width="10%"><label>이미지</label></td>
                     			<td align="left" width="90%"><input type="file" name="upload"></td>                     			
                    		</tr> 
                    		
                    		
           	<c:if test="${mode=='update'}"> 
						 <tr>
                            <td class="td1">등록이미지</td>
                            <td colspan="3" class="td3">
                                <img src="<%=cp%>/uploads/photo/${dto.saveFilename}"
				                 width="30" height="30" border="0"
				                 onclick="imageViewer('<%=cp%>/uploads/photo/${dto.saveFilename}');"
				                 style="cursor: pointer;">
                            </td>
                        </tr>
			</c:if>		
                    		                               		           
                    	</table>                             
                     </div>
                     </div>			
			
				<c:if test="${mode=='created'}">
				<div class="col-sm-2 colbtn">
					<button type="button" class="btn btn-primary btn-block" onclick="photoCheck();">등록하기</button>
				</div>
				</c:if>
				
				<c:if test="${mode=='update'}">
				<div class="col-sm-2 colbtn">
					<button type="button" class="btn btn-primary btn-block" style="float: left; width: 50%;" onclick="check();">수정하기</button>
					<button type="button" class="btn btn-primary btn-block" style="float: right; width: 50%;" onclick="javascript:location.href='<%=cp%>/adopt/list';">취소</button>
					<input type="hidden" name="preSaleNum" value="${dto.preSaleNum}">
					<input type="hidden" name="page" value="${page}">		
				</div>
				</c:if>
				
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