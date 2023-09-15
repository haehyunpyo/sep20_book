<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function purchase() {
    if (confirm("결제하시겠습니까?")) {
     
     
        showPaymentConfirmation();
        
    } else {
    	
    	 return false;
    }
}

function showPaymentConfirmation() {
    
    var confirmationForm = document.createElement("div");
    confirmationForm.innerHTML = "<p style='font-size: 24px;text-align:center;'>${sessionScope.mname}님&nbsp결제가 완료되었습니다!</p>";

    
    confirmationForm.style.position = "fixed";
    confirmationForm.style.top = "30%";
    confirmationForm.style.left = "50%";
    confirmationForm.style.width = "50%";
    confirmationForm.style.transform = "translate(-50%, -50%)";
    confirmationForm.style.backgroundColor = "#fff";
    confirmationForm.style.padding = "20px";
    confirmationForm.style.border = "3px solid #212121"; 

    

   
    document.body.appendChild(confirmationForm);

  
    setTimeout(function() {
        document.body.removeChild(confirmationForm);
        
      
        setTimeout(function() {
            document.getElementById("purchaseForm").submit();
        }, 1000);
    }, 1000);
}

</script>







<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/purchase.css">
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
<%@ include file="menu.jsp"%>
	

	<h1 class="tran">결제페이지</h1>
    <div>
	<div class="kakao">
		<div class="wkakao module-title font-alt">결제 QR 코드 스캔</div>
	<div class="kakaopic"><img src="img/transaction/kakao.png" alt="kakao transaction" /></div>
	</div>
<div class="qr">
		<img src="img/transaction/qr.png" alt="kakao transaction" class="qrimg" />
		<div class="scan">QR코드는 한번만 스캔 할수있습니다.</div>
		</div>

</div>



		<form action="./purchase" method="post" id="purchaseForm">
	<div class="content">
		<h1 class="info">주문정보</h1>
		<div class= flex>
		<table class="table table-dark table-hover table-striped dtable">
			<thead class="dhead">
				<tr class="row">
					<th>책번호</th>
					<th>아이디</th>
					<th>책이름</th>
					<th>갯수</th>
					<th>책가격</th>
					<th>금액</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${map}" var="row">
					<tr class="row">
						<td>${row.rownum }</td>
						<td>${row.mid}</td>
						<td>${row.bkname }</td>
						<td>${row.amount }</td>
						<td>${row.price}</td>
						<td>${row.total}</td>

					</tr>
					
				</c:forEach>
				
			</tbody>
			
		</table>

			<c:forEach items="${map}" var="item">

		 <c:set var="sum" value="${sum + item.total}" />
										</c:forEach>
		
		
		

<table class="table table-striped table-border checkout-table">
									<tbody class="asum">

										<c:forEach items="${cart}" var="item">

											<c:set var="sum" value="${sum + item.total}" />
										</c:forEach>

                                        <tr>
											<th class="tr">결제</th>
											<td>Kakao Pay</td>
										</tr>
                                        
										<tr>
											<th class="tr">주문금액</th>
											<td><c:out value="${sum}"/>원</td>
										</tr>
										<tr>
											<th class="tr">배송비</th>
											<td>2000원</td>
										</tr>
										<tr class="shop-Cart-totalprice">



											<th class="tr">결제총액</th>
											<td><c:out value="${sum+2000}" />원</td>
										</tr>
									</tbody>
								</table>
								 <input type="hidden" name="sum" value="${sum+2000}">
								</div>
									


	
	
	<div>
		<button type="button" class="btn btn-round btn-g"
			onclick="location.href='./cart'" id="npurchaseForm" onclick="npurchase()">결제취소</button>
			
			
	
			
		<button type="button" class="btn btn-secondary btn-d"  onclick="purchase()">결제하기</button>
			
	</div>
	
	
	
	</div>

			</form>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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