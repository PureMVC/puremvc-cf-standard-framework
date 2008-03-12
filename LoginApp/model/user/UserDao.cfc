<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="UserDao" 
			 output="true">

	<cffunction name="init" access="public" returntype="LoginApp.model.user.UserDao" output="true">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="read" output="true" access="public" returntype="LoginApp.model.user.User">
		<cfargument name="bean" required="true" type="LoginApp.model.user.User">
		<cfscript>
			arguments.bean.setUserId(1);
			arguments.bean.setUsername("moddis");
			arguments.bean.setPassword("moddis12");
			return arguments.bean;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="true" access="public">
		<cfargument name="bean" required="true" type="LoginApp.model.user.User">
		<cfscript>
			arguments.bean.setUserId(arguments.bean.getUserId()+1);
			arguments.bean.setUserName(arguments.bean.getUsername());
			arguments.bean.setPassword(arguments.bean.getPassword());
			return arguments.bean;
		</cfscript>
	</cffunction>

	<cffunction name="update" output="true" access="public">
		<cfargument name="bean" required="true" type="LoginApp.model.user.User">
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="true" access="public" returntype="void">
		<cfargument name="bean" required="true" type="LoginApp.model.user.User">
	</cffunction>
	
	<cffunction name="commit" access="package" returntype="Workflow" output="true">
		<cfargument name="bean" required="true" type="LoginApp.model.user.User">
		<cfscript>
			if(arguments.bean.getIdentity() eq 0 )
				arguments.bean = this.create(arguments.bean);
			else
				arguments.bean = this.update(arguments.bean);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

</cfcomponent>