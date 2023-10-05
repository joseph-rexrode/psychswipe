const editButton = document.querySelector(".btn--edit");
const updateForm = document.querySelector(".form--update");
const avatar = document.querySelector(".profile--avatar");
const editAvatarButton = document.querySelector(".profile--avatar-edit");
const closeEditAvatarScreenButton = document.querySelector(".close");
const editAvatarScreen = document.querySelector(".profile--avatar-edit-form");

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

editAvatarButton.addEventListener("click", function() {
	editAvatarScreen.style.scale = "1";
})

closeEditAvatarScreenButton.addEventListener("click", function() {
	editAvatarScreen.style.scale = "0";
})