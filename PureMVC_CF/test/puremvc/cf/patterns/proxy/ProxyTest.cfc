<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true">
	
	<cffunction name="testNameAccessor" returntype="void" access="public" output="true" hint="Tests getting the name using Proxy class accessor method. Setting can only be done in constructor.">
		<cfscript>
			// Create a new Proxy and use accessors to set the proxy name 
			var proxy = CreateObject("component","org.puremvc.cf.patterns.proxy.Proxy");
			proxy.init("TestProxy");
			
			//test assertions
			this.assertTrue("Expecting proxy.getProxyName() == 'TestProxy'", (proxy.getProxyName() EQ 'TestProxy') );
		</cfscript>
	</cffunction>
	
	<cffunction name="testDataAccessors" returntype="void" access="public" output="true" hint="Tests setting and getting the data using Proxy class accessor methods.">
		<cfscript>
			// Create a new Proxy and use accessors to set the proxy name 
			var proxy = CreateObject("component","org.puremvc.cf.patterns.proxy.Proxy");
			var testStr = {};
			var data = 0;
			testStr[1] = 'red';
			testStr[2] = 'green';
			testStr[3] = 'blue';
			proxy.init("colors");
			proxy.setData(testStr);
			data = proxy.getData();
			
			// test assertions
			this.assertTrue("Expecting data.length == 3", (StructCount(data) == 3) );
			this.assertTrue("Expecting data[1] == 'red'", (data[1] == 'red') );
			this.assertTrue("Expecting data[1] == 'green'", (data[2] == 'green') );
			this.assertTrue("Expecting data[2] == 'green'", (data[3] == 'blue') );
		</cfscript>
	</cffunction>
	
	<cffunction name="testConstructor" returntype="void" access="public" output="true" hint="Tests setting the name and body using the Notification class Constructor.">
		<cfscript>
			// Create a new Proxy using the Constructor to set the name and data
			var proxy = CreateObject("component","org.puremvc.cf.patterns.proxy.Proxy");
			var testStr = {};
			var data = 0;
			testStr[1] = 'red';
			testStr[2] = 'green';
			testStr[3] = 'blue';
			proxy.init("colors", testStr);
			data = proxy.getData();
			
			// test assertions
			this.assertTrue("Expecting data.length == 3", (StructCount(data) == 3) );
			this.assertTrue("Expecting proxy.getProxyName() == 'colors'", (proxy.getProxyName() == 'colors') );
			this.assertTrue("Expecting data[1] == 'red'", (data[1] == 'red') );
			this.assertTrue("Expecting data[1] == 'green'", (data[2] == 'green') );
			this.assertTrue("Expecting data[2] == 'green'", (data[3] == 'blue') );
		</cfscript>
	</cffunction>
	
</cfcomponent>