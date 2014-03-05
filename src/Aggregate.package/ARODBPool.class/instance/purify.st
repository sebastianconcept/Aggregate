actions
purify
	"Makes a garbage collection and then evolves.
	It should leave the new odb with the cremme de la cremme"
	
	self triggerEvent: #aboutToPurify: with: self.
	
	"Free all the clients of this odb"
	self reset.
	"To do: broadcast a free clients request and wait rasonably."

	"The garbage collection before the hot backup is needed
	because sometimes there are residual versions that would
	throw an exception interrupting the backup."
	self withExclusiveClientDo:[:anOmniBase|
		self 
			reorganizeOn: anOmniBase;
			purifyOn: anOmniBase].

	self reset.

	self removePreviousGeneration.

	(path / 'lastPurifyOn') asFileReference ensureCreateFile writeStreamDo:[:str| 
		str nextPutAll: DateAndTime current asString]