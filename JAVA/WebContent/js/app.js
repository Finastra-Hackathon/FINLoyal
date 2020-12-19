function updatePoints(name) {
	var points = document.getElementById('userPoints').value;
	
	console.log('Updated points are ' + points)
	
	if (points) {
		alert('Details are updated.')
	} else {
		alert('No points given for update.')
	}
}