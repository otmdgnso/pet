<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

							<div class="txt-sort">
								<p>Sort result:</p>
							</div>
									<div class="click-nav">
										<ul class="no-js">
											<li><a href="<%=cp %>/auction/bidList"  class="clicker">입찰한 물품</a>
												
											</li>
										</ul>
									</div>
								<div class="click-nav-location">
			                        <ul class="no-js">
				                        <li>
					                        <a href="<%=cp %>/auction/auctionList"    class="clicker">경매 리스트</a>
					                    </li>
			                        </ul>
		                        </div>
		                        	                        
				
								
			<div style="clear: both;">
                    <!--여기서 forEach시작 -->
					<c:forEach var="dto" items="${list}">
						
							<div style="clear:both;">
							                                                         
                                <div class="price-night" style="border-top: none;" align="left">
                                <table	style="width: 700px; margin: 0px auto; border-spacing: 0px; padding: 0px;">
                                   <tr height="40%">
                                   	<td align="center" width="10%">이름</td>
                                   	<td align="center" width="10%">${dto.userName}</td>
                                   	<td align="center" width="20%">제목</td>
                                   	<td align="center" width="20%">${dto.subject}</td>
                                   	<td align="center" width="10%">입찰가격</td>
                                   	<td align="center" width="10%">${dto.bidPrice}</td>
                                   	<td align="center" width="10%">종료날짜</td>
                                   	<td align="center" width="10%">${dto.aucEnd}</td>
                               
                               </table>
                                </div> 
							</div>
						
						</c:forEach>
						<ul class="pagination clearfix">
						<!-- 여기서 forEach 끝 -->
						
                    	    <c:if test="${dataCount!=0}">
            					${paging}
         					</c:if>
                    	</ul>
                  </div>
                    
                   
		