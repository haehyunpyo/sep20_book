<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>FindUser</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="assets/images/favicons/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
	<link href="../css/finduser.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
	<link href="../css/login.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="./js/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
		
	$(function(){
		
		// 아이디찾기
		$("#fidbtn").click(function(){
			
			let check = true;
			let mname = $("#fname").val();
			let memail = $("#femail").val();

			if(mname == null || mname == ""){
				Swal.fire("이름을 입력하세요");
				$("#fname").focus();
			} 
			else {
				memail = checkmail(check);
				alert(memail);
				
			$.ajax({
				url : "./findId",
				type : "post",
				data : {mname : mname, memail : memail},
				dataType : "json",
				success : function(data) {
					
					if(data.count == 1){
						
			            let yourIdDiv = $("<div>").attr("id", "yourId").text("Your ID: " + data.mid);
			            $(".tab-content").hide(); 		// 모든 .tab-content 요소 숨기기
			            $("body").append(yourIdDiv); 	// 페이지에 추가
			            yourIdDiv.show(); 				// 생성한 요소 표시
			            
					} else {
						Swal.fire("입력한 정보를 다시 확인해주세요")
					}
					
				},
				error : function(error) {
					alert("에러발생");
				}
				
			});
		
			}
		});
		
		
		$("#fpwbtn").click(function(){
			
			let check = true;
			let mid = $("#fid").val();
			let memail = $("#femail2").val();

			if(mid == null || mid == ""){
				Swal.fire("아이디를 입력하세요");
				$("#fid").focus();
			} 
			else {
				memail = checkmail2(check);
				//alert(memail);
				
				$.ajax({
					url : "./findPW",
					type : "post",
					data : {mid : mid, memail : memail},
					dataType : "json",
					success : function(data) {
						 if(data.changepw == 1){
							let isconfirm = confirm("비밀번호 수정 페이지로 이동합니다.")
							if(isconfirm){
								let user = data.mid;
								console.log(typeof user);
								url = '/changepw?user=' + encodeURIComponent(user);
								window.open(url, '_blank', 'width=700, height=500');
							} else {
								 alert('취소되었습니다.');
							}
						} else {
							alert("올바른 정보를 입력해주세요")
						}
					},
					error : function(error) {
						alert("에러발생");
					}
					
				});
				
			}
			
		});
		
		
	});

	
	// 이메일 입력값 검사(비밀번호)
	function checkmail2(check){
		
		// 메일주소검사
     	let Fmail = $("#femail2").val(); 						 // 앞부분
     	let option = $("#selectBox2 option:selected").val();      // 뒷부분(선택한 메일주소값)
     	let Final="";											 // 최종메일주소(리턴값)
		
     	if(Fmail != null && Fmail != ""){
     		
				let items = option.slice(1).split(".");	
				let first = items[0];	// hanmail
				let second = items[1];	// net
				
				// 메일주소 앞부분 입력값검사
				let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
				let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
			
				if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
					Fmail = Fmail.replace(replaceKorean, "").replace(replaceChar, "");
					Swal.fire("올바른 메일주소를 입력해주세요")		// 정규식검사
					$("#femail2").val("");
					$("#Opt2").prop("selected", true);
					return false; 
				}
				
				if(option == "-선택-"){
					Swal.fire("올바른 메일주소를 입력해주세요(뒤)");	// 뒷메일주소
					return false; 
			     }
				
				Final = Fmail + "@" + first + "." + second;
				
			} else {
				Swal.fire("올바른 메일주소를 입력해주세요(앞)");	// 앞메일주소
				return false; 
			} 
		
		return Final;
	}
	
	// 이메일 입력값 검사(아이디)
	function checkmail(check){
		
		// 메일주소검사
     	let Fmail = $("#femail").val(); 						 // 앞부분
     	let option = $("#selectBox option:selected").val();      // 뒷부분(선택한 메일주소값)
     	let Final="";											 // 최종메일주소(리턴값)
		
     	if(Fmail != null && Fmail != ""){
     		
				let items = option.slice(1).split(".");	
				let first = items[0];	// hanmail
				let second = items[1];	// net
				
				// 메일주소 앞부분 입력값검사
				let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
				let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
			
				if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
					Fmail = Fmail.replace(replaceKorean, "").replace(replaceChar, "");
					Swal.fire("올바른 메일주소를 입력해주세요")
					$("#femail").val("");
					$("#Opt").prop("selected", true);
					return false; 
				}
				
				if(option == "-선택-"){
					Swal.fire("올바른 메일주소를 입력해주세요");
					return false; 
			     }
				
				Final = Fmail + "@" + first + "." + second;
				
			} else {
				Swal.fire("올바른 메일주소를 입력해주세요");
				return false; 
			} 
		
		return Final;
	}

	</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	
	<div id="tabBox">
		<ul id="nav" class="nav nav-tabs font-alt" role="tablist">
			<li id="IDli" class="active"><a href="#findID" data-toggle="tab">아이디찾기</a></li>
			<li id="PWli"><a href="#findPW" data-toggle="tab">비밀번호찾기</a></li>
		</ul>
	</div>

	<div class="row mb-20" id="fContainer">
	
		<div class="tab-content">
		
			<div class="tab-pane active" id="findID">
				<div class="col-sm-6 mb-sm-20" id="fidBox">
					<input class="form-control input-lg" type="text" name="mname" id="fname" max="20" min="1" required placeholder="이름" /> 
					<div class="emailBox">
						<input class="form-control input-lg" type="email" id="femail"  max="20" min="1" required placeholder="이메일" /> 
						<select class="form-control input-lg selectMail" id="selectBox" name="selectBox">
							<option id="Opt">-선택-</option>
							<option id="naver" value="@naver.com">@naver.com</option>
							<option id="gmail" value="@gmail.com">@gmail.com</option>
							<option id="hanmail" value="@hanmail.net">@hanmail.net</option>
							<option id="kakao" value="@kakao.com">@kakao.com</option>
						</select>
						<input type="hidden" name="memailF" id="memailF"/>
					</div>
					<div class="col-sm-10" id="fidbtnBox">
						<button type="button" id="fidbtn">아이디찾기</button>
					</div>
				</div>
			</div>
			
			<div class="tab-pane" id="findPW">
				<div class="col-sm-6 mb-sm-20" id="fpwBox">
					<input class="form-control input-lg" type="text" name="mid" id="fid" max="40" min="1" required placeholder="아이디"/>
					<div class="emailBox">
						<input class="form-control input-lg" type="email" id="femail2"  max="20" min="1" required placeholder="이메일" /> 
						<select class="form-control input-lg selectMail" id="selectBox2" name="selectBox">
							<option id="Opt2">-선택-</option>
							<option id="naver2" value="@naver.com">@naver.com</option>
							<option id="gmail2" value="@gmail.com">@gmail.com</option>
							<option id="hanmail2" value="@hanmail.net">@hanmail.net</option>
							<option id="kakao2" value="@kakao.com">@kakao.com</option>
						</select>
						<input type="hidden" name="memail" id="memailF2"/>
					</div>
					<div class="col-sm-10" id="fpwbtnBox">
						<button type="button" id="fpwbtn">비밀번호찾기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
    
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
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>