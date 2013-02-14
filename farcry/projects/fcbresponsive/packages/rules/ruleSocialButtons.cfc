<cfcomponent displayname="Social Buttons" extends="farcry.core.packages.rules.rules"
	hint="A simple rule for placing social buttons on a page.">

	<cfproperty name="bGooglePlus" type="boolean"
		ftSeq="1" ftFieldset="Buttons" ftLabel="Google Plus"
		ftType="boolean" ftDefault="true">

	<cfproperty name="bTwitter" type="boolean"
		ftSeq="2" ftFieldset="Buttons" ftLabel="Twitter"
		ftType="boolean" ftDefault="true">

	<cfproperty name="bFacebookLike" type="boolean"
		ftSeq="3" ftFieldset="Buttons" ftLabel="Facebook Like"
		ftType="boolean" ftDefault="true"
		ftHint="Select the social buttons you would like to display.">

</cfcomponent>