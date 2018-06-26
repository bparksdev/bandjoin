<cfcomponent extends="Model" output="no" >

	<cffunction name="init">
		<cfset belongsTo(name="user",joinKey="userid")>
		<!--- <cfset hasOne(name="categories",joinKey="categorycode",foreignKey="id")> --->
	</cffunction>

</cfcomponent>