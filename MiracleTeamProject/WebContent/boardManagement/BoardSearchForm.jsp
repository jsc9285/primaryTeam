<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>게시물 조회</title>
<style type="text/css">
     #wrap {
         width: 800px;
         margin: 0 auto 0 auto;
     }
     #topForm{
         text-align :right;
     }
     #board, #pageForm, #searchForm{
         text-align :center;
     }
     
     #bList{
         text-align :center;
     }
</style>

</head>

<body>
<jsp:include page="/common/Header.jsp" />		
	<div style="width: 1000px; margin: auto;">
		<br>
		<b><font size="6" color="gray">게시물 조회</font></b>
		<br>
	
		<form action="./update" method="get">
			<input type="hidden" name="no" value='${boardManagementDto.no}'/>
			<table width="700" border="3" bordercolor="lightgray" align="center">
				<tr>
					<td id="title">작성자</td>
					<td>
						<input type="text" name="writer" value='${boardManagementDto.writer}'
							 readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td id="title">제 목</td>
					<td>
						<input type="text" name="title" size="70"
							   maxlength="100" value='${boardManagementDto.title}' readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td id="title">내 용</td>
					<td>
						<textarea name="context" cols="72" rows="20"
							 readonly="readonly">${boardManagementDto.context}</textarea>
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
						<c:if test="${member.email.equals('admin') || member.name 
							== boardManagementDto.writer}">
							<input type="submit" value="수정"> 
							<input type="button" value="삭제" 
								onclick="location.href = './delete?no=${boardManagementDto.no}'">
						</c:if> 
						<input type="button" value="목록" onclick="location.href = './list?page=${page}'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<jsp:include page="/common/Bottom.jsp" />
</body>
</html>