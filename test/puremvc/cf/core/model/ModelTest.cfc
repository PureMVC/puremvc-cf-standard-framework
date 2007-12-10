<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="ModelTest" output="true" extends="net.sourceforge.cfunit.framework.TestCase">
	
	<cfproperty name="model" type="org.puremvc.cf.core.model.Model">
	
	<cfscript>
		variables.viewTestVar = 0;
	</cfscript>
	
	<cffunction name="testGetInstance" returntype="void" access="public">
		<cfscript>
			var model = CreateObject("component","org.puremvc.cf.core.model.Model");
		</cfscript>
		<cfinvoke component="org.puremvc.cf.core.model.Model" method="getInstance" returnvariable="modelInstance">
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="expected" value="#model#">
			<cfinvokeargument name="actual" value="#modelInstance#">
		</cfinvoke>
	</cffunction>
	
	<cffunction name="testRegisterAndRetrieveProxy" returntype="void" access="public">
		<cfscript>
			var model = 0;
			var proxy = 0;
			var data = 0;
			var testStr = {};
			testStr[1] = 'red';
			testStr[2] = 'green';
			testStr[3] = 'blue';
		</cfscript>
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.model.Model" method="getInstance" returnvariable="modelInstance">
		<cfscript>
			proxy = CreateObject("component","org.puremvc.cf.patterns.proxy.Proxy");
			proxy.init('colors',testStr);
			modelInstance.registerProxy(proxy);
			
			proxy = modelInstance.retrieveProxy('colors');
			data = proxy.getData();
		</cfscript>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting data type is Array">
			<cfinvokeargument name="condition" value="#IsStruct(data)#">
		</cfinvoke>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting data.length == 3">
			<cfinvokeargument name="condition" value="#StructCount(data) EQ 3#">
		</cfinvoke>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting data[0] == 'red'">
			<cfinvokeargument name="condition" value="#(data[1] EQ 'red')#">
		</cfinvoke>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting data[0] == 'green'">
			<cfinvokeargument name="condition" value="#(data[2] EQ 'green')#">
		</cfinvoke>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting data[0] == 'blue'">
			<cfinvokeargument name="condition" value="#(data[3] EQ 'blue')#">
		</cfinvoke>
	</cffunction>
	
	<cffunction name="testRegisterAndRemoveProxy" returntype="void" access="public">
		<cfscript>
			var model = 0;
			var proxy = 0;
			var data = 0;
			var testStr = {};
			testStr[1] = 7;
			testStr[2] = 13;
			testStr[3] = 21;
		</cfscript>
		<!--- Get the Singleton View instance --->
		<cfinvoke component="org.puremvc.cf.core.model.Model" method="getInstance" returnvariable="modelInstance">
		<cfscript>
			proxy = CreateObject("component","org.puremvc.cf.patterns.proxy.Proxy");
			proxy.init('sizes',testStr);
			
			modelInstance.registerProxy(proxy);
			modelInstance.removeProxy('sizes');
			
			//proxy = modelInstance.retrieveProxy('sizes');
		</cfscript>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting proxy is null">
			<cfinvokeargument name="condition" value="#NOT StructKeyExists(modelInstance.proxyMap, 'sizes')#">
		</cfinvoke>
	</cffunction>

</cfcomponent>