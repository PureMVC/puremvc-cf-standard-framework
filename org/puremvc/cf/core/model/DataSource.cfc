<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent name="DataSource" output="false" hint="Defines a data source connection object.">
		
	<cfproperty name="connectionName" type="string" required="true" hint="Name of the data source connection.">
	
	<cfscript>
		variables.name = "";
	</cfscript>
	
	<cffunction name="init" displayname="init" access="public" returntype="DataSource">
		<cfargument name="connectionName" type="string" required="true">
		<cfscript>
			this.setConnectionName(arguments.connectionName);
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="setConnectionName" returntype="void" access="public" output="true">
		<cfargument name="name" type="string" required="true">
		<cfscript>
			variables.connectionName = arguments.name;
		</cfscript>
	</cffunction>
	
	<cffunction name="getConnectionName" returntype="string" access="public" output="true">
		<cfscript>
			return variables.connectionName;
		</cfscript>
	</cffunction>

</cfcomponent>