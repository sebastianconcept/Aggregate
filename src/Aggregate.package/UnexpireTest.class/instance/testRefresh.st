test
testRefresh

	| guy fresh |

	guy := ARPersonMock testPerson.
	pool commit:[guy save].	
	
	"Same transaction"
	pool commit:[
		guy := ARPersonMock first. 
		guy save.
		guy := guy fresh.
		guy name: 'Ivan Ilich'.
		self assert: guy name = 'Ivan Ilich'.
		fresh := guy fresh.
		self assert: fresh name = 'Ivan Ilich'].
	
	"Different transaction - first part"
	pool commit:[
		guy := fresh fresh.
		guy name: 'Ivan Ilich'.
		guy save.
		fresh := guy].
	
	"Different transaction - second part"
	pool commit:[
		guy := fresh fresh.
		guy name: 'Dr. Who'.
		guy save.

		"a quick sanity check..."
		self deny: guy name = 'Ivan Ilich'.
		self assert: guy name = 'Dr. Who'.
		
		self deny: guy fresh name = 'Ivan Ilich'.
		self assert: guy fresh name = 'Dr. Who'].

	pool commit:[
		self assert: guy name = 'Dr. Who'.
		self assert: guy fresh name = 'Dr. Who']
