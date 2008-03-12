<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="EchoDelegate"
			 output="true">
				 
	<cfscript>
	</cfscript>
	
	<cffunction name="init" displayname="init" description="" access="public" returntype="LoginApp.model.common.EchoDelegate" hint="" output="true">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="echoUser" displayname="echoUser" description="" access="public" returntype="LoginApp.model.user.User" hint="" output="true">
		<cfargument name="user" type="LoginApp.model.user.User" required="false">
		<cfscript>
			return arguments.user;
		</cfscript>
	</cffunction>
	
	<cffunction name="echoUserAsQuery" displayname="echoUserAsQuery" description="" access="public" returntype="query" hint="" output="true">
		<cfargument name="user" type="LoginApp.model.user.User" required="false">
		<cfscript>
			var qUser = QueryNew("userId,userName,userPassword");
			QueryAddRow(qUser, 1);
			qUser.userId[1] = arguments.user.getUserId();
			qUser.userName[1] = arguments.user.getUserName();
			qUser.userPassword[1] = arguments.user.getPassword();
			return qUser;
		</cfscript>
	</cffunction>
	
</cfcomponent>