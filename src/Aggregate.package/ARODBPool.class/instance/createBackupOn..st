actions
createBackupOn: aPath
	"Starts an on-line backup process creating a (hot) backup copy
	of the receiver database." 
	
	self withClientDo:[:anOmniBase|
		anOmniBase createBackupOn: aPath asFileReference pathString]