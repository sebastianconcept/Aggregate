private
withClientDo: aBlock
	"Evaluates aBlock using one of the 
	(previously) idle clients as parameter
	and with it accessible as AGCurrentClient value 
	during the whole evaluation"

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
		[aBlock value: client] ensure:[
			"Transcript cr; show: 'returning client c: ', omnibase asString."
			self returnClient: client]]
