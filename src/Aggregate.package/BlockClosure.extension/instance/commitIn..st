*aggregate
commitIn: anOmniBaseTransaction
		"Evaluate the receiver block while setting the current transaction 
		to anOmniBaseTransaction. If an error occurs during execution of
		this block the transaction will be rolled back. If there is no error the
		transaction will be committed. Answer the result of evaluating the block."

	| activeProcess previousTxn result |
	activeProcess := Processor activeProcess.
	previousTxn := OmniBase getCurrentAndSet: anOmniBaseTransaction for: activeProcess.
	[result := [[|answer|
				answer := self value.
				anOmniBaseTransaction commit.
				answer] 
					on: WAResponseNotification
					do:[:notification| 
						anOmniBaseTransaction commit.
						notification signal]] ensure:[
							anOmniBaseTransaction abort]]
		ensure: [
			previousTxn isNil
				ifTrue: [OmniBase removeFor: activeProcess]
				ifFalse: [OmniBase setTransaction: previousTxn for: activeProcess]].
	^result