var patientButton = document.getElementById("btn--patient");
var providerButton = document.getElementById("btn--provider");
var welcomeText = document.querySelector(".welcome");


if (patientButton) {	
	patientButton.addEventListener("click", () => { toggleFormVisibility("form--patient", "form--provider"); });
}
if (providerButton) {	
	let insSelect = document.querySelector(".ins--select");
	let insCheckboxes = document.querySelector(".ins--checkboxes");
	let statesCheckboxes = document.querySelector(".states--checkboxes");
	let statesSelect = document.querySelector(".states--select");
	
	providerButton.addEventListener("click", () => { toggleFormVisibility("form--provider", "form--patient"); });
	
	insSelect.addEventListener("click", function() {
		insCheckboxes.classList.toggle("hidden");
		insCheckboxes.classList.toggle("visible");
	})
	
	statesSelect.addEventListener("click", function() {
		statesCheckboxes.classList.toggle("hidden");
		statesCheckboxes.classList.toggle("visible");
	})
}

function toggleFormVisibility(el, other) {
	var form = document.getElementById(el);
	var otherForm = document.getElementById(other);
	
	
	if (welcomeText) {
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
	}

	form.classList.toggle("hidden");
	form.classList.toggle("visible");

	
	if (otherForm.classList.contains("visible") && form.classList.contains("visible")) {
		otherForm.classList.toggle("visible");
		otherForm.classList.toggle("hidden");
	}
}

