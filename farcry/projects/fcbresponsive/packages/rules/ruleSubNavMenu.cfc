<cfcomponent displayname="Sub Navigation Menu" extends="farcry.core.packages.rules.rules"
	hint="A rule for adding a Sub Navigation Menu from a given starting point.">

<cfproperty 
  ftseq="2" ftfieldset="Navigation"
  name="startNavigation" type="string"
  hint="Link to a navigation folder within the site." required="no" default=""
  fttype="navigation" ftalias="home" ftrendertype="tree"
  ftSelectMultiple="false" ftlabel="Navigation Folder" />

</cfcomponent>