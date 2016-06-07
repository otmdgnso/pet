<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.alert {
    color:#4374D9;
    background-color:white;
    border-color:#B2CCFF;
}

.boxLayout {
    max-width:500px;
    padding:20px;
    margin: 0 auto;
}

@media (min-width: 768px) {
  .boxLayout {
    margin-top: 70px;
  }
}

</style>

</head>
<body>
<div class="bodyFrame">

<div class="boxLayout">  
    <div class="alert alert">
            <h4><strong>결제 완료</strong></h4>
              결제가 완료되었습니다.
    </div>

    <p>
          <button type="button" class="btn btn-default btn-lg btn-block" onclick="javascript:location.href='<%=cp%>/';"> 메인화면으로 이동 &raquo; </button>
    </p>
</div>    
    
</div>

</body>
</html>