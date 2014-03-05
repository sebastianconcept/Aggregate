private
addIndicesTo: aStorage
	"Add the indices of this aggregate to aStorage.
	Note: this can be used for tunning when developing.
	Not normally used in production (unless installing a 
	new repo is part of the app)."

	"we are using one container per index"
	self indices do:[:anIndex| 
		aStorage addIndex: anIndex]