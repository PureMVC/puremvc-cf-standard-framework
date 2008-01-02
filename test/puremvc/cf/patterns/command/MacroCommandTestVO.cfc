<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent output="true" hint="A utility class used by MacroCommandTest.">
	
	<cfproperty name="input" type="numeric" required="true" />
	<cfproperty name="result1" type="numeric" required="false" />
	<cfproperty name="result2" type="numeric" required="false" />
	
	<cfscript>
		this.input = 0;
		this.result1 = 0;
		this.result2 = 0;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="void">
		<cfargument name="input" type="numeric" required="true" hint="The number to be fed to the MacroCommandTestCommand">
		<cfscript>
			this.input = arguments.input;
		</cfscript>
	</cffunction>

</cfcomponent>