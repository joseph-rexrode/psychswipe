var editButton = document.querySelector(".btn--edit");
var updateForm = document.querySelector(".form--update");
var avatar = document.querySelector(".profile--avatar");

editButton.addEventListener("click", toggleUpdateForm);

function toggleUpdateForm() {
	updateForm.classList.toggle("visible");
	updateForm.classList.toggle("hidden");
	avatar.classList.toggle("profile--avatar-mini");
	
	if (editButton.innerHTML == "Edit Basic Info") {
		editButton.innerHTML = "Cancel";
	}
	else {
		editButton.innerHTML = "Edit Basic Info";
	}
}