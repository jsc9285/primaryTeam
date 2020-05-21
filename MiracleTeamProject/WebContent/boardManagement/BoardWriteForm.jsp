<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>글 수정</title>

<style type="text/css">
        #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
</style>

<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "./list";
	}
	
	function pageMoveDeleteFnc(no){
		var url = "./delete?no=" + no;
		location.href = url;
	}
</script>

</head>

<body>

	<br>
	    <b><font size="6" color="gray">글수정</font></b>
	    <br>
	    
	    <form method="post" action="./write">
	    <input name="no" type="hidden" value="${boardManagementDto.no}">
	    <table width="700" border="3" bordercolor="lightgray" align="center">
	        <tr>
	            <td id="title">작성자</td>
	            <td>
	            	<input name="writer" type="text" value="${boardManagementDto.writer}">
	            </td>
	        </tr>
	            <tr>
	            <td id="title">
	                             제 목
	            </td>
	            <td>
	                <input name="title" type="text" size="70" 
	                	maxlength="100" value="${boardManagementDto.title}"/>
	            </td>        
	        </tr>
	        <tr>
	            <td id="title">
	                             내 용
	            </td>
	            <td>
	                <textarea name="context" cols="72" rows="20">${boardManagementDto.context}</textarea>            
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
	                <input type="reset" value="작성취소" >
	                <input type="submit" value="등록" >
	                <input type="button" value="목록" onclick='pageMoveListFnc();'>           
	            </td>
	        </tr>
	    </table>    
	</form>

</body>
</html>