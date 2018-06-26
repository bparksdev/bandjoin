<!--- Place functions here that should be globally available in your application. --->

<cffunction name="isMobile">
	<cfif findNoCase("Android",CGI.HTTP_USER_AGENT) or
		findNoCase("Mobile",CGI.HTTP_USER_AGENT)
		or findNoCase("iPhone",CGI.HTTP_USER_AGENT)
		or findNoCase("Windows Phone",CGI.HTTP_USER_AGENT)
		or findNoCase("iemobile",CGI.HTTP_USER_AGENT)
		>
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<cffunction name="isIE">
	<cfif findNoCase("Windows",CGI.HTTP_USER_AGENT) and
		!findNoCase("Windows Phone",CGI.HTTP_USER_AGENT)
		and
		!findNoCase("Chrome",CGI.HTTP_USER_AGENT)
		and
		!findNoCase("Webkit",CGI.HTTP_USER_AGENT)>
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<cffunction name="isKindle">
	<cfif findNoCase("Silk",CGI.HTTP_USER_AGENT)>
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<cffunction name="isIpad">
	<cfif findNoCase("iPad",CGI.HTTP_USER_AGENT)>
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<cffunction name="isWindows">
	<cfif findNoCase("windows phone",CGI.HTTP_USER_AGENT) or findNoCase("iemobile",CGI.HTTP_USER_AGENT)>
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>