private
ensureParent
	parent ifNil:
		 [self parent: (self interiorNodeClass keys: keys emptyCopy).
		parent insertKey: self firstKey value: self].
	^ parent