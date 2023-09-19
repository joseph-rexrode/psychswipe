var card = document.querySelector(".card.swipeCard");

dragCard(card);

function dragCard(c) {
	var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0, originX = 0, originY = 0;
	
	c.onmousedown = dragMouseDown

	function dragMouseDown(e) {
		e = e || window.event;
		e.preventDefault();
		
		originX = e.clientX;
		originY = e.clientY;
		
		console.log(originX + ", " + originY);
		
		pos3 = e.clientX;
		pos4 = e.clientY;
		document.onmouseup = closeDragCard;
		document.onmousemove = cardDrag;
	}
	
	function cardDrag(e) {
		e = e || window.event;
		e.preventDefault();
		
		pos1 = pos3 - e.clientX;
		pos2 = pos4 - e.clientY;
		pos3 = e.clientX;
		pos4 = e.clientY;
		
		c.style.top = (c.offsetTop - pos2) + "px";
		c.style.left = (c.offsetLeft - pos1) + "px";
	}
	
	function closeDragCard() {
		
		if (pos3 - originX >= 100) {
			c.style.alignSelf = "flex-end";
		}
		else if (originX - pos3 > 100) {
			c.style.alignSelf = "flex-start";
		}
		
		else {
			c.style.alignSelf = "center";
		}
		
		console.log(c.style.alignSelf + ", " + c);
		
		document.onmouseup = null;
		document.onmousemove = null;
	}
}