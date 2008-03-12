<!---
*************************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*************************************************************************************

 A base ICommand implementation that executes other ICommands.
	
 A MacroCommand maintains an list of ICommand Class references calledSubCommands.
	
 When execute is called, the MacroCommand  instantiates and calls execute on each of itsSubCommands turn.
 EachSubCommand will be passed a reference to the original INotification that was passed to the MacroCommand's 
 execute method.
	 
 Unlike SimpleCommand, your subclass should not override execute, but instead, should override the 
 initializeMacroCommand method, calling addSubCommand once for eachSubCommand to be executed.
	 
--->
<cfcomponent displayname="MacroCommand" extends="org.puremvc.cf.patterns.observer.Notifier" 
			 implements="org.puremvc.cf.interfaces.ICommand,org.puremvc.cf.interfaces.INotifier" 
			 output="true"
			 hint="A base ICommand implementation that executes other ICommands.">
				 
	<cfproperty name="subCommand" type="struct" required="false" hint="A collection of commands.">
	
	<cfscript>
		variables.subCommands = [];
	</cfscript>
	
	<cffunction name="init" displayname="init" access="public" output="true" returntype="void" hint="Contructor">
		<cfscript>
			initializeMacroCommand();
		</cfscript>
	</cffunction>
	
	<!--- 
		In your subclass, override this method to initialize the MacroCommand's SubCommand list with ICommand 
		class references like this:
		
		<cffunction name="initializeMacroCommand" returntype="void" access="public" output="true">
			<cfscript>
				this.addSubCommand("ModelPrepCommand", "HelloWorld.controller.ModelPrepCommand" );
	            this.addSubCommand("ViewPrepCommand", "HelloWorld.controller.ViewPrepCommand" );
			</cfscript>
		</cffunction>
	 --->
	<cffunction name="initializeMacroCommand" returntype="void" access="public" output="true" hint="Initialize the MacroCommand. ">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="addSubCommand" returntype="void" access="public" output="true" hint="Add a SubCommand. The SubCommands will be called in First In/First Out (FIFO) order.">
		<cfargument name="commandName" type="string" required="true" hint="The name of the ICommand.">
		<cfargument name="commandClassRef" type="string" required="true" hint="A reference to the Class of the ICommand.">
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