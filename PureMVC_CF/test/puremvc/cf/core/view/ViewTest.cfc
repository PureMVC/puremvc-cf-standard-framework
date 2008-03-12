<!---
***************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
***************************************************************************
--->
<cfcomponent displayname="ViewTest"
			 extends="net.sourceforge.cfunit.framework.TestCase"
			 implements="org.puremvc.cf.interfaces.IViewComponent"
			 output="true">
	
	<cfproperty name="viewTestVar" type="string" default="0" hint="Value used in testing of the view.">
	
	<cfscript>
		variables.viewTestVar = 0;
		variables.id = "ViewTest";
		varibales.componentName = "ViewTest";
	</cfscript>
	
	<cffunction name="testGetInstance" returntype="void" access="public">
		<cfscript>
			var view = CreateObject("component","org.puremvc.cf.core.view.View");
			
			// test assertions
			assertTrue( "Expecting instance not null", IsObject(view) != false );
			//assertTrue( "Expecting instance implements IView", GetMetaData(view). != false );
		</cfscript>
	</cffunction>
	
	<cffunction name="testRegisterAndNotifyObserver" returntype="void" access="public" output="true">
		<cfscript>
			var observer = 0;
			var note = 0;
			var viewInstance = 0;
		</cfscript>
		
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance" />
		
		<cfscript>
			// Create observer, passing in notification method and context
   			observer = CreateObject("component","org.puremvc.cf.patterns.observer.Observer");
   			observer.init("viewTestMethod", this);
   			
   			// Register Observer's interest in a particulat Notification with the View 
   			viewInstance.registerObserver("ViewTestNote", observer);
   			
   			// Create a ViewTestNote, setting 
   			// a body value, and tell the View to notify 
   			// Observers. Since the Observer is this class 
   			// and the notification method is viewTestMethod,
   			// successful notification will result in our local 
   			// viewTestVar being set to the value we pass in 
   			// on the note body.
   			note = CreateObject("component","ViewTestNote").create(10);
			viewInstance.notifyObservers(note);	
			
			// test assertions
   			assertTrue( "Expecting viewTestVar = 10", (variables.viewTestVar EQ 10) );	
		</cfscript>
	</cffunction>
	
	<cffunction name="testRegisterAndRetrieveMediator" returntype="void" access="public" output="true" hint="Tests registering and retrieving a mediator with the View.">
		<cfscript>
			var viewTestMediator = 0;
			var mediator = 0;
		</cfscript>
		
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance" />
		
		<cfscript>
			// Create and register the test mediator
			viewTestMediator = CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init("ViewTestMediator", this);
			viewInstance.registerMediator( viewTestMediator );
			
			// Retrieve the component
			mediator = viewInstance.retrieveMediator("ViewTestMediator");
			
			// test assertions
   			assertEquals( "Expecting comp is ViewTestMediator", viewTestMediator , mediator );	
		</cfscript>
		
		<cfset this.cleanup(viewInstance)>
	</cffunction>
	
	<cffunction name="testRegisterAndRemoveMediator" returntype="void" access="public" output="true">
		<cfscript>
			var viewTestMediator = 0;
			var mediator = 0;
		</cfscript>
		
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance" />
		
		<cfscript>		
			// Create and register the test mediator but not so we have a reference to it
			viewInstance.registerMediator( CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init("ViewTestMediator",this) );
			
			// Remove the component
			viewInstance.removeMediator("ViewTestMediator");
		</cfscript>
		
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting view.retrieveMediator('ViewTestMediator') == null )">
			<cfinvokeargument name="condition" value="#!StructKeyExists(viewInstance.mediatorMap,'ViewTestMediator')#">
		</cfinvoke>
		
		<cfset viewInstance.removeMediator("ViewTestMediator")>
	</cffunction> 
	
	<cffunction name="testSuccessiveRegisterAndRemoveMediator" returntype="void" access="public" output="true">
		<cfscript>
			var viewTestMediator = 0;
			var mediator = 0;
		</cfscript>
		
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance" />
		
		<!--- test that we can retrieve it --->
		<cfscript>
			// Create and register the test mediator
			viewTestMediator = CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init("ViewTestMediator",this);
			viewInstance.registerMediator( viewTestMediator );
			mediator = viewInstance.retrieveMediator("viewTestMediator");
		</cfscript>
		
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="message" value="Expecting view.retrieveMediator('ViewTestMediator') == ViewTestMediator">
			<cfinvokeargument name="expected" value="#viewTestMediator#">
			<cfinvokeargument name="actual" value="#mediator#">
		</cfinvoke>
		
		<!--- Remove the Mediator --->
		<cfset viewInstance.removeMediator("ViewTestMediator")>
		
		<!--- test that retrieving it now returns null --->
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting view.retrieveMediator('ViewTestMediator') == null )">
			<cfinvokeargument name="condition" value="#!viewInstance.hasMediator('ViewTestMediator')#">
		</cfinvoke>
		
		<!--- test that removing the mediator again once its gone doesn't cause crash --->
		<cfset viewInstance.removeMediator("ViewTestMediator")>
		
		<!--- again: test that we can retrieve it --->
		<cfscript>
			// Create and register the test mediator
			viewTestMediator = CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init("ViewTestMediator",this);
			viewInstance.registerMediator( viewTestMediator );
			mediator = viewInstance.retrieveMediator("viewTestMediator");
		</cfscript>
		
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="message" value="Expecting view.retrieveMediator('ViewTestMediator') == ViewTestMediator">
			<cfinvokeargument name="expected" value="#viewTestMediator#">
			<cfinvokeargument name="actual" value="#mediator#">
		</cfinvoke>
		
		<!--- Remove the Mediator --->
		<cfset viewInstance.removeMediator("ViewTestMediator")>
		
		<!--- test that retrieving it now returns null --->
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting view.retrieveMediator('ViewTestMediator') == null )">
			<cfinvokeargument name="condition" value="#!StructKeyExists(viewInstance.mediatorMap,'ViewTestMediator')#">
		</cfinvoke>
		
		<cfset this.cleanUp(viewInstance)>
	</cffunction> 
	
	<cffunction name="cleanup" returntype="void" access="public" output="true">
		<cfargument name="viewInstance" type="org.puremvc.cf.interfaces.IView" required="true">
		<cfscript>
			arguments.viewInstance.removeMediator("ViewTestMediator");
		</cfscript>
	</cffunction>
	
	<cffunction name="setId" access="public" returntype="void" output="true">
		<cfargument name="id" type="string" required="true" hint="The id of the View Component">
		<cfscript>
			variables.id = arguments.id;
		</cfscript>
	</cffunction>
	<cffunction name="getId" access="public" returntype="string" output="true">
		<cfscript>
			return variables.id;
		</cfscript>
	</cffunction>
	
	<cffunction name="setComponentName" access="public" returntype="void" output="true">
		<cfargument name="componentName" type="string" required="true" hint="The name of the View Component">
		<cfscript>
			variables.componentName = arguments.componentName;
		</cfscript>
	</cffunction>
	<cffunction name="getComponentName" access="public" returntype="string" output="true">
		<cfscript>
			return variables.componentName;
		</cfscript>
	</cffunction>

	<cffunction name="viewTestMethod" returntype="void" access="public" output="true">
		<cfargument name="note" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			// set the local viewTestVar to the number on the event payload
  			variables.viewTestVar = note.getBody();
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			this.viewTestMethod(arguments.notification);
		</cfscript>
	</cffunction>
	
</cfcomponent>