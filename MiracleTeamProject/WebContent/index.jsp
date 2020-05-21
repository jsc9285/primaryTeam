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

	<div style="text-align: center;">
		<h1>테스트용 임시 페이지 이동</h1>
		<p onclick="PageMoveFnc('/noticeBoard/list');">김홍</p>
		<p onclick="PageMoveFnc('/boardManagement/list');">이환상</p>
		<p onclick="PageMoveFnc('');">이용훈</p>
		<p onclick="PageMoveFnc('/auth/login');">김윤진</p>		
	</div>
	
</body>

</html>