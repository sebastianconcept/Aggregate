private
withExclusiveClientDo: aBlock
	"Evaluates aBlock using one of the idle clients using it as parameter.
	It will be accessible during the whole evaluation using the 
	dynamic variable: AGCurrentClient value
	The evaluation is exclusive, so it will set the locked file"

	| client |

	[[client := self requestClient] 
		on: ODBLockNotification 
		do:[:notification|
			Transcript cr; show: 'lock notification'.
			notification resume]] 
				on: ODBStreamLockedNotification
				do:[:notification| 
					Transcript cr; show: 'stream lock notification'.
					notification resume].
				
	^ ARCurrentClient use: client during:[
		[
		self lockOdb.
		aBlock value: client] ensure:[
			"Transcript cr; show: 'returning client c: ', omnibase asString."
			self unlockOdb.
			self returnClient: client.
			self reset]]
