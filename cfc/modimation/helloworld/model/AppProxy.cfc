<cfcomponent extends="org.puremvc.cf.patterns.proxy.Proxy" implements="org.puremvc.cf.interfaces.IProxy" output="true">
	
	<cfscript>
		this.NAME = "AppProxy";
	</cfscript>
	
	<cffunction name="init" returntype="cfc.modimation.helloworld.model.AppProxy" access="public" output="true">
		<cfargument name="proxyName" type="string" required="false">
		<cfargument name="data" type="any" required="false">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="doSayHello" returntype="string" access="public" output="true">
		<cfscript>
			return "Hello World!";
		</cfscript>
	</cffunction>
	
</cfcomponent>