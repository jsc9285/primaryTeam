<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/custom.css?ver=1.5" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>이메일 중복체크</title>
    
    <style type="text/css">
        #wrap {
            text-align :center;
        }
        
        #chk{
            text-align :center;
        }
        
        .cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
    
    <script type="text/javascript">
        
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("userEmail").value = opener.document.userInfo.email.value;
        }

   </script>
    
</head>
<body onload="pValue()">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">이메일 중복체크</font></b>
    <br>
    <div id="chk">
        <form id="checkForm" method="post" action="emailCheckProc.jsp">
            <input type="text" name="email" id="userEmail" class="EmailInput"maxlength="20" autofocus placeholder="이메일을 입력해주세요">
            <input class="submitBtn" type="submit" value="중복확인">
        </form>
        <div id="msg"></div>
        <br>
        <input class="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
    </div>
		
</div>    
</body>
</html>


