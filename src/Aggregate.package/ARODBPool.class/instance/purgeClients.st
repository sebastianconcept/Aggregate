actions
purgeClients

	self clientsMutex critical:[
		self busyClients do:[:client|
			client isUsable ifFalse:[self busyClients remove: client ifAbsent:[nil]]].
					
		self idleClients do:[:client|
			client isUsable ifFalse:[self idleClients remove: client ifAbsent:[nil]]]].