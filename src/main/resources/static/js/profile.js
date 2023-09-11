var editButton = document.querySelector(".btn--edit");
var updateForm = document.querySelector(".form--update");
var avatar = document.querySelector(".profile--avatar");

editButton.addEventListener("click", toggleUpdateForm);

function toggleUpdateForm() {
	updateForm.classList.toggle("visible");
	avatar.classList.toggle("profile--avatar-mini");
	
	if (editButton.innerHTML == "Edit") {
		editButton.innerHTML = "Cancel";
	}
	else {
		editButton.innerHTML = "Edit";
	}
}