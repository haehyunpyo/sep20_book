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
<title>회원정보</title>
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
						<h1 class="module-title font-alt">회원정보 수정</h1>
					</div>
				</div>
			</div>
		  <div class="container">
            <div class="row">
            	<c:if test="${param.error eq 'empty' }">
            		<div class="col-sm-8 col-sm-offset-3">
            			<h3>회원정보를 수정할 생각이 없으시다면 다른 페이지로 가세요.</h3>
            		</div>
            	</c:if>
            </div>
           </div>
          <div class="container">
            <div class="row">
            <form action="./infoChange" method="post" class="row" onsubmit="return validateForm()">
              <div class="col-sm-8 col-sm-offset-2">
                  <div class="form-group">
                    아이디 : <p style="display: inline" id="name" class="menu-title">${info.mid}</p>
                    <div>
                    	<input name="id" id="id" class="menu-title" type="text" placeholder="아이디"/>
                    	<input name="idchk" id="idchk" class="menu-title" type=button value="아이디 중복 확인"/>
                    	&nbsp;<span style="color: red;" id="idchkMsg"></span>
                    	<input id="idchkhidden" type="hidden"></input>
                  	</div>
                  </div>
                  <div class="form-group">
                    새 비밀번호  <input name="pw" style="width: 300px;" class="menu-title" id="pw" type="password" placeholder="새 비밀번호를 입력해주세요."/>
                  </div>
                  <div class="form-group">
                    비밀번호 확인  <input style="width: 300px;" class="menu-title input-sm" id="pwchk" type="password" placeholder="새 비밀번호를 한 번 더 입력해주세요."/>
                  	&nbsp;<span style="color: red;" id="pwchkMsg">비밀번호와 일치하지 않습니다.</span>
                  </div>
                  <div class="form-group">
                    이름 : <p style="display: inline" id="name" class="menu-title">${info.mname}</p>
                  </div>
                  <div class="form-group">
                  	주소 :
                  	<p style="display: inline" class="menu-title">${info.maddr}</p>
                  	<div>
	                  	<input name="postcode" class="menu-title" type="text" id="postcode" placeholder="우편번호">
						<input class="menu-title" type="button" onclick="addrChange()" value="우편번호 찾기"><br>
						<input name="address" class="menu-title" type="text" id="address" placeholder="주소"><br>
						<input name="detailAddress" class="menu-title" type="text" id="detailAddress" placeholder="상세주소">
						<input name="extraAddress" class="menu-title" type="text" id="extraAddress" placeholder="참고항목">
                    </div>
                  </div>
                  <div class="form-group"> 전화번호 (숫자만 입력하세요.)
                      <div class="detail">
                      <input class="menu-title" type="text" id="phone" placeholder="${info.mphone }">
						<input class="btn" type="button" id="phoneChk" value = "인증번호 받기">	
						<br><br>
						<input class="menu-title" id="phone2" type="text" disabled required/>
						<input class="btn" type="button" id="phoneChk2" value = "본인인증" disabled="disabled">
						<div><span style="color: red;" class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span></div>
						<input type="hidden" id="phoneDoubleChk"/>
					</div>
                  </div>
                  <div class="form-group">
                    생년월일 : <p style="display: inline" class="menu-title">${info.mbirth}&nbsp;</p>
				      <div><input name="birth" id="birth" type="date" min="1900-01-01"></div>
                  </div>
				<div class="form-group">
                  	이메일 : <p style="display: inline" class="menu-title">${info.memail}&nbsp;</p>
                  	<div class="form-group divEmail"  id="divEmail">
					<span class="form-group"><input type="text" id="emailId" name="emailId"/></span>
					<span class="at">@</span>
					<span class="menu-title">
	                  	<select id="selectEmailDomain" name="selectEmailDomain">
							<option selected="selected" value="naver.com">naver.com</option>
							<option value="kakao.com">kakao.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="5">직접 입력</option>
						</select>
					</span>
					<!-- 직접 입력시 노출 -->
					<input type="text" id="emailDomain" name="emailDomain" class="emailInput" value="" style="display: none"/>
					<div>
                    	<input name="emailchk" id="emailchk" class="menu-title" type=button value="이메일 중복 확인"/>
                    	&nbsp;<span style="color: red;" id="emailchkMsg"></span>
                    	<input id="emailchkhidden" type="hidden"></input>
                  	</div>
                  </div>
              	</div>
                  <hr>
                  <button type="submit" class="btn infobtn">회원정보 변경</button>
              	</div>
		    </form>
            </div>
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
	<!-- 도로명 주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
    function addrChange() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    
 	// 아이디 중복 검사(form 유효성 검사 안으로 들어가면 작동안함)
    var isIdChecked = false; // ID 중복 확인 여부를 저장하는 변수
  	$(document).on('click', '#idchk', function() {
  		var id = $('#id').val();
  		$.ajax({
				url : './idchk?id=' + id,
				type : 'post',
				dataType: 'json',
				success: function(data){
					if(data.count >= 1){
						$('#id').val('');
						$('#id').focus();
						$('#idchkMsg').text('중복된 아이디가 있습니다. 다시 적으세요.').css('color', 'red');
						isIdChecked = false;// 중복된 경우 isIdChecked를 false로 설정
					} else {
						$('#idchkMsg').text('사용가능한 아이디입니다.').css('color', 'green');
						 isIdChecked = true;// 중복되지 않은 경우 isIdChecked를 true로 설정
					}
				},
				error: function(error){
					alert('에러');
				}
			});
  		});
    	
    	// 이메일 중복 검사(form 유효성 검사 안으로 들어가면 작동안함)
    	var isEmailChecked = false; // ID 중복 확인 여부를 저장하는 변수
	  	$(document).on('click', '#emailchk', function() {
	    	var emailId = $('#emailId').val();
	    	var emailDomain = $('#selectEmailDomain').val(); // 도메인 값 업데이트
	 		if(emailDomain == '5'){
	 			emailDomain = $('#emailDomain').val();
			}
	    	var email = emailId +'@'+ emailDomain;
	  		$.ajax({
					url : './emailchk?email=' + email,
					type : 'post',
					dataType: 'json',
					success: function(data){
						if(data.count >= 1){
							$('#emailId').val('');
							$('#emailId').focus();
							$('#emailchkMsg').text('중복된 이메일이 있습니다. 다시 적으세요.').css('color', 'red');
							isEmailChecked = false;
						} else {
							$('#emailchkMsg').text('사용가능한 이메일입니다.').css('color', 'green');
							isEmailChecked = true;
						}
					},
					error: function(error){
						alert('에러');
					}
				});
	  		});
    	
    	// 비밀번호 입력 필드의 값이 변경될 때 확인
        $(document).on('input', '#pw', function() {
            checkPw();
        });

        // 비밀번호 확인 필드의 값이 변경될 때 확인
        $(document).on('input', '#pwchk', function() {
            checkPw();
        });
		
     	// pw와 pwchk 비교
        function checkPw() {
     		// 여기에 pw, pwchk를 안쓰면 처음 쓴 값으로 고정된다.
        	var pw = $('#pw').val();
            var pwchk = $('#pwchk').val();
            if (pw === pwchk) {
                $('#pwchkMsg').text('비밀번호와 일치합니다.').css('color', 'green');
            } else {
                $('#pwchkMsg').text('비밀번호와 일치하지 않습니다.').css('color', 'red');
            }
        }
     	
     	// form 유효성 검사
        function validateForm() {
            var id = $('#id').val();
            var pw = $('#pw').val();
            var pwchk = $('#pwchk').val();
            var birth = $('#birth').val();
            var postcode = $('#postcode').val().trim();
            var address = $('#address').val().trim();
            var detailAddress = $('#detailAddress').val().trim();
            var extraAddress = $('#extraAddress').val().trim();
            var email = $('#emailId').val();

            // id 길이
            if (id.length > 0 && id.length < 4) {
                alert('올바른 아이디를 입력하세요.');
                $('#id').focus();
                return false;
            }
			// pw 길이
            if (pw.length > 0 && pw.length < 4) {
                alert('올바른 비밀번호를 입력하세요.');
                $('#pw').focus();
                return false;
            }
			// pw, pwchk 비교
            if (pw !== pwchk) {
                alert('비밀번호 확인 칸을 다시 작성하세요.');
                $('#pwchk').focus();
                return false;
            }

            // 주소의 모든 값이 있거나 모든 값이 없을 때만 @controller로 간다.
            const isAllEmpty = postcode === '' && address === '' && detailAddress === '' && extraAddress === '';
            const isAllFilled = postcode !== '' && address !== '' && detailAddress !== '' && extraAddress !== '';

            if (!(isAllEmpty || isAllFilled)) {
                alert('주소를 전부 입력하세요.');
                return false;
            }
            
	          // 모든 입력 값이 하나라도 비어있는 경우
	          if(!(postcode === '' && address === '' && detailAddress === '' && extraAddress === '')){
		          if (postcode === '' || address === '' || detailAddress === '' || extraAddress === '') {
		          	alert('주소를 전부 입력해주세요.');
		          	return false;
		          }
	          }
	          
	          // 전부 입력 안됐을 때
	          if(postcode === '' && address === '' && detailAddress === '' && extraAddress === '' &&
	        		id === '' && pw === '' && birth === '' && email === ''){
	        	  alert('회원정보를 수정할 생각이 없으시다면 다른 페이지로 가세요.');
	        	  return false;
	          }
	          
	          // ID 중복 확인을 하지 않은 경우
	          if (id != '' && !isIdChecked) {
	              alert("ID 중복 확인을 해주세요.");
	              return false; // 폼 제출 중지
	          }
	          
	          // 이메일 중복 확인을 하지 않은 경우
	          if (email != '' && !isEmailChecked) {
	              alert("이메일 중복 확인을 해주세요.");
	              return false; // 폼 제출 중지
	          }
	          
            // 위의 유효성 검사를 모두 통과하면 true를 반환하여 폼 제출을 허용
            return true;
        }
     	
	    // 이메일 사용자 지정
   		var emailDomain = $('#selectEmailDomain').val();
    	$(document).on('change', '#selectEmailDomain', function(){
    		var selectedValue = $(this).val();
    		if(selectedValue == '5'){
    			$('#emailDomain').css('display', 'inline');
    			selectedValue = $('#emailDomain').val();
    		}
    	});
    	
     	// form으로 보낼 때 이메일 도메인 체크(동적으로)
     	$(document).on('click', '.infobtn', function(){
     		var emailDomain = $('#selectEmailDomain').val(); // 도메인 값 업데이트
     		if(emailDomain == '5'){
     			emailDomain = $('#emailDomain').val();
    		}
            // 도메인 검사 로직 추가
            if (!isValidDomain(emailDomain)) {
                alert("올바른 이메일 도메인을 입력해주세요.");
                return false;
	        }
     	});
     	
     	// 올바른 이메일 도메인 검사 함수
        function isValidDomain(domain) {
            var validDomains = ['com', 'net', 'org', 'gov', 'co', 'io', 'edu'];
            var domainParts = domain.split('.');
            if (domainParts.length === 2 && validDomains.includes(domainParts[1])) {
                return true;
            }
            return false;
        }
    
    
