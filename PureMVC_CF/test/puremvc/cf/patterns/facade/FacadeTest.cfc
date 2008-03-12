<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true" 
			 hint="Tests the execute method of a SimpleCommand.">

	<cffunction name="testGetInstance" returntype="void" access="public" output="true" hint="Tests the Facade Singleton Factory Method">
		<cfscript>
			var facade = this.getFacade();
			
			// test assertions
   			assertTrue( "Expecting instance not null", IsObject(facade) );
   			assertTrue( "Expecting instance implements IFacade", GetMetaData(facade).implements['org.puremvc.cf.interfaces.IFacade'].DISPLAYNAME == 'IFacade' );
   		</cfscript>
	</cffunction>
	
	<cffunction name="testRegisterCommandAndNotifyObservers" returntype="void" access="public" output="true" hint="">
		<cfscript>
			var facade = 0;
			var vo = 0;
			var note = 0;
			
			// Create the Facade, register the FacadeTestCommand to
   			// handle 'FacadeTest' events
   			facade = this.getFacade();
   			facade.registerCommand("FacadeTestNote","test.puremvc.cf.patterns.facade.FacadeTestCommand");
			
			// Create a 'FacadeTest' event
   			vo = CreateObject("component","FacadeTestVO");  			
   			vo.init(32);
   			note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
  			note.init("FacadeTestNote", vo);

			// Notify Observers. The Command associated with the event
			// (FacadeTestCommand) will be invoked, and will multiply 
			// the vo.input value by 2 and set the result on vo.result
   			facade.notifyObservers(note);
   			
   			// test assertions 
   			assertTrue( "Expecting vo.result == 64", vo.result == 64 );
   			
   		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" returntype="org.puremvc.cf.interfaces.IFacade" access="public" output="true" hint="">
		<cfinvoke component="org.puremvc.cf.patterns.facade.Facade" method="getInstance" returnvariable="oFacade">
		<cfreturn oFacade>
	</cffunction>
	
</cfcomponent>