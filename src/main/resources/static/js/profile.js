var editButton = document.querySelector(".btn--edit");
var updateForm = document.querySelector(".form--update");

editButton.addEventListener("click", toggleUpdateForm);

function toggleUpdateForm() {
	updateForm.classList.toggle("visible");
	
	if (editButton.innerHTML == "Edit") {
		editButton.innerHTML = "Cancel";
	}
	else {
		editButton.innerHTML = "Edit";
	}
}