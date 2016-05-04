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

        
        <link href="<%=cp%>/res/css/rangeSlider/ion.rangeSlider.skinHTML5.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/rangeSlider/normalize.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="range_03">
dd
</div>

<!-- rangeSlider -->
<script src="<%=cp%>/res/js/ion.rangeSlider.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/ion.rangeSlider.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
$("#range_03").ionRangeSlider({
    type: "double",
    grid: true,
    min: 0,
    max: 1000,
    from: 200,
    to: 800,
    prefix: "$"
});
</body>
</script>
</html>

