<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

<style type="text/css">
#wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}

#topForm {
	text-align: right;
}

#board, #pageForm, #searchForm {
	text-align: center;
}

#bList {
	text-align: center;
}
</style>

</head>

<body>

	<jsp:include page="/common/Header.jsp" />

	<div id="wrap">
		<br>
		<div id="topForm">
			<input type="button" value="글쓰기" onclick="location.href = './post?no=${memberDto.no}'">
		</div>
		<br>
		<div id="board">
			<table id="bList" width="800" border="3" bordercolor="lightgray">
				<tr heigh="30">
					<td style="width: 100px;">글번호</td>
					<td style="width: 550px;">제목</td>
					<td style="width: 150px;">작성자</td>
				</tr>
				
				<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td>${notice.no}</td>
						<td><a href='./update?no=${notice.no }'>${notice.title}</a></td>
						<td>${notice.writer}</td>
					</tr>
				</c:forEach>

			</table>
		</div>
		<br>
		<div id="pageForm">페이지 번호</div>
		<br>
		<div id="searchForm">
			<form>
				<select name="opt">
					<option value="0">제목</option>
					<option value="1">내용</option>
					<option value="2">제목+내용</option>
					<option value="3">글쓴이</option>
				</select> <input type="text" size="20" name="condition" />&nbsp; <input
					type="submit" value="검색" />
			</form>
		</div>
	</div>
	<br>
	
	<jsp:include page="/common/Bottom.jsp" />

</body>
</html>