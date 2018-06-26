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

<cf_querysim name="qryme">
	name,Varchar|bands,Varchar
	Brian|Big Country,Rush,XTC,The Beatles,Primus,The Police
</cf_querysim>
<cf_querysim name="qryThem">
	name,Varchar|bands,Varchar
	Bill|Blur,XTC,Pearl Jam,Primus,Tool,Big Country
</cf_querysim>
<cf_querysim name="qryboth">
	name,Varchar|bands,Varchar
	Brian|Big Country,Rush,XTC,The Beatles,Primus,The Police
	Bill|Blur,XTC,Pearl Jam,Primus,Tool,Big Country
</cf_querysim>

<cfset matchlist = "">
<cfloop list="#valueList(qryme.bands)#" index="i">
	<cfif listFindNoCase(valuelist(qryThem.bands),i)>
		<cfset matchlist = listAppend(matchlist,i)>
	</cfif>
</cfloop>

<cfoutput>
<script type="text/javascript" src="/javascripts/canvasXpress.min.js"></script>
   <script>
      var initPage = function () {
      	var data = {
        	"venn": {
		    	"data": {
		      		"A": '#getBands("qryme")#',
				    "B": '#getBands("qryThem")#',
		    		"AB": '#replace(matchlist,",","\r\n","all")#'
		    	},
		    	"legend": {
		      		"#qryMe.name#": "",
		      		"#qryThem.name#": ""
		    	}
			}
       	};
		var conf = {
			"animationType": "spring",
			  "autoScaleFont": false,
			  "axisTickColor": "rgb(73, 91, 140)",
			  "axisTickFontSize": 14,
			  "axisTitleFontSize": 24,
			  "dendrogramHeight": 56.5,
			  "disableEvents": true,
			  "fontName": "Roboto",
			  "graphType": "Venn",
			  "heatmapIndicatorHeight": 22.6,
			  "heatmapIndicatorWidth": 180.7,
			  "heatmapSeparatorWidth": 2.8,
			  "legendFontSize": 24,
			  "lineThickness": 3,
			  "margin": 3,
			  "marginBottom": 3,
			  "marginLeft": 3,
			  "marginRight": 3,
			  "marginTop": 1,
			  "maxCols": 2,
			  "maxRows": 4,
			  "overlaysThickness": 20.3,
			  "showAnimation": true,
			  "showLegend": false,
			  "showTransition": true,
			  "subtitle": "Band/Artist Influences - You and #qryThem.name#",
			  "subtitleFontSize": 34,
			  "title": " ",
			  "titleFontSize": 36,
			  "vennColors": [
			    "##efefef",
			    "##c0c0c0"
			  ],
			  "vennGroups": 2
		};
        var cX = new CanvasXpress("canvasId", data, conf);
      }
    </script>

</head>

  <body onload="initPage()">
	<div class="row">
	  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
	    <canvas id='canvasId' width='400' height='400' aspectRatio='1:1' responsive='true'></canvas>
	  </div>
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
	<h2>Related Artists & Genres</h2>
	<cfloop list="#valueList(qryme.bands)#" index="i">
		<cfif listFindNoCase(valuelist(qryThem.bands),i)>

			<h3>#i#</h3>
			<cfhttp url="http://ws.audioscrobbler.com/2.0/?method=artist.getInfo&artist=#urlencodedformat(i)#&api_key=8c6d56d146fc74f3b4a5ba73a257182e&format=json&user=RJ" >
			<cfset res = DeserializeJson(cfhttp.Filecontent)>
			<cfloop array="#res.artist.tags.tag#" index="tag">
				<button class="btn btn-success btn-sm">#tag.name#</button>
			</cfloop>
			<cfloop array="#res.artist.similar.artist#" index="band">
				<li>
					#band.name#
				</li>
			</cfloop>
			<!--- <br />
	 		<cfloop array="#res.artist.tags.tag#" index="tag">
				<cfdump var="#tag.name#">
			</cfloop> --->
		</cfif>
	</cfloop>
	</div>
	</div>
  </body>
</html>

</cfoutput>
<cffunction name="getBands" output="false">
	<cfargument name="qry">

	<cfquery name="test" dbtype="query">
		SELECT bands
		FROM #qry#
	</cfquery>

	<cfreturn replace(test.bands,",","\r\n","all")>
</cffunction>

<script>

</script>
<!--- <script src="/javascripts/raphael-master/raphael.min.js"></script>
<script src="/javascripts/jquery.venn.min.js"></script>
<style>
text {
	font-size:24px !important;
}
rect {
	fill: #fff !important;
	stroke: none !important;
}
</style>
<div id="venn-demo" style="margin: 30px auto;width: 80%;height: 60%;"></div>


<script>
$('#venn-demo').venn({

  // The number of sets to draw and track.
  numSets : 2,

  // Default labels to use for the sets
  setLabels : ['You', 'Other User'],

  // Label to use for the universe
  universeLabel : 'BandJoin Compatibility Chart',

  // Color palette
  colors : ['#f00', '#0f0'],

  // Background color for universal set, etc.
  backgroundColor : '#fff',

  // Border color appearing around the universe
  borderColor: '#000',

  // If this is true, we will render nice little lines under regions that are
  // enabled.
  shadeRegions : true,

  // If region shading is enabled, this specifies the number of pixels that
  // vertically separate the lines in the shading.
  shadeSpacing : 2,

  // Color to use for shading (fill for universe, lines for non-universe sets).
  shadeColor : '#fff',

  // Opacity to use when the universe is shaded
  universeShadeOpacity : 0.3,

  // Set of attributes for the ellipses to be drawn
  ellipseSettings: {
    'fill'         : '#fff',
    'fill-opacity' : 0,
    'stroke-width' : 3,
  },

  // An set of regions to enable initially
  initRegions : ['You', 'Other User'],

  // If true, interactive clicking will be disabled.
  disableClicks : false,

  // Default dimensions for the HTML 5 canvas
  canvasWidth : 'inherit',
  canvasHeight : 'inherit',

  // Event handler that gets called when a region is clicked. Default is noop.
  regionClicked : $.noop

});


</script> --->