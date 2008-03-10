*************************************
*  PureMVC for ColdFusion Readme	*
*************************************

Introduction
-----------------------------------------------------------
PureMVC for ColdFusion is a lightweight framework based on the PureMVC 2.0 AS3 Reference implementation for creating 
applications based upon the classic Model-View-Controller design pattern.


Status: Alpha 0.9
-----------------------------------------------------------
This implementation of the framework is still being tested, but has all the functionality of the 2.0 AS3 Reference implementation. 
Please feel free to experiment with it and tell us what you come up with! We need demos, and utilities.


Communuty Contribution
----------------------------------------------------------
If you would like to contribute to the project in some form or another, send me an email
at michael.oddis@puremvc.org. We need demo's and utilities and lots of feedback. Constructive
Critizism is welcome! :)


Prerequisites
-----------------------------------------------------------
- Adobe ColdFusion 8
- CFUnit v2.0 Beta 4 (community contribution only)


Installation
-----------------------------------------------------------
1 - Download the latest version of CFUnit at (http://cfunit.sourceforge.net/)
2 - Download the latest release of PureMVC Framework for ColdFusion from one of the following locations:
	
	Trac website: http://trac.puremvc.org/PureMVC_CF/
	Zip Archive: 	http://puremvc.org/pages/downloads/CF/PureMVC_CF.zip) 
	SVN repository: http://svn.puremvc.org/PureMVC_CF)
		Lastest release: tags/0.9


Installation Scenarios
-----------------------------------------------------------

[SCENARIO 1]
The quickest and easiest way to install the framework is to extract the contents of the PureMVC_CF.zip into the root of 
your website. So, if your site root is located at 'C:\ColdFusion8\wwwroot\MyApp\' then extract the contents 
of the zip under MyApp. 

If you will be contributing to the code base you must configure your development environment to use CFUnit for unit 
testing your code changes. if not, then you can simple delete the "test" folder. 

To configure CFUnit in your environment, follow the installation instructions provided in the CFUnit archive 
you download above. In most cases you can simply place the contents of the CFUnit archive into your site root. As long as
it is accessible when accessing you website. 

[SCENARIO 2]
You can configure ColdFusion mappings to access the framework using the ColdFusion Administrator.
1 - Extract the contents of the PureMVC_CF.zip into any preferred location outside your site root.
2 - Login to the ColdFusion Admin and create a mapping named "org", which points to the location of the
	"org" folder you extracted from the PureMVC_CF.zip archive.
3 - For CFUnit, extract the contents of the CFUnit zip archive into any preferred location outside your site root.
	In the ColdFusion Admin, create a mapping named "net" which points to the location of the "net" folder
	extracted from the CFUnit archive.


Running Unit Tests
-----------------------------------------------------------
1 - If you are using the built in ColdFusion server with an application folder named "MyApp", 
	then go to 'http://localhost:8500/MyApp/test/PureMVC_CFTestRunner.cfm' to execute the test cases.
	
2 - If you are using IIS then go to 'http://[yourdomainhere]/test/PureMVC_CFTestRunner.cfm' to execute the test cases.
