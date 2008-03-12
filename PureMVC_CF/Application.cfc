<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
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
		</cfscript>
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