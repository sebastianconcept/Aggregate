accessing
delayAt

	| guy delay |

	self odb readOnly:[
		guy := ARPersonMock findAll asSet anyOne.
		delay := [1000 timesRepeat:[|g|
					g := ARPersonMock atId: guy id]] timeToRun].

	^ delay