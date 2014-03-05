private
split
	| other midpoint |
	other := self class keys: keys emptyCopy.
	midpoint := self size // 2 + 1.
	midpoint to: self size do:
		[:i |
		other insertKey: (keys at: i) value: (self at: i) at: (i - midpoint + 1).
		keys at: i put: nil.
		self at: i put: nil].
	
	self ensureParent insertKey: other firstKey value: other