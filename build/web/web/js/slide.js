/*
*Autor: Pablo David Romero
*E-mail: pdavid.romero@concatel.com; pablo.romeropablo@gmail.com; pablo@13deseptiembre.com.ar
*Empresa: 
*Description: 
*/

jQuery.fn.simpleSlide = function(a){

	a				= a || {};
	a.duration		= a.duration || 6000;
	a.transition	= a.transition || 2500;
	var	c	= jQuery(this);
	jQuery(c).css("position","relative");

	jQuery("li",jQuery(c))
		.css({
			'position'	: 'absolute',
			'top'		: '0px',
			'left'		: '0px',
			'z-index'	: '8'
			})
		.find(":first")
			.addClass("slide-active")
			.css('z-index','10');

	setInterval(function(){

			var $active = jQuery("li.slide-active",jQuery(c));

			if($active.length == 0) $active = jQuery("li:last",jQuery(c));

			var $next	= $active.next().length ? $active.next() : jQuery("li:first",jQuery(c));

			$active
				.addClass("slide-last-active")
				.css('z-index','9');

			$next
				.css({opacity: 0.0})
				.addClass("slide-active")
				.css('z-index','10')
				.animate({opacity: 1.0}, a.transition, function(){
					$active
						.removeClass('slide-active slide-last-active')
						.css('z-index','8');
				});
		}, a.duration);

}