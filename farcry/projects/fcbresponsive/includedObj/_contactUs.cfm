<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Enquiry Form --->

<cfparam name="form.firstName" default="" />
<cfparam name="form.LastName" default="" />
<cfparam name="form.email" default="" />
<cfparam name="form.comment" default="" />
<cfparam name="form.phone" default="" />

<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/utils" prefix="utils" />

<cfset bShowForm = 1 />
<cfset recipient=#application.config.fcbforms.enquiryRecipient# />
<cfset from="#recipient#" />
<cfset subject=#application.config.fcbforms.enquirySubject# />
<cfset sNotice = "" />
<cfset noticeType = "" />
<cfset errors = structNew() />

<cfif isDefined("form.submitForm")>

	<cfif len(form.firstName) IS 0>
		<cfset structInsert(errors,'firstName','Pleaser enter your name.') />
	</cfif>
	<cfif len(form.lastName) IS 0>
		<cfset structInsert(errors,'lastName','Pleaser enter your name.') />
	</cfif>		
	<cfif len(form.email) IS 0 OR (len(form.email) GT 0 AND NOT isValid('email',form.email))>
		<cfset structInsert(errors,'email','Please enter a valid email address') />
	</cfif>	
	<cfif len(form.comment) IS 0>
		<cfset structInsert(errors,'comment','Please enter a comment') />
	</cfif>		
	<cfif len(form.phone) IS 0 OR (len(form.phone) GT 0 AND NOT isNumeric(form.phone))>
		<cfset structInsert(errors,'phone', 'Please enter your phone number in digits with no spaces between them.') />
	</cfif>

	<cfif structIsEmpty(errors)>

		<!--- Build email content --->
		<cfsavecontent variable="mailContent">
			<cfoutput>
			The Online Enquiries form on the #application.config.general.sitetitle# website was submitted at #timeFormat(now(), "short")# on #dateFormat(now(), "full")#.

		    Details of their enquiry are as follows:

		    NAME:  #form.firstName# #form.lastName#
		    PHONE: #form.phone#
		    EMAIL: #form.email#

		    ENQUIRY:

		    #form.comment#

		    IP Address: #cgi.remote_addr#
		    Hostname: #cgi.remote_host#
		    Browser: #cgi.http_user_agent#
			</cfoutput>
		</cfsavecontent>

		<utils:mail 
				from="#recipient#" 
				to="#application.config.fcbForms.enquiryRecipient#" 
				subject="#subject#"
				mailContent="#mailContent#" 
				type="text" />

		<cfset sNotice = application.config.fcbForms.enquiryThankyou />

		<!--- Reset all form variables --->
		<cfset form.firstName = "" />
		<cfset form.lastName = "" />
		<cfset form.phone = "" />
		<cfset form.email = "" />
		<cfset form.comment = "" />
	</cfif>
</cfif>	

<cfset qProducts = QueryNew("objectName") />
<cfif structKeyExists(application.navid,"our-products")>
	<cfset qProducts = application.factory.oTree.getChildren(objectid=application.navid['our-products']) />
</cfif>

<cfoutput>
<div id="contactForm">
</cfoutput>

<!--- Begin out of form--->

<cfsavecontent variable="sURL"><ui:buildLink objectid="#request.navid#" urlOnly="1" /></cfsavecontent>

<cfif trim(sURL) EQ '/'>
	<!--- the request navid is pointing to home page, that mean this from in on a dynamic type page, let's use the objectid from URL --->
	<cfsavecontent variable="sURL"><ui:buildLink objectid="#url.objectid#" urlOnly="1" /></cfsavecontent>
</cfif>

<cfoutput>

	<p class="intro">Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio. </p>
	<cfif len(sNotice) GT 0>
			<div class="alert alert-success">#sNotice#</div>
	</cfif>

	<form id="mainContactForm" name="contactForm" class="form-contact-us" method="post" action="#sURL###contactForm">
					
		<fieldset title="Contact Details" class="contact-details">
			<span class="required-notify"><span class="required">*</span> Required Fields</span>
			<div class="row">
				<div class="column six">	
					<label for="firstName">First Name <span class="required">*</span></label>	
					<input class="text" type="text" name="firstName" id="firstName" value="#form.firstName#" placeholder="Enter your first name..." />
					<cfif structKeyExists(errors,'firstName')>
						<small class="error">#errors.firstName#</small>
					</cfif>
				</div>
				<div class="column six">	
					<label for="lastName">Last Name <span class="required">*</span></label>
					<input class="text" type="text" name="lastName" id="lastName" value="#form.lastName#" placeholder="Enter your last name..." />
					<cfif structKeyExists(errors,'lastName')>
						<small class="error">#errors.lastName#</small>
					</cfif>
				</div>
			</div>

			<div class="row">
				<div class="column six">
					<label for="phone">Phone Number <span class="required">*</span></label>
					<input class="text" type="text" name="phone" id="phone" value="#form.phone#" placeholder="numbers only, no spaces..." />
					<cfif structKeyExists(errors,'phone')>
						<small class="error">#errors.phone#</small>
					</cfif>
				</div>
				<div class="column six">		
					<label for="email">Email Address <span class="required">*</span></label>
					<input class="text" type="text" name="email" id="email" value="#form.email#" placeholder="enter a valid email address..." />
					<cfif structKeyExists(errors,'email')>
						<small class="error">#errors.email#</small>
					</cfif>
				</div>
			</div>

			<div class="row">
				<div class="column six">
					<label for="typeofEnquiry">Type of Enquiry</label>
					<select name="typeofEnquiry" id="typeofEnquiry">
						<option value="">Please select one</option>
						<option value="general">General Enquiry</option>
						<option value="option2">Option 2</option>
						<option value="option3">Option 3</option>
					</select>
				</div>
				<div class="column six">		
					<label>Preferred Method of Contact</label>
					<label class="label-radio"><input type="radio" name="contact_type" value="phone" checked="checked"><span class="custom radio checked"></span> Phone</label>
					<label class="label-radio"><input type="radio" name="contact_type" value="Email"><span class="custom radio"></span> Email</label>
				</div>
			</div>
			
			<label for="comment">Your Message <span class="required">*</span></label>
			<textarea class="text" name="comment"  id="comment" placeholder="Enter your message here...">#form.comment#</textarea>
			<cfif structKeyExists(errors,'comment')>
				<small class="error">#errors.comment#</small>
			</cfif>

			<div class="row">
				<div class="column eight">
					<label class="info"><input type="checkbox" checked="checked" name="recieveUpdate" value="true" /> Yes, I would like to receive news and updates from FCB.</label>
				</div>
				<div class="column four rtl">
					<a href="##" class="button button-submit">Submit Enquiry<i class="icon-right-circled"></i></a>
					<input type="submit" class="button button-with-icon" name="submitForm" value="Submit Enquiry" style="display:none" />
				</div>
			</div>

			<input type="hidden" name="submitForm" />
		</fieldset>
	</form>
</cfoutput>


<cfoutput>
</div><!-- ##contactForm  -->
</cfoutput>

<cfsetting enablecfoutputonly="false">