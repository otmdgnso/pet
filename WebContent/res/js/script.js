

(function ($) {

 "use strict";

 $(document).ready(function () {

    // Reservation Form	
    //jQueryUI - Datepicker

    if (jQuery().datepicker) {
        jQuery('.checkin').datepicker({
            showAnim: "drop",
            dateFormat: "dd/mm/yy",
            minDate: "-0D",
        });

        jQuery('.checkout').datepicker({
            showAnim: "drop",
            dateFormat: "dd/mm/yy",
            minDate: "-0D",
            beforeShow: function () {
                var a = jQuery(".checkin").datepicker('getDate');
                if (a) return {
                    minDate: a
                }
            }
        });
        jQuery('.checkin, .checkout').on('focus', function () {
            jQuery(this).blur();
        }); // Remove virtual keyboard on touch devices
    } 
    jQuery('[data-toggle="popover"]').popover();
      
 

 var mobile_nav = $("#mobile-menu-01 li.line-mini-menu");
    mobile_nav.on( "click", function () {
        $(this).children('div').addClass("active");
        $(this).children('div').toggle(1000);
    });

var mobile_open = $("#mobile-menu-01 .line-logo i.fa-bars");
    mobile_open.on( "click", function () {        
        $("#mobile-menu-01 .travel-mega-menu-mobile").toggle(1000);
    });

$('.header-lang').on("hover",
		function() {
			$('.langs-drop').fadeIn();
		}, function() {
			$('.langs-drop').hide();
		}
	);


/**************  Animated images up  ************************/

    if (Modernizr.touch) {
        // show the close overlay button
        $(".close-overlay").removeClass("hidden");
        // handle the adding of hover class when clicked
        $(".img").on( "click", function(e){
            if (!$(this).hasClass("hover")) {
                $(this).addClass("hover");
            }
        });
        // handle the closing of the overlay
        $(".close-overlay").on( "click", function(e){
            e.preventDefault();
            e.stopPropagation();
            if ($(this).closest(".img").hasClass("hover")) {
                $(this).closest(".img").removeClass("hover");
            }
        });
    } else {
        // handle the mouseenter functionality
        $(".img").mouseenter(function(){
            $(this).addClass("hover");
        })
        // handle the mouseleave functionality
        .mouseleave(function(){
            $(this).removeClass("hover");
        });
    }


/**************  Animated Hover Price Circle  ************************/


    $('.price-color-log .content-red').on("hover", function() {
          $('.price-color-log .content-green').addClass('circle-opacity');
        }, function() {
          $('.price-color-log .content-green').removeClass('circle-opacity');
    });

    $('.price-color-log .content-blue').on("hover", function() {
          $('.price-color-log .content-green').addClass('circle-opacity');
        }, function() {
          $('.price-color-log .content-green').removeClass('circle-opacity');
    });


/**************  Animated Counter  ************************/

    var nav = $('.top-mega-menu');

    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            nav.addClass("push-top");
        } else {
            nav.removeClass("push-top");
        }
    });
/*
    
    try {
	    
	    if ($(".animated")[0]) {
		    $('.animated').css('opacity', '0');
	    }

	    $('.triggerAnimation').waypoint(function() {
		    var animation = $(this).attr('data-animate');
		    $(this).css('opacity', '');
		    $(this).addClass("animated " + animation);

	    },
		    {
			    offset: '80%',
			    triggerOnce: true
		    }
	    );
    } catch(err) {

    }*/






/**************  List Trip checkbox management  ************************/


    $('.ac-container article div').on( "click", function(e){
      $(this).toggleClass('active');

    });


/**************  Blog Right  ************************/
       
    $('.blog-category .cc-check').on( "click", function(e){
      e.preventDefault();
      $(this).toggleClass('active');
      e.stopPropagation();
    });


/***** Percentage code*****/


    $('.skillbar').each(function () {
        $(this).find('.skillbar-bar').width(0);
    });

    $('.skillbar').each(function () {
        $(this).find('.skillbar-bar').animate({
            width: $(this).attr('data-percent')
        }, 2000);
    });

});
    
})(window.jQuery);