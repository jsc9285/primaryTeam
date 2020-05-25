<%@page import="java.sql.Connection"%>
<%@page import="mtp.login.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckProc.jsp</title>
</head>
<body>
<div style="text-align: center"></div>
<h3>* 비밀번호 찾기 결과 *</h3>
<%
//1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함

String email=request.getParameter("email");
		
MemberDao dao = new MemberDao();

Connection conn = null;
ServletContext sc = this.getServletContext();
conn = (Connection) sc.getAttribute("conn");

dao.setConnection(conn);
int cnt = dao.emailCheck(email);
String pwdVal = dao.findPassWord(email);
out.println("입력 ID : <strong>" + email + "</stong>");

System.out.println(email);
if(cnt==1){
out.println("<p>당신의 비밀번호는 "+pwdVal+" 입니다</p>");
%>
<script>
function apply(email){
//2) 중복확인 id를 부모창에 적용
//부모창 opener
opener.document.userInfo.email.value=email;
window.close(); //창닫기
}//apply () end
</script>
<%
}else{
out.println("<p style='color: red'>해당하는 이메일이 없습니다. 다시 입력해주세요</p>");

}//if end
%>
<hr>
<a href="javascript:history.back()">[다시시도]</a>
&nbsp; &nbsp;
<a href="javascript:window.close()">[창닫기]</a>
</body>
</html>

