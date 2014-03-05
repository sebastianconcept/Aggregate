actions
lockOdb
	"Locks the odb."

	(self numberOfUsers > 1 or:[
	(self numberOfUsers = 1 and:[
	busyClients size = 1])]) ifTrue:[
		^ ARCantLockOdb signal].
	
	self isLockedFile ensureCreateFile