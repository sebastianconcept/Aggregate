private
createBackupOf: anOmniBase on: newDirectoryName
	"Starts an on-line backup process creating a (hot) backup copy
	of the receiver database." 
	
	anOmniBase createBackupOn: newDirectoryName asFileReference pathString