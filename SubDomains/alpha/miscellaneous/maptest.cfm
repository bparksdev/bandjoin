<cfset application.enablerobustexception = true />
<HTML>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
<!--- <link rel="stylesheet" href="/stylesheets/canvasXpress.css" type="text/css"/> --->
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,600|Roboto:100,300,400,700" rel="stylesheet">
<style>
body {font-family:Roboto,Sans-serif;}
h1,h2,h3,h4 {font-family:Oswald,sans-serif;}
</style>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<cfset dist = 30>
<cfset myzip = "30115">
<cfset genre = "Rock">
<cf_querysim name="qry1">
	name,Varchar|zipcode,Varchar|genre,varchar
	Brian|90210|Rock
	Sam|20715|Jazz
	Bill|20716|Jazz
	Jill|30189|Rock
	Jeff|30188|Rock
	Kenny|30188|Jazz
	Paul|30309|Rock
	Smith|41222|Jazz
</cf_querysim>

<!--- pare down results as much as possible --->
<cfquery name="qryres" dbtype="query">
	SELECT *
	FROM qry1
	WHERE genre = 'Rock'
</cfquery>
<cfset reslist = "">
<cfset counter = 0>
<cfhttp url="https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#myzip#&destinations=#valuelist(qryres.zipcode,'|')#&key=AIzaSyCjyH-MBNVh0GQ-HX9mtGURZR_OuRyI_k0"></cfhttp>

<cfset res = deserializeJson(cfhttp.filecontent)>
<cfset distArray = res.rows[1].elements>

<cfloop array="#distArray#" index="i">
	<cftry>
	<cfset counter = counter + 1>
	<cfset miles = replace(i.distance.text," mi","","ALL")>
	<cfset miles = replace(miles,",","","ALL")>
	<cfif miles LTE dist>
		<cfset foundzip = findNumInString(res.destination_addresses[counter])>
		<cfquery name="endres" dbtype="query">
			SELECT *
			FROM qry1
			WHERE zipcode = '#foundzip#'
		</cfquery>
		<cfoutput>#endres.name# lives #round(miles)# miles from #myzip#<br /></cfoutput>
	</cfif>
	<cfcatch></cfcatch>
	</cftry>
</cfloop>


<cffunction name="findNumInString" output="true">
	<cfargument name="strin">

	<cfset outstr = rematch("[\d]+",strin)>

	<cfreturn outstr[1]>
</cffunction>