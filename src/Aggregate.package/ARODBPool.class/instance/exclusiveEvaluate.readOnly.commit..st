private
exclusiveEvaluate: aBlock readOnly: isReadOnly commit: hasToCommit
	"Evaluates aBlock commiting changes to the repository depending on hasToCommit.
	Read only or not depends on isReadOnly's value"

	^ self withExclusiveClientDo: [:omnibase| |activeProcess currentTransaction previousTransaction|
		activeProcess := Processor activeProcess.
		currentTransaction := isReadOnly
						ifTrue: [omnibase newReadOnlyTransaction]
						ifFalse: [omnibase newTransaction].

		previousTransaction := OmniBase currentTransactionOrNil.

		OmniBase currentTransaction: currentTransaction.
		[hasToCommit
			ifTrue:[
				aBlock commitIn: currentTransaction]
			ifFalse:[
				aBlock evaluateIn: currentTransaction]] ensure:[
					OmniBase currentTransaction: previousTransaction]]