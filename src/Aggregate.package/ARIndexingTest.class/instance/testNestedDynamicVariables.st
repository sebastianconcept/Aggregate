testing
testNestedDynamicVariables

	self assert: ARCurrentClient value isNil.

	ARCurrentClient use: 1 during:[
		self assert: ARCurrentClient value = 1.
		ARCurrentClient use: 2 during:[
			self assert: ARCurrentClient value = 2].
		self assert: ARCurrentClient value = 1].
	
	self assert: ARCurrentClient value isNil

