var cards = document.querySelectorAll(".card--home");
const cardParent = cards[0].parentNode;
var swipeCard;

setTopCards();

dragCard(swipeCard);

function dragCard(c) {
	var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0, originX = 0
	
	c.onmousedown = dragMouseDown
	
	// defines buttons for this specific card
	let passButton = c.querySelector(".btn--pass");
	let matchButton = c.querySelector(".btn--match");
	
	passButton.addEventListener("click", function() {
		console.log("Pass :(");
	})
	
	matchButton.addEventListener("click", function() {
		console.log("Match :)");
	})

	function dragMouseDown(e) {
		e = e || window.event;
		e.preventDefault();
				
		// set originX value to calculate opacity changes
		originX = e.clientX;
		
		// set starting points
		pos3 = e.clientX;
		pos4 = e.clientY;
		
		document.onmouseup = closeDragCard;
		document.onmousemove = cardDrag;
	}
	
	function cardDrag(e) {
		e = e || window.event;
		e.preventDefault();
		
		// sets pixel difference on mouse move
		pos1 = pos3 - e.clientX;
		pos2 = pos4 - e.clientY;
		
		// sets current point
		pos3 = e.clientX;
		pos4 = e.clientY;
		
		
		if (pos3 - originX >= 100) {
			c.style.transform = "rotate(20deg)";
		}
		
		else if (originX - pos3 >= 100) {
			c.style.transform = "rotate(-20deg)";
		}
		
		else {
			c.style.transform = "none";
		}
		
		// measure opacity based on distance from origin traveled
		var frOpacity = Math.abs(pos3 - originX) / 100;
		
		let cardOpacity = (frOpacity >= 0.8) ? 0.6 : 1 - (frOpacity / 2);

		// change stylings to match dragging change
		c.style.opacity = cardOpacity;
		c.style.position = "absolute";
		c.style.top = (c.offsetTop - pos2) + "px";
		c.style.left = (c.offsetLeft - pos1) + "px";
	}
	
	function closeDragCard() {
		
		// change stylings to match mouse up change
		// need static position to allow for align-self properties
		c.style.position = "static";
		c.style.top = "auto";
		c.style.left = "auto";
		
		if (pos3 - originX >= 100) {
			c.style.alignSelf = "flex-end";
			matchButton.click();
			c.style.opacity = "0";
			setTimeout(() => {
				c.remove()
				setTopCards();
				dragCard(swipeCard);
			}, 500);

		}
		else if (originX - pos3 > 100) {
			c.style.alignSelf = "flex-start";
			passButton.click();
			c.style.opacity = "0";
			setTimeout(() => {
				c.remove()
				setTopCards();
				dragCard(swipeCard);
			}, 500);
		}
		
		else {
			c.style.alignSelf = "center";
			c.style.opacity = "1";
		}
		
		
		document.onmouseup = null;
		document.onmousemove = null;
	}
}

function setTopCards() {
	console.log(cardParent.firstElementChild);
	let topCard = cardParent.firstElementChild;
	
	if (topCard != null) {
		
		topCard.classList.add("swipeCard");
		topCard.classList.remove("secondCard");
		
		if (topCard.nextElementSibling != null) {		
			topCard.nextElementSibling.classList.add("secondCard");
		}
		swipeCard = document.querySelector(".card.card--home.swipeCard");
	}
}

// need to reference jsp to get list of all providers
	// this will change later to reference algorithm that matches 
	// based on preferences
// first render should have two provider cards, one shown 
	// and one hidden behind (pos absolute)
// when shown card is pushed to either side and mouseup occurs
	// transition opacity to 0 slowly
	// append provider info to matched section if matched
	// then remove that element from innerhtml 
	// then appendChild to cardContainer to create new second card
	// previous "second" card is now top card and inherits those stylings