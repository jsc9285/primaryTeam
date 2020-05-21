<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function PageMoveFnc(address) {
		location.href = '<%=request.getContextPath()%>' + address;
	}
</script>
<div style="background-color:#00008b; color:#ffffff; height:20px; padding: 5px;">
	<a onclick="PageMoveFnc('/noticeBoard/list');">공지사항</a>
	<a onclick="PageMoveFnc('/boardManagement/list');">게시판</a>
	<a onclick="PageMoveFnc('/memberManagement/list');">회원관리</a>
	
	<c:if test="${sessionScope.member.email ne null }">
		<a style="text-align: right;">${sessionScope.member.name}</a>
		<a style="text-align: right;" onclick="PageMoveFnc('/auth/logout');">로그아웃</a>
	</c:if>
</div>