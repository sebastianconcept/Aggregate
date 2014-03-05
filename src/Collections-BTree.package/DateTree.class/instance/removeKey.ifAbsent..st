adding
removeKey: aTimespan ifAbsent: exceptionBlock
	| set |
	events removeKey: aTimespan ifAbsent: [^ exceptionBlock].
	
	"If we got here, we should be able to remove the start and end caches too."
	set := (startTimes at: aTimespan start) remove: aTimespan; yourself.
	set isEmpty ifTrue: [ startTimes removeKey: aTimespan start ].
	set := (endTimes at: aTimespan end) remove: aTimespan; yourself.
	set isEmpty ifTrue: [ endTimes removeKey: aTimespan end ].