var loginCard = document.querySelector(".login");
var registerCard = document.querySelector(".register");
var loginSwitch = document.getElementById("switch-login");
var registerSwitch = document.getElementById("switch-register");

loginSwitch.addEventListener("click", function() {
	loginCard.style.zIndex = "1";
	registerCard.style.zIndex = "2";
	console.log(loginCard.style.zIndex);
	console.log(registerCard.style.zIndex);
});

registerSwitch.addEventListener("click", function() {
	loginCard.style.zIndex = "2";
	registerCard.style.zIndex = "1";
	console.log(loginCard.style.zIndex);
})