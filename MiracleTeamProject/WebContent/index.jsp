<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>시작 화면</title>

<script type="text/javascript">
	function PageMoveFnc(address) {
		location.href = '<%=request.getContextPath()%>' + address;
	}
</script>
</head>

<body>

	<jsp:include page="/common/Header.jsp" />

	<div style="width: 1000px; margin: auto; background-color: #f3f5f7; text-align: center;">
		<p onclick="PageMoveFnc('/auth/login');">
			<img style="width: 1000px; height: 600px;" src="./img/pika.gif" alt="MainImg">
		</p>		
	</div>
	
	<jsp:include page="/common/Bottom.jsp" />
	
</body>
</html>