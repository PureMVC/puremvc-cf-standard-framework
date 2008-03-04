<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
--->
<cfcomponent displayname="MediatorTest"
			 extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true" 
			 hint="Test the PureMVC Mediator class.">
	
	<cffunction name="testNameAccessor" returntype="void" access="public" output="true" hint="Tests getting the name using Mediator class accessor method.">
		<cfscript>
			// Create a new Mediator and use accessors to set the mediator name 
			var mediator = CreateObject("component","org.puremvc.cf.patterns.mediator.Mediator");
			mediator.init();
			
			// test assertions
   			assertTrue( "Expecting mediator.getMediatorName() == 'Mediator'", mediator.getMediatorName() == Mediator.getMediatorName() );
		</cfscript>
	</cffunction>
	
	<cffunction name="testViewAccessor" returntype="void" access="public" output="true" hint="Tests getting the name using Mediator class accessor method. ">
		<cfscript>
			var view = 0;
			var mediator = 0;
			
			// Create a view object
			view = CreateObject("component","test.puremvc.cf.patterns.viewHelper.TestViewHelper");
			view.setComponentName("TestViewHelper");
			
			// Create a new Mediator
   			mediator = CreateObject("component","org.puremvc.cf.patterns.mediator.Mediator");
			mediator.init("Mediator",view);
			   			
   			// test assertions
   			assertTrue( "Expecting mediator.getViewComponent() != ''", len(mediator.getViewComponent().getComponentName()) != 0 );
		</cfscript>
	</cffunction>
	
</cfcomponent>