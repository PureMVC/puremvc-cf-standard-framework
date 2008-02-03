<cfinterface name="IFactory" displayName="IFactory">
			
	<cffunction name="getObject" access="public" returntype="org.puremvc.cf.interfaces.IFactoryObject" output="true" hint="I get an object">
		<cfargument name="objectName" required="true" type="string" />
		<cfargument name="stArgs" required="false" type="struct" hint="" />
	</cffunction>
	
	<cffunction name="factoryMethod" access="public" displayname="factoryMethod" hint="" returntype="org.puremvc.cf.interfaces.IFactoryObject" output="true">
		<cfargument name="objectName" required="true" type="string">
		<cfargument name="stArgs" required="true" type="struct" hint="" />
	</cffunction>
	
</cfinterface>