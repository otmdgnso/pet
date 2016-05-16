<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<body>
	<div class="clear"></div>
	<section id="guide">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="horizontalTab">
						<ul>
							<li><a href="#tab-1">INFO</a></li>
							<li><a href="#tab-2">예약 목록</a></li>
							<li><a href="#tab-3">북마크 리스트</a></li>
							<li><a href="#tab-4">포토 갤러리</a></li>
							<li><a href="#tab-5">나의 QnA</a></li>
							<li><a href="#tab-6">Weather</a></li>
						</ul>

						<div id="tab-1">
							<div class="city-info-content">
								<div class="info-box-guide">
											<img src="<%=cp%>/uploads/profile/${dto.profile}"
												class="avatar img-circle img-thumbnail" id="wizardPicturePreview" title="" />
								</div>
								<img src="http://placehold.it/1600x800" alt="" />
							</div>
							<h3>Information</h3>
							이름 : ${dto.userName }<br>
							생년월일 :${dto.birth } <br>
							가입일 : ${dto.created }<br>
							이메일 : ${dto.email }<br>
							${dto.profile}
							
							
						</div>
						<div id="tab-2">

							<div class="col-md-5 histo-img">
								<img src="http://placehold.it/450x260" alt="" />
							</div>
							<div class="col-md-7 guide-story-info">
								<h3 style="margin-top: 0">Rome History</h3>
								<p>Quisque sodales sodales lacus pharetra bibendum. Etiam
									commodo non velit ac rhoncus. Mauris euismod purus sem, ac
									adipiscing quam laoreet et. Praesent vulputate ornare sem vel
									scelerisque. Ut dictum augue non erat lacinia, sed lobortis
									elit gravida. Proin ante massa, ornare accumsan ultricies et,
									posuere sit amet magna. Praesent dignissim, enim sed malesuada
									luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
									est. Donec tristique mi turpis, et sodales nibh gravida eu.
									Etiam odio risus, porttitor non lacus id, rhoncus tempus
									tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
									sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
									ultricies dolor est, a congue ante dapibus varius. Nulla at
									auctor nunc. Curabitur accumsan feugiat felis ut pretium.
									Praesent semper semper nisi, eu cursus augue.</p>
							</div>
							<div class="clear"></div>
							<h3>Rome Culture</h3>
							<div class="col-md-5 culture-img">
								<img src="http://placehold.it/400x200" alt="" />
							</div>
							<div class="col-md-7 histo-img">
								<p>Quisque sodales sodales lacus pharetra bibendum. Etiam
									commodo non velit ac rhoncus. Mauris euismod purus sem, ac
									adipiscing quam laoreet et. Praesent vulputate ornare sem vel
									scelerisque. Ut dictum augue non erat lacinia, sed lobortis
									elit gravida. Proin ante massa, ornare accumsan ultricies et,
									posuere sit amet magna. Praesent dignissim, enim sed malesuada
									luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
									est. Donec tristique mi turpis, et sodales nibh gravida eu.
									Etiam odio risus, porttitor non lacus id, rhoncus tempus
									tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
									sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
									ultricies dolor est, a congue ante dapibus varius. Nulla at
									auctor nunc. Curabitur accumsan feugiat felis ut pretium.
									Praesent semper semper nisi, eu cursus augue.</p>
							</div>
						</div>
						<div id="tab-3">
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
								<p class="local-name">El Birro Disco Pub</p>
								<p>Every day: 8:00pm to 3:00am</p>
							</div>
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
								<p class="local-name">After Dinner</p>
								<p>Every day: 8:00pm to 3:00am</p>
							</div>
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
								<p class="local-name">After Dinner</p>
								<p>Every day: 8:00pm to 3:00am</p>
							</div>
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
								<p class="local-name">Il Barocco</p>
								<p>Every day: 8:00pm to 3:00am</p>
							</div>

							<div class="night-desc">
								<p>Mauris facilisis elit ut sem eleifend accumsan molestie
									sit amet dolor. Pellentesque dapibus arcu eu lorem laoreet,
									vitae cursus metus mattis. Nullam eget porta enim, eu rutrum
									magna. Duis quis tincidunt sem, sit amet faucibus magna.
									Integer commodo, turpis consequat fermentum egestas, leo odio
									posuere dui, elementum placerat eros erat id augue. Nullam at
									eros eget urna vestibulum malesuada vitae eu mauris. Aliquam
									interdum rhoncus velit, quis scelerisque leo viverra non.
									Suspendisse id feugiat dui. Nulla in aliquet leo. Proin vel
									magna sed est gravida rhoncus. Mauris lobortis condimentum
									nibh, vitae bibendum tortor vehicula ac. Curabitur posuere arcu
									eros.</p>
							</div>

							<div class="night-desc">
								<h3>Warnings</h3>
								<p>Mauris facilisis elit ut sem eleifend accumsan molestie
									sit amet dolor. Pellentesque dapibus arcu eu lorem laoreet,
									vitae cursus metus mattis. Nullam eget porta enim, eu rutrum
									magna. Duis quis tincidunt sem, sit amet faucibus magna.
									Integer commodo, turpis consequat fermentum egestas, leo odio
									posuere dui, elementum placerat eros erat id augue. Nullam at
									eros eget urna vestibulum malesuada vitae eu mauris. Aliquam
									interdum rhoncus velit, quis scelerisque leo viverra non.
									Suspendisse id feugiat dui. Nulla in aliquet leo. Proin vel
									magna sed est gravida rhoncus. Mauris lobortis condimentum
									nibh, vitae bibendum tortor vehicula ac. Curabitur posuere arcu
									eros.</p>
							</div>
						</div>
						<div id="tab-4">
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
							</div>
							<div class="col-md-9">
								<h3>Pasta</h3>
								<p>Quisque sodales sodales lacus pharetra bibendum. Etiam
									commodo non velit ac rhoncus. Mauris euismod purus sem, ac
									adipiscing quam laoreet et. Praesent vulputate ornare sem vel
									scelerisque. Ut dictum augue non erat lacinia, sed lobortis
									elit gravida. Proin ante massa, ornare accumsan ultricies et,
									posuere sit amet magna. Praesent dignissim, enim sed malesuada
									luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
									est. Donec tristique mi turpis, et sodales nibh gravida eu.
									Etiam odio risus, porttitor non lacus id, rhoncus tempus
									tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
									sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
									ultricies dolor est, a congue ante dapibus varius. Nulla at
									auctor nunc.</p>
							</div>
							<div class="clear"></div>
							<br />
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
							</div>
							<div class="col-md-9">
								<h3>Pizza</h3>
								<p>Quisque sodales sodales lacus pharetra bibendum. Etiam
									commodo non velit ac rhoncus. Mauris euismod purus sem, ac
									adipiscing quam laoreet et. Praesent vulputate ornare sem vel
									scelerisque. Ut dictum augue non erat lacinia, sed lobortis
									elit gravida. Proin ante massa, ornare accumsan ultricies et,
									posuere sit amet magna. Praesent dignissim, enim sed malesuada
									luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
									est. Donec tristique mi turpis, et sodales nibh gravida eu.
									Etiam odio risus, porttitor non lacus id, rhoncus tempus
									tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
									sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
									ultricies dolor est, a congue ante dapibus varius. Nulla at
									auctor nunc.</p>
							</div>
							<div class="clear"></div>
							<br />
							<div class="col-md-3 histo-img">
								<img src="http://placehold.it/300x200" alt="" />
							</div>
							<div class="col-md-9">
								<h3>Vino</h3>
								<p>Quisque sodales sodales lacus pharetra bibendum. Etiam
									commodo non velit ac rhoncus. Mauris euismod purus sem, ac
									adipiscing quam laoreet et. Praesent vulputate ornare sem vel
									scelerisque. Ut dictum augue non erat lacinia, sed lobortis
									elit gravida. Proin ante massa, ornare accumsan ultricies et,
									posuere sit amet magna. Praesent dignissim, enim sed malesuada
									luctus, arcu sapien sodales sapien, ut placerat eros nunc vel
									est. Donec tristique mi turpis, et sodales nibh gravida eu.
									Etiam odio risus, porttitor non lacus id, rhoncus tempus
									tortor. Curabitur tincidunt molestie turpis, ut luctus nibh
									sollicitudin vel. Sed vel luctus nisi, at mattis metus. Aenean
									ultricies dolor est, a congue ante dapibus varius. Nulla at
									auctor nunc</p>
							</div>
						</div>
						<div id="tab-5">
							<p>Proin dignissim faucibus odio sollicitudin sagittis.
								Phasellus aliquet, erat vitae mollis consectetur, enim lectus
								ornare libero, et porta mi dui eu tellus. Morbi lobortis, elit
								at euismod porta, magna lacus mattis massa, a lacinia ligula
								risus et lectus. Sed et aliquam ligula. Nunc venenatis orci
								magna, quis facilisis sem porta non. Nunc sodales arcu in
								consectetur malesuada. Maecenas varius justo lacus, scelerisque
								viverra tellus luctus eu. Nam imperdiet ultricies suscipit. Ut
								urna mauris, eleifend quis lacinia non, mollis id libero.
								Praesent pharetra viverra ipsum at posuere. Quisque commodo
								tortor nec hendrerit faucibus. Fusce convallis urna et vehicula
								tincidunt. Duis sed vehicula justo, eu placerat nisi. Donec
								facilisis augue non turpis semper, eget condimentum mauris
								malesuada. Nunc in dignissim mi, sed laoreet felis.</p>
						</div>
						<div id="tab-6">
							<h3>
								Italy Weather <span>(more info <a href="meteo.html">travego
										meteo</a>)
								</span>
							</h3>
							<p>Quisque sodales sodales lacus pharetra bibendum. Etiam
								commodo non velit ac rhoncus. Mauris euismod purus sem, ac
								adipiscing quam laoreet et. Praesent vulputate ornare sem vel
								scelerisque. Ut dictum augue non erat lacinia, sed lobortis elit
								gravida. Proin ante massa, ornare accumsan ultricies et, posuere
								sit amet magna. Praesent dignissim, enim sed malesuada luctus,
								arcu sapien sodales sapien, ut placerat eros nunc vel est. Donec
								tristique mi turpis, et sodales nibh gravida eu. Etiam odio
								risus, porttitor non lacus id, rhoncus tempus tortor. Curabitur
								tincidunt molestie turpis, ut luctus nibh sollicitudin vel. Sed
								vel luctus nisi, at mattis metus. Aenean ultricies dolor est, a
								congue ante dapibus varius. Nulla at auctor nunc</p>
							<div id="meteo-guide"></div>
						</div>
					</div>
					<!--Close col 12 -->

				</div>
			</div>
		</div>

	</section>

	<section id="parallax" class="about-prx">
		<div class="effect-over">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="main">
							<div id="cbp-contentslider" class="cbp-contentslider">
								<ul>
									<li id="slide1">
										<h3 class="icon-wolf">
											<span>enezuela</span>
										</h3>
										<div>
											<div class="cbp-content">
												<p>Veggies sunt bona vobis, proinde vos postulo esse
													magis desert raisin bush tomato soko salsify garbanzo
													horseradish cabbage burdock.</p>
												<p>Daikon artichoke gumbo azuki bean bok choy avocado
													winter purslane gram earthnut pea broccoli salsify squash
													plantain wattle seed wakame broccoli rabe bamboo shoot.
													Zucchini lotus root azuki bean epazote dulse pumpkin
													rutabaga spinach. Endive mung bean gumbo maize plantain
													rock melon.</p>
											</div>
										</div>
									</li>
									<li id="slide2">
										<h3 class="icon-rabbit">
											<span class="country-name1">ome</span>
										</h3>
										<div>
											<div class="cbp-content">
												<p>Chicory collard greens tatsoi cress bamboo shoot
													broccoli rabe lotus root earthnut pea arugula okra welsh
													onion leek shallot courgette. Chard garlic fava bean pea
													sprouts gram spinach plantain tomatillo. Chicory garlic
													black-eyed pea gourd chickpea cucumber lotus root.</p>
												<p>Daikon artichoke gumbo azuki bean bok choy avocado
													winter purslane gram earthnut pea broccoli salsify squash
													plantain wattle seed wakame broccoli rabe bamboo shoot.
													Zucchini lotus root azuki bean epazote dulse pumpkin
													rutabaga spinach. Endive mung bean gumbo maize plantain
													rock melon.</p>
											</div>
										</div>
									</li>
									<li id="slide3">
										<h3 class="icon-aligator">
											<span class="country-name1">rgentine</span>
										</h3>
										<div>
											<div class="cbp-content">
												<p>Tomato shallot broccoli rabe aubergine melon fava
													bean soybean sorrel. Tomatillo plantain wattle seed pea
													ricebean sorrel fennel welsh onion kakadu plum celery.
													Arugula radicchio garlic welsh onion kale celtuce tomato
													fava bean beet greens soybean burdock groundnut lentil
													broccoli rabe.</p>
											</div>
										</div>
									</li>
									<li id="slide4">
										<h3 class="icon-turtle">
											<span>urkey</span>
										</h3>
										<div>
											<div class="cbp-content">
												<p>Yarrow bush tomato beetroot taro water chestnut
													komatsuna azuki bean. Parsnip artichoke water chestnut
													caulie carrot grape summer purslane brussels sprout fava
													bean tomatillo pea groundnut nori earthnut pea tigernut.
													Tigernut brussels sprout wakame tomatillo radicchio carrot
													maize swiss chard seakale melon grape broccoli pea sprouts
													kakadu plum plantain cauliflower. Gram salsify radicchio
													daikon courgette rock melon bunya nuts turnip greens.
													Cabbage black-eyed pea spinach asparagus plantain cress
													soybean spring onion salad artichoke pea garlic silver beet
													grape water spinach zucchini wakame summer purslane.</p>
											</div>
										</div>
									</li>
									<li id="slide5">
										<h3 class="icon-platypus">
											<span>rasil</span>
										</h3>
										<div>
											<div class="cbp-content">
												<p>Potato watercress burdock spinach quandong jícama
													chard pea sprouts garlic celery turnip daikon kale lotus
													root sorrel coriander rock melon cabbage. Epazote salsify
													lentil rock melon eggplant cauliflower zucchini caulie
													catsear broccoli rabe pumpkin lettuce okra green bean
													squash seakale onion water chestnut. Sweet pepper peanut
													corn soko celery winter purslane.</p>
												<p>Daikon artichoke gumbo azuki bean bok choy avocado
													winter purslane gram earthnut pea broccoli salsify squash
													plantain wattle seed wakame broccoli rabe bamboo shoot.
													Zucchini lotus root azuki bean epazote dulse pumpkin
													rutabaga spinach. Endive mung bean gumbo maize plantain
													rock melon.</p>
											</div>
										</div>
									</li>
								</ul>
								<nav>
									<a href="#slide1" class="icon-wolf"><span>Venezuela</span></a>
									<a href="#slide2" class="icon-rabbit"><span>Rome</span></a> <a
										href="#slide3" class="icon-aligator"><span>Argentine</span></a>
									<a href="#slide4" class="icon-turtle"><span>Turkey</span></a> <a
										href="#slide5" class="icon-platypus"><span>Brasil</span></a>
								</nav>
							</div>
						</div>
					</div>
					<!--Close col-md-12-->
				</div>
			</div>
		</div>
	</section>


	<!-- waypoint -->
	<script type="text/javascript" src="<%=cp%>/res/js/waypoints.min.js"></script>
	<script>
		$(function() {
			"use strict";
			var mobile_nav = $("#mobile-menu-01 li.line-mini-menu");
			mobile_nav.click(function() {
				$(this).children('div').addClass("active");
				$(this).children('div').toggle(1000);
			});

			var mobile_open = $("#mobile-menu-01 .line-logo i.fa-bars");
			mobile_open.click(function() {
				$("#mobile-menu-01 .travel-mega-menu-mobile").toggle(1000);
			});
		});
	</script>

	<script src="<%=cp%>/res/js/tabs/jquery.responsiveTabs.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							"use strict";
							$('#horizontalTab')
									.responsiveTabs(
											{
												rotate : false,
												startCollapsed : 'accordion',
												collapsible : 'accordion',
												setHash : true,
												animation : 'slide',
												disabled : [ 4 ],
												activate : function(e, tab) {
													$('.info')
															.html(
																	'Tab <strong>'
																			+ tab.id
																			+ '</strong> activated!');
												},
												activateState : function(e,
														state) {
													//console.log(state);
													$('.info')
															.html(
																	'Switched from <strong>'
																			+ state.oldState
																			+ '</strong> state to <strong>'
																			+ state.newState
																			+ '</strong> state!');
												}
											});

						});
	</script>
	<!--Carousel-->
	<script src="<%=cp%>/res/js/carousel/modernizr.custom.js"
		type="text/javascript"></script>
	<script src="<%=cp%>/res/js/carousel/jquery.cbpContentSlider.min.js"
		type="text/javascript"></script>
	<script>
		$(function() {
			$('#cbp-contentslider').cbpContentSlider();
		});
	</script>

	<!--Counter-->

	<script src="<%=cp%>/res/js/jquery.counterup.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			"use strict";
			$('.counter').counterUp({
				delay : 40,
				time : 4000
			});
		});
	</script>

	<!--Meteo-->
	<script src="<%=cp%>/res/js/meteo/jquery.zweatherfeed.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			"use strict";
			$('#meteo-guide').weatherfeed([ 'ITXX0067', 'ITXX0028' ], {
				unit : 'f',
				image : true,
				country : true,
				highlow : true,
				wind : true,
				humidity : true,
				visibility : true,
				sunrise : true,
				sunset : true
			});
		});
	</script>
</body>
</html>