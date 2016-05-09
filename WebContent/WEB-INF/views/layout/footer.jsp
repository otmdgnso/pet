<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
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