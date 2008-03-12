*************************************************
*						*
*  PureMVC for ColdFusion v1.0 Alpha Readme  	*
*						*
*************************************************

Introduction
-----------------------------------------------------------
PureMVC for ColdFusion is a lightweight framework based on the PureMVC 2.0 AS3 Reference implementation for creating 
applications based upon the classic Model-View-Controller design pattern.

This implementation of the framework is still being tested and needs more documentation, demos, and utilities, but 
has all the functionality of the 2.0 AS3 Reference implementation. 

Please feel free to experiment with it and tell us what you think! If you would like to contribute to the project in 
some form or another, send me an email at michael.oddis@puremvc.org. We need demo's and utilities and lots of feedback.


Prerequisites
-----------------------------------------------------------
- Adobe ColdFusion 8
- CFUnit v2.0 Beta 4 (only required if running unit tests)


Installation
-----------------------------------------------------------
Lastest release: tags/1.0
Trac website: http://trac.puremvc.org/PureMVC_CF
SVN repository: http://svn.puremvc.org/PureMVC_CF

STEP 1 - Download the latest release above from the Trac website or SVN and choose a scenaro for installation.
	
	[SCENARIO 1]
	The quickest and easiest way to install the framework is to extract the contents of the PureMVC_CF.zip into the root of 
	your website. So, if your site root is located at 'C:\ColdFusion8\wwwroot\' then extract the contents of the zip under wwwroot.
	You should see the folders listed below under site root.
	
	cfcdoc - API Documentation
	org - Framework classes.
	test - Framework Unit Test classes.
	
	[SCENARIO 2]
	You can configure ColdFusion mappings to access the framework using the ColdFusion Administrator.
	1 - Extract the contents of the PureMVC_CF_1_0.zip into any preferred location outside your site root.
	2 - Login to the ColdFusion Admin and create a mapping named "org", which points to the location of the
		"org" folder you extracted from the PureMVC_CF_1_0.zip archive. Do the same for "test" if you plan on running the unit tests.
		
	To run the unit tests or if you will be contributing to the code base you must configure your development environment to use 
	CFUnit for unit testing. Proceed to STEP 2. if not, then you can simple delete the "test" folder. 
		
STEP 2 - Download CFUnit v2.0 Beta 4 at (http://cfunit.sourceforge.net/)

	[SCENARIO 1]
	The quickest and easiest way to install CFUnit is to extract the contents of the CFUnit archive into the root of 
	your website. So, if your site root is located at (C:\ColdFusion8\wwwroot\) then extract the contents 
	of the CFUnit archive under wwwroot. As long as it is accessible when accessing your website all things should work 
	as expected. You should have a folder named "net" under your site root (C:\ColdFusion8\wwwroot\net).

	[SCENARIO 2]
	You can configure ColdFusion mappings to access CFUnit using the ColdFusion Administrator.
	1 - Extract the contents of the CFUnit archive into any preferred location outside your site root.
	2 - Login to the ColdFusion Admin and create a mapping named "net", which points to the location of the
		"net" folder you extracted from the CFUnit archive you downloaded above.

API Documentation
-----------------------------------------------------------
1- To view API documentation go to http://[yourdomainhere]:[yourport]/cfcdoc/index.cfm

Demos and Utils
-----------------------------------------------------------
You can download demos and utils from the Trac website listed above.

The demos provided will give you a starting point to begin developing with PureMVC for ColdFusion. If 
you would like to contribute to the project, please send me an email at michael.oddis@puremvc.org. We 
need demo's, utilities and lots of feedback before we can make this an official v1.0 release.


Running Unit Tests
-----------------------------------------------------------
1 - If you are using the built in ColdFusion server then go to 'http://[yourdomainhere]:[yourport]/test/PureMVC_CFTestRunner.cfm' to execute the test cases.
2 - If you are using IIS then go to 'http://[yourdomainhere]/test/PureMVC_CFTestRunner.cfm' to execute the test cases.
