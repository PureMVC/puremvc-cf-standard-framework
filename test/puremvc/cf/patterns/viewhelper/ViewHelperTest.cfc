<cfcomponent displayname="ViewHelperTest"
			 extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true">
	
	<cfscript>
	</cfscript>
	
	<cffunction name="testIdAccessor" access="public" returntype="void">
		<cfscript>
			var testViewHelper = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			testViewHelper.init();
			
			testViewHelper.setId("TestViewHelper");
		
			// test assertions
   			assertTrue( "Expecting ID = 'TestViewHelper'", testViewHelper.getId() == 'TestViewHelper' );
		
		</cfscript>
	</cffunction>
	
	 	
	<cffunction name="testComponentNameAccessor" access="public" returntype="void">
		<cfscript>
			var testViewHelper = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			testViewHelper.init();
			
			testViewHelper.setComponentName("TestViewHelper");
		
			// test assertions
   			assertTrue( "Expecting Name = 'TestViewHelper'", testViewHelper.getComponentName() == 'TestViewHelper' );
		
		</cfscript>
	</cffunction>
	
	<cffunction name="testMediatorAccessor" access="public" returntype="void">
		<cfscript>
			var testViewHelper = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			var mediator = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewMediator");
			
			testViewHelper.init();
			mediator.init("TestViewMediator",testViewHelper);
			
			testViewHelper.getFacade().registerMediator(mediator);
		
			// test assertions
   			assertTrue( "Expecting Mediator Name = 'TestViewMediator'", testViewHelper.getFacade().retrieveMediator("TestViewMediator").getMediatorName() == 'TestViewMediator' );
		
		</cfscript>
	</cffunction>
	
	<cffunction name="testSendNotification" access="public" returntype="void">
		<cfscript>
			var testViewHelper = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			var mediator = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewMediator");
			
			testViewHelper.init();
			mediator = mediator.init("TestViewMediator",testViewHelper);
			
			testViewHelper.getFacade().registerMediator(mediator);
			
			mediator.sendNotification("ABC", 5);
		
			// test assertions
   			assertTrue( "Expecting testValue == 10", testViewHelper.testValue == 10 );
		
		</cfscript>
	</cffunction> 

</cfcomponent>