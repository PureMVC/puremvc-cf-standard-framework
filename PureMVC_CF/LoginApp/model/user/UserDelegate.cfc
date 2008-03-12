<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent name="UserService" displayname="UserService"
			 output="true">
	
	<cffunction name="init" displayname="init" access="public" returntype="LoginApp.model.user.UserDelegate" description="" hint="" output="true">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="getUserDetail" displayname="getUserDetail" access="public" returntype="LoginApp.model.user.User" description="" hint="" output="true">
		<cfargument name="user" type="LoginApp.model.user.User" required="false">
		<cfscript>
			var userDao = CreateObject("component","LoginApp.model.user.UserDao").init();
			arguments.user = userDao.read(arguments.user);
			return arguments.user;
		</cfscript>
	</cffunction>
	
</cfcomponent>