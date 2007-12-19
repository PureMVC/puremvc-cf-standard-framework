<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
***********************************************************************
**
* Tests PureMVC Observer class.
* 
* <P>
* Since the Observer encapsulates the interested object's
* callback information, there are no getters, only setters. 
* It is, in effect write-only memory.</P>
* 
* <P>
* Therefore, the only way to test it is to set the 
* notification method and context and call the notifyObserver
* method.</P>
* 
*
--->
<cfcomponent extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true">
			 
	<cfproperty name="observerTestVar" type="numeric" required="true" hint="A test variable that proves the notify method was executed with 'this' as its exectution context">
				 
	<cfscript>
		variables.observerTestVar = 0;
	</cfscript>
	
	<cffunction name="testObserverAccessors" returntype="void" access="public" output="true" hint="Tests observer class when initialized by accessor methods.">
		<cfscript>
			// Create observer with null args, then
   			// use accessors to set notification method and context
			var observer = CreateObject("component","org.puremvc.cf.patterns.observer.Observer");
			var note = 0;
			var observerTestMethod = "observerTestMethod";
			
			observer.init("","");
			observer.setNotifyContext(this);
   			observer.setNotifyMethod(observerTestMethod);
			
			// create a test event, setting a payload value and notify 
   			// the observer with it. since the observer is this class 
   			// and the notification method is observerTestMethod,
   			// successful notification will result in our local 
   			// observerTestVar being set to the value we pass in 
   			// on the note body.
   			note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
   			note.init('ObserverTestNote',10);
   			observer.notifyObserver(note);
   			
			// test assertions  			
   			assertTrue( "Expecting observerTestVar = 10", observerTestVar == 10 );
		</cfscript>
	</cffunction>
	
	<cffunction name="testObserverConstructor" returntype="void" access="public" output="true" hint="Tests observer class when initialized by constructor.">
		<cfscript>
			// Create observer passing in notification method and context
			var note = 0;
			var observerTestMethod = "observerTestMethod";
			var observer = CreateObject("component","org.puremvc.cf.patterns.observer.Observer");
			observer.init(observerTestMethod, this);
			
   			// create a test note, setting a body value and notify 
   			// the observer with it. since the observer is this class 
   			// and the notification method is observerTestMethod,
   			// successful notification will result in our local 
   			// observerTestVar being set to the value we pass in 
   			// on the note body.
   			note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
   			note.init('ObserverTestNote',5);
			observer.notifyObserver(note);

			// test assertions  			
   			assertTrue( "Expecting observerTestVar = 5", observerTestVar == 5 );
		</cfscript>
	</cffunction>
	
	<cffunction name="testCompareNotifyContext" returntype="void" access="public" output="true" hint="Tests the compareNotifyContext method of the Observer class">
		<cfscript>
			// Create observer passing in notification method and context
			var note = 0;
			var negTestObj = {};
			var observerTestMethod = "observerTestMethod";
			var observer = CreateObject("component","org.puremvc.cf.patterns.observer.Observer");
			observer.init(observerTestMethod, this);
			
   			// test assertions  			
   			assertTrue( "Expecting observer.compareNotifyContext(negTestObj) == false", observer.compareNotifyContext(negTestObj) == false );
   			assertTrue( "Expecting observer.compareNotifyContext(this) == true", observer.compareNotifyContext(this) == true );
		</cfscript>
	</cffunction>
	
	<cffunction name="observerTestMethod" returntype="void" access="public" output="true" hint="A function that is used as the observer notification method. It multiplies the input number by the observerTestVar value">
		<cfargument name="note" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			variables.observerTestVar = note.getBody();
		</cfscript>
	</cffunction>
	
</cfcomponent>