<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.command.MacroCommand"
			 output="true" 
			 hint="Tests the execute method of a MacroCommand.">
	
	<cfscript>
		this.init();
	</cfscript>
	
	<cffunction name="init" displayname="init" access="public" output="true" returntype="void">
		<cfscript>
			super.init();
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeMacroCommand" returntype="void" access="public" output="true">
		<cfscript>
			this.addSubCommand("MacroCommandTestSub1Command", "test.puremvc.cf.patterns.command.MacroCommandTestSub1Command" );
            this.addSubCommand("MacroCommandTestSub2Command", "test.puremvc.cf.patterns.command.MacroCommandTestSub2Command" );
		</cfscript>
	</cffunction>
	
</cfcomponent>