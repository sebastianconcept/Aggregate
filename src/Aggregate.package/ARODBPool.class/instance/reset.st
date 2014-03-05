actions
reset
	"Closes all the OmniBase open clients"

	self clientsMutex critical:[
		self busyClients isEmpty ifFalse: [
			ARResetingWithOnlineClients signal: 'There are clients still in the used list.  
Beware that closing busy clients is not threadsafe.'].
		
		self idleClients do: [:anOpenOmniBase | 
			anOpenOmniBase notNil ifTrue: [
				anOpenOmniBase close]].
		
		idleClients := nil.
		
		self busyClients do: [:anOpenOmniBase | 
			anOpenOmniBase notNil ifTrue: [
				anOpenOmniBase close]].
		
		busyClients := nil]