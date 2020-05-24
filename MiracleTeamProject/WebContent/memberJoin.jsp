<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var emailCheck = false;
var nickNameCheck = false;
var pwdCheck = false;
var cnt = 0;

	window.onload = function () {
		var inputEmailObj = document.getElementById('inputEmail');
		var inputNameObj = document.getElementById('inputName'); 
		var inputPwdObj = document.getElementById('inputPwd');
		  var selectBoxObj = document.getElementById('selectBox1');
	      selectBoxObj.addEventListener('mouseover', blockBgChangeOverFnc, false);
	      selectBoxObj.addEventListener('mouseleave', blockBgChangeLeaveFnc, false);

		inputEmailObj.addEventListener('click', emailFnc, false);
		inputEmailObj.addEventListener('keyup', emailFnc, false);
		inputEmailObj.addEventListener('keyup', checkFnc, false);
		
		inputNameObj.addEventListener('click', nickFnc, false);
		inputNameObj.addEventListener('keyup', nickFnc, false);
		inputNameObj.addEventListener('keyup', checkFnc, false);
		
		inputPwdObj.addEventListener('click', pwdFnc, false);
		inputPwdObj.addEventListener('keyup', pwdFnc, false);
		inputPwdObj.addEventListener('keyup', checkFnc, false);
		
		
	}
	
	function emailFnc() {
		var inputEmailObj = document.getElementById('inputEmail');
		inputEmailObj.placeholder = '';
		
		var emailNode = inputEmailObj.value;
		
		var textOne = "@";
		var textTwo = ".";
		
		var msg = document.getElementsByClassName('warningMsg')[0];
		
		if (emailNode.length >= 1 && (emailNode.indexOf(textOne) <= -1 || 
				emailNode.indexOf(textTwo) <= -1))  {
					msg.innerHTML = "<img src='./img/warning.PNG'" 						
							+"style=\"margin-right : 10px; vertical-align: middle;\">"
								+ "유효한 이메일 주소를 입력해 주시기 바랍니다.";
									return false;
									emailCheck = false;
		}
		if ((emailNode.length >= 1 && (emailNode.indexOf(textOne) > -1 && 
				emailNode.indexOf(textTwo) > -1)) || emailNode.length == 0){
					msg.innerHTML = "";
					emailCheck = true;
		}		
	}
	
	function nickFnc() {
		var inputNameObj = document.getElementById('inputName');
		inputNameObj.placeholder = '';
		
		var nickNameNode = inputNameObj.value;
		
		var msg = document.getElementsByClassName('warningMsg')[1];
		
		var warMsg = document.getElementById("warning");
		
		if (nickNameNode.length != 0 && 
				(nickNameNode.length < 3 || nickNameNode.length > 20)) {
					msg.innerHTML = 
						"<img src='./img/warning.PNG'" 
							+"style=\"margin-right : 10px; vertical-align: middle;\">"
								+ "최소 3자 이상 최대 20자 이하로 작성해주시기 바랍니다.";
				warMsg.style.display='none';
				return false;
				nickNameCheck = false;
		} else if (nickNameNode.length == 0 || 
				(nickNameNode.length >= 3 && nickNameNode.length <= 20)) {
					msg.innerHTML = "";
				warMsg.style.display='inherit';
				nickNameCheck = true;
		}		
	}
	function pwdFnc() {
		cnt++;
		var inputEmailObj = document.getElementById('inputEmail');
		var emailNode = inputEmailObj.value;
		
		var inputNameObj = document.getElementById('inputName');
		var nickNameNode = inputNameObj.value;
		
		
		var inputPwdObj = document.getElementById('inputPwd');
		inputPwdObj.placeholder = '';
		
		var pwdNode = inputPwdObj.value;
		
		var msg = document.getElementsByClassName('warningMsg');
		

		var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9])/.test(pwdNode);   
		//영문,특수문자
		var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])/.test(pwdNode);  
		//특수문자, 숫자
		var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9])/.test(pwdNode);
		//영문, 숫자
		var pwdCheck1 = false;
		var pwdCheck2 = false;
		var pwdCheck3 = false;
		
		if (pwdNode.length >= 1) {
			msg[2].innerHTML = 
				"<img src='./img/lock.PNG'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "비밀번호 요구사항";
			msg[3].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "이메일 주소 혹은 닉네임을 포함하지 않음";
			msg[4].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
					+ "영문, 숫자, 기호 중 2개 이상의 조합";	
			msg[5].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "비밀번호 길이는 최소 8자 이상";	
		}
		
		if((emailNode.indexOf(pwdNode) > -1 || 
			nickNameNode.indexOf(pwdNode) > -1) && pwdNode != ''){

				msg[3].innerHTML = 
					"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "이메일 주소 혹은 닉네임을 포함하지 않음";	
				msg[3].style.color = "#FE453B";				
			return false;
		}else if (pwdNode != ''){
			msg[3].innerHTML = 
				"<img src='./img/check.PNG'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "이메일 주소 혹은 닉네임을 포함하지 않음";	
			msg[3].style.color = "#98A0A7";
			pwdCheck1 = true;
		}else if (pwdNode == '' && cnt >= 2) {
			msg[3].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "이메일 주소 혹은 닉네임을 포함하지 않음";	
			msg[3].style.color = "#FE453B";	
		}
		if (check1 || check2 || check3) {
			msg[4].innerHTML = 
				"<img src='./img/check.PNG'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "영문, 숫자, 기호 중 2개 이상의 조합";	
			msg[4].style.color = "#98A0A7";
			pwdCheck2 = true;
		} else if(check1 == false && check2 == false && check3 == false && pwdNode != ''){
			msg[4].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "영문, 숫자, 기호 중 2개 이상의 조합";	
			msg[4].style.color = "#FE453B";
		} else if (pwdNode == '' && cnt >= 2) {
			msg[4].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "영문, 숫자, 기호 중 2개 이상의 조합";	
			msg[4].style.color = "#FE453B";
		}
		if (pwdNode.length >= 8) {
			msg[5].innerHTML = 
				"<img src='./img/check.PNG'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "비밀번호 길이는 최소 8자 이상";	
			msg[5].style.color = "#98A0A7";
			pwdCheck3 = true;
		}else if(cnt >= 2 && (pwdNode == '' || pwdNode.length < 8)){
			msg[5].innerHTML = 
				"<img src='./img/lockNull.png'" 
					+"style=\"margin-right : 10px; vertical-align: middle;\">"
						+ "비밀번호 길이는 최소 8자 이상";	
			msg[5].style.color = "#FE453B";
		}
		if(pwdCheck1 == true && pwdCheck2 == true && pwdCheck3 == true) {
			pwdCheck = true;
		}else{
			pwdCheck = false;
		}
		
	}
	
	
	function checkFnc() {		
		
		var joinBtn = document.getElementById("join");
			
		var actObj = document.getElementById('act');
				

		if(emailCheck == true && nickNameCheck == true && pwdCheck == true) {
			actObj.setAttribute("action", "./freeBoard.jsp");
			joinBtn.disabled = false;
			joinBtn.style.backgroundColor = "#5383E8";
		}else {
			joinBtn.disabled = true;
			joinBtn.style.backgroundColor = "#D5D5D5";
		}

	}
	
	  function blockBgChangeOverFnc() {
	      var selectBoxObj = document.getElementById('selectBox1');
	      selectBoxObj.style.backgroundColor = '#2F436E';
	   }
	   function blockBgChangeLeaveFnc() {
	      var selectBoxObj = document.getElementById('selectBox1');
	      selectBoxObj.style.backgroundColor = '#232F46';
	   }


