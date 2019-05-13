<cfif isMobile() and not isIPad()>
<style>
.text450 {
	font-size:400%;
	margin-bottom:20px;
	color:white;
}
.text300 {
	font-size:250%;
	margin-bottom:20px;
	color:white;
}
.text200 {
	font-size:150%;
	margin-bottom:20px;
	color:white;
}
label {
	font-size:20px;
	min-width: 200px;
}
.container {
	padding:5px;
}
</style>
<cfelse>
	<style>
	body {color:white !important;}
	</style>
</cfif>
<div class="container-fluid" style="margin-top:20px;text-align:center">
	<div class="text450" style="color:#fff">Let's face it.</div>
	<div class="text300" style="color:#fff">
		<span class="glyphicon glyphicon-music"style="color:#c5bf63"></span>Musical relationships can be as intense and all-consuming as romantic ones.<span class="glyphicon glyphicon-heart" style="color:#b30e0e"></span>
	</div>
	<div class="jumbotron" style="background-position: 50%;color: whitesmoke;background-image: url(/images/band-bg.jpg);">
		<div class="text200">
			There are fights, hurt feelings, storming out of the room, and the occasional "silent treatment". But also times of
			unbridled bliss and harmony that you wouldn't trade for the world.
		</div>
		<div class="text200">
			Wouldn't it be <strong>great</strong> if we handled relationships between musicians in the same way we handle romantic ones online?
			With thoughtful consideration of a musician's <em>likes and dislikes, aspirations, personal style, preferences, and skills</em> and how those match up (or not) with another individual?
		</div>
		<div class="text300">
			The answer is coming soon. Throw us your basic details and we'll keep you in the loop as we prepare to launch BandJoin.com!
		</div>
		<cfoutput>
		<div class="well" style="color: ##828282;">
			#errorMessagesFor("user")#
			#startFormTag(controller="site", action="adduser")#
			#textField(
						label="First Name",
						objectName="user",
						property="firstname",
						labelPlacement="before",required="true",class="bigtextbox")#
			#textField(
						label="Last Name",
						objectName="user",
						property="lastname",
						labelPlacement="before",required="true",class="bigtextbox")#
			<br /><br />
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
			<br /><br />
			<small>(No birth date necessary!)</small>
			<br /><br />
			#submitTag(class="btn btn-success btn-lg",value="I'm Curious!")#
			#endFormTag()#
		</div>
		<br /><br />
		<small>
			Questions? Please feel free to <a href="mailto:questions@bandjoin.com">email us</a>. Anytime.
			<br />
			<br />
			&copy;2019 BandJoin.com - Home of the <strong>Musician Compatibility Engine</strong>&##8482;
		</small>
		</cfoutput>
	</div>
</div>
</div>
<div class="text300">What is the <em>Musician Compatibility Engine</em> &#8482;?</div>
<div class="text200">
	Glad you asked! The MCE is a tool that allows an artist to find similar (or disimilar) artists based on several weighted comparison algorithms - exclusive to BandJoin.
	<br /><br />
	We give you a definitive compatibility rating based on the information in your profile to find your musical soul mate.
</div>


