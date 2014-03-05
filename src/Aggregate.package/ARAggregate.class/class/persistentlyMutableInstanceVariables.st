private
persistentlyMutableInstanceVariables
	"Answers the instance variables of this aggregate that are going to 
	be publicly manipulable."
	
	"We exclude #isNew and the #id of the aggregate"
	^  self persistentInstanceVariables reject:[:e|
		e = 'id' or:[
		e = 'isNew' or:[
		e = 'oid']]]