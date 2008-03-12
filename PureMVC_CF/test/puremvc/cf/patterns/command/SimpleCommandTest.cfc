<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<!--- 
/**
 * Tests the execute method of a SimpleCommand.
 * 
 * This test creates a new Notification, adding a 
 * SimpleCommandTestVO as the body. 
 * It then creates a SimpleCommandTestCommand and invokes
 * its execute method, passing in the note.
 * 
 * Success is determined by evaluating a property on the 
 * object that was passed on the Notification body, which will
 * be modified by the SimpleCommand.
 */
 --->
<cfcomponent extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true" 
			 hint="Tests the execute method of a SimpleCommand.">
	
	<cffunction name="testSimpleCommandExecute" returntype="void" access="public" output="true" hint="">
		<cfscript>
			// Create the VO
			var vo = CreateObject("component","SimpleCommandTestVO");
			var note = 0;
			var command = 0 ;
			
			vo.init(5);

			// Create the Notification (note)
  			note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
  			note.init("SimpleCommandTestNote", vo);

			// Create the SimpleCommand  			
			command = CreateObject("component","SimpleCommandTestCommand");
   			
   			// Execute the SimpleCommand
   			command.execute(note);
   			
   			// test assertions
   			this.assertTrue("Expecting vo.result == 10", (vo.result == 10) );
   			
   		</cfscript>
	</cffunction>
	
</cfcomponent>