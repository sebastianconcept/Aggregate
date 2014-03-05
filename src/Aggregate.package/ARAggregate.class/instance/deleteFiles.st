actions
deleteFiles
	"Deletes files in the directory where this aggregate is supposed to store attached files"
	
	| directory |
	
	directory := self session pathFor: self.

	directory exists ifTrue:[
		directory deleteAll]
