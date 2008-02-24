<cfcomponent displayname="TestViewHelper"
			 extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true">
	
	<cfscript>
	</cfscript>
	
	<cffunction name="testSetFacadeMethod" access="public" returntype="void">
		<cfscript>
			var testViewHelper = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			var facade = 0;
			
			testViewHelper.setFacade(this.getFacade());
			facade = testViewHelper.getFacade();
			
			// test assertions
   			assertTrue( "Expecting instance is an IFacade", GetMetaData(facade).implements['org.puremvc.cf.interfaces.IFacade'].DISPLAYNAME == 'IFacade' );
		
		</cfscript>
	</cffunction>
	
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
			var mediator = CreateObject("component","org.puremvc.cf.patterns.mediator.Mediator");
			
			testViewHelper.init();
			mediator.init(testViewHelper);
			
			testViewHelper.registerMediator(mediator);
		
			// test assertions
   			assertTrue( "Expecting Mediator Name = 'Mediator'", testViewHelper.retrieveMediator("Mediator").getMediatorName() == 'Mediator' );
		
		</cfscript>
	</cffunction>
	
	<cffunction name="testSendNotification" access="public" returntype="void">
		<cfscript>
			var testViewHelper = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			var mediator = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewMediator");
			
			testViewHelper.init();
			mediator.init(testViewHelper);
			
			this.getFacade().registerMediator(mediator);
			
			testViewHelper.sendNotification("ABC", 5);
		
			// test assertions
   			assertTrue( "Expecting testValue == 10", testViewHelper.testValue == 10 );
		
		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" returntype="org.puremvc.cf.interfaces.IFacade" access="public" output="true" hint="">
		<cfinvoke component="org.puremvc.cf.patterns.facade.Facade" method="getInstance" returnvariable="oFacade">
		<cfreturn oFacade>
	</cffunction>

</cfcomponent>