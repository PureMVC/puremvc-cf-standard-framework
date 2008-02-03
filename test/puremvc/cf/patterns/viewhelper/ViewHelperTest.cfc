<cfcomponent displayname="TestViewHelper"
			 extends="net.sourceforge.cfunit.framework.TestCase"
			 output="true">
	
	<cfscript>
		
	</cfscript>
	
	<cffunction name="testSetFacadeMethod" access="public" returntype="void">
		<cfscript>
			var viewHelper = CreateObject("component","org.puremvc.cf.patterns.viewHelper.ViewHelper");
			var facade = 0;
			
			viewHelper.setFacade(this.getFacade());
			facade = viewHelper.getFacade();
			
			// test assertions
   			assertTrue( "Expecting instance is an IFacade", GetMetaData(facade).implements['org.puremvc.cf.interfaces.IFacade'].DISPLAYNAME == 'IFacade' );
		
		</cfscript>
	</cffunction>
	
	<cffunction name="testGetNotificationObject" access="public" returntype="void">
		<cfscript>
			var viewHelper = CreateObject("component","org.puremvc.cf.patterns.viewHelper.ViewHelper");
			var notification = 0;
	
			viewHelper.init();
			
			notification = viewHelper.getNotification();
			notification.init("NotificationTestNote");
			
			// test assertions
   			assertTrue( "Expecting instance is an INotification", GetMetaData(notification).implements['org.puremvc.cf.interfaces.INotification'].DISPLAYNAME == 'INotification' );
		
		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" returntype="org.puremvc.cf.interfaces.IFacade" access="public" output="true" hint="">
		<cfinvoke component="org.puremvc.cf.patterns.facade.Facade" method="getInstance" returnvariable="oFacade">
		<cfreturn oFacade>
	</cffunction>

</cfcomponent>