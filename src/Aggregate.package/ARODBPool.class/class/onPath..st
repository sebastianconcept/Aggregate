actions
onPath: aPath
	"Answers a new pool to work on aDirectoryName"

	^ self new
		initializeOnPath: aPath;
		yourself