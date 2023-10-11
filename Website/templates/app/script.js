const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

var objPeople = [
	{ // Object @ 0 index
		email: "mihai@test.com",
		password: "12345"
	},
	{ // Object @ 1 index
		email: "matt@test.com",
		password: "academy"
	},
	{ // Object @ 2 index
		email: "chris@test.com",
		password: "forever"
	}

];

function getInfo() {
	var email = document.getElementById('loginEmail').value;
	var password = document.getElementById('loginPassword').value;

	for(var i = 0; i < objPeople.length; i++) {
		// check is user input matches username and password of a current index of the objPeople array
		if(email == objPeople[i].email && password == objPeople[i].password) {
			alert(email + " is logged in!!!");
			window.onload = function() {
				location.href = "https://www.javascripttutorial.net/";
			};
			return;
		}
	}
	alert("incorrect username or password");
}