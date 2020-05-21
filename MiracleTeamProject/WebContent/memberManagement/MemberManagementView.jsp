<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 관리</title>
<style type="text/css">
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		background-color: yellowgreen;
	}
	
	#noStyle {
		text-align: center;
	}
</style>
</head>

<body>
	<jsp:include page="../common/Header.jsp"/>

	<h1>회원관리</h1>
	
	<h3>관리자 목록</h3>
	<table>
		<tr>
			<th>
				번호
			</th>
			<th>
				이름
			</th>
			<th>
				이메일
			</th>
			<th>
				비밀번호
			</th>
			<th	colspan="2">
				수정/삭제
			</th>
		</tr>
		<c:forEach var='adminDto' items='${adminList}'>
			<tr>
				<td id='noStyle'>
					${adminDto.no}
				</td>
				<td>
					${adminDto.name}
				</td>
				<td>
					${adminDto.email}
				</td>
				<td>
					${adminDto.password}
				</td>
				<td>
					<a href='./update?adNo=${adminDto.no}'>[수정]</a>
				</td>
				<td>
					<a href='./delete?adNo=${adminDto.no}'>[삭제]</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>회원 목록</h3>
	
	<table>
		<tr>
			<th>
				번호
			</th>
			<th>
				이름
			</th>
			<th>
				이메일
			</th>
			<th>
				비밀번호
			</th>
			<th	colspan="2">
				수정/삭제
			</th>
		</tr>
		<c:forEach var='memberDto' items='${memberList}'>
			<tr>
				<td id='noStyle'>
					${memberDto.no}
				</td>
				<td>
					${memberDto.name}
				</td>
				<td>
					${memberDto.email}
				</td>
				<td>
					${memberDto.password}
				</td>
				<td>
					<a href='./update?mmNo=${memberDto.no}'>[수정]</a>
				</td>
				<td>
					<a href='./delete?mmNo=${memberDto.no}'>[삭제]</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../common/Bottom.jsp"/>

</body>

</html>