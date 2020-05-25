/**
 * 
 */

var emailCheck = false;
var nickNameCheck = false;
var pwdCheck = false;
var pwdEqCheck = false;
var cnt = 0;

window.onload = function() {

	var inputObj = document.getElementsByClassName('input-contents');
	var placeObj = document.getElementsByClassName('member-input__label');
	var eqObj = document.getElementById('eqEmail');
	
	for (var i = 0; i < 4; i++) {	
		inputObj[i].addEventListener('focus', placeFlyFnc)
		inputObj[i].addEventListener('blur', placeDownFnc)
		inputObj[i].addEventListener('keyup', submitFnc)
	}
	setInterval(metaFnc, 4000);

	inputObj[0].addEventListener('keyup', emailFnc);
	inputObj[1].addEventListener('keyup', nameFnc);
	inputObj[2].addEventListener('keyup', pwdFnc);
	inputObj[3].addEventListener('keyup', equalPwd);
}

function emailFnc() {
	
	var wrongDiv = document.getElementById('wrongBox');
	
	var re2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

	if (!re2.test(this.value)) {
		wrongDiv.style.color = "red";
		wrongDiv.innerHTML = "유효한 이메일 주소를 입력해 주시기 바랍니다.";	
		emailCheck = false;
		
	} else if (re2.test(this.value)) {
		wrongDiv.innerHTML = "";	
		wrongDiv.style.color = "blue";
		emailCheck = true;
	} 
	
	if (this.value.length == 0) {
		wrongDiv.innerHTML = "";	
		emailCheck = false;
	}
}

function nameFnc() {
	
	var wrongDiv = document.getElementById('wrongBox');
	
	var re3 = /^[가-힣]{2,4}$/;
	
	if (!re3.test(this.value)) {
		wrongDiv.style.color = "red";
		wrongDiv.innerHTML = "이름은 최소 2자 최대 4자 한글로만 입력가능합니다.";	
		nickNameCheck = false;
	} else if (re3.test(this.value)) {
		wrongDiv.innerHTML = "사용가능한 이름입니다.";	
		wrongDiv.style.color = "blue";
		nickNameCheck = true;
	}
	
	if (this.value.length == 0) {
		
		wrongDiv.innerHTML = "";	
		nickNameCheck = false;
	}
}

function pwdFnc() {
	
	var wrongDiv = document.getElementById('wrongBox');
	
	var re = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

	if (!re.test(this.value)) {
		wrongDiv.style.color = "red";
		wrongDiv.innerHTML = "패스워드는 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력";
		pwdCheck = false;
		
	} else if (re.test(this.value)) {
		wrongDiv.innerHTML = "사용가능한 비밀번호입니다.";
		wrongDiv.style.color = "blue";
		pwdCheck = true;
	}
	
	if (this.value.length == 0) {
		wrongDiv.innerHTML = "";	
		pwdCheck = false;
	}	
}

function equalPwd() {
	var inputObj = document.getElementsByClassName('input-contents');
	var wrongDiv = document.getElementById('wrongBox');

	if (this.value.length >= inputObj[2].value.length || this.value.length <= inputObj[2].value.length
			&& this.value != inputObj[2].value ) {
		wrongDiv.style.color = "red";
		this.focus();
		wrongDiv.innerHTML = "입력하신 비밀번호와 일치하지 않습니다.";
		pwdEqCheck = false;
	}
	
	if (this.value == inputObj[2].value) {
		wrongDiv.style.color = "blue";
		wrongDiv.innerHTML = "입력하신 비밀번호와 일치합니다.";
		pwdEqCheck = true;
	}
	
	if (this.value.length == 0) {
		wrongDiv.innerHTML = "";
		pwdEqCheck = false;
	}

	
}

function check(re, what, message) {

	if (re.test(what.value)) {
		return true;
	}
	what.focus();
	
	return false;
}

function metaFnc() {
	var imgArray = new Array(8);

	for (var i = 0; i < imgArray.length; i++) {
		imgArray[i] = "../img/pika" + i + ".gif";
	}
	var imgNum = Math.round(Math.random() * 7);
	var objImg = document.getElementById("mainImg");
	objImg.src = imgArray[imgNum];
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

function validate() {

	var inputObj = document.getElementsByClassName('input-contents');
	var formObj = document.getElementById('formFirst');
	if (emailCheck == true && nickNameCheck == true && pwdCheck == true && pwdEqCheck == true) {
		formObj.setAttribute('action', './add');
		return true;
	} 
	return false;
}

function submitFnc() {
	var submitBnt = document.getElementById('target');
	var inputObj = document.getElementsByClassName('input-contents');

	if (inputObj[0].value.length > 0 && inputObj[1].value.length > 0
			&& inputObj[2].value.length > 0 && inputObj[3].value.length > 0
			&& inputObj[2].value == inputObj[3].value) {
		submitBnt.style.backgroundColor = '#1ea1f7';
		submitBnt.style.cursor = 'pointer';
		submitBnt.disabled = false;
	} else if (inputObj[0].value.length == 0 || inputObj[1].value.length == 0
			|| inputObj[2].value.length == 0 || inputObj[3].value.length == 0 || inputObj[2].value != inputObj[3].value) {
		submitBnt.style.backgroundColor = '#dddfe4';
		submitBnt.style.cursor = 'default';
		submitBnt.disabled = true;
	}
}

function inputEmailChk(){
    
    window.name = "parentForm";
    window.open("emailCheckForm.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
}



