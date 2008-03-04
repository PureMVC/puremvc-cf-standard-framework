<!---
*************************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*************************************************************************************
--->
<cfcomponent displayname="MacroCommand" extends="org.puremvc.cf.patterns.observer.Notifier" 
			 implements="org.puremvc.cf.interfaces.ICommand,org.puremvc.cf.interfaces.INotifier" 
			 output="true">
	
	<cfscript>
		variables.subCommands = [];
	</cfscript>
	
	<cffunction name="init" displayname="init" access="public" output="true" returntype="void">
		<cfscript>
			initializeMacroCommand();
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeMacroCommand" returntype="void" access="public" output="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="addSubCommand" returntype="void" access="public" output="true">
		<cfargument name="commandName" type="string" required="true">
		<cfargument name="commandClassRef" type="string" required="true">
		<cfscript>
			ArrayAppend(variables.subCommands,arguments.commandClassRef);
		</cfscript>
	</cffunction>

	<cffunction name="execute" returntype="void" access="public" output="true" hint="Execute the ICommand's logic to handle a given INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="An INotification to handle.">
		<cfscript>
			var subCommandsLength = ArrayLen(variables.subCommands);
			var commandClassRef = 0;
			var commandInstance = 0;
				
			for (i=1; i <= subCommandsLength; ++i)
			{
				commandClassRef = variables.subCommands[i];
				commandInstance = CreateObject("component", commandClassRef);
				commandInstance.execute( notification );
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Executes the execute method of an ICommand.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			this.execute(arguments.notification);
		</cfscript>
	</cffunction>
	
</cfcomponent>