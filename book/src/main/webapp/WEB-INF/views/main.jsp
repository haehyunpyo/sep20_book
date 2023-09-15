<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->
<title>우리동네 | 동네북</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="assets/images/favicons/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    -->
<!-- Default stylesheets-->
<link href="assets/lib/bootstrap/dist/css/bootstrap.min.css"
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
<link href="assets/lib/animate.css/animate.css" rel="stylesheet">
<link href="assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
<link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="assets/css/colors/default.css"
	rel="stylesheet">

<link href="../css/main.css" rel="stylesheet">

<script type="text/javascript">
	
</script>
<style type="text/css">


</style>
<!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->

</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<%@ include file="menu.jsp"%>
	<main>
		<div class="main">
			<section class="module-small" style="margin-bottom: -3%">
			</section>
			<div class="welcome_banner_inner">
				<div class="swiper-container">
					<ul class="swiper-wrapper">
						<li class="swiper-slide" style="margin-left: 13%; width: 90%;">
							<div class="owl-carousel" data-items="1" data-pagination="false" data-navigation="false">
						<c:forEach items="${bannerlist }" var="row">
							  <div class="owl-item">
							   <span class="banner_title">
								${row.batext }
							   </span> 
									<div class="col-sm-12">
										<img src="../img/banner/${row.baimg }" alt="배너이미지"/>
									</div>
								</div>
							</c:forEach>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<hr class="divider-w">
