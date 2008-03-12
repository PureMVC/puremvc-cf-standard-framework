<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="EchoService"
			 output="true">
				 
	<cfscript>
		variables.delegate = 0;
		this.init();
	</cfscript>
	
	<cffunction name="init" displayname="init" description="" access="public" returntype="void" hint="" output="true">
		<cfscript>
			variables.delegate = CreateObject("component","HelloWorldAjax.model.common.EchoDelegate").init();
		</cfscript>
	</cffunction>
	
	<cffunction name="echoHelloWorld" displayname="echoHelloWorld" access="remote" returntype="string" hint="returns Hello World" output="true">
		<cfargument name="val" type="string" required="false" default="Mudd">
		<cfscript>
			return variables.delegate.echoHelloWorld(); 
		</cfscript>
	</cffunction>

</cfcomponent>