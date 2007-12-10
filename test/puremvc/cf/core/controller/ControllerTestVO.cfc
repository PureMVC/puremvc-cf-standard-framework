<cfcomponent output="false" alias="test.ControllerTestVO">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="input" type="numeric" default="0">
	<cfproperty name="result" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.input = 0;
		variables.result = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="ControllerTestVO">
		<cfargument name="val" type="numeric" required="false" default="0">
		<cfscript>
			this.setInput(arguments.val);
		</cfscript>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getInput" output="false" access="public" returntype="any">
		<cfreturn variables.Input>
	</cffunction>

	<cffunction name="setInput" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Input = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getResult" output="false" access="public" returntype="any">
		<cfreturn variables.Result>
	</cffunction>

	<cffunction name="setResult" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Result = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>
	
</cfcomponent>