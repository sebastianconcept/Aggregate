accessing
someNumbers

	| rnd |

	rnd := Random new.
	rnd seed: TimeStamp now asSeconds.
	
	^ (1 to: 1000) collect:[:i|
		rnd next]