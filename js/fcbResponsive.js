/*jslint browser: true*/
/*global $, jQuery, Modernizr, FastClick, enquire */

/* 
Use the comment-based directives to compress and minify all js files into one 
*/

// @depends lib/respond.min.js
// @depends lib/jquery-1.8.3.min.js
// @depends lib/enquire.min.js
// @depends lib/appendAround.js
// @depends lib/fastclick.js
// @depends lib/galleria/galleria-1.2.9.min.js
// @depends lib/jquery.validate.min.js
// @depends lib/jquery.fitvids.min.js
// @depends lib/jquery.foundation.forms.js

$(document).ready(function () {
	$(".append-around").appendAround();

	$('body').addClass('js');

	var $menu = $('#menu'),
		$menulink = $('#menu-link'),
		$menuTrigger = $('.parent > a');

	$menulink.click(function(e) {		
		e.preventDefault();
		$menulink.toggleClass('active');
		$menu.toggleClass('active');
		
	});
	
	// This is setup to only show top level nav in mobile menu. 
	// Script below will need more work	(e.preventdefault() stops the nav click event allowing sub menu to show)
	$menuTrigger.click(function(e) {
		//e.preventDefault();
		var $this = $(this);
		//$this.toggleClass('active').next('ul').toggleClass('active');
		//$this.toggleClass('active').next('ul').toggleClass('active');
	});

	jQuery(".toTop").click(function(event){		
		event.preventDefault();	
		$('html,body').animate({scrollTop:0}, 500);	
	});

	// Hide address bar on mobile devices (except if #hash present, so we don't mess up deep linking).
	if ( Modernizr.touch && !window.location.hash ) {
		$(window).load(function () {
		  setTimeout(function () {
		    // At load, if user hasn't scrolled more than 20px or so...
				if( $(window).scrollTop() < 20 ) {
		      window.scrollTo(0, 1);
		    }
		  }, 0);
		});
	}

	//Add the fast click events if touch is enabled
	if( Modernizr.touch ) {
		// Instantiate FastClick
		window.addEventListener('load', function() {
		    var ft = new FastClick(document.body);
		}, false); 
	}


	/******************************************** 
		- All functionality that requires responsive     
		Should be included here
	*********************************************/	
	enquire.register("screen and (min-width:320px) and (max-width:991px)", {
		match: function() {			
			$('.toggleBtn.search').on("click", function(e){
				e.preventDefault();
				
				var sForm = $('.header-search-form');
				var sInput = $('.header-search-form .search');

				sForm.toggleClass('active');

				if(sForm.hasClass('active')) 
					sInput.focus();
			});
		},

		unmatch: function() {
			$('.toggleBtn.search').off('click');
		}
	})	   
	.listen();

	enquire.register("screen and (min-width:800px)", {
		match: function() {			
			$('.toggleBtn.search').on("click", function(e){
				e.preventDefault();
				
				var sForm = $('.header-search-form');
				sForm.submit();
			});
		},

		unmatch: function() {
			$('.toggleBtn.search').on("click", function(e){
				e.preventDefault();
				
				var sForm = $('.header-search-form');
				var sInput = $('.header-search-form .search');

				sForm.toggleClass('active');

				if(sForm.hasClass('active')) 
					sInput.focus();
			});
			
		}
	})	   
	.listen();


	// Contact Form validation
	var contactForm = $('.form-contact-us').validate({
		rules: {
			firstName: "required",
			lastName: "required",
			email: {"required": true, email: true},
			comment: "required",
			phone: {"required": true, number: true}
		},
		messages: {
			firstName : 'Pleaser enter your first name.',
			lastName : 'Pleaser enter your First name.',
			email : 'Please enter a valid email address',
			comment: 'Please enter a comment',
			phone : 'Please enter your phone number in digits with no spaces between them.'
		},		
        errorElement: "small"		
	});

	// Reset contact us form on click 
	$('.form-contact-us .button-reset').on("click", function(e){
		e.preventDefault();
		contactForm.resetForm();
	});

	// Enable fit vids to
	$('.wrapper').fitVids();

	// Allow all close buttons to close the parent
	$('.close').on("click", function(){
		$(this).parent().remove();	
	});
});