<cfif isMobile() and not isIPad()>
<style>
.text450 {
	font-size:400%;
	margin-bottom:20px;
}
.text300 {
	font-size:250%;
	margin-bottom:20px;
}
.text200 {
	font-size:150%;
	margin-bottom:20px;
}
label {
	font-size:20px;
	min-width: 200px;
}
.container {
	padding:5px;
}
</style>
</cfif>
<div class="container" style="margin-top:20px;">
	<div class="jumbotron" style="text-align:center">
		<div class="text450">Let's face it.</div>
		<div class="text300">
			<span class="glyphicon glyphicon-music"></span>Musical relationships can be as intense and all-consuming as romantic ones.<span class="glyphicon glyphicon-heart" style="color:red"></span>

		</div>

		<div class="text200">
		There are fights, hurt feelings, storming out of the room, and the occasional "silent treatment". But also times of
		unbridled bliss and harmony that you wouldn't trade for the world.
		</div>
		<div class="text200">
		Wouldn't it be <strong>great</strong> if we handled relationships between musicians in the same way we handle romantic ones online?
		With thoughtful consideration of a musician's <em>likes and dislikes, aspirations, personal style, preferences, and skills</em> and how those match up (or not) with another individual?
		</div>
		<div class="text300">
			The answer is coming soon. Throw us your email and zip code and we'll keep you in the loop as we prepare to launch BandJoin.com!
		</div>
		<cfoutput>
		<div class="well">
		#errorMessagesFor("user")#
		#startFormTag(controller="site", action="adduser")#
		#textField(
					label="Email",
					objectName="user",
					property="email",
					prependToLabel="<div>",
					labelPlacement="before",required="true",class="bigtextbox")#
		<br /><br />
		#textField(
					label="Zip/Postal Code",
					objectName="user",
					property="zippostalcode",
					prependToLabel="<div>",
					labelPlacement="before",required="true",class="bigtextbox",maxlength="5")#
		<br />
		<small>(No birth date necessary)</small>
		<br /><br />
		#submitTag(class="btn btn-success btn-lg",value="I'm Curious!")#
		#endFormTag()#
		</div>
		<br /><br />
		<small>
			Questions? Please feel free to <a href="mailto:support@bandjoin.com">email us</a>. Anytime.
			<br />
			<br />
			&copy;2017 BandJoin.com - Home of the <strong>Musician Compatibility Engine</strong>&##8482;
		</small>
		</cfoutput>
	</div>
</div>
<script>
	$(document).ready(function() {
		setTimeout(function() {
			$(".flashMessages").hide(400);
		},3500);

	});


</script>