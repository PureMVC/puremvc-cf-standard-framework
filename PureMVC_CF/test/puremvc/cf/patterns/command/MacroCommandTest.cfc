<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true" 
			 hint="Tests the execute method of a SimpleCommand.">
	
	<!--- 
	 * Tests operation of a MacroCommand.
	 * 
	 * This test creates a new Notification, adding a 
	 * MacroCommandTestVO as the body. 
	 * It then creates a MacroCommandTestCommand and invokes
	 * its execute method, passing in the 
	 * Notification.
	 * 
	 * The MacroCommandTestCommand has defined an
	 * initializeMacroCommand method, which is 
	 * called automatically by its constructor. In this method
	 * the MacroCommandTestCommand adds 2 SubCommands
	 * to itself, MacroCommandTestSub1Command and
	 * MacroCommandTestSub2Command.
	 * 
	 * The MacroCommandTestVO has 2 result properties,
	 * one is set by MacroCommandTestSub1Command by
	 * multiplying the input property by 2, and the other is set
	 * by MacroCommandTestSub2Command by multiplying
	 * the input property by itself. 
	 * 
	 * Success is determined by evaluating the 2 result properties
	 * on the MacroCommandTestVO that was passed to 
	 * the MacroCommandTestCommand on the Notification 
	 * body.
	 --->
	<cffunction name="testMacroCommandExecute" returntype="void" access="public" output="true" hint="Tests operation of a MacroCommand.">
		<cfscript>
			// Create the VO
			var vo = CreateObject("component","MacroCommandTestVO");
			var note = 0;
			var command = 0 ;
			
			vo.init(5);

			// Create the Notification (note)
  			note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
  			note.init("MacroCommandTestNote", vo);

			// Create the SimpleCommand  			
			command = CreateObject("component","MacroCommandTestCommand");
   			
   			// Execute the SimpleCommand
   			command.execute(note);
   			
   			// test assertions
			assertTrue( "Expecting vo.result1 == 10", vo.result1 == 10 );
   			assertTrue( "Expecting vo.result2 == 25", vo.result2 == 25 );
   			
   		</cfscript>
	</cffunction>
	
</cfcomponent>