<%-- 			<section class="module-small">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">베스트셀러</h2>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5"
							data-pagination="false" data-navigation="false">
							<c:forEach items="${booktop }" var="row" varStatus="loop">
								<div class="owl-item">
									<div class="col-sm-12">
										<div class="ex-product">
											<span class="bestnumber">${loop.index + 1}</span> <a
												href="./bookdetail?bkno=${row.bkno}"><img
												src="/img/bookimg/${row.bkimg}" alt="Leather belt" /></a>
											<h4 class="shop-item-title font-alt">
												<a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a>
											</h4>
											<fmt:formatNumber value="${row.bkprice}" pattern="#,###" />
											원
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section> --%>
			
	    <section class="module-small">
          <div class="container" style="width: 98%">
            <div class="row">
  <!--  ----------- 왼쪽 사이드바 ------------------------------------------------------------------ -->
              <div class="col-sm-1 col-md-1 sidebar" style="background-color: #f5faf2; border-radius:20px;">

                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-3.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Eco bag Mockup</a></div>
                        <div class="widget-posts-meta">21 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Bottle Mockup</a></div>
                        <div class="widget-posts-meta">2 March</div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Tag</h5>
                  <div class="tags font-serif"><a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a href="#" rel="tag">Video</a><a href="#" rel="tag">Image</a><a href="#" rel="tag">Minimal</a><a href="#" rel="tag">Post</a><a href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a href="#" rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a href="#" rel="tag">Popular</a><a href="#" rel="tag">English</a>
                  </div>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Text</h5>The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
 <!--  ----------- 중앙 본문 ------------------------------------------------------------------ -->
              <div class="col-sm-8 col-sm-offset-1" >
              <div class="container">
					<div class="row">
					   <div class="col-sm-12">
					   <img src="../img/page/ad1.png"  style="width:560px; height: 170px; border-radius:20px;"/>
					   <img src="../img/page/ad2.png"  style="width:560px; height: 170px; border-radius:20px; margin-left: 15px;"/>
					   </div>			   
					</div>
					
					<div class="row"  style="background-color: #f2f2f2; border-radius:20px; margin-top: 5%;">
					<div class="row" style="width: 90%; margin-left: 50px;">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="best-title" style="margin-top: 35px;margin-bottom: 35px;">이달의 베스트셀러</h3>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
							<c:forEach items="${booktop }" var="row" varStatus="loop">
								<div class="owl-item">
									<div class="col-sm-12">
										<div class="ex-product">
											<span class="bestnumber">${loop.index + 1}</span> <a
												href="./bookdetail?bkno=${row.bkno}"><img
												src="/img/bookimg/${row.bkimg}" alt="Leather belt" /></a>
											<h4 class="shop-item-title font-alt">
												<a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a>
											</h4>
											<fmt:formatNumber value="${row.bkprice}" pattern="#,###" />
											원
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						</div>
					</div>
					</div>
					
					<div class="row"  style="background-color: #f2f2f2; border-radius:20px; margin-top: 5%;">
					<div class="row" style="width: 90%; margin-left: 50px;">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="best-title" style="margin-top: 35px;margin-bottom: 35px;">급상승! 많이 보고 있는 책 </h3>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
							<c:forEach items="${bookrtop }" var="row" varStatus="loop">
								<div class="owl-item">
									<div class="col-sm-12">
										<div class="ex-product">
											<span class="bestnumber">${loop.index + 1}</span> <a
												href="./bookdetail?bkno=${row.bkno}"><img
												src="/img/bookimg/${row.bkimg}" alt="Leather belt" /></a>
											<h4 class="shop-item-title font-alt">
												<a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a>
											</h4>
											<fmt:formatNumber value="${row.bkprice}" pattern="#,###" />
											원
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						</div>
					</div>
					</div>
					</div>
					
					
				  <div class="row"  style="background-color: #f5faf2; border-radius:20px; margin-top: 5%;">
					<div class="row" style="width: 90%; margin-left: 50px;">
					<div class="row">
						<div class="col-sm-12">
							<h3 class="best-title" style="margin-top: 35px;margin-bottom: 35px;">안녕하세요 망곰님 대여중인 책이 있습니다.</h3>
						</div>
					</div>
					<div class="row">
											<div class="shop-item">
												<div class="shop-item-image">
													<img style="height: 418px;" src="/img/bookimg/bk5.jpg"/>
													<div class="shop-item-detail">
														<a class="btn btn-round btn-b"
															href="./bookdetail?bkno=5"> 상세보기</a><br>
													</div>
												</div>
												<h3 class="shop-item-title font-alt"><a href="./bookdetail?bkno=5">1Q84 1</a>
												</h3>
												<a href="./booklist?searchN=write&searchV=무라카미 하루키"><h6>무라카미 하루키</h6></a>
											</div>
										</div>
					</div>
					</div>
					
					
					
                </div>
              
   <!--  ----------- 오른쪽 사이드바 ------------------------------------------------------------------ -->
              <div class="col-sm-1 col-md-1 col-md-offset-1 sidebar" style="background-color: #f5faf2; border-radius:20px;">
                <div class="widget">
                  <form role="form">
                    <div class="search-box">
                      <input class="form-control" type="text" placeholder="Search..."/>
                      <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                  </form>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-3.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Eco bag Mockup</a></div>
                        <div class="widget-posts-meta">21 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Bottle Mockup</a></div>
                        <div class="widget-posts-meta">2 March</div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Tag</h5>
                  <div class="tags font-serif"><a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a href="#" rel="tag">Video</a><a href="#" rel="tag">Image</a><a href="#" rel="tag">Minimal</a><a href="#" rel="tag">Post</a><a href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a href="#" rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a href="#" rel="tag">Popular</a><a href="#" rel="tag">English</a>
                  </div>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Text</h5>The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
            </div>
            </div>
          </section>

			<!-- --------------------------------------------------- 하단 풋---------------------------------------------------------------- -->
			<div class="module-small bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">About Titan</h5>
								<p>The languages only differ in their grammar, their
									pronunciation and their most common words.</p>
								<p>Phone: +1 234 567 89 10</p>
								Fax: +1 234 567 89 10
								<p>
									Email:<a href="#">somecompany@example.com</a>
								</p>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Recent Comments</h5>
								<ul class="icon-list">
									<li>Maria on <a href="#">Designer Desk Essentials</a></li>
									<li>John on <a href="#">Realistic Business Card Mockup</a></li>
									<li>Andy on <a href="#">Eco bag Mockup</a></li>
									<li>Jack on <a href="#">Bottle Mockup</a></li>
									<li>Mark on <a href="#">Our trip to the Alps</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Blog Categories</h5>
								<ul class="icon-list">
									<li><a href="#">Photography - 7</a></li>
									<li><a href="#">Web Design - 3</a></li>
									<li><a href="#">Illustration - 12</a></li>
									<li><a href="#">Marketing - 1</a></li>
									<li><a href="#">Wordpress - 16</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Popular Posts</h5>
								<ul class="widget-posts">
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="assets/images/rp-1.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Designer Desk Essentials</a>
											</div>
											<div class="widget-posts-meta">23 january</div>
										</div>
									</li>
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="assets/images/rp-2.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Realistic Business Card Mockup</a>
											</div>
											<div class="widget-posts-meta">15 February</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr class="divider-d">
			<footer class="footer bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<p class="copyright font-alt">
								&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights
								Reserved
							</p>
						</div>
						<div class="col-sm-6">
							<div class="footer-social-links">
								<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
									class="fa fa-twitter"></i></a><a href="#"><i
									class="fa fa-dribbble"></i></a><a href="#"><i
									class="fa fa-skype"></i></a>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa  fa-chevron-up"></i></a>
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