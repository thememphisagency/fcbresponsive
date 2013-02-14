<cfcomponent displayname="Forms Configuration" hint="Website Forms Configuration" extends="farcry.core.packages.forms.forms" output="false" key="fcbForms">
	<cfproperty ftSeq="1" ftFieldset="" name="enquiryFormBCC" type="String" default="" hint="" ftLabel="BCC" />
	<cfproperty ftSeq="2" ftFieldset="" name="enquiryFormCC" type="String" default="" hint="" ftLabel="CC" />
	<cfproperty ftSeq="3" ftFieldset="" name="enquiryFromEmail" type="String" default="support@enpresiv.com" hint="" ftLabel="From Email" />
	<cfproperty ftSeq="4" ftFieldset="" name="enquiryFromName" type="String" default="Enpresiv Support" hint="" ftLabel="From Name" />
	<cfproperty ftSeq="5" ftFieldset="" name="enquiryRecipient" type="String" default="support@enpresiv.com" hint="" ftLabel="Recipient Email" />
	<cfproperty ftSeq="6" ftFieldset="" name="enquiryReplyTo" type="String" default="enquiryReplyTo" hint="" ftLabel="Reply To" />
	<cfproperty ftSeq="7" ftFieldset="" name="enquirySubject" type="String" default="An enquiry from your website" hint="" ftLabel="Subject" />
	<cfproperty ftSeq="8" ftFieldset="" name="enquiryThankyou" type="String" default="Thankyou for your enquiry. We will endeavour to respond as soon as possible." hint="" ftLabel="Thankyou Message" />
	<cfproperty ftSeq="9" ftFieldset="" name="enquirySubmitName" type="String" default="Submit Enquiry" hint="" ftLabel="Submit Button Name" />
	<cfproperty ftSeq="10" ftFieldset="" name="developerEmail" type="String" default="" hint="" ftLabel="Developer Email Address" />
</cfcomponent>