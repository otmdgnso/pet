<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
</script>

<div class="city-info-content">
								<div class="info-box-guide" style="width: 200px; height: 200px;">
									<img src="<%=cp%>/uploads/profile/${dto.profile}"
										class="avatar img-circle img-thumbnail">
								</div>
								<c:if test="${empty dto.themeprofile }">
									<img src="http://placehold.it/1600x800" alt="" />
								</c:if>
								<c:if test="${not empty dto.themeprofile }">
									<img style="width: 1000px; height: 600px;" src="<%=cp%>/uploads/theme/${dto.themeprofile}" alt="" />
								</c:if>

								<form name="updateTheme" method="post" enctype="multipart/form-data">
									<div class="file_input_div" style="float: right;">
										<div class="file_input">
											<label
												class="image_input_button mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-js-ripple-effect mdl-button--colored">
												<i class="material-icons">file_upload</i> <input
												id="file_input_file" class="none" type="file"
												style="display: none;" name="themeUpload" />
											</label>
										</div>
										<div id="file_input_text_div"
											class="mdl-textfield mdl-js-textfield textfield-demo">
											<input class="file_input_text mdl-textfield__input"
												type="text" disabled readonly id="file_input_text" /> <label
												class="mdl-textfield__label" for="file_input_text"></label>
										</div>
										<div style="float: right;">
											<button onclick="sendTheme();" class="btn btn-info btn-small">
												<i class="icon-white icon-chevron-right"></i>테마사진변경
											</button>
										</div>
									</div>
								</form>
							</div>
							<h3 style="text-align: center;"><img alt="" src="<%=cp%>/res/images/asterisk.png"
											style="width: 64px;"> &nbsp; Information</h3>
							
							
						<div align="center">
						<table style="text-align: left;margin-left: 290px; margin-right: 290px; ">
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/name.png"
															style="width: 64px;"> 이름 : ${dto.userName }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/birthday-cake.png"
															style="width: 64px;"> 생년월일 : ${dto.birth }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/calendar.png"
															style="width: 64px;"> 가입일 : ${dto.created }
													</h4></td>
											</tr>
											<tr
												style="border-bottom: 2px; border-bottom-style: dashed; width: 100%; color: navy;">
												<td><h4>
														<img alt="" src="<%=cp%>/res/images/email.png"
															style="width: 64px;"> 이메일 : ${dto.email }
													</h4></td>
											</tr>
											<tr style="text-align: center;">
												<!--    <td><h3><input class="btn btn-default btn-register"  type="button" onclick="update();" value="수정하기"></h3> -->

												<td><h4>
														<a href="javascript:void(0)" onclick="openUpdateModal();">수정하기</a>
													</h4></td>												
											</tr>
										</table>
										</div>