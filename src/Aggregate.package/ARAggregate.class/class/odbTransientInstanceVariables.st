private
odbTransientInstanceVariables
	"This method tells OmniBase which instance variables should not be stored into the database."

	"the hashCache is transident stuff for the persistence machinery"
	^super odbTransientInstanceVariables
		add: 'isProxied';  "<--- isProxied becomes true once the persistent got rid of the proxies (and subproxies)"
		yourself