<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<section class="about-section-top">
       <div class="container">
          <div class="row">
             <div class="col-md-12">
               <div class="page-title pull-left">
                    <h2 class="title-about">예약 관리</h2>
                </div>
             </div>
          </div>
      </div>
</section>

<section class="top-we-are" style="height:780px;">
	<div class="container">
	<div class="row" style="margin:0 auto; width:80%;" align="center">
	<div class="col-md-12 effect-5 effects no-border-img" style="margin:0 auto; width:100%;" align="center">		

			
	<div class="cbp-vm-switcher cbp-vm-view-list">
	
		<div class="form-group" style="margin:0 auto; width:100%; padding-top: 30px;" align="center">
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%"><label>번호</label></td>
	              <td align="center" width="10%"><label>신청자</label></td>
	              <td align="center" width="10%"><label>종류</label></td>
	              <td align="center" width="10%"><label>신청 수</label></td>
	              <td align="center" width="20%"><label>날짜</label></td>              
	              <td align="center" width="10%"></td>
	           </tr>
	           
	           <tr align="center" height="50px">
	           	  <td align="center" width="5%" style="color: #A6A6A6;">1</td>
	              <td align="center" width="10%" style="color: #6ABC64;">김지원</td>
	              <td align="center" width="10%" style="color: #A6A6A6;">강아지</td>
	              <td align="center" width="10%" style="color: #A6A6A6;">1마리</td>	          
	              <td align="center" width="20%" style="color: #A6A6A6;">2016/07/01~2016/07/03</td>
	              <td align="center" width="10%" style="color: #A6A6A6;">수락 | 거절</td>
	           </tr>        
	        </table>     
		</div>
	</div>
	<div class="cbp-vm-switcher cbp-vm-view-list">
		<div class="form-group" style="margin:0 auto; width:80%; height:60px " align="center">
		<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; color: #A6A6A6;">
            <c:if test="${dataCount==0 }">
                  	등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
               ${paging}
            </c:if>
        </div>   
        </div>    
	</div>
	</div>
	</div>
	</div>  
</section>
