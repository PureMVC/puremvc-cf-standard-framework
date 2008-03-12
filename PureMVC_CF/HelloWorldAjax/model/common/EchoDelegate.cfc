<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="EchoDelegate"
			 output="true">
				 
	<cfscript>
	</cfscript>
	
	<cffunction name="init" displayname="init" description="" access="public" returntype="HelloWorldAjax.model.common.EchoDelegate" hint="" output="true">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="echoHelloWorld" displayname="echoHelloWorld" access="public" returntype="string" hint="returns Hello World" output="true">
		<cfargument name="val" type="string" required="false" default="Mudd">
		<cfscript>
			return "Hello " & arguments.val & "! Welcome to PureMVC for ColdFusion"; 
		</cfscript>
	</cffunction>

	
</cfcomponent>