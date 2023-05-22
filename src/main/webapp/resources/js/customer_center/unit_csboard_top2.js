jQuery(document).ready(function(){
	var _ = jQuery,
		_qnaBoardWrap = _('.qnaBoardWrap');
	
	_.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
		return null;
	    }
	    else{
		return results[1] || 0;
	    }
	}
	
	_qnaBoardWrap.find('ul li').each(function(){
	    var _this = _(this);
	    if ( _.urlParam('code') == _this.find('a').attr('data-link') ) {
		_(this).find('a').addClass('active');
		_(this).find('span').addClass('active');
	    }
	});
});