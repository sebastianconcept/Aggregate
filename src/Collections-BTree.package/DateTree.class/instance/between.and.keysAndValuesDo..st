enumerating
between: startDateAndTime and: endDateAndTime keysAndValuesDo: aBlock
	| startOrLater endOrEarlier |

	"This adds stuff really slowly; I'm not sure what to do about that yet"
	startOrLater := TreeSet new.
	endOrEarlier := TreeSet new.
	startTimes from: DateAndTime epoch to: endDateAndTime do: [ :ea | endOrEarlier addAll: ea ].
	"Kluge to make the ranges work."
	endTimes from: startDateAndTime to: (DateAndTime year: 2029 day: 1) do: [ :ea | startOrLater addAll: ea ].
	(startOrLater intersection: endOrEarlier) do: [ :ea | aBlock value: ea value: (self at: ea) ].