actions
refresh 
	"Makes the receiver to refresh itself.
	At first glance this seems silly but it absolutely 
	makes sense when this aggregate is composed 
	by another aggregate/s."
	
	self onAboutToRefresh.
	
	self onAboutToEnsureValuesIn: self from: self.
	self class ensureValuesIn: self from: self
