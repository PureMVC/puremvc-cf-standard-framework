<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 A Singleton IView implementation.
 
 In PureMVC, the View class assumes these responsibilities:

 - Maintain a cache of IMediator instances.
 - Provide methods for registering, retrieving, and removing IMediators.
 - Notifiying IMediators when they are registered or removed.
 - Managing the observer lists for each INotification in the application.
 - Providing a method for attaching IObservers to an INotification's observer list.
 - Providing a method for broadcasting an INotification.
 - Notifying the IObservers of a given INotification when it broadcast.
	 
--->
<cfcomponent displayname="View"
			 implements="org.puremvc.cf.interfaces.IView"
			 output="true"
			 hint="A Singleton IView implementation. In PureMVC, the View class assumes these responsibilities. Maintain a cache of IMediator instances. Provide methods for registering, retrieving, and removing IMediators. Managing the observer lists for each INotification in the application. Providing a method for attaching IObservers to an INotification's observer list. Providing a method for broadcasting an INotification. Notifying the IObservers of a given INotification when it broadcast. ">
	
	<cfproperty name="mediatorMap" type="struct" required="true" hint="Mapping of Mediator names to Mediator instances">
	<cfproperty name="observerMap" type="array" required="true" hint="Mapping of Notification names to Observer lists">
	<cfproperty name="viewInstance" type="org.puremvc.cf.interfaces.IView" required="true" hint="Singleton instance">
	
	<cfscript>
		this.mediatorMap = {};
		this.observerMap = ArrayNew(1);
	</cfscript>
		
	<cffunction name="getInstance" displayname="getInstance" access="public" returntype="org.puremvc.cf.interfaces.IView" output="true" hint="View Singleton Factory method. Returns the Singleton instance of View.">
		<cfscript>
			if ( NOT StructKeyExists(this, "viewInstance" ) )
			{
				this.viewInstance = CreateObject("Component", "org.puremvc.cf.core.view.View");
				this.viewInstance.initializeView();
			}
			return this.viewInstance;
		</cfscript>
	</cffunction>
	
	<!---  
	 Called automatically by the constructor, this is your opportunity to initialize the Singleton
	 instance in your subclass.
	--->
	<cffunction name="initializeView" displayname="initializeView" access="public" returntype="void"
				hint="Called automatically by the constructor, this is your opportunity to initialize the Singleton instance in your subclass.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerObserver" displayname="registerObserver" returntype="void" access="public" output="true" hint="Register an IObserver to be notified of INotifications with a given name.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotifications">
		<cfargument name="observer" type="org.puremvc.cf.interfaces.IObserver" required="true" hint="The IObserver to register">
		<cfscript>
			var obj = 0;
			var observerMapLength = 0;
			var isRegistered = false;
			
			if ( IsDefined("this.observerMap") )
			{
				observerMapLength = ArrayLen(this.observerMap);
				obj = {context=GetMetaData(arguments.observer.getNotifyContext()).DISPLAYNAME, notificationName=arguments.notificationName, observer=arguments.observer};
				
				// Check to see if an Observer with the same context and notificationName is already registered.
				// If one exists set isRegistered flag to true which will prevent the registration of duplicate observers.
				for (i=1;  i <= observerMapLength; i++) 
				{
					if (this.observerMap[i].context == obj.context AND this.observerMap[i].notificationName == obj.notificationName) 
						{ isRegistered=true; break; }
				}
				
				// Only register an Observer if both the context and notificationName are unique.
				if (!isRegistered) { ArrayAppend(this.observerMap, obj); }
			}
		</cfscript>
	</cffunction>
	
	<!---  
	All previously attached IObservers for this INotification's 
	list are notified and are passed a reference to the INotification in 
	the order in which they were registered.
	--->
	<cffunction name="notifyObservers" displayname="notifyObservers" returntype="void" access="public" output="true" hint="Notify the IObservers for a particular INotification. All previously attached IObservers for this INotification's list are notified and are passed a reference to the INotification in the order in which they were registered.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification to notify IObservers">
		<cfscript>
			var observerMapLength = ArrayLen(this.observerMap);
			var observer = 0;
			var notificationName = arguments.notification.getName();
			
			// Loop over the observerMap and notify those observers which match 
			// the name of the notifcation passed into the function. 
			for (i=1;  i <= observerMapLength; i++) {
				if (this.observerMap[i].notificationName == notificationName)
				{
					observer = this.observerMap[i].observer;
					observer.notifyObserver( arguments.notification );
				}
			}
		</cfscript>
	</cffunction>
	
	<!---  
	 Registers the IMediator so that it can be retrieved by name,
	 and further interrogates the IMediator for its INotification interests.
	 
	 If the IMediator returns any INotification names to be notified about, an 
	 Observer is created encapsulating the IMediator instance's handleNotification method 
	 and registering it as an Observer for all INotifications the IMediator is interested in.
	--->
	<cffunction name="registerMediator" displayname="registerMediator" returntype="void" access="public" output="true" hint="Register an IMediator instance with the View. If the IMediator returns any INotification names to be notified about, an Observer is created encapsulating the IMediator instance's handleNotification method and registering it as an Observer for all INotifications the IMediator is interested in handling.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the IMediator instance">
		<cfscript>
			var _interests = [];
			var _observer = 0;
			var _interestsLen = 0;
			var _i = 1;
			
			// Register the Mediator for retrieval by name
			this.mediatorMap[ arguments.mediator.getMediatorName() ] = arguments.mediator;
			
			// Get Notification interests, if any.
			_interests = arguments.mediator.listNotificationInterests();
			_interestsLen = ArrayLen(_interests);
			if ( _interestsLen EQ 0) return;
			
			// Create Observer
			_observer = CreateObject("component","org.puremvc.cf.patterns.observer.Observer");
			_observer = _observer.init("handleNotification", arguments.mediator);			
			
			// Register Mediator as Observer for its list of Notification interests
			for (_i=1;  _i <= _interestsLen; _i++) 
			{
				this.registerObserver( _interests[_i],  _observer );
			}
			
			// alert the mediator that it has been registered
			arguments.mediator.onRegister();
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" displayname="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true" hint="Retrieve an IMediator from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the IMediator instance to retrieve.">
		<cfscript>
			return this.mediatorMap[ arguments.mediatorName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeMediator" displayname="removeMediator" returntype="any" access="public" output="true" hint="Remove an IMediator from the View. If Mediator exist it is returned otherwise return 0.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the IMediator instance to be removed.">
		<cfscript>
			var mediator = 0;
			if (this.hasMediator(arguments.mediatorName)) 
			{ 
				mediator = this.retrieveMediator(arguments.mediatorName);
				StructDelete(this.mediatorMap, arguments.mediatorName, true);
				
				// alert the mediator that it has been removed
				if (IsObject(mediator)) { mediator.onRemove(); }
				return mediator;
			}
			return mediator;
		</cfscript>
	</cffunction>
	
	<cffunction name="hasMediator" displayname="hasMediator" returntype="boolean" access="public" output="true" hint="Check if a Mediator is registered or not">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the IMediator instance to retrieve.">
		<cfscript>
			return StructKeyExists(this.mediatorMap,arguments.mediatorName);
		</cfscript>
	</cffunction>

</cfcomponent>