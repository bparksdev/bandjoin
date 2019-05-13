<!--- Place HTML here that should be used as the default layout of your application. --->
<cfoutput>
#flashMessages()#

</cfoutput>
<!DOCTYPE html>
<html  lang="en">
	<head>
	    <meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	    <meta name="description" content="Musician matching at BandJoin.com. Use our exclusive Musician Compatibility Engine (MCE) free for 30 days, then just a low $1.99 per month!">
	    <meta name="keywords" content="musicians wanted,musician classifieds,musician want ads,band classifieds,music industry,musician resources,drummers,guitarist,bass player,bands,singer,vocalist,musician matching">
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-102725330-1', 'auto');
		  ga('send', 'pageview');

		</script>
<!--- 		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<script>
		  (adsbygoogle = window.adsbygoogle || []).push({
		    google_ad_client: "ca-pub-9604790872365978",
		    enable_page_level_ads: true
		  });
		</script> --->
		<title>BandJoin.com</title>
		<link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<cfoutput>#styleSheetLinkTag(sources="main.css",media="all")#</cfoutput>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<meta name="viewport" content="initial-scale=1"/>
	</head>
	<body>
		<cfoutput>
			#imagetag(source="logobj.png", class="img-responsive")#
			#includeContent()#
		</cfoutput>
	</body>
</html>

<script>
	$(document).ready(function() {
		setTimeout(function() {
			$(".flashMessages").hide(400);
		},3500);

	});
</script>