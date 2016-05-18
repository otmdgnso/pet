<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!doctype html>

<html>
	<head>
    <title>Travego</title>
    <meta charset="utf-8">
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
        
        <link href="<%=cp%>/res/css/travel-mega-menu.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/layout2.css" rel="stylesheet" type="text/css" />
        <link href="<%=cp%>/res/css/responsive.css" rel="stylesheet" type="text/css" />
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp" type="text/javascript"></script>
</head>
	<body>



	
<section>
	<div class="col-sm-4 col-sm-offset-2">
		<div class="google-maps-slide">
          <!--Google Maps-->
            <div id="map_container_slide">
			    <div id="map_canvas_slide"></div>
			</div>
		</div>
	</div>
</section>
    
<script src="<%=cp%>/res/js/modernizr.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="<%=cp%>/res/js/jquery.easing.1.3.js"></script>

<script type="text/javascript" src="<%=cp%>/res/js/bootstrap.min.js"></script> 
<script src="<%=cp%>/res/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>


 <script src="<%=cp%>/res/js/script.js" type="text/javascript"></script>

 <script>

    /********************************************
    GOOGLE MAPS SLIDER
    ********************************************/

    // The following example creates a marker in Stockholm, Sweden
    // using a DROP animation. Clicking on the marker will toggle
    // the animation between a BOUNCE animation and no animation.
     $(document).ready(function ($) {
         "use strict";

         var Locations = [
                {
                    lat: 37.553270,
                    lon: 126.936689,
                    address: '쌍용교육센터',
                    gval: '25.5',
                    aType: 'Non-Commodity',
                    title: '<p class="title-map">쌍용교육센터</p>',
                    descr: '<p class="desc-map">코딩하기 드릅게 힘드네</p>',
                    room: '<p class="room-map"><img class="star-level" src="<%=cp%>/res/images/5star.png" alt=""><i class="fa fa-bed"></i> 2</p>'
                },
                    {
                        lat: 55.7512419,
                        lon: 37.6184217,
                        address: 'Moscow',
                        gval: '11.5',
                        aType: 'Non-Commodity',
                        title: '<p class="title-map">Moscow</p>',
                        descr: '<p class="desc-map">A modern hotel room in Star Hotel Nunc</p>',
                        room: '<p class="room-map"><img class="star-level" src="<%=cp%>/res/images/3star.png" alt=""><i class="fa fa-bed"></i> 1</p>'
                    }

        ];
         var mapPosition = new google.maps.LatLng(37.553270, 126.936689);

         var image = '<%=cp%>/res/images/marker.png';
         var marker;
         var map;

         function initialize() {
             var styleArray = [
                            {
                                featureType: 'all'

                            }, {
                                featureType: 'road.arterial',
                                elementType: 'geometry'

                            }
                            ];


             var mapOptions = {
                 zoom: 17,
                 styles: styleArray,
                 center: mapPosition
             };

             var infoWindow = new google.maps.InfoWindow({
                 maxWidth: 160
             });

             map = new google.maps.Map(document.getElementById('map_canvas_slide'), mapOptions);

             for (var i = 0; i < Locations.length; i++) {

                 marker = new google.maps.Marker({
                     map: map,
                     draggable: true,
                     animation: google.maps.Animation.DROP,
                     position: new google.maps.LatLng(Locations[i].lat, Locations[i].lon),
                     icon: image
                 });
                 google.maps.event.addListener(marker, 'click', (function(marker, i) {
                     return function () {
                         infoWindow.setContent(Locations[i].title + Locations[i].descr + Locations[i].room);
                         infoWindow.open(map, marker);
                     }
                 })(marker, i));

             }
         }

         google.maps.event.addDomListener(window, 'load', initialize);

     });

</script>

	</body>
</html>