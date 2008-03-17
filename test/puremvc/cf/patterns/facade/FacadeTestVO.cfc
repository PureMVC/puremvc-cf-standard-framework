<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent name="FacadeTestVO" 
			 displayname="FacadeTestVO" 
			 output="false" 
			 hint="A utility class used by FacadeTestCommand.">
	
	<cfproperty name="input" type="numeric" required="true" />
	<cfproperty name="result" type="numeric" required="false" />
	
	<cfscript>
		this.input = 0;
		this.result = 0;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="void">
		<cfargument name="input" type="numeric" required="true" hint="The number to be fed to the FacadeTestCommand">
		<cfscript>
			this.input = arguments.input;
		</cfscript>
	</cffunction>

</cfcomponent>