jQuery(window).scroll(function(){
var ftTop = jQuery("#footer").position().top;
var winTop = jQuery(window).scrollTop();
var fthide = ftTop - 900

if(winTop >= fthide){
jQuery('#asideCate').hide();
}else{
jQuery('#asideCate').show();
}
});