</script>
</head>
<style type="text/css">
a {
	text-decoration: none;
}

body {
margin: 0px;
}

#header {
	height: 40px;
	background-color: #232F46;
}

#header {
	height: 40px;
	background-color: #232F46;
}

.headerImgL {
	height: 40px;
	float: left;
}

#yasuo {
	height: 32px;
	margin-bottom: 4px;
	margin-top: 4px;
	margin-left: 40px;
}

.headerImgR {
	height: 40px;
	float: right;
}

#loginBtn {
	height: 28px;
	width: 70px;
	margin-bottom: 6px;
	margin-top: 6px;
	background-color: #5383E8;
	margin-right: 20px;
	border: 1px solid #5383E8;
	border-radius: 6px;
	color: white;
}

.selectBox {
	height: 28px;
	float: right;
	margin-top: 6px;
	margin-right: 18px;
	margin-bottom: 6px;
	background-color: #232F46;
	color: white;
	border: 1px solid #232F46;
}

#selectBox1 {
	width: 150px;
	float: left;
}

#selectBox2 {
	width: 66px;
	float: right;
}

#headerBtn {
	border: 0px solid;
}

#bg {
	background-color: #5383E8;
}

#inBg {
	background-color: white;
	padding: 10px;
	padding-bottom: 172px;
	padding-top: 50px;
	width: 600px;
	margin: auto;
}

#logo {
	width: 460px;
	margin: auto;
	text-align: center;
}

#input {
	margin: auto;
	width: 500px;
}

#information {
	background-color: #F6F6F6;
	padding: 18px;
	padding-right: 25px;
	width: 460px;
	margin: auto;
	color: gray;
}

#emailNmae {
	width: 500px;
	margin: auto;
	margin-top: 40px;
}