</script>
	
	<script type="text/javascript">
	$(function(){
		// 오늘 이후 선택이 안되게 함
		var now_utc = Date.now()// 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000;// 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		// document.getElementById("birth").setAttribute("max", today);
		$("#birth").attr("max", today);
	});
	</script>
	
	<script type="text/javascript">
	$(function(){
		 //휴대폰 번호 인증
		   $(document).on("click", "#phoneChk", function() {
		   	var phone = $("#phone").val().trim();
		   	if (!strToInt(phone)) {
	            return; // 숫자로 변환되지 않으면 함수 종료
	        }
		   	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주세요.");
		   	$.ajax({
		           type:"post",
		           url:"phoneCheck",// "phoneCheck?phone=" + phone하려면 밑에 data를 빼야함
		           data:{phone:phone},
		           success:function(data){
		        	    alert(data);
		           	    update();
		           		var clickCnt = 0;
		           	 $(document).on("click", "#phoneChk2", function() {
		           		if(data == $("#phone2").val().trim()){
		           			alert("본인 인증이 확인되었습니다.");
		           			$("#phoneChk2").attr("disabled",true);
		           			$("#phoneChk2").css("background-color",'green');
		           			$.ajax({
		           			   type:"post",
		     		           url:"phoneSave",
		     		           data:{phone:phone},
		     		           success:function(data){
		     		        	   location.href="./info";
		     		           }, error:function(error){
		     		        	   alert('에러');
		     		           }
		           			});
		           		} else if (clickCnt < 5){
		           			alert("인증 번호가 틀렸습니다. 다시 시도하세요.");
		           		} else if(clickCnt >= 5){
		           			alert("인증 번호를 다시 받으세요.");
		           			location.href = "./info";
		           		}
		           		clickCnt++;
		           	 });
	           		},
	           		error:function(error){
	           			alert("에러");
	           		}
		       });
		  });
	});
	
	function strToInt(str) {
		if(str.length > 11 || str.length < 10){
			alert("다시 입력하세요...");
			return false;
		}
		
	    for (let i = 0; i < str.length; i++) {
	        if (isNaN(parseInt(str[i]))) {
	            // 숫자가 아닌 문자가 중간에 포함된 경우
	            alert("숫자만 입력하세요...");
	            return false;
	        }
	    }
	    // 숫자로만 이루어진 문자열을 정수로 변환하여 반환
	    return parseInt(str);
	}
	
	function update(){
		$("#phone2").attr("disabled",false);
   		$("#phone2").attr("placeholder","인증번호를 입력하세요...");
   		$("#phoneChk").attr("disabled",true);
   		$("#phoneChk2").attr("disabled",false);
   		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
   		$(".successPhoneChk").css("color","green");
   		$("#phone").attr("readonly",true);
	}
	</script>
</body>
</html>