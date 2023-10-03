toggleProfileSidebar();

function toggleProfileSidebar() {
	let profileButton = document.querySelector(".profile--button");
	let sidebar = document.querySelector(".sidebar");
	let main = document.querySelector(".main");
	
	profileButton.addEventListener("click", function() {
		sidebar.setAttribute("data-position", 
			(sidebar.getAttribute("data-position") == "open") ?
				"closed" : "open");
	})
	
	main.addEventListener("click", function() {
		if (sidebar.getAttribute("data-position") == "open") {
			sidebar.setAttribute("data-position", "closed");
		}
	})
	
}