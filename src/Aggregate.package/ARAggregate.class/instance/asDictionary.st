private
asDictionary 

	| dic |
	
	dic := Dictionary new.
	
	self class allInstVarNames do:[:name|
		dic at: name put: (self instVarNamed: name) asString].
	
	^ dic