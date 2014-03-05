actions
ensureExistence
	"Makes sure that an OmniBase repository 
	exists in path. It will only create a repo
	if the path does not (previously) exists"

	self isLocked ifTrue:[ ^self].
	
	(ODBFileStream directoryExists: path asFileReference pathString) ifFalse:[
		path asFileReference ensureCreateDirectory.
		self lockOdb.
		[OmniBase createOn: path asFileReference pathString]
			ensure:[self unlockOdb]].
