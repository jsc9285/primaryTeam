<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/custom.css?ver=1.5" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>아이디 중복 체크</title>
    
    <style type="text/css">
        #wrap {
            text-align :center;
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
            <input type="text" name="email" id="userEmail" class="EmailInput" maxlength="20" autofocus>
            <input class="submitBtn" type="submit" value="비번찾기">
        </form>
        <div id="msg"></div>
        <br>
        <input class="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
    </div>
		
</div>    
</body>
</html>


