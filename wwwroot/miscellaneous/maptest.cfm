<cfinclude template="header.cfm">

	<cf_querysim name="qry1">
		name,Varchar|zipcode,Varchar|genre,varchar|instrument,Varchar
		Brian|90210|Rock|Guitar
		Sam|20715|Folk|Banjo
		Bill|20716|Jazz|Percussion
		Jill|30189|Rock|Bass
		Jeff|30188|Classical|Viola
		Kenny|30188|Jazz|Vibes
		Paul|30309|EDM|DJ
		Smith|41222|Flamenco|Guitar
	</cf_querysim>

<div class="row">
	<div class="col-md-4 col-md-offset-3">
<cfif isDefined("form.btnSend")>
	<h1>Search Results - <cfoutput>#form.distance# mile radius</cfoutput></h1>

	<cftry>
	<cfset dist = form.distance><!--- mile radius variable --->
	<cfset myzip = "30115"><!--- zip code var --->
	<cfset genre = "Rock"><!--- genre var? --->

	<!--- pare down results as much as possible --->
	<cfquery name="qryres" dbtype="query">
		SELECT *
		FROM qry1
		<!--- WHERE genre = 'Rock' --->
	</cfquery>
	<!--- plot map points --->

	<cfset reslist = "">
	<cfset counter = 0>
	<cfhttp url="https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#myzip#&destinations=#valuelist(qryres.zipcode,'|')#&key=AIzaSyCjyH-MBNVh0GQ-HX9mtGURZR_OuRyI_k0"></cfhttp>
	<cfset res = deserializeJson(cfhttp.filecontent)>
	<cfset distArray = res.rows[1].elements>
	<cfset name = "">

	<div class="well">
	<cfif arraylen(distArray) neq 0>
		<table class="table table-striped">
			<thead>
				<th>Name</th>
				<th>Distance<br />(miles)</th>
				<th>Main Genre</th>
				<th>Main Instrument</th>
			</thead>
		<cfloop array="#distArray#" index="i">
			<cfset counter = counter + 1>
			<cftry>
			<cfset miles = replace(i.distance.text," mi","","ALL")>
			<cfcatch><cfset miles = 100000></cfcatch>
			</cftry>
			<cfset miles = replace(miles,",","","ALL")>
			<cfif miles LTE dist>
				<cfset foundzip = findNumInString(res.destination_addresses[counter])>
				<cfquery name="endres" dbtype="query">
					SELECT *
					FROM qry1
					WHERE zipcode = '#foundzip#' and name <> '#name#'
				</cfquery>
				<cfset name = endres.name>
				<cfoutput>
				<tr>
					<td>#endres.name#</td>
					<td align="center">#round(miles)#</td>
					<td>#endres.genre#</td>
					<td>#endres.instrument#</td>
				</tr>
				</cfoutput>
				<!--- <cfoutput> lives approximately #round(miles)# miles from #myzip# and is into #endres.genre#.<br /></cfoutput> --->
			</cfif>
		</cfloop>
		</table>
	<cfelse>
		No results found!
	</cfif>
	</div>
	<div><button onclick="history.back()">Back to Search Form</button></div>
	<cfcatch><cfdump var="#cfcatch#"></cfcatch>
	</cftry>
<cfelse>
	<h1>Search Proof of Concept</h1>
	<form method="post" class="form-horizontal" onsubmit="return checkStuff()">
		<label>Distance</label>
		<input type="text" name="distance" id="distance" class="form-control">
		<br />
		<input type="submit" name="btnSend" class="btn btn-success" value="Search">
	</form>


</cfif>
	</div>
</div>

<script>
	function checkStuff() {
		if(isNaN($("#distance").val())) {
			alert("Please enter a number.");
			return false;
		}
	}
</script>

<cffunction name="findNumInString" output="true">
	<cfargument name="strin">

	<cfset outstr = rematch("[\d]+",strin)>

	<cfreturn outstr[1]>
</cffunction>