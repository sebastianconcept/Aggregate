Aggregate
=========

Aggregate is a small persistance framework with a clean API and full [ACID](http://en.wikipedia.org/wiki/ACID) features that uses [OmniBase](https://github.com/sebastianconcept/OmniBase) as backend and supports [BTree](http://en.wikipedia.org/wiki/B-tree)-based indexing.

##Motivation
The motivation for this is to have a clean API to use in persistent models. The trade off is biased towards having something _less general_ but _easier to use_.

##Applicability
Whatever you need to save with almost zero configuration and yet, with [ACID](http://en.wikipedia.org/wiki/ACID) features. It uses [OmniBase](https://github.com/sebastianconcept/OmniBase) so I say it should be good for small repositories (by small I mean way below <<2TB)

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

    pool readOnly:[		ARDummyUser findAll do:[:wookie| 
			wookie sayGrroooouuugggaaaghhh]].

Fetching _Chewbaccas_ that ...

    pool readOnly:[		ARDummyUser withFirstName: 'Chewbacca' ].
		

are being...

    ARDummyPerson class>>withFirstName: aName
     	^ self storage find: self where: #firstName is: aName


...indexed because they have this class side method:

    ARDummyPerson class>>indices    	"Answers the indices for this aggregate
    	so it performs well for the application using it.
    	Note: a repository index rebuild is needed when this definition changes"    	^ super indices		add: (ARAttributeIndex new 				aggregateClass: self; 				selector: #firstName;				keySize: self nameKeySize;				yourself);		yourself

Garbage collect the database

    pool purify


###Performance

Well is filebased [BTrees](http://en.wikipedia.org/wiki/B-tree) so... 

Go ahed and take a look here:

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