<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.command.MacroCommand"
			 output="true">
				 
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
			this.addSubCommand("ModelPrepCommand", "HelloWorld.controller.ModelPrepCommand" );
            this.addSubCommand("ViewPrepCommand", "HelloWorld.controller.ViewPrepCommand" );
		</cfscript>
	</cffunction>
	
</cfcomponent>