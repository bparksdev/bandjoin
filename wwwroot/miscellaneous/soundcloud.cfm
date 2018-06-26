<cfinclude template="header.cfm">

<script src="https://connect.soundcloud.com/sdk/sdk-3.1.2.js"></script>
<script>
	SC.initialize({
		client_id: 'YOUR_CLIENT_ID',
	  	redirect_uri: 'http://example.com/callback'
	});
</script>

<cfset weburl = "https://soundcloud.com/neumunki">
<cfhttp url="#weburl#">
<cfoutput>
<div class="row">
	<div class="col-md-6 col-md-offset-3 well">
<cfif cfhttp.Statuscode is not "404 Not Found">
	<div id="putTheWidgetHere"></div>
	<script type="text/javascript">
		SC.oEmbed('#weburl#', {
			type: "rich",
			maxwidth: 400,
		  	element: document.getElementById('putTheWidgetHere')
		});
	</script>
<cfelse>
	Invalid SoundCloud artist link - please check and re-enter.
</cfif>
	</div>
</div>
</cfoutput>