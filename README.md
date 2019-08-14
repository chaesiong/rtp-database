# rtp-database
Collaborative development between DERMALOG and MSCS

![workflow](https://user-images.githubusercontent.com/53939926/63028911-edd19380-beaf-11e9-8ef7-1df9e4269cb4.png)

1.	Production DB is cloned (or set up from sources fetched in step (2))
2.	Production sources are pushed into Git
3.	If a developer needs to change or create an object, the corresponding source file is copied or created, respectively, into the current development directory
4.	These files are used as a basis for development. 
5.	Changes are commited with comments and pushed back into Git
6.	Completed changes are installed into a pre-production system for testing
7.	Once all tests are completed and the changes shall be applied to production, pre-production sources are pushed into Git (analog to (2))
8.	From the diffs between production and pre-production, an update package for production is created
This update package will be applied to the original (one-and-only!) UAT system, put into flashback-recovery mode.
*	If tests fail, it is recovered from flashback and update package must be fixed.
*	If tests succeed, the update is applied to production

