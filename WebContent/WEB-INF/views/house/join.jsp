<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

	<%-- <link href="<%=cp%>/res/assets/css/bootstrap.min.css" rel="stylesheet" /> --%>
	<link href="<%=cp%>/res/assets/css/gsdk-base.css" rel="stylesheet" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">


<script type="text/javascript">
jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + 
                                                $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    return this;
}

function listCategory2(){
	var category1 = $("#category1").val();
	if(category1==""){
		$("#category2 option").each(function(){
			$("#category2 option:eq(0)").remove();
		});
		
		$("#category2").append("<option value=''>- 시·군·구 -</option>");
		return false;
	}
	var url = "<%=cp%>/house/listCategory2";
	var params = "category1="+category1;
	
	$.ajax({
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(data){
			$("#category2 option").each(function(){
				$("#category2 option:eq(0)").remove();
			});
			$("#category2").append("<option value=''>- 시·군·구 -</option>");
			 
			 for(var idx=0; idx<data.list.length; idx++) {
				 $("#category2").append("<option value='"+data.list[idx].category2+"'>"+data.list[idx].category2+"</option>");
			 }
		},
	    error:function(e) {
	    	alert(e.responseText);
	    }
	});
}

$(function(){
	$("#category1").change(function(){
		var category1 = $("#category1").val();
		if(category1==""){
			$("#category2 option").each(function(){
				$("#category2 option:eq(0)").remove();
			});
			
			$("#category2").append("<option value=''>- 시·군·구 -</option>");
			return false;
		}
		
		var url = "<%=cp%>/house/listCategory2";
		var params = "category1="+category1;
		
		$.ajax({
			type:"post",
			url:url,
			data:params,
			dataType:"json",
			success:function(data){
				$("#category2 option").each(function(){
					$("#category2 option:eq(0)").remove();
				});
				$("#category2").append("<option value=''>- 시·군·구 -</option>");
				 
				 for(var idx=0; idx<data.list.length; idx++) {
					 $("#category2").append("<option value='"+data.list[idx].category2+"'>"+data.list[idx].category2+"</option>");
				 }
			},
		    error:function(e) {
		    	alert(e.responseText);
		    }
		});
	});
	
	$(document)
    .ajaxStart(function(){ // AJAX 시작시
    	 $("#loading").center(); // 이미지를 화면 중앙에
    	 $("#loadingLayout1").fadeTo("slow",0.5); // 불투명으로
    	 // $("#loadingLayout1").show();
   })
   .ajaxComplete(function(){ // AJAX 종료시
        $("#loadingLayout1").hide();
   });	
});

$(function(){
	$("body").on("click", "button[name='plus']", function(){
		
		var s="";
		s+="<input type='file' name='upload' class='form-control input-sm'>";
		
		$("#tbFile").append(s);
	});
});

function checkHouseJoin() {
	alert("a");
  	var f=document.houseJoinForm;  	
  	/*var str= f.subject.value;
	if(!str) {
		f.subject.focus();
		return false;
	}
	
	var str= f.content.value;
	if(!str) {
		f.content.focus();
		return false;
	}
	
	var str= f.type.value;
	if(!str) {
		f.type.focus();
		return false;
	}
	
	var str= f.month.value;
	if(!str) {
		f.month.focus();
		return false;
	}
	
	var str= f.price.value;
	if(!str) {
		f.price.focus();
		return false;
	}
	
	var str= f.deposit.value;
	if(!str) {
		f.deposit.focus();
		return false;
	}
	
	if(f.upload.value!="") {
		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 가능합니다. !!!');
			return false;
		}
	}
	 */
	 
	 f.action="<%=cp%>/house/join";
	f.submit();
}


</script>

<div id="loadingLayout1" style="display: none; position:absolute; left:0; top:0; width: 100%; height: 100%; z-index:90000;  background: #eee;">
	<img id="loading" src="<%=cp%>/res/img/loading.gif" border="0">
</div>

<section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about"><b>호스팅</b></h2>
                </div>
                <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li>/</li>
                    <li class="active">House hosting</li>
                </ul>
             </div>
          </div>
      </div>
    </section>
<div class="image-container set-full-height" style="background-image: url('<%=cp%>/res/img/bg_housejoin.jpg')">
    <!--   Big container   -->
    
    <div class="container">
        <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
           
            <!--      Wizard container        -->   
            <div class="wizard-container"> 
                <div class="card wizard-card ct-wizard-azzure" id="wizard">
