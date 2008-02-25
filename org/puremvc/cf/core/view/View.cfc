<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
******************************************************************************
 * A Singleton <code>IView</code> implementation.
 * 
 * <P>
 * In PureMVC, the <code>View</code> class assumes these responsibilities:
 * <UL>
 * <LI>Maintain a cache of <code>IMediator</code> instances.</LI>
 * <LI>Provide methods for registering, retrieving, and removing <code>IMediators</code>.</LI>
 * <LI>Managing the observer lists for each <code>INotification</code> in the application.</LI>
 * <LI>Providing a method for attaching <code>IObservers</code> to an <code>INotification</code>'s observer list.</LI>
 * <LI>Providing a method for broadcasting an <code>INotification</code>.</LI>
 * <LI>Notifying the <code>IObservers</code> of a given <code>INotification</code> when it broadcast.</LI>
 * </UL>
 * 
 * See org.puremvc.patterns.mediator.Mediator Mediator
 * See org.puremvc.patterns.observer.Observer Observer
 * See org.puremvc.patterns.observer.Notification Notification
******************************************************************************
--->
<cfcomponent displayname="View"
			 implements="org.puremvc.cf.interfaces.IView"
			 output="true"
			 hint="A Singleton <code>IView</code> implementation.">
	
	<cfproperty name="mediatorMap" type="struct" required="true" hint="Mapping of Mediator names to Mediator instances">
	<cfproperty name="observerMap" type="array" required="true" hint="Mapping of Notification names to Observer lists">
	<cfproperty name="viewInstance" type="org.puremvc.cf.interfaces.IView" required="true" hint="Singleton instance">
	
	<cfscript>
		this.mediatorMap = {};
		this.observerMap = ArrayNew(1);
	</cfscript>
		
	<cffunction name="getInstance" displayname="getInstance" access="public" returntype="org.puremvc.cf.interfaces.IView" output="true" hint="View Singleton Factory method. Returns the Singleton instance of <code>View</code>.">
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
				description="Called automatically by the constructor, this is your opportunity to initialize the Singleton instance in your subclass.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerObserver" displayname="registerObserver" returntype="void" access="public" output="true" hint="Register an <code>IObserver</code> to be notified of <code>INotifications</code> with a given name.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the <code>INotifications</code>">
		<cfargument name="observer" type="org.puremvc.cf.interfaces.IObserver" required="true" hint="The <code>IObserver</code> to register">
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
	<cffunction name="notifyObservers" displayname="notifyObservers" returntype="void" access="public" output="true" hint="Notify the <code>IObservers</code> for a particular <code>INotification</code>.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The <code>INotification</code> to notify <code>IObservers</code>">
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
	<cffunction name="registerMediator" displayname="registerMediator" returntype="void" access="public" output="true" hint="Register an <code>IMediator</code> instance with the <code>View</code>.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the <code>IMediator</code> instance">
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
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" displayname="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true" hint="Retrieve an <code>IMediator</code> from the <code>View</code>.">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the <code>IMediator</code> instance to retrieve.">
		<cfscript>
			return this.mediatorMap[ arguments.mediatorName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeMediator" displayname="removeMediator" returntype="void" access="public" output="true" hint="Remove an <code>IMediator</code> from the <code>View</code>.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the <code>IMediator</code> instance to be removed.">
		<cfscript>
			StructDelete(this.mediatorMap, arguments.mediatorName, false);
		</cfscript>
	</cffunction>
	
</cfcomponent>