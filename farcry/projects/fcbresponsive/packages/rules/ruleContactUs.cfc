<cfcomponent displayname="Contact Us (Footer)" extends="farcry.core.packages.rules.rules"
	hint="A rule for adding Contact Us Footer in a way that works Responsively.">

<cfproperty ftSeq="1" ftFieldSet="Heading" name="heading" type="uuid" ftJoin="dmLink,dmNews,dmHTML,dmNavigation" hint="Heading link. In mobile view this is all that is shown" ftLabel="Heading" />
<cfproperty ftSeq="2" ftFieldSet="Contact Details" name="phone" type="string" ftLabel="Phone" />
<cfproperty ftSeq="3" ftFieldSet="Contact Details" name="fax" type="string" ftLabel="Fax" />
<cfproperty ftSeq="4" ftFieldSet="Contact Details" name="email" type="string" ftLabel="Email" />
<cfproperty ftSeq="5" ftFieldSet="Contact Details" name="address" type="string" ftLabel="Address" />
<cfproperty ftSeq="6" ftFieldSet="Contact Details" name="address2" type="string" ftLabel="Address 2" />



</cfcomponent>