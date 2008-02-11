<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="ViewTest" 
			 output="true" 
			 extends="net.sourceforge.cfunit.framework.TestCase" 
			 implements="org.puremvc.cf.interfaces.IViewHelper">
	
	<cfproperty name="view" type="org.puremvc.cf.core.view.View">
	
	<cfscript>
		variables.viewTestVar = 0;
	</cfscript>
	
	<cffunction name="testGetInstance" returntype="void" access="public">
		<cfscript>
			var view = CreateObject("component","org.puremvc.cf.core.view.View");
		</cfscript>
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance">
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="expected" value="#view#">
			<cfinvokeargument name="actual" value="#viewInstance#">
		</cfinvoke>
	</cffunction>
	
	<cffunction name="testRegisterAndNotifyObserver" returntype="void" access="public" output="true">
		<cfscript>
			var oVO = 0;
			var observer = 0;
			var note = 0;
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
		</cfscript>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting viewTestVar = 10">
			<cfinvokeargument name="condition" value="#(variables.viewTestVar EQ 10)#">
		</cfinvoke>
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
	
	<cffunction name="testRegisterAndRetrieveMediator" returntype="void" access="public" output="true" hint="Tests registering and retrieving a mediator with the View.">
		<cfscript>
			var viewTestMediator = 0;
			var mediator = 0;
		</cfscript>
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance" />
		<cfscript>		
			// Create and register the test mediator
			viewTestMediator = CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init(this);
			viewInstance.registerMediator( viewTestMediator );
			
			// Retrieve the component
			mediator = viewInstance.retrieveMediator("ViewTestMediator");
		</cfscript>
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="message" value="Expecting comp is ViewTestMediator">
			<cfinvokeargument name="expected" value="#viewTestMediator#">
			<cfinvokeargument name="actual" value="#mediator#">
		</cfinvoke>
		<cfset this.cleanup()>
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
			viewInstance.registerMediator( CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init(this) );
			
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
			viewTestMediator = CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init(this);
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
		
		<!--- test that removing the mediator again once its gone doesn't cause crash --->
		<cfset viewInstance.removeMediator("ViewTestMediator")>
		
		<!--- again: test that we can retrieve it --->
		<cfscript>
			// Create and register the test mediator
			viewTestMediator = CreateObject("component", "test.puremvc.cf.core.view.ViewTestMediator").init(this);
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
		
		<cfset this.cleanUp()>
	</cffunction>
	
	<cffunction name="cleanup" returntype="void" access="public" output="true">
		<cfinvoke component="org.puremvc.cf.core.view.View" method="getInstance" returnvariable="viewInstance" />
		<cfscript>
			viewInstance.removeMediator("ViewTestMediator");
		</cfscript>
	</cffunction>
	
	<cffunction name="setId" access="public" returntype="void" output="true">
		<cfargument name="componentId" type="string" required="true" hint="The id of the View Component">
		<cfscript>
			variables.id = arguments.componentId;
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
			variables.name = arguments.componentName;
		</cfscript>
	</cffunction>
	
	<cffunction name="getComponentName" access="public" returntype="string" output="true">
		<cfscript>
			if (len(variables.name)) { return GetMetaData(this).name; } 
			variables.name = arguments.componentName;
		</cfscript>
	</cffunction>
	
	<cffunction name="setFacade" access="public" returntype="void">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.patterns.facade.Facade">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
		<cfscript>
		</cfscript>
	</cffunction>

</cfcomponent>