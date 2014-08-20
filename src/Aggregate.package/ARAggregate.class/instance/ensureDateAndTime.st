actions
ensureDateAndTime
	"Jan 5, 2014 Pharo 3 is near release and TimeStamp 
	is probably going to be deprecated in favor of DateAndTime 
	so this method ensures that no TimeStamp instances are stored
	in this receiver's instVars and if found any, it will replace it 
	for its equivalent DateAndTime"
	
	self class persistentlyMutableInstanceVariables do:[:instVarName| |val|
		val := self perform: instVarName asSymbol.
		(val class = TimeStamp or:[
		val class = DateAndTime ]) ifTrue:[
			val hasJdn ifTrue:[
				val ensurePharo3.
				self 
					perform: (instVarName,':') asSymbol 
					with: (DateAndTime fromSeconds: val asSeconds) ] ]
		]
	
	