<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type ="text/javascript" src="${ pageContext.request.contextPath }/resources/js/loadingbar.js"> </script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
/* 로딩바스타일 */
	#back{
position: absolute;
z-index: 100;
background-color: #000000;
display:none;
left:100%;
top:100%;
}
#loadingBar{
position:absolute;
left:43%;
top: 25%;
display:none;
z-index:200;
}
</style>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "findpw.do",
				type : "POST",
				data : {
					members_id : $("#id").val(),
					members_email : $("#email").val()
				},
				beforeSend: function () {
					FunLoadingBarStart(); //로딩바 생성펑션
					},
				complete: function () {
					FunLoadingBarEnd(); //로딩바 제거
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 456.3px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>아이디</label>
					<input class="w3-input" type="text" id="id" name="id" placeholder="회원가입한 아이디를 입력하세요" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
				</p>
				<p class="w3-center">
					<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
					<button type="button" onclick="location.href='go_login.do'" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인으로</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>