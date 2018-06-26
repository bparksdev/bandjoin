<cfcomponent extends="Model" output="no" >

	<cffunction name="init">
		<cfset hasOne(name="userprofile",joinKey="userid")>
		<!--- <cfset hasOne(name="categories",joinKey="categorycode",foreignKey="id")> --->
	</cffunction>

</cfcomponent>