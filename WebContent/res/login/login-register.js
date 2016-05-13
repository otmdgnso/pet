/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: http://creative-tim.com
 * 
 */

function showRegisterForm(){
	$('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register with');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        $('.modal-title').html('Login with');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}


function loginSend(){
    var url="<%=cp%>/member/login";       
    var params="userId="+$("#userId").val()+"&pwd="+$("#pwd").val()
     $.ajax({
    	url:url
    	,data:params
    	,type:"post"
    	,dataType:"json"
    	,success:function(data){
    		if(data.state=="false") {
    			shakeModal();
    		} else {    			
    			location.href="<%=cp%>";
    		}
    		
    	}
     });
}
function registerMember(){
    var url="<%=cp%>/member/register";       
    // var f=$("#joinForm");
    var f=$("form")[2];
    checked();   
    
    var formData=new FormData(f);
    
     $.ajax({
    	url:url
    	,type:"post"
    	,processData:false
    	,contentType:false
    	,data:formData
    	,dataType:"json"
    	,success:function(data){
    		if(data.state=="false") {
    			
    		} else {     		  			
    			location.href="<%=cp%>";
    		}
    		
    	}
     });
}
function checked() {
	var f=$("form")[2];
	var str;
	
	str=f.upload.value;
	if(!str){
		shakeModalMember('사진을 등록하세요!');
		return false;
	}
	
	str=f.userId.value;
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		f.userId.focus();
		shakeModalMember('아이디는 영문과 숫자를 조합하세요');
		return false;
	}
	
	str = f.pwd.value;
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		f.pwd.focus();
		shakeModalMember('패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야합니다!');
		return false;
	}
	
	if(f.pwd_confirm.value != str) {
		f.pwd_confirm.focus();
		shakeModalMember('비밀번호를 동일하게 입력하세요!');
		return false;
	} 
	   str = f.userName.value;
	    if(!/^[가-힣]{2,4}$/.test(str)) {
	        f.userName.focus();
	        shakeModalMember('이름이 잘못된 형식입니다!');
	        return false;
	    }
	
    str = f.email.value;
    if(!isValidEmail(str)) {
        f.email.focus();
        shakeModalMember('이메일 형식이 잘못되었습니다!');
        return false;
    }
    str = f.birth.value;
    if(!isValidDateFormat(str)) {
        f.birth.focus();
        shakeModalMember('생일형식이 잘못 되었습니다. "1991-12-23" 이렇게 입력!');
        return false;
    }
    str = f.phone.value;
    if(!/^\d{3}-\d{3,4}-\d{4}$/.test(str)) {
        f.phone.focus();
        shakeModalMember('전화 번호 형식을 확인하세요!');
        return false;
    }    
    f.checking.value="true";
    return true;
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("아이디 또는 패스워드가 일치하지 않습니다.");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}

function shakeModalMember(msg){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html(msg);
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}




   