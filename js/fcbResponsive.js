$(document).ready(function() {
  $('body').addClass('js');
  var $menu = $('#menu'),
    $menulink = $('.toggleMenu');
  
$menulink.click(function() {
	console.log('what');
  $menulink.toggleClass('active');
  $menu.toggleClass('active');
  return false;
});});