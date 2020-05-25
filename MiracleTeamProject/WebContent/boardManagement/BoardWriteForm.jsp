<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>글 작성</title>

<style type="text/css">
        #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
</style>

<script type="text/javascript">

</script>

</head>

<body>
<jsp:include page="../common/Header.jsp"/>
<div style="width: 1000px; margin: auto;">
	<br>
    <b><font size="6" color="gray">글작성</font></b>
    <br>
	    
	    <form method="post" action="./write">
	    <table width="700" border="3" bordercolor="lightgray" align="center">
	        <tr>
	            <td id="title">작성자</td>
	            <td>
	            	<input name="writer" type="text" value="${member.name}">
	            </td>
	        </tr>
	            <tr>
	            <td id="title">
	                             제 목
	            </td>
	            <td>
	                <input name="title" type="text">
	            </td>        
	        </tr>
	        <tr>
	            <td id="title">
	                             내 용
	            </td>
	            <td>
	                <textarea name="context" cols="72" rows="20"></textarea>            
	            </td>        
	        </tr>
	        <tr>
	            <td id="title">
	                             파일첨부
	            </td>
	            <td>
	                <input type="file" name="board_file" />
	            </td>    
	        </tr>
	 
	        <tr align="center" valign="middle">
	            <td colspan="5">
	                <input type="submit" value="작성" >
	                <input type="reset" value="리셋" >
	                <input type="button" value="목록" onclick='pageMoveListFnc();'>           
	            </td>
	        </tr>
	    </table>    
	</form>
<jsp:include page="../common/Bottom.jsp"/>
</body>
</html>