#inputEmail {
	margin-bottom: 4px;
	font-size: 16px;
	width: 500px;
	border: white;
	outline: 0;
}

.warningMsg {
	width: 400px;
	font-size: 14px;
	border: white;
	outline: 0;
	color: #FE453B;
}

#warningMsg {
	width: 400px;
	font-size: 16px;
	border: white;
	outline: 0;
	color: #52595F;
}

.warningMsgChild {
	width: 400px;
	font-size: 14px;
	border: white;
	outline: 0;
	color: #FE453B;
}

#inputName {
	margin-bottom: 4px;
	font-size: 16px;
	width: 500px;
	border: white;
	margin-top: 30px;
	outline: 0;
}

#warning {
	color: gray;
	margin: auto;
	width: 500px;
	font-size: 15px;
}

#inputPwd {
	margin-bottom: 4px;
	font-size: 16px;
	width: 500px;
	border: white;
	outline: 0;
}

#btn {
	margin: auto;
	width: 500px;
	margin-top: 40px;
}

#cancel {
	background-color: white;
	padding: 18px;
	padding-right: 95px;
	padding-left: 95px;
	border: 1px solid #D5D5D5;
	font-size: 16px;
	width: 240px;
}

#join {
	background-color: #D5D5D5;
	padding: 18px;
	padding-right: 85px;
	padding-left: 85px;
	border: 1px solid #EAEAEA;
	font-size: 16px;
	color: white;
	width: 240px;
	margin-left: 10px;
}

#member {
	width: 500px;
	margin: auto;
	text-align: center;
	margin-top: 15px;
}
</style>
<body>
	<div id="header">
		<a href="./logIn.jsp"> <img class="headerImgl"
			src="./img/logo3.PNG" style="float: left; height: 40px;">
		</a> <a href=""> <img class="headerImgL" src="./img/lolImg.PNG"
			style="height: 24px; margin: 8px 0px 8px 12px;">
		</a> <select class="selectBox" id='selectBox1' name="select"
			onchange="if(this.value) location.href=(this.value);">
			<option value="">League of Legends</option>
			<option value="https://pubg.op.gg/">배틀그라운드</option>
			<option value="https://overwatch.op.gg/">오버워치</option>
			<option value="https://fortnite.op.gg/">포트나이트</option>
			<option value="https://r6.op.gg/">레인보우 식스 시즈</option>
			<option value="https://talk.op.gg/">톡피지지</option>
		</select> <a
			href="https://playruneterra.com/ko-kr/?_branch_match_id=770454022758730522">
			<img id="yasuo" class="headerImgl" src="./img/yasuo.PNG">
		</a>
		<button id="loginBtn" class="headerImgR"
			onclick="location.href='logIn.jsp'">로그인</button>
		<select class="selectBox" id='selectBox2'>
			<option>한국어</option>
			<option>english</option>
			<option>中国語</option>
			<option>日本語</option>
			<option>español</option>
			<option>Deutsch</option>
		</select> <a> <img class="headerImgR" src="./img/earth.PNG">
		</a>
	</div>

	<div id="bg">
		<div id="inBg">
			<div id="logo">
				<a href="./logIn.jsp"> <img src="./img/logo1.PNG">
				</a>
			</div>
			<div id="input">
				<h2>기본정보입력</h2>
			</div>

			<div id="information">
				회원가입을 위해서 이메일 인증이 진행되며, 인증이 완료되기<br /> 전까지 회원가입이 완료가 되지않습니다
			</div>
			<form id="act" action="" onsubmit="checkFnc();">
				<div id="emailNmae">
					<input id="inputEmail" type="email" placeholder="이메일 주소"
						autocomplete="off">
					<hr />
					<div class="warningMsg"></div>
					<input id="inputName" type="text" placeholder="닉네임"
						autocomplete="off">
					<hr />
					<div class="warningMsg"></div>
				</div>

				<div id="warning">
					개인정보를 기입하여 발생될 수 있는 피해는 OP.GG가 일절 책임지지<br /> 않습니다
				</div>

				<div id="emailNmae">
					<input id="inputPwd" type="password" placeholder="비밀번호">
					<hr />
					<div class="warningMsg" id="warningMsg"></div>
					<div class="warningMsg"></div>
					<div class="warningMsg"></div>
					<div class="warningMsg"></div>

				</div>

				<div id="btn">
					<input id="cancel" type="button"
						onclick="location.href='./logIn.jsp'" value="취소">

					<button id="join" disabled="disabled">가입하기</button>
				</div>

				<div id="member">
					이미 회원이신가요?&nbsp;&nbsp; <a href="./logIn.jsp">로그인하기</a>
				</div>
			</form>
		</div>
	</div>

</body>
</html>