actions
reorganize

	self triggerEvent: #aboutToReorganize: with: self.
	
	"Free all the clients of this odb"
	self reset.
	"To do: broadcast a free clients request and wait rasonably."
	
	^ self withExclusiveClientDo:[:omnibase|
		self reorganizeOn: omnibase]