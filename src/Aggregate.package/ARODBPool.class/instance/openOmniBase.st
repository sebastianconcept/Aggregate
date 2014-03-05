actions
openOmniBase
	"Returns a new OmniBase instance 
	opened in the path of this pool.
	It will create a repository when none is found"

	path asFileReference exists ifFalse:[
		path asFileReference ensureCreateDirectory].

	^ self hasOmniBaseFiles
		ifFalse:[OmniBase createOn: path asFileReference pathString]
		ifTrue: [OmniBase openOn: path asFileReference pathString].