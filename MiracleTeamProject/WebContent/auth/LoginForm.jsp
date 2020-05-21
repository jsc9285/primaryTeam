<%@ page import="mtp.login.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/NewFile4.css" />
<meta charset="UTF-8">
<title>로그인 페이지</title>

<script type="text/javascript">
	window.onload = function() {		
		var inputObj = document.getElementsByTagName('input');
		var placeObj = document.getElementsByClassName('member-input__label');


		for (var i = 0; i < 2; i++) {
			inputObj[i].addEventListener('focus', placeFlyFnc)
			inputObj[i].addEventListener('blur', placeDownFnc)
			inputObj[i].addEventListener('keyup', submitFnc)
		}

	}

	function placeFlyFnc() {
		this.parentNode.style.borderBottom = '1px solid #1ea1f7';
		this.parentNode.children[0].style.transform = 'scale(.75) translateY(-39px)';
		this.parentNode.children[0].style.color = '#1ea1f7';
	}

	function placeDownFnc() {

		if (this.value.length == 0) {
			this.parentNode.style.borderBottom = '1px solid #dddfe4';
			this.parentNode.children[0].style.color = '#7b858e';
			this.parentNode.children[0].style.transform = '';

		} else if (this.value.length > 0) {
			this.parentNode.style.borderBottom = '1px solid #dddfe4';
			this.parentNode.children[0].style.color = '#7b858e';
			this.parentNode.children[0].style.transform = 'scale(.75) translateY(-39px)';
		}
	}

	function submitFnc() {
		var submitBnt = document.getElementById('target');
		var inputObj = document.getElementsByTagName('input');
		var wrongObj = document
				.getElementsByClassName('member-input-wrong-message');
		var sizeUp = document.getElementsByClassName('member-card');

		if (inputObj[0].value.length > 0 && inputObj[1].value.length > 0) {
			submitBnt.style.backgroundColor = '#1ea1f7';
			submitBnt.style.cursor = 'pointer';
			submitBnt.disabled = false;
		} else if (inputObj[0].value.length == 0
				|| inputObj[1].value.length == 0) {
			/* sizeUp[0].style.height = "726px"; */
			submitBnt.style.backgroundColor = '#dddfe4';
			wrongObj[0].innerHTML = "";
			submitBnt.style.cursor = 'default';
			submitBnt.disabled = true;
		}
	}

	function nextStepFnc() {
		var formObj = document.getElementById('formFirst');
		var inputObj = document.getElementsByTagName('input');
		var wrongObj = document
				.getElementsByClassName('member-input-wrong-message');
		var sizeUp = document.getElementsByClassName('member-card');
		
		<%-- var id = "<%= memberDto.email %>" ;
		var pwd = '${memberDto.password}'; --%>

/* 		if (inputObj[0].value == id
				&& inputObj[1].value == pwd) {
		} else if (inputObj[0].value != id && inputObj[1].value != pwd) {
				

			for (var i = 0; i < 2; i++) {
				inputObj[i].parentNode.style.borderBottom = '1px solid #fe453b';
				inputObj[i].parentNode.children[0].style.color = '#fe453b';
			}

			wrongObj[0].innerHTML = "<img class=\"warning\" src=\"../img/warning.svg\">"
					+ "OP.GG ID가 존재하지 않거나 비밀번호가 일치하지 않습니다. 다시 시도해주세요.";
			return false;
		} */
	}


</script>
</head>
<body>
<jsp:include page="../common/Header.jsp" />
	<div id="root">
		<div class="member-card-layout">
			<div class="member-card">
				<div class="member-card-layout-inner">

					<h1 class="member-card-layout__logo">
						<img class="member-card-layout__logo-image"
							src="../img/lolImg.	PNG" alt="로고">
					</h1>
					<div class="info-div">
						
						<div class="or-line">
							<hr class="hr-left">
							OR
							<hr class="hr-right">
						</div>
									<!--onsubmit="return nextStepFnc();"   -->
						<form id="formFirst" action="./login" method="post" onsubmit="return nextStepFnc();">
							<h2 class="login__email-title">이메일 로그인</h2>
							<div class="input-box">
								<label class="member-input__label" for="email-input">이메일
									주소</label> <input class="input-contents" type="text" id="email-input"
									autocomplete="off" value="" name="email"/>
							</div>

							<div class="input-box">
								<label class="member-input__label" for="pwd-input">비밀번호</label>
								<input class="input-contents" type="password" id="pwd-input"
									autocomplete="off" value="" name="password"/>
							</div>

							<!--오류메시지  -->
							<div class="member-input-wrong-message"></div>

							<div class="checks">
								<div class="login-check">
									<input id="ex_chk" type="checkbox"> <label for="ex_chk"
										class="login-check-box-label">로그인 상태 유지하기</label>
								</div>
								
							</div>
							<input id="target" type="submit" class="login-button" value="로그인"
								disabled>
							<div class="hello-text">
								ㅁㅁㅁㅁㅁㅁ에 처음이세요?<span class="signUp-link"><a
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