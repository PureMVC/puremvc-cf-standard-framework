<cfcomponent name="Factory" displayName="Factory" implements="org.puremvc.cf.interfaces.IFactory" 
			 hint="Concrete implementation of IFactory.">
	
	<cfproperty name="singletonCollection" type="struct" required="false">
		
	<cfscript>
		variables.singletonCollection = StructNew();
	</cfscript>
	
	<cffunction name="getObject" access="public" returntype="org.puremvc.cf.interfaces.IFactoryObject" output="true" hint="I get an object">
		<cfargument name="objectName" required="true" type="string" />
		<cfset var obj = 0>
		<cfscript>
			obj = this.factoryMethod(arguments.objectName);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="factoryMethod" access="package" displayname="factoryMethod" hint="" returntype="IFactoryObject" output="false">
		<cfargument name="objectName" required="true" type="string">
		<cfthrow type="Custom" message="Abstract method: must be overridden in a subclass" />
	</cffunction>

	<cffunction name="singletonCheck" returntype="any" access="public" output="false">
		<cfargument name="className" type="string" required="true">
		<cfargument name="classRef" type="string" required="true">
		<cfscript>
			if ( StructKeyExists(getSingletonCollection(),arguments.className) )
			{
				returnObj = StructFind(getSingletonCollection(),arguments.className);
			} else {
				returnObj = CreateObject("Component",arguments.classRef);
				StructInsert(getSingletonCollection(),arguments.className,returnObj);
			}
			return returnObj;
		</cfscript>
	</cffunction>
	
	<cffunction name="getSingletonCollection" returntype="struct" access="public" output="false">
		<cfscript>
			return variables.singletonCollection;
		</cfscript>
	</cffunction>
	
	<cffunction name="setSingletonCollection" returntype="void" access="public" output="false">
		<cfargument name="singletonCollection" type="struct" required="true">
		<cfscript>
			variables.sigletonCollection = arguments.singletonCollection;
		</cfscript>
	</cffunction>
	
</cfcomponent>