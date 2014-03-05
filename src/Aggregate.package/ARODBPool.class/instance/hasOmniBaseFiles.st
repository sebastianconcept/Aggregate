testing
hasOmniBaseFiles 

	^ path asFileReference exists and:[|files|
	files := path asFileReference allFiles collect:[:f| f basename].
	#(
	'omnibase.log'
	'omnibase.cif'
	'omnibase.cid'
	'omnibase.odt'
	'omnibase.vcf'
	) allSatisfy: [:e|
		files includes: e ]]
