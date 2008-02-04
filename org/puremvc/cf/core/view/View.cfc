<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent output="true" implements="org.puremvc.cf.interfaces.IView">
	
	<cfproperty name="mediatorMap" type="struct" required="true">
	<cfproperty name="observerMap" type="struct" required="true">
	<cfproperty name="SINGLETON_MSG" type="string" required="true">
	<cfproperty name="viewInstance" type="org.puremvc.cf.interfaces.IView" required="true">
	
	<cfscript>
		this.mediatorMap = {};
		this.observerMap = {};
		this.SINGLETON_MSG = "View Singleton already constructed!";
	</cfscript>
		
	<cffunction name="getInstance" displayname="getInstance" access="public" returntype="org.puremvc.cf.interfaces.IView" output="true">
		<cfscript>
			if ( NOT StructKeyExists(this, "viewInstance" ) )
			{
				this.viewInstance = CreateObject("Component", "org.puremvc.cf.core.view.View");
				this.viewInstance.initializeView();
			}
			return this.viewInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeView" displayname="initializeView" access="public" returntype="void">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerObserver" displayname="registerObserver" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="observer" type="org.puremvc.cf.interfaces.IObserver" required="true">
		<cfscript>
			StructInsert(this.observerMap, arguments.notificationName, arguments.observer, true);
		</cfscript>
	</cffunction>
	
	<cffunction name="notifyObservers" displayname="notifyObservers" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			var observers = {};
			var observer = 0;
			var notificationName = arguments.notification.getName();
			if( StructKeyExists(this.observerMap, notificationName) ) 
			{
				observers = this.observerMap;
				observer = observers[notificationName];
				observer.notifyObserver( arguments.notification );
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="registerMediator" displayname="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
		<cfscript>
			var interests = [];
			var observer = 0;
			var interestsLen = 0;
			// Register the Mediator for retrieval by name
			this.mediatorMap[ arguments.mediator.getMediatorName() ] = arguments.mediator;
			
			// Get Notification interests, if any.
			interests = arguments.mediator.listNotificationInterests();
			interestsLen = ArrayLen(interests);
			if ( interestsLen EQ 0) return;
			
			// Create Observer
			observer = CreateObject("component","org.puremvc.cf.patterns.observer.Observer");
			observer = observer.init("handleNotification", arguments.mediator);			
			
			// Register Mediator as Observer for its list of Notification interests
			for (i=1;  i <= interestsLen; i++) {
				this.registerObserver( interests[i],  observer );
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" displayname="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
			return this.mediatorMap[ arguments.mediatorName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeMediator" displayname="removeMediator" returntype="void" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
			StructDelete(this.mediatorMap, arguments.mediatorName, false);
		</cfscript>
	</cffunction>
	
</cfcomponent>