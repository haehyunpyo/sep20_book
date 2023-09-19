<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js//jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		let check = false;
		let ischeck;
		
		$(".again").hide();
		$(".pass").hide();
	   
	   $("#editbtn").click(function(){
		   
		   	let mpw = $("#mpw").val();
	   		let mpw2 = $("#mpw2").val();
	   		let mid = $("#mid").val();
		   
		   if(mpw != null && mpw2 != null){
	   			
		   		if(mpw != mpw2){
		   			alert("불일치");
		   			return false;
		   		}
		   		if(mpw.length < 3){
		   			alert("더입력해");
		   			return false;
		   		}
		   		
		   	 $.ajax({
                 url : "./editpw",
                 type : "post",
                 data : {"mid" : mid, "mpw" : mpw},
                 dataType : "json",
                 success : function(data) {
        			if(data.result == 1){
        				alert("비밀번호가 변경되었습니다.");
        				window.opener.location.href = "/login";
        				window.close();
        			}
                 },
                 error : function(error) {
                	 
                 }
              });
		   		
	   		} else {
	   			alert('수정할 비밀번호를 입력하세요');
	   		}
		   
   		});
	  

	 });

</script>

<h2>비밀번호 수정페이지</h2>

</head>
<body>
	
	 <div class="container">
		<div class = "pwBox1">
			<input type="password" name="mpw" id="mpw" placeholder="비밀번호 입력"/>
		</div>
		<div class = "pwBox2">
			<input type="password" name="mpw2" id="mpw2" placeholder="비밀번호 확인"/>
		</div>
			<input type="hidden" value="${mid}" name="mid" id="mid"/>
		<div class="check">
			<span class="again">비밀번호가 일치하지 않습니다.</span>
			<span class="pass">비밀번호가 일치합니다.</span>
		</div>
		<div class = "btnbox">
			<button type="submit" id="editbtn">변경</button>
			<button type="button" id="reset">취소</button>
		</div>
	</div>

</body>


</html>