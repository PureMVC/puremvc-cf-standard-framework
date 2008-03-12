<cfcomponent displayname="LoginFormViewHelper" 
			 extends="org.puremvc.cf.patterns.viewhelper.ViewHelper"
			 output="true">
	
	<cfproperty name="user" type="LoginApp.model.user.User">
	
	<cfscript>
		this.user = 0;
		variables.id = "LoginFormViewHelper";
		variables.componentName = "LoginFormViewHelper";
	</cfscript>
	
	<cffunction name="init" access="public" returntype="LoginApp.view.login.LoginFormViewHelper" output="true">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void" output="true">
		<cfscript>	
			super.initializeViewHelper();
			this.getFacade().registerMediator(this.createMediator());
			this.handlePostBack();
		</cfscript>
	</cffunction>
	
	<cffunction name="createMediator" access="public" returntype="org.puremvc.cf.interfaces.IMediator" output="true">
		<cfscript>
			var oMediator = 0;
			oMediator = CreateObject("component", "LoginApp.view.login.LoginViewMediator");			
			oMediator.init(this.getId(),this);
			return oMediator;
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
		<cfscript>
			var oNotification = 0;
			this.user = CreateObject("component", "LoginApp.model.user.User").init();
			if (IsDefined("FORM.userName") AND IsDefined("FORM.userPassword"))
			{
				this.user.setUsername(FORM.userName);
				this.user.setPassword(FORM.userPassword);
				
				if (IsDefined("FORM.btnSubmitWithQueryReturned"))
				{
					this.sendNotification("LOGIN_USER_QUERY", this.user);
				} else {
					this.sendNotification("LOGIN_USER", this.user);	
				}
				variables.isPostBack = true;
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="updateView" returntype="void" access="public" output="true">
		<cfargument name="user" type="any" required="true">
		<cfscript>
			this.user = arguments.user;
		</cfscript>
	</cffunction>
	
	<cffunction name="updateViewAsQuery" returntype="void" access="public" output="true">
		<cfargument name="user" type="query" required="true">
		<cfset this.user.setUsername( arguments.user.username )>
		<cfset this.user.setPassword( arguments.user.userpassword )>
	</cffunction>
	
</cfcomponent>