accessing
delayFreshOID

	| guy delay |

	self odb readOnly:[
		guy := ARPersonMock findAll asSet anyOne.
		delay := [1000 timesRepeat:[|g|
					g := guy freshOID]] timeToRun].
	^ delay