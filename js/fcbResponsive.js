/* 
	Use the comment-based directives to compress and minify all js files into one 
*/

// @depends lib/respond.min.js
// @depends lib/jquery-1.8.3.min.js
// @depends lib/enquire.min.js
// @depends lib/appendAround.js
// @depends lib/fastclick.js


$(document).ready(function() {	
	$(".sponsors").appendAround();

  	var $menu = $('#menu'),
    $menulink = $('.toggleBtn.menu');
	$menulink.click(function() {
		
		$menulink.toggleClass('active');
		$menu.toggleClass('active');
		return false;
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
		    new FastClick(document.body);
		}, false); 
	}


	/******************************************** 
		- All functionality that requires responsive     
		Should be included here
	*********************************************/	
	enquire.register("screen and (min-width:320px) and (max-width:991px)", {
		match: function() {
			$('.toggleBtn.search').on("click", function(){
				$('.header-search-form').toggleClass('active');
			});
		},

		unmatch: function() {
			$('.toggleBtn.search').off("click");
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

});