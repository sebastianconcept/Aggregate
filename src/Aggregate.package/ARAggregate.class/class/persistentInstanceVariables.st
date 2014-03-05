private
persistentInstanceVariables 
	"Answers the instance variables in the receiver that are going to be persisted (not ignored by the storage.)"
	
	^ self allInstVarNames reject:[:instVarName|
		self odbTransientInstanceVariables includes: instVarName]