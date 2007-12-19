<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
***********************************************************************
**
 * Test the PureMVC Notification class.
 * 
 * @see org.puremvc.patterns.observer.Notification Notification
 *
--->
<cfcomponent extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true">
	
	<cffunction name="testNameAccessor" returntype="void" access="public" output="true" hint="Tests setting and getting the name using Notification class accessor methods.">
		<cfscript>
			// Create a new Notification and use accessors to set the note name 
			var note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			note.init("TestNote");
			
			//test assertions
			this.assertTrue("Expecting note.getName() == 'TestNote'", (note.getName() == 'TestNote') );
		</cfscript>
	</cffunction>
	
	<cffunction name="testBodyAccessors" returntype="void" access="public" output="true" hint="Tests setting and getting the body using Notification class accessor methods.">
		<cfscript>
			// Create a new Notification and use accessors to set the body
			var note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			note.init("TestNote");
			note.setBody(5);
			
			// test assertions
   			this.assertTrue("Expecting note.getBody()as Number == 5", (note.getBody() == 5) );
		</cfscript>
	</cffunction>
	
	<cffunction name="testConstructor" returntype="void" access="public" output="true" hint="Tests setting the name and body using the Notification class Constructor.">
		<cfscript>
			// Create a new Notification using the Constructor to set the note name and body
			var note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			note.init('TestNote',5,'TestNoteType');
			
			// test assertions
   			this.assertTrue( "Expecting note.getName() == 'TestNote'", note.getName() == 'TestNote' );
   			this.assertTrue( "Expecting note.getBody()as Number == 5", note.getBody() == 5 );
   			this.assertTrue( "Expecting note.getType() == 'TestNoteType'", note.getType() == 'TestNoteType' );
		</cfscript>
	</cffunction>
	
</cfcomponent>