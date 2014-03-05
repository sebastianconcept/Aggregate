accessing
delayOID

	| pal delay oid |

	self odb readOnly:[
		pal := ARPersonMock findAll asSet anyOne.
		oid := pal odbGetOID.
		delay := [1000 timesRepeat:[|g|
					g := ARPersonMock currentTransaction objectAt: oid]] timeToRun].

	^ delay