<cfcomponent extends="Controller">

<cfscript>
function init() {


}

</cfscript>

<cffunction name="index">
	<cfset user = model("user").new(include="userprofile")>
</cffunction>

<cffunction name="adduser">
<cftry>
	<cfset params.user.username = params.user.email>
	<cfset newuser = model("user").new(params.user)>
	<cfset newuser.save()>
	<cfset profile = model("userprofile").new()>
	<cfset profile.userid = newuser.userid>
	<cfset profile.save()>
	<cfcatch><cfdump var="#cfcatch#"><cfabort></cfcatch>
</cftry>
<!--- 	<cfif newuser.hasErrors()>

		<cfset renderPage()>
	</cfif> --->
	<cfset flashInsert(success="Thanks for your interest in BandJoin.com. Stay Tuned!")>
	<cfset redirectTo(route="index")>
</cffunction>

</cfcomponent>