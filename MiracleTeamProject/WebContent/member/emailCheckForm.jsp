<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/custom.css?ver=1.5" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>�̸��� �ߺ�üũ</title>
    
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
        
        // ȸ������â�� ���̵� �Է¶��� ���� �����´�.
        function pValue(){
            document.getElementById("userEmail").value = opener.document.userInfo.email.value;
        }

   </script>
    
</head>
<body onload="pValue()">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">�̸��� �ߺ�üũ</font></b>
    <br>
    <div id="chk">
        <form id="checkForm" method="post" action="emailCheckProc.jsp">
            <input type="text" name="email" id="userEmail" class="EmailInput"maxlength="20" autofocus placeholder="�̸����� �Է����ּ���">
            <input class="submitBtn" type="submit" value="�ߺ�Ȯ��">
        </form>
        <div id="msg"></div>
        <br>
        <input class="cancelBtn" type="button" value="���" onclick="window.close()"><br>
    </div>
		
</div>    
</body>
</html>


