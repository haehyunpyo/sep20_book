<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->
<title>찜목록</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="../assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="../assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="../assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="../assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="../assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="../assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="../assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="../assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="../assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="../assets/css/colors/default.css"
	rel="stylesheet">
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<%@ include file="../menu.jsp"%>
	<div style="margin-top: 100px;"></div>
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h1 class="module-title font-alt">찜목록</h1>
					</div>
				</div>
				<c:choose>
					<c:when test="${list[0].count eq null}">
						<section class="module-small">
							<div class="container">
								<h2 style="text-align: center;">찜목록이 없습니다.</h2>
							</div>
						</section>
					</c:when>
					<c:otherwise>
						<section class="module-small">
							<div style="text-align: center;" class="row">
								<input name="allCheck" type="checkbox">&nbsp;
								<h3 style="display: inline;">찜한 상품 </h3>
								<h4><span class="zzim"></span> / ${list[0].count }</h4>
								<button class="delbtn btn" type="button" onclick="deleteValue()">삭제</button>
							</div>
						</section>
						<div class="row multi-columns-row post-columns">
							<c:forEach items="${list }" var="row">
								<div class="col-sm-3 col-md-3 col-lg-3">
                						<div class="shop-item">
											<div>
												<input name="rowCheck" type="checkbox" value="${row.zno }">
											</div>
											<div class="post-image">
												<a href="../bookdetail?bkno=${row.bkno}"><img
													src="/img/bookimg/${row.bkimg }" alt="Blog-post Thumbnail" /></a>
											</div>
											<div class="post-title">
												<a href="../bookdetail?bkno=${row.bkno}">${row.bkname}</a>
											</div>
											<div class="post-entry">${row.bkwrite}</div>
										</div>
									</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="../assets/lib/jquery/dist/jquery.js"></script>
	<script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/lib/wow/dist/wow.js"></script>
	<script
		src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../assets/lib/smoothscroll.js"></script>
	<script
		src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>

	<script type="text/javascript">
		$(function() {
			var check = document.getElementsByName("rowCheck");
			var checkCnt = check.length;
			$('.zzim').text('0');

			$('input[name="allCheck"]').click(function() {
				var checkList = $('input[name="rowCheck"]');
				for (var i = 0; i < checkList.length; i++) {
					checkList[i].checked = this.checked;
				}
			});

			$('input[name="rowCheck"]').click(function() {
				if ($('input[name="rowCheck"]:checked').length == checkCnt) {
					$('input[name="allCheck"]')[0].checked = true;
				} else {
					$('input[name="allCheck"]')[0].checked = false;
				}
			});

			// 모든 체크박스 요소를 가져오기
			var allCheckCb = document.querySelector('input[name="allCheck"]');
			var rowCheckCb = document
					.querySelectorAll('input[name="rowCheck"]');

			// "찜한 상품" 옆 체크박스의 변경 이벤트 처리
			allCheckCb.addEventListener('change', function() {
				var checkedCount = 0;
				if (allCheckCb.checked) {
					// "찜한 상품" 체크박스가 체크되면 모든 상품 체크박스도 체크
					rowCheckCb.forEach(function(checkbox) {
						checkbox.checked = true;
						checkedCount++;
					});
				} else {
					// "찜한 상품" 체크박스가 해제되면 모든 상품 체크박스도 해제
					rowCheckCb.forEach(function(checkbox) {
						checkbox.checked = false;
					});
				}

				// 총 선택된 상품 개수를 업데이트
				updateTotalCount(checkedCount);
			});

			// 각 상품 옆 체크박스의 변경 이벤트 처리
			rowCheckCb.forEach(function(checkbox) {
				checkbox.addEventListener('change', function() {
					var checkedCount = 0;
					rowCheckCb.forEach(function(checkbox) {
						if (checkbox.checked) {
							checkedCount++;
						}
					});

					// 총 선택된 상품 개수를 업데이트
					updateTotalCount(checkedCount);
				});
			});

			// 총 선택된 상품 개수를 업데이트하는 함수
			function updateTotalCount(count) {
				var zzimTotalElement = document.querySelector('.zzim');
				zzimTotalElement.textContent = count;
			}

			$('.delbtn').click(function() {
				deleteValue();
			});

			function deleteValue() {
				var valueArr = new Array();
				var list = $('input[name="rowCheck"]');
				for (var i = 0; i < list.length; i++) {
					if (list[i].checked) {
						valueArr.push(list[i].value);
					}
				}
				// alert("valueArr: " + valueArr);
				if (valueArr.length == 0) {
					alert('선택된 글이 없습니다.');
					return false;
				} else {
					var chk = confirm('정말 삭제하시겠습니까?');
					$.ajax({
						url : './zdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] > valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr
						},
						success : function(data) {
							alert('삭제했습니다.');
							location.href = "./zzim";
						},
						error : function(error) {
							alert('에러');
						}
					});
				}
			}
		});
	</script>
</body>
</html>