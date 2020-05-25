<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Refresh" content="3;url=./login">
<title>회원가입 성공</title>
<script type="text/javascript">
	
</script>
</head>

<body>
	<div style="text-align: center;">
		<h1 style="color: #DAA520;">회원가입을 축하드립니다 >___________<</h1>
		<h1 style="color: #DAA520;">3초후 로그인 페이지로 이동됩니다</h1>
	</div>

	<div
		style="width: 1000px; margin: auto; background-color: #f3f5f7; text-align: center;">
		<p onclick="PageMoveFnc('/auth/login');">
			<img style="width: 1000px; height: 600px;" src="../img/poke3.gif"
				alt="MainImg">
		</p>
	</div>

	<jsp:include page="/common/Bottom.jsp" />
</body>
</html>