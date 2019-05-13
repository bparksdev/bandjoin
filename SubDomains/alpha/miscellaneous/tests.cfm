<cfset application.enablerobustexception = true />
<HTML>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
<!--- <link rel="stylesheet" href="/stylesheets/canvasXpress.css" type="text/css"/> --->
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,600|Roboto:100,300,400,700" rel="stylesheet">
<style>
body {font-family:Roboto,Sans-serif;}
h1,h2,h3,h4 {font-family:Oswald,sans-serif;}
svg path {
    stroke: white;
    stroke-width: 2px;
}
svg text {
    fill: white;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="/javascripts/venn.js"></script>
<cf_querysim name="qryme">
	name,Varchar|band,Varchar
	Brian|Big Country
	Brian|Rush
	Brian|XTC
	Brian|The Beatles
	Brian|Primus
	Brian|The Police
</cf_querysim>

<cf_querysim name="qryThem">
	name,Varchar|band,Varchar
	Bill|Blur
	Bill|XTC
	Bill|Pearl Jam
	Bill|Primus
	Bill|Tool
	Bill|Big Country
</cf_querysim>


<cf_querysim name="qryAll">
	name,Varchar|band,Varchar
	Bill|Blur
	Bill|XTC
	Bill|Pearl Jam
	Bill|Primus
	Bill|Tool
	Bill|Big Country
	Brian|Big Country
	Brian|Rush
	Brian|XTC
	Brian|The Beatles
	Brian|Primus
	Brian|The Police
</cf_querysim>
<cf_querysim name="qryboth">
	name,Varchar|band,Varchar
	Brian|Big Country,Rush,XTC,The Beatles,Primus,The Police
	Bill|Blur,XTC,Pearl Jam,Primus,Tool,Big Country
</cf_querysim>

<!---<cfset matchlist = "">
<cfloop list="#valueList(qryme.band)#" index="i">
	<cfif listFindNoCase(valuelist(qryThem.band),i)>
		<cfset matchlist = listAppend(matchlist,i)>
	</cfif>
</cfloop>--->

<cfoutput>

<!---<script type="text/javascript" src="/javascripts/canvasXpress.min.js"></script>
   <script>
      var initPage = function () {
      	var data = {
        	"venn": {
		    	"data": {
		      		"A": '#getband("qryme")#',
				    "B": '#getband("qryThem")#',
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
    </script>--->

</head>

<body>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<div id="venn"></div>
	    	<!---<canvas id='canvasId' width='400' height='400' aspectRatio='1:1' responsive='true'></canvas>--->
	  	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 jumbotron">
			<h2>Artist Info</h2>
			<cfloop list="#valueList(qryme.band)#" index="i">
				<cfif listFindNoCase(valuelist(qryThem.band),i)>
					<cfhttp url="http://ws.audioscrobbler.com/2.0/?method=artist.getInfo&artist=#urlencodedformat(i)#&api_key=8c6d56d146fc74f3b4a5ba73a257182e&format=json&user=RJ" >
					<cfset res = DeserializeJson(cfhttp.Filecontent)>

					<div class="well" style="padding-top:5px;padding-bottom:0;">
						<div class="row">
							<div class="col-sm-2 text-center">
								<h3 style="margin-top:5px">
									<img src="#res.artist.image[2]['##text']#" style="border: 6px solid white;-webkit-box-shadow: 4px 4px 5px 0px rgba(50, 50, 50, 0.75);-moz-box-shadow:4px 4px 5px 0px rgba(50, 50, 50, 0.75);box-shadow:4px 4px 5px 0px rgba(50, 50, 50, 0.75);" />
									<br />#i#
								</h3>
							</div>
							<div class="col-sm-10 well" style="background-color:##fff;padding:5px;">
								#res.artist.bio.summary#
							</div>
						</div>
					</div>
					<h4>Tags</h4>
					<cfloop array="#res.artist.tags.tag#" index="tag">
						<button class="btn btn-primary btn-sm">#tag.name#</button>
					</cfloop>
					<h4>Related Artists</h4>
					<cfloop array="#res.artist.similar.artist#" index="band">
						<li>#band.name#</li>
					</cfloop>
					<hr>
				</cfif>
			</cfloop>

		</div>
	</div>
  </body>
</html>

<cffunction name="getband" output="true">
	<cfargument name="qry">

	<cfset jsonout = "">
	<cfset numlist = "">
	<cfset bandlist = "">

	<cfloop query="qryAll">
		<cfset jsonout = jsonout & '{"sets": [#currentRow#], "label": "#band#", "size": 2}'>
		<cfif currentrow neq recordcount><cfset jsonout = jsonout & ","></cfif>
		<cfset numlist = listAppend(numlist,currentrow+1)>
		<cfset bandlist = listAppend(bandlist,band)>
	</cfloop>

	<cfset jsonout = jsonout & getListPair()>

	<cfreturn jsonout>
</cffunction>

<cffunction name="getListPair">
	<cfquery name="getMatches" dbtype="query">
		SELECT distinct band from qryALL
		WHERE band in ('#replace(valueList(qryMe.band),",","','","ALL")#')
		AND band in ('#replace(valueList(qryThem.band),",","','","ALL")#')
		ORDER BY band
	</cfquery>
	<cfset outlist = "">

	<cfloop query="getMatches">
		<cfset bandpos = listFind(bandlist,band)>
		<cfif bandpos neq 0>
			<cfset outlist = listAppend(outlist,'{"sets": [' & listGetAt(numlist,bandpos)-1 & "," & listFindLast(bandlist,band)-1 & '], "size": 1, "label": "!"}')>
		</cfif>
	</cfloop>


	<cfreturn "," & outlist>
</cffunction>

<cffunction name="listFindLast">
	<cfargument name="list">
	<cfargument name="value">

	<cfset x = listFind(list,value)>
	<cfset newlist = listDeleteAt(numlist, x)>
	<cfset newlist2 = listDeleteAt(list, x)>
	<cfset x = listFind(newlist2,value)>

	<cfloop list="#newlist2#" index="i">
		<cfif listFind(newlist2,value) neq 0>
			<cfset x = listFind(newlist2,value)>
			<cfset retval = listGetAt(newlist,x)>

		</cfif>
	</cfloop>

	<cfreturn retval>

</cffunction>

<script type="text/javascript">
var sets = [ #getband()# ];
console.log(sets);

var chart = venn.VennDiagram().width(1000).height(680);
var div = d3.select("##venn")
div.datum(sets).call(chart);
var tooltip = d3.select("body").append("div")
    .attr("class", "venntooltip");
div.selectAll("path")
    .style("stroke-opacity", 0)
    .style("stroke", "##fff")
    .style("stroke-width", 3)
div.selectAll("g")
    .on("mouseover", function(d, i) {
        // sort all the areas relative to the current item
        venn.sortAreas(div, d);
        // Display a tooltip with the current size
        tooltip.transition().duration(400).style("opacity", .9);
        tooltip.text(d.size + " users");
        // highlight the current path
        var selection = d3.select(this).transition("tooltip").duration(400);
        selection.select("path")
            .style("fill-opacity", d.sets.length == 1 ? .4 : .1)
            .style("stroke-opacity", 1);
    })
    .on("mousemove", function() {
        tooltip.style("left", (d3.event.pageX) + "px")
               .style("top", (d3.event.pageY - 28) + "px");
    })
    .on("mouseout", function(d, i) {
        tooltip.transition().duration(400).style("opacity", 0);
        var selection = d3.select(this).transition("tooltip").duration(400);
        selection.select("path")
            .style("fill-opacity", d.sets.length == 1 ? .25 : .0)
            .style("stroke-opacity", 0);
    });

</script>
</cfoutput>
<!---
"A": '#getband("qryme")#',
				    "B": '#getband("qryThem")#',
		    		"AB": '#replace(matchlist,",","\r\n","all")#'
 <script src="/javascripts/raphael-master/raphael.min.js"></script>
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