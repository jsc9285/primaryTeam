<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>게시판</title>
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
     
     .pageBtn{
	display:inline-block;
	border: 1px solid #CD5C5C;	
	width: 20px;
	height: 20px;
	border-radius: 50%;	
	color: #fff;
	font-size: 13px;
	text-decoration: none; 
	background-color: #CD5C5C; 	
	}

	.pageBtn:hover{
	background-color: #fff;
	border: 1px solid #CD5C5C;
	color: #CD5C5C;
	}
</style>

<script type="text/javascript">

</script>


</head>

<body>
<jsp:include page="../common/Header.jsp"/>
<div style="width: 1000px; margin: auto;">
	<br>
		<b><font size="6" color="gray">게시판</font></b>
	<br> 
	<div id="wrap">
	
	    <br>
	    <div id="topForm">
	         <input type="button" value="글쓰기" onclick="location.href = './write?no=${member.no}'">
	    </div>
	    <br>
	    <div id="board">
	        <table id="bList" width="800" border="3" bordercolor="lightgray">
	            <tr heigh="30">
	                <td style="width: 100px;">글번호</td>
	                <td style="width: 550px;">제목</td>
	                <td style="width: 150px;">작성자</td>
	            </tr> 
	             
	            <c:forEach var="boardManagementDto" items="${boardManagementList}">
		        	<tr>
		                <td>${boardManagementDto.no}</td>
		                <td>
		                	<a href='./search?no=${boardManagementDto.no}&page=${spage}'>
		                		${boardManagementDto.title}
		                	</a>
		                </td>
		                <td>${boardManagementDto.writer}</td>
		            </tr>
	        	</c:forEach>  
	            
	        </table>
	    </div>
	    <br>
	    <div id="pageForm">
	       	<c:if test="${startPage != 1}">
				<a href='.list?page=${startPage-1}'>[ 이전 ]</a>			
			</c:if>
		
			<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
				<c:if test="${pageNum == spage}">
					<a class='pageBtn'>${pageNum}&nbsp;</a>
				</c:if>
				<c:if test="${pageNum != spage}">
					<a class='pageBtn' href="./list?page=${pageNum}">${pageNum}&nbsp;</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage != maxPage}">
				<a href='.list?page=${endPage+1}'>[ 다음 ]</a>			
			</c:if>
	    </div>
	    <br>
	    <div id="searchForm">
	        <form action="./list" method="get">
	            <select name="opt">
	                <option value="0">제목</option>
	                <option value="1">내용</option>
	                <option value="2">제목+내용</option>
	                <option value="3">글쓴이</option>
	            </select>
            	<input type="text" size="20" id='search' name="condition"/>&nbsp;
            	<a href="./BoardSearchForm.jsp">
            		<input type="submit" value="검색"/>
            	</a>
	        </form>    
	    </div>
	</div>  
	<br>
</div>
	 
<jsp:include page="../common/Bottom.jsp"/>
</body>
</html>