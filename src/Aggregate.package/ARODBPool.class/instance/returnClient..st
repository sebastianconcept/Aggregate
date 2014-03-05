actions
returnClient: anOmniBase
	"Makes anOmniBase to go from the busy ones 
	to the idle ones"

	self clientsMutex critical:[
		self busyClients remove: anOmniBase ifAbsent: [self returningUnusedClient].		
		self idleClients add: anOmniBase]