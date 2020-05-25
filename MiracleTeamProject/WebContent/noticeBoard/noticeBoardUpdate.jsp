<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>

<style type="text/css">
#title {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
}
</style>
</head>

<body>

	<jsp:include page="/common/Header.jsp" />		
	<div style="width: 1000px; height: 600px; margin: auto;">
		<br>
		<b><font size="6" color="gray">게시글 수정</font></b>
		<br>
	
		<form action="./update" method="post">
			<input type="hidden" name="no" value='${noticeDto.no}'/>
			<table width="700" border="3" bordercolor="lightgray" align="center">
				<tr>
					<td id="title">작성자</td>
					<td><input type="text" name="writer" value='${noticeDto.writer}'/></td>
				</tr>
				<tr>
					<td id="title">제 목</td>
					<td>
						<input type="text" name="title" size="70"
							   maxlength="100" value='${noticeDto.title}' />
					</td>
				</tr>
				<tr>
					<td id="title">내 용</td>
					<td>
						<textarea name="context" cols="72" rows="20">${noticeDto.context}</textarea>
					</td>
				</tr>
				<tr>
					<td id="title">파일첨부</td>
					<td>
						<input type="file" name="board_file"/>
					</td>
				</tr>			
				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="submit" value="수정완료">
						<input type="reset" value="복구">
						<input type="button" value="수정취소" onclick="location.href = './select?no=${noticeDto.no}&page=${page}'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="/common/Bottom.jsp" />

</body>
</html>