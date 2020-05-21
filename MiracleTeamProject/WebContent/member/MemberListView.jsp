<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
td{
	padding: 5px;
}

h1 {
margin-bottom: 5px;

}

.firstTag {
	background-color: pink;
	font-weight: bold;

}

.logOutBtn {
	margin: 20px;
	margin-left: 318px;
	margin-bottom: 10px;
	margin-top: 0px;
}
</style>	
<script type="text/javascript">
function pageMoveLoginFnc(){
	location.href = "../auth/login";
}
	
</script>
<title>회원 목록</title>

</head>

<body>
	<jsp:include page="../common/Header.jsp" />

	<h1>회원목록
	<input class="logOutBtn" type='button' value='로그아웃' onClick='pageMoveLoginFnc();'>
</h1>
	<table>
		<tr class="firstTag">
			<td>회원번호</td>
			<td>회원이름</td>
			<td>이메일</td>
			<td>관리자 권한</td>
			<td>관리자 권한</td>
		</tr>
		<c:forEach var="memberDto" items="${memberList}">
			<tr>
				<td>${memberDto.no}</td>
				<td>${memberDto.name}</td>
				<td>${memberDto.email}</td>
				<td><a href='./update?no=${memberDto.no}'>[수정]</a></td>
				<td><a href='./delete?no=${memberDto.no}'>[삭제]</a><br></td>
			</tr>

		</c:forEach>
	</table>
	

	<jsp:include page="../common/Bottom.jsp" />	
</body>
</html>