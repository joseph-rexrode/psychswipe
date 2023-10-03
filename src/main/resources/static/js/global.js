const toggleButtons = document.querySelectorAll(".btn--toggler");

toggleProfileSidebar();
toggleActive();

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

function delayForButtonTransition(url) {
	setTimeout(function() {
		window.location = url
	}, 1000);
}

function toggleActive() {
	toggleButtons.forEach(t => {
		t.addEventListener("click", function() {
			t.classList.toggle("active");
		})
	})
}