const rows = document.querySelectorAll(".row");
toggleProfileSidebar();

rows.forEach((row) => {
	row.addEventListener("click", function() {
		let arrow = row.querySelector("svg");
		let moreInfoSection = row.nextElementSibling;
		
		if (!arrow.classList.contains("open")) {	
			closeCurrentActiveRow();
		}
		
		arrow.classList.toggle("open");
		moreInfoSection.classList.toggle("hidden");
		moreInfoSection.classList.toggle("visible");
		row.classList.toggle("row--active");
		
	})
})


function closeCurrentActiveRow() {
	rows.forEach((row) => {
		let arrow = row.querySelector("svg");
		let moreInfoSection = row.nextElementSibling;
		
		arrow.classList.remove("open");
		moreInfoSection.classList.add("hidden");
		moreInfoSection.classList.remove("visible");
		row.classList.remove("row--active");
	})
}