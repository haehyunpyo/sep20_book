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
<title>Titan | Multipurpose HTML5 Template</title>
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
<style type="text/css">
.gray{
	background-color: gray;
}
</style>
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
						<h1 class="module-title font-alt">대여 관리</h1>
					</div>
				</div>
			</div>

			<section class="module-small">
				<div class="container">
					<div class="col-sm-2 mb-sm-20">
						<button class="btn" onclick="location.href='./rent?cate=0'">전체보기</button>
					</div>
					<form action="./rent" method="get" class="row">
						<div class="col-sm-2 mb-sm-20">
							<select class="form-control" name="cate" id="cate"
								onclick="cateChange()">
									<option selected="selected" value="0">전체</option>
									<option value="1">소설</option>
									<option value="2">에세이</option>
									<option value="3">자기계발</option>
							</select>
						</div>
						<div class="col-sm-2 mb-sm-20">
							<select class="form-control" name="searchN">
								<option value="title">책제목</option>
								<option value="writer">저자</option>
								<option value="publisher">출판사</option>
							</select>
						</div>
						<div class="col-sm-4">
						<div class="search-box">
							<input class="form-control" type="text" name="searchV"
								required="required" placeholder="Search..">
							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
						</div>
					</form>
				</div>
			</section>
			<div class="container">
				<div class="row multi-columns-row">
					<div class="col-sm-15">
					<div class="menu" style="text-align: center;">
							<div class="row">
								<span class="menu-detail font-alt col-sm-1">대여번호</span>
								<span class="menu-title font-alt col-sm-3">책제목</span>
								<span class="menu-title font-alt col-sm-2">저자</span>
								<span class="menu-price font-alt col-sm-2">가격</span>
								<span class="menu-price font-alt col-sm-2">대여일</span>
								<span class="menu-price font-alt col-sm-2">반납일</span>
							</div>
							<c:forEach items="${list }" var="row">
								<div class="row <c:if test="${row.rdel eq 0}">gray</c:if>">
									<div class="col-sm-15">
										<span class="menu-detail font-serif col-sm-1">${row.rno}</span>
										<span class="menu-title font-alt col-sm-3">${row.bkname}</span>
										<span class="menu-title font-alt col-sm-2">${row.bkwrite}</span>
										<span class="menu-price font-alt col-sm-2">${row.bkprice}원</span>
										<span class="menu-price font-alt col-sm-2">${row.rsdate}</span>
										<span class="menu-price font-alt col-sm-2">${row.rddate}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">재고</h5>
				</div>
				<div class="modal-body">
					<input id="bkno2" type="hidden">
					<div class="detail">
						<!-- <select class="form-control" name="stock" id="stock" onclick="stockChange()">
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
								<option value="admin">사용자 지정</option>
						</select> 
						<div id="adminInputContainer"></div>-->
						<input id="stockCnt" type="text" placeholder="수량을 입력하세요...">
						<button id="stockbtn">재고 업데이트</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	
	function getParameterByName(name) {
	    const urlParams = new URL(location.href).searchParams;
	    return urlParams.get(name);
	}
 	
 	$(function() {
 	// URL에서 cate 매개변수를 가져와서 기본값으로 설정
    var defaultCate = getParameterByName('cate');
    $('#cate').val(defaultCate);
    
	$('#cate').on('change', function(){
		var cate = $('#cate').val();
		// alert(cate);
		$.ajax({
			url:'./rent',
			type:'get',
			data:{cate:cate},
			success:function(data){
				location.href="./rent?cate=" + cate;
				
			},
			error:function(error){
				alert('에러');
			}
		});
	});
	
	});
 	</script>

</body>
</html>