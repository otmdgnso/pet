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
<title>Pet</title>
<meta name="description" content="travel, trip, store, shopping, siteweb, cart">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700,700italic' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'/>


        <link href="<%=cp%>/res/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/animate.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/settings_slide2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div>
    <tiles:insertAttribute name="header"/>
</div>

<div class="container" role="main">
    <tiles:insertAttribute name="body"/>
</div>

<div>
    <tiles:insertAttribute name="footer"/>
</div>


<script src="<%=cp%>/res/js/modernizr.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>
<!-- waypoint -->
<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>
<!--Preload-->
<script type="text/javascript">
    $(document).ready(function ($) {
        "use strict";
        try {
            var myTimer = 0; clearTimeout(myTimer);
            myTimer = setTimeout(function () { $("#loader-wrapper").slideUp() }, 2000);
        } catch (err) {
        }
    });
</script>

<script src="<%=cp%>/res/js/jquery.themepunch.plugins.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
<script type="text/javascript">
var tpj = jQuery;
    tpj(document).ready(function () {
        "use strict";
        if (tpj.fn.cssOriginal !== undefined)
            tpj.fn.css = tpj.fn.cssOriginal;
        tpj('.fullwidthbanner').revolution(
        {
            delay: 9000,
            startwidth: 1170,
            startheight: 646,
            onHoverStop: "on",
            thumbWidth: 100,
            thumbHeight: 50,
            thumbAmount: 4,
            hideThumbs: 200,
            navigationType: 'none',
            navigationArrows: "verticalcentered", 	//nexttobullets, verticalcentered, none
            navigationStyle: "large",
            touchenabled: "on",
            navOffsetHorizontal: 0,
            navOffsetVertical: 20,
            fullWidth: "on",
            shadow: 0
        });
});
</script>

<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<!--bxSlider-->
<script src="<%=cp%>/res/js/jquery.bxslider.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    "use strict";
    $('.bxslider').bxSlider({
        auto: true
    });
});
</script>

 <script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>
</body>
</html>