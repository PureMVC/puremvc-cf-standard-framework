<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="SecurityProxy" 
			 extends="org.puremvc.cf.patterns.proxy.Proxy" 
			 implements="org.puremvc.cf.interfaces.IProxy" 
			 output="true">
	
	<cfscript>
		variables.proxyName = "SecurityProxy";
		variables.appProxy = 0;
	</cfscript>
	
	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="false">
		<cfargument name="proxyName" type="string" required="false">
		<cfargument name="data" type="any" required="false">
		<cfscript>
			super.init();
			variables.appProxy = this.getFacade().retrieveProxy("AppProxy");
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="loginUser" returntype="void" access="public" output="true">
		<cfargument name="user" type="LoginApp.model.user.User" required="true">
		<cfscript>
			var echoDelegate = variables.appProxy.getEchoDelegate();
			arguments.user = echoDelegate.echoUser(arguments.user);
			this.sendNotification("USER_LOGIN_RESULT", arguments.user);
		</cfscript>
	</cffunction>
	
	<cffunction name="loginUserWithReturnQuery" returntype="void" access="public" output="true">
		<cfargument name="user" type="LoginApp.model.user.User" required="true">
		<cfscript>
			var echoDelegate = variables.appProxy.getEchoDelegate();
			var qUser = echoDelegate.echoUserAsQuery(arguments.user);
			this.sendNotification("USER_LOGIN_QUERY_RESULT", qUser);
		</cfscript>
	</cffunction>
	
</cfcomponent>