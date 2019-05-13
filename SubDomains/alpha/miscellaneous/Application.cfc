<!---
	You can place CFML code in this folder and run it independently from CFWheels.
	This empty "Application.cfc" file makes sure that CFWheels does not interfere with the request.
--->

<cfcomponent>
	<cfset this.enablerobustexception = true />

	<cfset this.name = "HOAIC60">
	<cfset this.sessionmanagement = true>
	<cfset this.sessionTimeout = createTimespan(0,0,40,0)>
</cfcomponent>