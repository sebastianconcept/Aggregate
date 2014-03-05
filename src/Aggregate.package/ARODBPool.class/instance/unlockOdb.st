actions
unlockOdb
	"Unlocks the odb."

	self isLockedFile deleteIfAbsent: [ nil ]