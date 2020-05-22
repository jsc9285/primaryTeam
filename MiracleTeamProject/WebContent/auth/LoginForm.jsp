<%@ page import="mtp.login.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/custom.css?ver=1.2" />
<script type="text/javascript" src="../js/login.js?ver=1.3"></script>
<meta charset="UTF-8">
<title>로그인 페이지</title>

</head>
<body>
	<jsp:include page="../common/Header.jsp" />
	<div id="root">
		<div class="member-card-layout">
			<div class="member-card">
				<div class="member-card-layout-inner">

					<div class="member-card-layout__logo">
						<img id="mainImg" class="member-card-layout__logo-image" src="../img/pika4.gif"
							alt="로고">
					</div>
					<div class="info-div">


						<!--onsubmit="return nextStepFnc();"   -->
						<form id="formFirst" action="./login" method="post"
							onsubmit="return nextStepFnc();">

							<div class="input-box">
								<label class="member-input__label" for="email-input">이메일
									주소</label> <input class="input-contents" type="text" id="email-input"
									autocomplete="off" value="" name="email" />
							</div>

							<div class="input-box">
								<label class="member-input__label" for="pwd-input">비밀번호</label>
								<input class="input-contents" type="password" id="pwd-input"
									autocomplete="off" value="" name="password" />
							</div>

							<!--오류메시지  -->
							<div class="member-input-wrong-message"></div>

							<input id="target" type="submit" class="login-button" value="로그인"
								disabled>
							<div class="checks">
								<div class="login-check">
									<input id="ex_chk" type="checkbox"> <label for="ex_chk"
										class="login-check-box-label">심심하면 눌러보세요</label>
								</div>

							</div>
							<div class="hello-text">
								처음 방문이신가요?<span class="signUp-link"><a
									class="member-link" href="../member/add">회원가입하기</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../common/Bottom.jsp" />
</body>
</html>