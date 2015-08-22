jQuery(document).ready( function(){

  $('#brand').removeClass('hidden');
  $('#brand').addClass('animated zoomInDown');

  $('#heading').removeClass('hidden');
  $('#heading').addClass('animated fadeIn');

  $('#button').removeClass('hidden');
  $('#button').addClass('animated slideInRight');

  $('#main-nav, #social-media').removeClass('hidden');
  $('#main-nav, #social-media').addClass('animated fadeIn');

  $('#scroll-indicator').removeClass('hidden');
  $('#scroll-indicator').addClass('animated bounce');
});

$(window).scroll(function(e){
  parallax();
});

function parallax(){
  var scrolled = $(window).scrollTop();
  $('.landing').css('top',-(scrolled*0.0315)+'rem');
  $('.landing .column').css('top',-(scrolled*-0.005)+'rem');
  $('.landing .column,#scroll-indicator').css('opacity',1-(scrolled*.00175));
  $('#scroll-indicator').css('opacity',1-(scrolled*.005));
};


$(document).ready(function() {
  $('body').addClass('js');
  var $menu = $('.sidebar'),
    $menulink = $('.menu-toggle');

$menulink.click(function() {
  $menulink.toggleClass('active');
  $menu.toggleClass('active');
  $('#page-content-wrapper').toggleClass('active');
  $('#social-media').toggleClass('active');


  return false;
});});
