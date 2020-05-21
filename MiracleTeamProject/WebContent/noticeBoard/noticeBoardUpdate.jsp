<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<input type="submit" value="수정"> 
					<input type="button" value="삭제" onclick="location.href = './delete?no=${noticeDto.no}'"> 
					<input type="button" value="목록">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>