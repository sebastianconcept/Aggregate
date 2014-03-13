Aggregate
=========

Aggregate is a small persistance framework with a clean API that uses [OmniBase](https://github.com/sebastianconcept/OmniBase) as backend

##Motivation
Having a clean API to use in persistent models. The trade off is biased towards less general but easier to use.

##Applicability
Whatever you need to save with almost zero configuration and yet, with [ACID](http://en.wikipedia.org/wiki/ACID) features. It uses [OmniBase](https://github.com/sebastianconcept/OmniBase) so I suggest for small repositories (way below <<2TB)

###Loading

Use this snippet to load it into your [Pharo](http://www.pharo-project.org/home)* image:

    Gofer it 
		smalltalkhubUser: 'Pharo'
		project: 'MetaRepoForPharo30'; 
		package: 'ConfigurationOfAggregate';
		load.
	
    (Smalltalk at: #ConfigurationOfAggregate) load

###Examples

Make a session to the odb (it will create one if needed):

    pool := ARODBPool onPath: ('aha' / 'mhm') asFileReference path.

Saving a new dummy person aggregate

    pool commit:[		ARDummyUser new
			firstName: 'Chewbacca';
			save].
    
Fetching _all_ dummy person aggregates (and read-only-ish make them sing)

    pool readOnly:[		ARDummyUser findAll do:[:wookie| wookie sayGrroooouuugggaaaghhh]].

Fetching _Chewbaccas_ that ...

    pool readOnly:[		ARDummyUser withFirstName: 'Chewbacca' ].
		

are being...

    ARDummyPerson class>>withFirstName: aName
     	^ self storage find: self where: #firstName is: aName


...indexed like this:

    ARDummyPerson class>>indices    	"Answers the indices for this aggregate
    	so it performs well for the application using it.
    	Note: a repository index rebuild is needed when this definition changes"    	^ super indices		add: (ARAttributeIndex new 				aggregateClass: self; 				selector: #firstName;				keySize: self nameKeySize;				yourself);		yourself


###Performance

It's quite nice. You can take a look at 

    ARIndexingTest>>benchmarksBasic


###Contributions

...are welcomed, send that push request and hopefully we can review it together

###*Pharo Smalltalk
Getting a fresh Pharo Smalltalk image and its virtual machine is as easy as running in your terminal:
 
    wget -O- get.pharo.org/30+vm | bash

_______

MIT - License

2014 - [sebastian](http://about.me/sebastianconcept)

o/