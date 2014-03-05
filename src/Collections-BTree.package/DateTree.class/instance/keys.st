accessing
keys
	| keys |
	keys := Set new.
	self keysAndValuesDo: [:k :v | keys add: k].
	^ keys