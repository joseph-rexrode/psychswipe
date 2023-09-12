var patientButton = document.getElementById("btn--patient");
var providerButton = document.getElementById("btn--provider");
var welcomeText = document.querySelector(".welcome");

console.log(providerButton);

patientButton.addEventListener("click", () => { toggleFormVisibility("form--patient", "form--provider"); });
providerButton.addEventListener("click", () => { toggleFormVisibility("form--provider", "form--patient"); });

function toggleFormVisibility(el, other) {
	var form = document.getElementById(el);
	var otherForm = document.getElementById(other);
	
	if (otherForm.classList.contains("hidden")) {
		if (form.classList.contains("hidden")) {
			welcomeText.style.fontSize = "16pt";
			welcomeText.style.transition = "400ms 0ms"
		}
		else {			
			welcomeText.style.fontSize = "24pt";	
			welcomeText.style.transition = "400ms 600ms"
		}
	}

	form.classList.toggle("hidden");
	form.classList.toggle("visible");
	
	if (otherForm.classList.contains("visible") && form.classList.contains("visible")) {
		otherForm.classList.toggle("visible");
		otherForm.classList.toggle("hidden");
	}
}