<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>시작 화면</title>

<script type="text/javascript">
	function PageMoveFnc(address) {
		location.href = '<%=request.getContextPath()%>
	' + address;
	}
</script>

<style type="text/css">
body {
	margin: 0px;
}

html { 
  background: url(images/bg.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.bgimg {
    border: 0;
    padding: 0; 
    background-image: url('img/back1.jpg');
    min-height: 100%;
 	min-width: 1024px;
    background-position: center;
    background-size: cover;
}
</style>
</head>

<body>
	<div class="bgimg">
		<jsp:include page="./common/Header.jsp" />
		<div style="text-align: center;">
			<h1>테스트용 임시 페이지 이동</h1>
			<p onclick="PageMoveFnc('/noticeBoard/list');">김홍</p>
			<p onclick="PageMoveFnc('/boardManagement/list');">이환상</p>
			<p onclick="PageMoveFnc('/memberManagement/list');">이용훈</p>
			<p onclick="PageMoveFnc('/auth/login');">김윤진</p>
		</div>
	</div>
	<jsp:include page="./common/Bottom.jsp" />
</body>
</html>