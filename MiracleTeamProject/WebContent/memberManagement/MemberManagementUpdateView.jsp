<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원정보수정</title>
<style type="text/css">
	div {
		width: 1000px;
		margin: auto;
	}

</style>
<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "../noticeBoard/list";
	}
	
	function pageMoveDeleteFnc(no){
		var url = "./delete?mmNo=" + no;
		location.href = url;
	}
	
	function pageMoveAdminDeleteFnc(no){
		var url = "./delete?adNo=" + no;
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="../common/Header.jsp"/>
	<div>
	<h1>회원정보</h1>
	<c:if test="${adminDto != null}">
		<form action='./update' method='post'>
			번&emsp;&emsp;호: <input type='text' name='adNo' value='${adminDto.no}' readonly><br>
			이&emsp;&emsp;름: <input type='text' name='name' value='${adminDto.name}' readonly><br>
			이&nbsp;메&nbsp;&nbsp;일: <input type='text' name='email' value='${adminDto.email}' readonly><br>
			비밀번호: <input type='text' name='password' value='${adminDto.password}'><br>
			<input type='submit' value='저장'>
			<input type='button' value='삭제' onclick='pageMoveAdminDeleteFnc(${adminDto.no});'>
			<input type='button' value='취소' onClick='pageMoveListFnc();'>	
		</form>
	</c:if>
	<c:if test="${memberDto != null}">
		<form action='./update' method='post'>
			번&emsp;&emsp;호: <input type='text' name='mmNo' value='${memberDto.no}' readonly><br>
			이&emsp;&emsp;름: <input type='text' name='name' value='${memberDto.name}' readonly><br>
			이&nbsp;메&nbsp;&nbsp;일: <input type='text' name='email' value='${memberDto.email}' readonly><br>
			비밀번호: <input type='text' name='password' value='${memberDto.password}'><br>
			<input type='submit' value='저장'>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${memberDto.no});'>
			<input type='button' value='취소' onClick='pageMoveListFnc();'>	
		</form>
	</c:if>
	</div>
	<br>
	<jsp:include page="../common/Bottom.jsp"/>

</body>

</html>