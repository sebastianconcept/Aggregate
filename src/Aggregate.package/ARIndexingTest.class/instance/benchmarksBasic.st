actions
benchmarksBasic
	| creation update deletion destruction |

	self setUp.

	creation := [1 to: 100 do:[:i|
		pool commit:[
			1to: 10 do:[:j|
				ARDummyPerson new save]]]] timeToRun.
	Transcript cr; show: 'creating 1000 aggregates in: '; show: creation asString; show: ' [msec]'.

	update := [|stream|
	stream := (pool readOnly:[ARDummyPerson findAll]) asArray readStream.
	[stream atEnd] whileFalse:[
		pool commit:[
			(stream next: 10) do:[:each|
				each fresh save]]]] timeToRun.
	Transcript cr; show: 'updating 1000 aggregates in: '; show: update asString; show: ' [msec]'.

	deletion := [|stream|
	stream := (pool readOnly:[ARDummyPerson findAll]) asArray readStream.
	[stream atEnd] whileFalse:[
		pool commit:[
			(stream next: 10) do:[:each|
				each fresh delete]]]] timeToRun.
	Transcript cr; show: 'deleting 1000 aggregates in: '; show: deletion asString; show: ' [msec]'.

	destruction := [|stream|
	stream := (pool readOnly:[ARDummyPerson findAll]) asArray readStream.
	[stream atEnd] whileFalse:[
		pool commit:[
			(stream next: 10) do:[:each|
				each fresh destroy]]]] timeToRun.
	Transcript cr; show: 'destroying 1000 aggregates in: '; show: destruction asString; show: ' [msec]'.
	
	self tearDown.
