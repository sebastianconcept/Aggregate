actions
clean

	pool commit:[
		self aggregates do:[:e| e destroy]]