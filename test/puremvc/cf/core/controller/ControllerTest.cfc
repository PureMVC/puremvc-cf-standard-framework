<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="Controller" output="true" extends="net.sourceforge.cfunit.framework.TestCase">
	
	<cfproperty name="controller" type="org.puremvc.cf.core.controller.Controller">
	
	<cffunction name="testGetInstance" returntype="void" access="public">
		<cfscript>
			var controller = CreateObject("component","org.puremvc.cf.core.controller.Controller");
		</cfscript>
		<cfinvoke component="org.puremvc.cf.core.controller.Controller" method="getInstance" returnvariable="controllerInstance">
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="expected" value="#controller#">
			<cfinvokeargument name="actual" value="#controllerInstance#">
		</cfinvoke>
	</cffunction>
	
	<cffunction name="testRegisterAndExecuteCommand" returntype="void" access="public" output="true">
		<cfscript>
			var oVO = 0;
			var oNotification = 0;
		</cfscript>
		<cfinvoke component="org.puremvc.cf.core.controller.Controller" method="getInstance" returnvariable="controllerInstance" />
		<cfscript>
			// Create the controller, register the ControllerTestCommand to handle 'ControllerTest' notes
			controllerInstance.registerCommand("ControllerTest", "test.puremvc.cf.core.controller.ControllerTestCommand");
			
			// Create a 'ControllerTest' note
			oVO = CreateObject("component","ControllerTestVO").init(12);
			oNotification = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			oNotification.init("ControllerTest", oVO);
			
			// Tell the controller to execute the Command associated with the note
			// the ControllerTestCommand invoked will multiply the vo.input value
			// by 2 and set the result on vo.result
			controllerInstance.executeCommand(oNotification);
		</cfscript>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting vo.result == 24">
			<cfinvokeargument name="condition" value="#(oVO.getResult() EQ 24)#">
		</cfinvoke>
	</cffunction>
	
	<cffunction name="testRegisterAndRemoveCommand" returntype="void" access="public">
		<cfscript>
			var oVO = 0;
			var oNotification = 0;
		</cfscript>
		<cfinvoke component="org.puremvc.cf.core.controller.Controller" method="getInstance" returnvariable="controllerInstance" />
		<cfscript>
			// Create the controller, register the ControllerTestCommand to handle 'ControllerTest' notes
			controllerInstance.registerCommand("ControllerRemoveTest", "test.puremvc.cf.core.controller.ControllerTestCommand");
			
			// Create a 'ControllerTest' note
			oVO = CreateObject("component","ControllerTestVO").init(12);
			oNotification = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			oNotification.init("ControllerRemoveTest", oVO);
			
			// Tell the controller to execute the Command associated with the note
			// the ControllerTestCommand invoked will multiply the vo.input value
			// by 2 and set the result on vo.result
			controllerInstance.executeCommand(oNotification);
		</cfscript>
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting vo.result == 24">
			<cfinvokeargument name="condition" value="#(oVO.getResult() EQ 24)#">
		</cfinvoke>
		<cfscript>
			// Reset result
   			oVO.setResult(0);
   			
   			// Remove the Command from the Controller
   			controllerInstance.removeCommand('ControllerRemoveTest');
			
			// Tell the controller to execute the Command associated with the
			// note. This time, it should not be registered, and our vo result
			// will not change   			
   			controllerInstance.executeCommand(oNotification);
		</cfscript>
		<!--- 
		<cfdump var="#application.facadeInstance#">
		<cfabort> 
		--->
		<cfinvoke method="assertTrue">
			<cfinvokeargument name="message" value="Expecting vo.result == 0">
			<cfinvokeargument name="condition" value="#(oVO.getResult() EQ 0)#">
		</cfinvoke>
	</cffunction>

</cfcomponent>