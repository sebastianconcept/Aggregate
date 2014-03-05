as yet unclassified
shiftRightFrom: index
	self size to: index+1 by: -1 do:
		[:i |
		self at: i put: (self at: i - 1)]
	