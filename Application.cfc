<cfcomponent displayname="Application" hint="PureMVC_CF" output="true">
	
	<cfscript>
		this.name = "PureMVC_CF";
		this.sessionManagement = true;
		this.sessionTimeout = CreateTimeSpan(0,0,20,0);
	</cfscript>
	
	<cffunction name="onApplicationStart" displayname="On Application Start" hint="Application start" access="public" output="true" returntype="boolean">
	   	<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>

	<cffunction name="onSessionStart" displayname="On Session Start" hint="Session start" access="public" output="true" returntype="boolean">
		<cfscript>
			var done = true;
			var applicationFacade = 0;
			if (IsDefined("url.initApp") AND url.initApp )
			{
				if ( StructKeyExists(application,"facadeInstance") )
				{
					WriteOutput("Deleting facade!");
					StructDelete(application,"facadeInstance");
				}
			}
		</cfscript>
		<cfinvoke component="cfc.modimation.helloworld.AppFacade" method="getInstance" returnvariable="oFacade">
		<cfreturn done>
	</cffunction>
	
	<cffunction name="onSessionEnd" displayname="On Session End" hint="Session end" access="public" output="true" returntype="boolean">
		<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>
	
	<cffunction name="onRequestStart" displayname="On Request Start" hint="Request start" access="public" output="true" returntype="boolean">
		<cfscript>
			var done = true;
			this.onSessionStart();
		</cfscript>		
		<cfreturn done>
	</cffunction>
	
	<cffunction name="onRequestEnd" displayname="On Request End" hint="Request end" access="public" output="true" returntype="boolean">
	   	<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>
	
</cfcomponent>