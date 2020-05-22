/**
 * 
 */

window.onload = function() {

	var inputObj = document.getElementsByTagName('input');
	var placeObj = document.getElementsByClassName('member-input__label');

	for (var i = 0; i < 4; i++) {
		inputObj[i].addEventListener('focus', placeFlyFnc)
		inputObj[i].addEventListener('blur', placeDownFnc)
		inputObj[i].addEventListener('keyup', submitFnc)
		inputObj[i].addEventListener('keyup', checkMailFnc)
	}
	
	inputObj[3].addEventListener('keyup', equalPwd)
}

function equalPwd() {
	var inputObj = document.getElementsByTagName('input');
	var wrongObj = document
	.getElementsByClassName('member-input-wrong-message');
	var sizeUp = document.getElementsByClassName('member-card');
	
	if (this.value == inputObj[2].value || this.value.length == 0) {
		sizeUp[0].style.height = "620px";
		wrongObj[0].innerHTML = "";
	} 
	
	if(this.value.length >= 4 && this.value != inputObj[2].value) {		
		this.focus();
		sizeUp[0].style.height = "620px";
		wrongObj[0].innerHTML = "<img class=\"warning\" src=\"../img/warning.svg\">"
			+ "비밀번호와 일치하지 않습니다.";
	}
}

function checkMailFnc() {
	var wrongObj = document
			.getElementsByClassName('member-input-wrong-message');
	var sizeUp = document.getElementsByClassName('member-card');
	
	if (this.value.length == 0) {
		sizeUp[0].style.height = "620px";
		wrongObj[0].innerHTML = "";
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

	if (inputObj[0].value.length > 0 && inputObj[1].value.length > 0
			&& inputObj[2].value.length > 0 && inputObj[3].value.length > 0 && inputObj[2].value == inputObj[3].value) {
		submitBnt.style.backgroundColor = '#1ea1f7';
		submitBnt.style.cursor = 'pointer';
		submitBnt.disabled = false;
	} else if (inputObj[0].value.length == 0 || inputObj[1].value.length == 0
			|| inputObj[2].value.length == 0 || inputObj[3].value.length == 0) {
		submitBnt.style.backgroundColor = '#dddfe4';
		submitBnt.style.cursor = 'default';
		submitBnt.disabled = true;
	}
}

function validate() {

	var id = document.getElementById("id-input");
	var pw = document.getElementById("pwd-input");
	var email = document.getElementById("email-input");
	var name = document.getElementById("name-input");
	
	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	// 이메일이 적합한지 검사할 정규식

	if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}

	if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		return false;
	}
}

function check(re, what, message) {

	var formObj = document.getElementById('formFirst');
	var inputObj = document.getElementsByTagName('input');
	var wrongObj = document
			.getElementsByClassName('member-input-wrong-message');
	var sizeUp = document.getElementsByClassName('member-card');

	if (re.test(what.value)) {
		formObj.setAttribute('action', './add');
		return true;
				
		}

		// alert(message);
		what.focus();
		sizeUp[0].style.height = "620px";
		wrongObj[0].innerHTML = "<img class=\"warning\" src=\"../img/warning.svg\">"
			+ message;
		return false;		

	// return false;}
}