$(document).ready(function() {
	$('body').addClass('js');
  	var $menu = $('#menu'),
    $menulink = $('.toggleMenu');
	$menulink.click(function() {
		
		$menulink.toggleClass('active');
		$menu.toggleClass('active');
		return false;
	});

  	$.fn.appendAround = function(){
	    return this.each(function(){

		    var $self = $( this ),
		        att = "data-set",
		        $set = $( "["+ att +"='"+ $self.closest( "["+ att +"]" ).attr( att ) + "']" );
		     
		    function appendToVisibleContainer(){
		        if( $self.is( ":hidden" ) ){
		          $self.appendTo( $set.filter( ":visible:eq(0)" ) );
		        }
		    }
		      
		    appendToVisibleContainer();
		      
		    $(window).resize( appendToVisibleContainer );
		      
	    });
  	};
  	$(".sponsors").appendAround();
});

