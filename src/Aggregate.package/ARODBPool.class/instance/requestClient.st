actions
requestClient
	"Answers an OmniBase instance taken from the idle clients.
	It's a thread safe operation."
	| anOmniBase |

	self clientsMutex critical: [
		"Transcript cr; show: 'getting odb client p: ', Processor activeProcess hash asString."
		anOmniBase := self hasIdleClients
						ifTrue: [self idleClients anyOne]
						ifFalse: [self openOmniBase].
		self idleClients remove: anOmniBase ifAbsent:[nil].
		self busyClients add: anOmniBase].
	
	^ anOmniBase