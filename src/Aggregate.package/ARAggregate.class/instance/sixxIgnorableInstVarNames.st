private
sixxIgnorableInstVarNames
	"If we are using SIXX to dump/import data (and you should!), 
	then we will ignore the oid that was given to this aggregate in this (current) repository,
	otherwise, any import (which creates a new repo) would get confused."
	 
	^#(#oid)