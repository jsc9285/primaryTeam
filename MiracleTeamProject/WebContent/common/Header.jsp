<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function PageMoveFnc(address) {
		location.href = '<%=request.getContextPath()%>' + address;
	}
	
	function tagEnterFnc(a) {		
		a.style.backgroundColor = "#ffffff";
		a.style.border = "1px solid #ffffff";
		a.style.color = "#B22222";
		
	}
	
	function tagLeaveFnc(a) {
		a.style = 'none';
	}
</script>
<div style="text-align: center;">
	<h1 style="color: #DAA520;">Miracle Team Project</h1>
</div>

<div style="background-color: #B22222; color: #FAFAD2; margin:auto; width: 1000px; padding: 15px; box-sizing: border-box;">
	<a onclick="PageMoveFnc('/noticeBoard/list');" onmouseenter="tagEnterFnc(this);" onmouseleave="tagLeaveFnc(this);">공지사항</a>
	<a onclick="PageMoveFnc('/boardManagement/list');" onmouseenter="tagEnterFnc(this)" onmouseleave="tagLeaveFnc(this);">게시판</a>
	<c:if test="${sessionScope.member.email eq 'admin'}">
		<a onclick="PageMoveFnc('/memberManagement/list');" onmouseenter="tagEnterFnc(this)" onmouseleave="tagLeaveFnc(this);">회원관리</a>
	</c:if>
	
	<c:if test="${sessionScope.member.email ne null }">
		<c:if test="${sessionScope.member.email eq 'admin'}">
			<a style="text-align: right;"onclick="location.href='../memberManagement/update?adNo=${sessionScope.member.no}'" onmouseenter="tagEnterFnc(this);" onmouseleave="tagLeaveFnc(this);">${sessionScope.member.name}</a>
		</c:if>
		<c:if test="${sessionScope.member.email ne 'admin'}">
			<a style="text-align: right;"onclick="location.href='../memberManagement/update?mmNo=${sessionScope.member.no}'" onmouseenter="tagEnterFnc(this);" onmouseleave="tagLeaveFnc(this);">${sessionScope.member.name}</a>
		</c:if>
		<a style="text-align: right;" onclick="PageMoveFnc('/auth/logout');" onmouseenter="tagEnterFnc(this);" onmouseleave="tagLeaveFnc(this);">로그아웃</a>
	</c:if>

</div>