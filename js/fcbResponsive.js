/* 
	Use the comment-based directives to compress and minify all js files into one 
*/

// @depends lib/jquery-1.8.3.min.js
// @depends lib/enquire.min.js
// @depends lib/appendAround.js


$(document).ready(function() {	
	/* 
		All functionality that requires responsive     
		Should be included here
	*/	
	enquire.register("screen and (min-width:320px) and (max-width:991px)", {
		match: function() {
			$('.toggleSearch').on("click", function(){
				$('.header-search-form').toggleClass('active');
			});
		},

		unmatch: function() {
			$('.toggleSearch').off("click");
		}
	})
	.register("screen and (min-width:992px)",{
		match: function() {
			//Turn the searchToggle button into a search submit
		},

		unmatch: function() {
		}
	})
	.listen();

	$(".sponsors").appendAround();

  	var $menu = $('#menu'),
    $menulink = $('.toggleMenu');
	$menulink.click(function() {
		
		$menulink.toggleClass('active');
		$menu.toggleClass('active');
		return false;
	});

	// Hide address bar on mobile devices (except if #hash present, so we don't mess up deep linking).
	if (Modernizr.touch && !window.location.hash) {
		$(window).load(function () {
		  setTimeout(function () {
		    // At load, if user hasn't scrolled more than 20px or so...
					if( $(window).scrollTop() < 20 ) {
		      window.scrollTo(0, 1);
		    }
		  }, 0);
		});
	}
});