<form name="houseJoinForm" method="post" enctype="multipart/form-data" action="<%=cp%>/house/join">
                <!--        You can switch "ct-wizard-azzure"  with one of the next bright colors: "ct-wizard-blue", "ct-wizard-green", "ct-wizard-orange", "ct-wizard-red"             -->
                
                    	<div class="wizard-header">
                        	<h3>
                        	   <b>집 정보 입력</b><br>
                        	   <small>회원님의 집에 대한 정보를 입력해 주세요</small>
                        	</h3>
                    	</div>
                    	<ul>
                            <li><a href="#location" data-toggle="tab" style="font-size:11pt">시설</a></li>
                            <li><a href="#type" data-toggle="tab" style="font-size:11pt">동물 종류</a></li>
                            <li><a href="#facilities" data-toggle="tab" style="font-size:11pt">사진</a></li>
                            <li><a href="#description" data-toggle="tab" style="font-size:11pt">상세정보</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane" id="location">
                              <div class="row">
                                  <div class="col-sm-12">
                                    <h4 class="info-text"><b>집 정보 입력</b></h4>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label><b>시·도</b></label><br>
                                             <select id="category1" name="category1" class="form-control" >
                                                <option disabled="" selected="">- 시·도 -</option>
                                                <c:forEach var="loca1" items="${list}">
                                                	<option value="${loca1.category1}">${loca1.category1}</option>
                                                </c:forEach>
                                            </select>
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                       <div class="form-group">
                                            <label><b>시·군·구</b></label><br>
                                             <select id="category2" name="category2" class="form-control">
                                                <option disabled="" selected="">- 시·군·구 -</option>
                                            </select>
                                          </div>
                                  </div>
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                        <label><b>상세주소</b></label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="상세 주소를 입력해주세요" name="category3">
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                          <label><b>수용가능 동물 수</b></label>
                                          <select class="form-control" name="capacity">
                                            <option disabled="" selected="">- 마리 -</option>
                                            <option value="1">1 마리</option>
                                            <option value="2">2 마리 </option>
                                            <option value="3">3 마리</option>
                                            <option value="4">4 마리</option>
                                            <option value="5">5 마리</option>
                                            <option value="6">6+ 마리</option>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                      <div class="form-group">
                                          <label><b>비용</b></label>
                                          <div class="input-group">
                                              <input type="text" class="form-control" placeholder="1일 비용" name="cost">
                                              <span class="input-group-addon">￦</span>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                            </div>
                            <div class="tab-pane" id="type">
                                <h4 class="info-text"> <b>어떤 동물을 현재 키우고 계신가요?(복수 선택 가능)</b> </h4>
                                <div class="row">
                                    <div class="col-sm-10 col-sm-offset-1">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <div class="choice" data-toggle="wizard-checkbox" rel="tooltip" title="Select this option if you have a Dog.">
                                                <input type="checkbox" name="species" value="dog">
                                                <div class="icon">
                                                    <img src="<%=cp%>/res/img/dog_icon.png">
                                                </div>
                                                <h6>Dog</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox" rel="tooltip" title="Select this option if you have an cat">
                                                <input type="checkbox" name="species" value="cat">
                                                <div class="icon">
                                                    <img src="<%=cp%>/res/img/cat_icon.png">
                                                </div>
                                                <h6>Cat</h6>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="facilities">
                                <h4 class="info-text"><b> 집 사진을 올려주세요 </b><label>최대 4장</label></h4>
                                
                                <div class="row" style="margin-bottom: 5px">
                                 <div class="col-sm-2 col-sm-offset-10">
	    			 				<button type="button" name="plus" class="btn btn-fill btn-info btn-sm">사진추가</button>
                                </div>
                                </div>
                                <div class="row">
                                 <div id="tbFile" class="col-sm-9 col-sm-offset-1">
                                    <!-- 시작 -->
	    			 				<input type="file" name="upload" class="form-control input-sm">
                                      <!-- 끝 -->
                                 </div>
                                     
                                      
                                </div>
                            </div>
                            <div class="tab-pane" id="description">
                                <div class="row">
                                    <h4 class="info-text"><b> 집 세부 정보 </b></h4>
                                    <div class="col-sm-6 col-sm-offset-1">
                                         <div class="form-group">
                                         	<label>Title</label>
                                         	<input type="text" class="form-control" placeholder="Title" name="subject">
                                            <label>집에 대한 소개를 해주세요.</label>
                                            <textarea class="form-control" rows="9" name="content"></textarea>
                                          </div>
                                    </div>
                                    <div class="col-sm-4">
                                         <div class="form-group">
                                         <label>검색 노출 여부</label>
                                         	<div class="choice" data-toggle="wizard-radio">
                                                <input type="radio" name="searchOn" value="yes">
                                                <div class="icon">
                                                    <i class="fa fa-search-plus"></i>
                                                </div>
                                                </div>
                                                <div class="choice" data-toggle="wizard-radio">
                                                <input type="radio" name="searchOn" value="no">
                                                <div class="icon">
                                                    <i class="fa fa-search-minus"></i>
                                                </div>
                                                </div>
                                            <label>상세 설명 예시</label>
                                            <p class="description">"편리한 시설, 아늑한 공간"</p>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-footer">
                            	<div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-info btn-wd btn-sm' name='next' value='Next'/>
                                    <input type='button' class='btn btn-finish btn-fill btn-info btn-wd btn-sm' name='finish' value='finish' onclick="javascript:checkHouseJoin();"/>
        
                                </div>
                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                                </div>
                                <div class="clearfix"></div>
                        </div>	
</form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div> <!-- row -->
    </div> <!--  big container -->
   
    <div class="footer">
        <div class="container">
             Made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>. Free download <a href="http://www.creative-tim.com/product/bootstrap-wizard">here.</a>
        </div>
    </div>
    
</div>
		
	<!--   plugins 	 -->
	<script src="<%=cp%>/res/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
	
    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="<%=cp%>/res/assets/js/jquery.validate.min.js"></script>
	
	<!--  methods for manipulating the wizard and the validation -->
	<script src="<%=cp%>/res/assets/js/wizard.js"></script>

