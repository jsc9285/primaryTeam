<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>���̵� �ߺ� üũ</title>
    
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
    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" method="post" action="emailCheckProc.jsp">
            <input type="text" name="email" id="userEmail" maxlength="20" autofocus>
            <input type="submit" value="�ߺ�Ȯ��">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="���" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
    </div>
		
</div>    
</body>
</html>


