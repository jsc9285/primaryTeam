<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>

</head>

<body>
	<jsp:include page="../common/Header.jsp" />
	<h1>회원목록</h1>
	
	<c:forEach var="memberDto" items="${memberList}">
	
		${memberDto.no},
		<a href='./update?no=${memberDto.no }'>${memberDto.name}</a>,
		${memberDto.email}
		<a href='./delete?no=${memberDto.no}'>[삭제]</a><br>
	</c:forEach>
	<jsp:include page="../common/Bottom.jsp" />
</body>
</html>