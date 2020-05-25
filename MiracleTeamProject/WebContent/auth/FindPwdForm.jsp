<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>아이디 중복 체크</title>
    
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
    
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="4" color="gray">비밀번호 찾기</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" method="post" action="FindPwdProc.jsp">
            <input type="text" name="email" id="userEmail" maxlength="20" autofocus>
            <input type="submit" value="비번찾기">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
    </div>
		
</div>    
</body>
</html>


