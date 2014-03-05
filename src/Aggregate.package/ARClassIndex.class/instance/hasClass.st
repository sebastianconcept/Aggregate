testing
hasClass
	"Answers true if this index finds that className 
	is the name of a class that exists in this image."

	"Applicability: renaming objects persisted in the storage 
	is not that rare and migrations use to need this kind of checks"
	^ Smalltalk includesKey: className
	