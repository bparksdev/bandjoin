<cfcomponent extends="Controller">

<cfscript>
function init() {


}

</cfscript>

<cffunction name="index">
	<cfset user = model("user").new()>
</cffunction>

<cffunction name="adduser">
<cftry>
	<cfset newuser = model("user").new()>
	<cfset newuser.email = params.user.email>
	<cfset newuser.username = params.user.email>
	<cfset newuser.zippostalcode = params.user.zippostalcode>
	<cfset newuser.save()>
	<cfcatch><cfdump var="#cfcatch#"><cfabort></cfcatch>
</cftry>
<!--- 	<cfif newuser.hasErrors()>

		<cfset renderPage()>
	</cfif> --->
	<cfset flashInsert(success="Thanks for your interest in BandJoin.com. Stay Tuned!")>
	<cfset redirectTo(route="index")>
</cffunction>

</cfcomponent>