testing
testOccurrences

	| dates someUserIds sorted |

	self resetStorage.
	dates := Array with: DateAndTime today with: DateAndTime yesterday.
	self addDummyUsers: 10 times: 1 do:[:guy| guy createdOn: dates shuffled first].
	someUserIds := users collect:[:u| u id].
	sorted := users asSortedCollection:[:a :b| a createdOn > b createdOn].
	
	pool readOnly:[
		(ARDummyUser from: 1 to: 10 of: #createdOn) do:[:guy|
			self assert: (someUserIds includes: guy id).
			self assert: (users anySatisfy: [:u| u id = guy id])]].
	
	pool readOnly:[
		"All the occurrences of dates must fetch all the guys"
		self assert: (ARDummyUser from: 1 to: 10 of: #createdOn) size = users size.
		(ARDummyUser from: 1 to: 10 of: #createdOn) do:[:guy|
			self assert: (users anySatisfy: [:e| e = guy])]].

	pool readOnly:[|guys group todayPeople yesterdayPeople |
		"the occurrences must be fetched sorted"
		todayPeople := users select:[:e| e createdOn = DateAndTime today].
		yesterdayPeople := users select:[:e| e createdOn = DateAndTime yesterday].
		guys := ARDummyUser from: 1 to: yesterdayPeople size  of: #createdOn.
		self assert: guys size = yesterdayPeople size.
		self assert: (guys allSatisfy: [:e| e createdOn = DateAndTime yesterday]).

		guys := ARDummyUser from: 1 to: (yesterdayPeople size -1) of: #createdOn.
		self assert: guys size = (yesterdayPeople size -1).
		self assert: (guys allSatisfy: [:e| e createdOn = DateAndTime yesterday]).

		guys := ARDummyUser from: 2 to: yesterdayPeople size of: #createdOn.
		self assert: guys size = (yesterdayPeople size - 1).
		self assert: (guys allSatisfy: [:e| e createdOn = DateAndTime yesterday]).

		guys := ARDummyUser from: 2 to: (yesterdayPeople size -1) of: #createdOn.
		self assert: guys size = (yesterdayPeople size -2).
		self assert: (guys allSatisfy: [:e| e createdOn = DateAndTime yesterday]).

		guys := ARDummyUser from: yesterdayPeople size to: (yesterdayPeople size +1) of: #createdOn.
		self assert: guys size = 2.
		self assert: guys first createdOn = DateAndTime yesterday.
		self assert: guys second createdOn = DateAndTime today.

		guys := ARDummyUser from: (todayPeople size -1) to: 1 of: #createdOn.
		dates := guys collect:[:e| e createdOn].
		self assert: guys size = (todayPeople size -1).
		self assert: (guys allSatisfy: [:e| dates includes: e createdOn ]).

		guys := ARDummyUser from: todayPeople size to: 2 of: #createdOn.
		dates := guys collect:[:e| e createdOn].
		group := ARDummyUser from: 2 to: todayPeople size of: #createdOn.
		self assert: (guys allSatisfy: [:e| group includes: e]).
		self assert: (group allSatisfy: [:e| guys includes: e]).
		self assert: guys size = (todayPeople size - 1).
		self assert: (guys allSatisfy: [:e| dates includes: e createdOn ]).

		guys := ARDummyUser from: (todayPeople size -1) to: 2 of: #createdOn.
		dates := guys collect:[:e| e createdOn].
		self assert: guys size = (todayPeople size -2).
		self assert: (guys allSatisfy: [:e| dates includes: e createdOn]).
		].
