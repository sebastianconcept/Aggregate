private
purifyOn: anOmniBase
	"Returns the next generation of this odb.
	This is what this does:
	1. create a hot backup of the current odb in path.NG
	2. closes this odb.
	3. renames this odb to path.old
	4. renames path.NG to path."
	
	| nextGeneration |
	nextGeneration := path parent / (path basename,'.NG').
	nextGeneration asFileReference exists ifTrue:[
		"Discarding a failed successor isn't key for evolution?"
		nextGeneration asFileReference deleteAll].

	self createBackupOf: anOmniBase on: nextGeneration.
	path asFileReference renameTo: (path basename,'.old').
	nextGeneration asFileReference renameTo: path basename.
	