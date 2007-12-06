<cfcomponent extends="org.puremvc.cf.patterns.command.MacroCommand"
			 output="true">
				 
	<cfscript>
		this.init();
	</cfscript>
	
	<cffunction name="init" displayname="init" access="public" output="true" returntype="void">
		<!--- <cftrace text="In init() of ApplicationStartupCommand"> --->
		<cfscript>
			super.init();
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeMacroCommand" returntype="void" access="public" output="true">
		<!--- <cftrace text="In initializeMacroCommand() of MacroCommand"> --->
		<cfscript>
			this.addSubCommand("ModelPrepCommand", "cfc.modimation.helloworld.controller.ModelPrepCommand" );
            this.addSubCommand("ViewPrepCommand", "cfc.modimation.helloworld.controller.ViewPrepCommand" );
		</cfscript>
	</cffunction>
	
</cfcomponent>