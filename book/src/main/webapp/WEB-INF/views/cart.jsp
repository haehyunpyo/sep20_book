<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

//select 요소를 가져옵니다.
$(function(){
  $("#coopang").click(function(){ 
    let coopang = $(".selectMail").val();
    
    alert(coopang + "이 적용되었습니다.");
  //  let price = 0.9*parseInt($(".").text());
    let sumtotal = 0.9*parseInt($(".sumtotal").text());
    let mtotal =sumtotal + 2000;
    let cartno = $(".cartno").text();
   alert(cartno);
    if (coopang === '웰컴 10%할인쿠폰') {
    	   $.ajax({
               url : "./coupon",
               type : "post",
               data : {"sumtotal":sumtotal},
               dataType : "json",
               success : function(data) {	
    


	document.location.href = document.location.href;
    }
               
               });
    }
  });
});





    $(function(){
	$("#tbtn").click(function(){
		let stock =  $("#mtotal").val();
		if(stock =="2000"){
			alert("장바구니에 재고가 없습니다.");
		    location.href = './booklist';
			
		}else{
		//위 두 검사가 성공한다면 form전송하기
			if(confirm("결제페이지로 이동하겠습니까?")){
				location.href="./purchase";
			}
		}
	});
});    
 

 
 
$(function(){
 
$(".pr-remove").click(function(){
	 	let cartno = $(this).parents(".seed").siblings(".cartno").text();
	 	let tree = $(this).parents(".tree");
	    let mod = parseInt($(this).siblings(".mod").val());
	    let amount = parseInt($(this).parents(".seed").siblings(".amount2").text());

 	if (mod > amount) {
	    alert("입력값이 현재 담은수를 초과합니다.");
	return false;  
 	} else { 
	if(confirm("취소하시겠습니까?")){
		 
	 	
	
		$.ajax({
			url:"./delete",
			type: "get",
			data: {cartno: cartno, mod: mod},
			dataType: "json",
			success:function(data){
				if(data.result == 1) {
				
					
					
					if(amount==mod){
						
						tree.remove();
						document.location.href = document.location.href;
					}
					else{
						document.location.href = document.location.href;
					}
					
				}else{
					alert("삭제실패");
				}
			}
		});
	}
	  }
});
});
 
 
 

</script>

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
</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<%@ include file="menu.jsp"%>
	<main>
      <div class="main">
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h1 class="module-title font-alt">장바구니</h1>
						</div>
					</div>
					<hr class="divider-w pt-20">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-border checkout-table">
								<tbody>
									<tr>
										<th class="hidden-xs">Item</th>
										<th>Description</th>
										<th class="hidden-xs">Price</th>
										<th>Quantity</th>
										<th>Total</th>
										<th>Remove</th>
									</tr>
									<c:forEach items="${cart}" var="row">
                               <!-- <form action="./check" method="post"> -->

										<c:if
											test="${not empty row.bkimg and not empty row.bkscontent and not empty row.price and not empty row.amount and not empty row.total}"> --%>
											<tr class="tree">
												<td class="hidden-xs" style="width: 20%;"><a href="#"><img
														src="${row.bkimg}" alt="책사진" width="200" height="300" /></a></td>
												<td style="width: 30%;">
													<h5 class="product-title font-alt">${row.bkscontent}</h5>
												</td>
												<td class="hidden-xs">
													<h5 class="product-title font-alt" id="tprice">${row.price}원</h5>
												</td>
												<td class="amount2">${row.amount}</td>
												<td hidden="hidden" class="cartno">${row.cartno}</td>
												<td>
													<h5 class="product-title font-alt">${row.total}원</h5>
												</td>
												<td class="seed"><input id="myInput" class="mod" type="number" name="mod"  min="1" max="${row.amount }" required="required"><button class="pr-remove" type="button" style="margin: 3px;">담기 취소</button></td>

											</tr>
										</c:if>

                                   <!--</form> -->
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3" id="fren">
							<div class="form-group">
								 <select class="selectMail" id="selectBox" name="selectBox">
						<option id="Opt">-쿠폰선택-</option>
						<c:forEach items="${coupon}" var="row">
						
						<option id="coupons" value="${row.cocontent }">${row.cocontent }</option>
						
					</c:forEach>
					</select> 
								<!-- <input class="form-control" type="text"  id="selectedValue" value="" readonly /> -->
							</div>
							
						</div>
						<div class="col-sm-3" id="papa">
							<div class="form-group">
							
						<button class="btn btn-block btn-round btn-c pull-right" type="button" id="coopang">쿠폰적용</button>
					
					
							</div>
						</div>
						<div class="col-sm-3 col-sm-offset-3">
							<div class="form-group">
								<button class="btn btn-block btn-round btn-d pull-right"
									type="submit" onclick="location.href='/booklist';">책
									진열대로 돌아가기</button>
							</div>
						</div>
					</div>
					<hr class="divider-w">
					<div class="row mt-70">
						<div class="col-sm-5 col-sm-offset-7">
							<div class="shop-Cart-totalbox">
							<!--  <form action="./purchase" method="post"> -->
								<h4 class="font-alt">Cart Totals</h4>
								<table class="table table-striped table-border checkout-table">
									<tbody>






										<c:forEach items="${cart}" var="item">

											<c:set var="sum" value="${sum + item.total}" />
										</c:forEach>



										<tr>
											<th>금액</th>
											<td class="sumtotal"><c:out value="${sum}"/>원</td>
										</tr>
										<tr>
											<th>배송비</th>
											<td>2000원</td>
										</tr>
										<tr class="shop-Cart-totalprice">



											<th>총액</th>
											<td class="mtotal"><c:out value="${sum+2000}" />원</td>
										</tr>
									</tbody>
								</table>
								 <input type="hidden" id="mtotal" name="sum" value="${sum+2000}">
						
								<button class="btn btn-lg btn-block btn-round btn-d" id="tbtn"
									type="button" >결제하기</button>
							<!-- </form> --> 
							</div>
						</div>
						
					</div>
				</div>
			</section>
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
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	
	<script src="assets/lib/jquery/dist/jquery.js"></script>
	<script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/lib/wow/dist/wow.js"></script>
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="assets/lib/smoothscroll.js"></script>
	<script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>