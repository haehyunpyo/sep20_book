<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
<title>주문목록</title>
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
				<h1 class="module-title font-alt">주문목록</h1>
			</div>
		</div>
		
	</div>
	
	<c:choose>
		<c:when test="${list[0].count eq null}">
			<section class="module-small">
				<div class="container">
					<h2 style="text-align: center;">주문 목록이 없습니다.</h2>
				</div>
			</section>
		</c:when>
	<c:otherwise>
		<section class="module-small">
		<div class="module-subtitle font-alt">총 주문개수 : ${list[0].count }개</div>
		<div class="container">
		<div class="col-sm-2 mb-sm-20">
			<button class="btn" onclick="location.href='./buy'">전체보기</button>
		</div>
		<div class="col-sm-10">
			<form action="./buy" method="get" class="row">
				<div class="col-sm-3 mb-sm-20">
					<select class="form-control" name="searchN">
						<option selected="selected" value="no">주문번호</option>
						<option value="title">책제목</option>
						<option value="writer">글쓴이</option>
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
		</div>
	</section>
	<div class="container">
		<div class="row multi-columns-row">
			<div class="col-sm-15">
				<div class="menu">
				<div class="row">
					<span class="menu-detail font-alt col-sm-5">주문번호<br>
					총 주문금액<br>
					날짜</span>
					<span class="menu-price font-alt col-sm-3">책</span>
				</div>
				<div class="row">
					<c:forEach items="${list }" var="row"  varStatus="loop">
						<c:if test="${loop.first || row.tgroup ne list[loop.index - 1].tgroup}">
							<span class="col-sm-5">
								<span class="menu-title font-alt col-sm-3">${row.tgroup} <br> <fmt:formatNumber value="${row.total}" pattern="#,###"/>원
								${row.tdate }</span>
							</span>
						</c:if>
						<span class="menu-title font-alt col-sm-3 font-alt"><a href="../bookdetail?bkno=${row.bkno}">${row.bkname}</a><br>
						<a href="../bookdetail?bkno=${row.bkno}"><img src="/img/bookimg/${row.bkimg }" alt="Blog-post Thumbnail"/></a><br>
						<fmt:formatNumber value="${row.bkprice}" pattern="#,###"/>원<br>
						${row.tamount}개</span>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
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
</body>
</html>