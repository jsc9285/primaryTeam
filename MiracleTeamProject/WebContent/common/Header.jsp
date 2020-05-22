<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
.titleMenu:hover{
		background-color: #fff;
		border: 1px solid #ffffff;
		color: #B22222;
}
</style>
<script type="text/javascript">
	function PageMoveFnc(address) {
		location.href='<%=request.getContextPath()%>'+address;
	}
</script>
<div style="text-align: center;">
	<h1 style="color: #DAA520; cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>'">Miracle Team Project</h1>
</div>

<div style="background-color: #B22222; color: #FAFAD2; margin:auto; width: 1000px; padding: 15px; box-sizing: border-box;">
	<a class='titleMenu' onclick="PageMoveFnc('/noticeBoard/list');">공지사항</a>
	<a class='titleMenu' onclick="PageMoveFnc('/boardManagement/list');">게시판</a>
	<c:if test="${sessionScope.member.email eq 'admin'}">
		<a class='titleMenu' onclick="PageMoveFnc('/memberManagement/list');">회원관리</a>
	</c:if>
	
	<c:if test="${sessionScope.member eq null}">
		<a class='titleMenu' style="float: right;" onclick="PageMoveFnc('/member/MemberForm.jsp');">회원가입</a>
		<a class='titleMenu' style="float: right; margin-right: 10px;" onclick="PageMoveFnc('/auth/LoginForm.jsp');">로그인</a>
	</c:if>
	
	<c:if test="${sessionScope.member.email ne null}">
		<a class='titleMenu' style="float: right;" onclick="PageMoveFnc('/auth/logout');">로그아웃</a>		
		<c:if test="${sessionScope.member.email eq 'admin'}">
			<a class='titleMenu' style="float: right; margin-right: 10px;"onclick="location.href='../memberManagement/update?adNo=${sessionScope.member.no}'" >${sessionScope.member.name}</a>
		</c:if>
		<c:if test="${sessionScope.member.email ne 'admin'}">
			<a class='titleMenu' style="float: right; margin-right: 10px;"onclick="location.href='../memberManagement/update?mmNo=${sessionScope.member.no}'" >${sessionScope.member.name}</a>
		</c:if>
	</c:if>

</div>