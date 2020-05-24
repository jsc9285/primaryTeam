<%@page import="mtp.login.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/custom.css?ver=1.1" />
<script type="text/javascript" src="../js/member.js?ver=1.2"></script>
<title>회원 등록</title>

</head>

<body>
	<!-- 337 1번 문제 MemberAddServlet 화면출력 위임 -->
	<jsp:include page="../common/Header.jsp" />

	<div id="root">
		<div class="member-card-layout">

			<div class="member-card-join">
				<div class="member-card-layout-inner">

					<div class="member-card-layout__logo">
						<img id="mainImg" class="member-card-layout__logo-image"
							src="../img/pika0.gif" alt="로고">
					</div>
					<div class="info-div">

						<!-- <form name="join" onsubmit="return validate();" action='./add'
		method="post"> -->
						<!--onsubmit="return nextStepFnc();"   -->
						<form id="formFirst" method="post" onsubmit="return validate();" name="userInfo">
							<div class="input-box">
								<label class="member-input__label" for="email-input">이메일
									주소</label> <input class="input-contents" type="text" id="email-input"
									autocomplete="off" value="" name="email" onkeydown="inputEmailChk()" />
								<div class="email-wrong-message"></div>
								<input id="eqEmail" type="button" value="Email 중복확인">
							</div>

							<div class="input-box" style="margin-top: 40px">
								<label class="member-input__label" for="name-input">닉네임 </label>
								<input class="input-contents" type="text" id="name-input"
									autocomplete="off" value="" name="name" />
									<div class="email-wrong-message"></div>
							</div>


							<div class="input-box">
								<label class="member-input__label" for="pwd-input">비밀번호</label>
								<input class="input-contents" type="password" id="pwd-input"
									autocomplete="off" value="" name="password" />
								<div class="email-wrong-message"></div>
							</div>
							
							<div class="input-box">
								<label class="member-input__label" for="pwdChk-input">비밀번호
									확인</label> <input class="input-contents" type="password"
									id="pwdChk-input" autocomplete="off" value=""
									name="passwordChk" />
								<div class="email-wrong-message"></div>
							</div>
							<!--오류메시지  -->
							<div class="member-input-wrong-message"></div>

							<input id="target" type="submit" class="login-button" value="회원가입"
							disabled>
						</form>

						<div class="hello-text">
							이미 회원이신가요?<span class="signUp-link"><a class="member-link"
								href="../auth/login">돌아가기</a></span>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../common/Bottom.jsp" />

</body>
</html>