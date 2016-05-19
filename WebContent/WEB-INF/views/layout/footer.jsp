<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">

function deleteMember(){
	if(confirm("정말로 탈퇴하시겠습니까?"))
		openSubmitModal();
}

function openSubmitModal(){
	
    setTimeout(function(){
        $('#submitModal').modal('show');    
    }, 230);
    
}

function submitSend(){
	var url="<%=cp%>/member/delete";
	var params="pwd="+$("#pwd2").val();
	
	$.ajax({
		url:url
		,type:"post"
		,data:params
		,dataType:"json"
		,success:function(data){
			if(data.state=="false"){
				shakeModalsubmit();
			}else{
				alert("탈퇴완료");
				location.href="<%=cp%>";
			}
		}
	});
}

function shakeModalsubmit(){
    $('#submitModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("패스워드가 일치하지 않습니다.");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#submitModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}
</script>

<section id="footer">
    <div class="container">
            <div class="row">
                <div class="col-md-12">
                  <div class="col-md-3">
                    <img class='logo-footer' src='<%=cp%>/res/images/icon/dog2.JPG' alt='logo' />  
                  </div>
                  <div class="col-md-3 footer-zone">
                        <h3>CONTACTS</h3>
                        <p><i class="fa fa-map-marker"></i>Address: 18 Baekbeom-ro, Mapo-gu, Seoul, Korea </p>
                        <p><i class="fa fa-phone"></i>Tel: 02 336 8546~8</p>
                        <p><i class="fa fa-envelope-o"></i>Mail: info@pet.com</p>
                        <p><i class="fa fa-globe"></i>pet@pet.com</p>
                        
                    <c:if test="${not empty sessionScope.member}"> 
                       <h6><a href="javascript:void(0)" onclick="deleteMember();">회원탈퇴</a></h6>
                    </c:if>
                    
                        <div class="socialfooter">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-google"></i></a></div>  
                  </div>
                </div>
           </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                    <div class="col-xs-6 copyright">Pet © 2016 Name All Rights Reserved </div>
                    <div class="col-xs-6 payment-card">
                        <i class="fa fa-2x fa-cc-visa"></i>
                        <i class="fa fa-2x fa-cc-mastercard"></i>
                        <i class="fa fa-2x fa-cc-amex"></i>
                        <i class="fa fa-2x fa-cc-paypal"></i>
                    </div>
              </div>
            </div>
        </div>
    </div>
</section>

<div class="container">
	<div class="modal fade login" id="submitModal">
		<div class="modal-dialog login animated">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">회원탈퇴</h4>
				</div>
				<div class="modal-body">
					<div class="box">
						<div class="content">
							<div class="error"></div>
							<div class="form loginBox">
								<form name="subForm">
									<input id="userId2" class="form-control" type="text"
										value="${sessionScope.member.userId}" name="userId"	readonly="readonly">
								    <input id="pwd2" class="form-control" type="password" placeholder="pwd" name="pwd">
								    <input class="btn btn-default btn-login" type="button" value="Login" onclick="submitSend()">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
