actions
addDummyUsers: anInteger times: anotherInteger to: aPool and: aSet do: aBlock

	anotherInteger timesRepeat:[
		aPool commit:[
			anInteger timesRepeat: [ |guy|
				guy := ARDummyUser new.
				aSet add: guy.
				aBlock value: guy.
				guy save]]]