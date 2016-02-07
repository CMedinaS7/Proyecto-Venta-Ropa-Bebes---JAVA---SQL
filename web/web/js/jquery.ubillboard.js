(function($){
	$.fn.uBillboard = function(options) {
		var defaults = {
			speed: 600, 						// animation duration (in miliseconds)
			delay: 3000,						// delay between animations (in miliseconds)
			width: '940px',						// container width
			height: '376px',					// container height
			effect: 'cycle',					// Transition effect: cycle | random | horizontal | vertical | async
			square_resolution: 94,				// resolution of one transition square in pixels
			description_opacity: 0.6,			// Opacity of the description box
			loader_image: 'images/loading.gif'	// loader image URL
		};
		
		var options = $.extend(defaults, options);
		
		// jQuery billboard element
		var billboard;
		// jQuery description element
		var description;
		// array of all squares
		var squares = [];
		/* 
		 * array of all images, contains object with properties:
		 *	- src: image URL
		 *	- el: the image element
		 *	- url: link URL
		 *	- alt: image description
		 */
		var images = [];
		// JS setInterval() object  
		var interval;
		// current image index in the images array
		var cur_img = 0;
		// next image index in the images array
		var nxt_img = 1;
		// current effect (used when cycling trough effects)
		var cur_eff = 1;
		// tracks total images, used for reliable preload
		var total_images;
		// tracks loaded images
		var total_images_loaded = 0;
		// column count
		var cols = Math.ceil(parseInt(options.width)  / options.square_resolution);
		// row count
		var rows = Math.ceil(parseInt(options.height) / options.square_resolution);
		
		// debug function that does not throw errors :)
		var d = function(v){ try { console.log(v); } catch(e) {} }
		
		// circumvent context changes with setTimeout()
		var timer = function(i, billboard, speed, delay){
			function timed(){
				jQuery('.square'+i, billboard).stop().animate({'opacity': 1}, speed);
			}
			
			setTimeout(timed, delay);
		}
		
		// horizontal animation function
		function animFunc1(rows, cols){
			var n = rows*cols;
			for(i = 0; i < n; i++){
				timer(i, billboard, options.speed, Math.round(Math.random() * options.speed));
			}
		}
		
		// vertical animation function
		function animFunc2(rows, cols){
			var n = rows*cols;
			for(i = 0; i < n; i++){
				timer(i, billboard, options.speed, i * 70);
			}
		}
		
		// asynchronous animation function
		function animFunc3(rows, cols){
			var n = 0;
			for(i = 0; i < cols; i++){
				for(j = 0; j < rows; j++){
					timer(j*cols + i, billboard, options.speed, n * 70);
					n++;
				}
			}
		}
		
		// this is animFuncX wrapper, introdced to eliminate need for evals (breaks code when compressed)
		function animFunc(type, rows, cols){
			switch(type){
				case 1: animFunc1(rows, cols); break;
				case 2: animFunc2(rows, cols); break;
				case 3: animFunc3(rows, cols); break;
			}
		}

		/*
		 *	Main animation function, this is called in intervals to set up
		 *	and perform animations. It also makes sure that we don't animate
		 *	until the images are fully loaded
		 */
		var animate = function(rows, cols){
			// move current image to background
			billboard.css({
				'background-image': 'url('+images[cur_img].src+')',
				'background-position': '0px 0px'
			});
			
			// set next image as bg to all the animation divs, and set their opacity to 0
			$('div', billboard).css({
				'background-image': 'url('+images[nxt_img].src+')',
				'opacity': '0'
			});
			
			// run the effect function
			switch(options.effect){
				case 'async':
					animFunc1(rows, cols);
					break;
				case 'horizontal':
					animFunc2(rows, cols);
					break;
				case 'vertical':
					animFunc3(rows, cols);
					break;
				case 'random':
					var eff = Math.round(Math.random()*2+1);
					animFunc(eff, rows, cols);
					break;
				case 'cycle':
				default:
					animFunc(cur_eff, rows, cols);	 
			}
			
			// cycle animation effect pointer for next animation (only when in cycle mode)
			if(cur_eff == 3) cur_eff = 1; else cur_eff++; // loop effect pointer
			if(images.length - 1 == cur_img) cur_img = 0; else cur_img++; // loop current image pointer
			if(images.length - 1 == nxt_img) nxt_img = 0; else nxt_img++; // loop next image pointer
				
			// make billboard clickable with the right URL
			$(billboard).unbind('click').click(function(){
				window.location = images[cur_img].url;
			});
			
			// animate description
			$(description).animate({top: options.height}, {duration: 300, complete: function(){
				if(images[cur_img].alt == '') return;
				$(this).text(images[cur_img].alt);
				$(description).animate({top: parseInt(options.height) - 43 + 'px'}, {duration: 300});
			}});
		};
	
		/*
		 *	Main plugin function, takes care of the inital setup needed for animations
		 *	to occur. 
		 */
		return this.each(function() {
			billboard = $(this);
			// no images to switch between, returning
			total_images = $('img', billboard).length;
			if(total_images < 2){
				return;
			}
			
			// set up billboard css
			billboard.css({
				'background-image': 'url('+options.loader_image+')',
				'background-position': 'center center',
				'background-repeat': 'no-repeat',
				width: options.width,
				height: options.height,
				overflow: 'hidden',
				margin: 'auto',
				position: 'relative',
				cursor: 'pointer'
			});
			
			// parse images within the billboard, add their sources to an array and remove them
			$('img', billboard).each(function(i, el){
				var url = '#';
				if($(el).parent().is('a')) url = $(el).parent().attr('href');
				var src = $(this).attr('src');
				images.push({
					src: src,
					el: this,
					url: url,
					alt: $(this).attr('alt')
				});
				$(this).detach();
				// preload image
				$('<img>').load(function(){
					++total_images_loaded;
					if(total_images == total_images_loaded) {
						interval = setInterval(function(){
							animate(rows, cols);
						}, options.delay + options.speed);
					}
				}).attr('src', src);
			});
			
			// create span for description
			description = $('<span class="description">' + images[0].alt + '</span>');
			description.css({
				display: 'block',
				opacity: options.description_opacity,
				position: 'absolute',
				zIndex: 1000,
				height: '17px',
				width: parseInt(options.width) - 20 + 'px',
				color: 'white',
				textAlign: 'center',
				padding: '13px 20px',
				background: 'black',
				top: options.height
			});
			billboard.append(description);
			
			// create divs for animation
			var n = 0;
			for(y = 0; y < rows; y++){
				for(x = 0; x < cols; x++){
					var current = document.createElement('div');
					current.style.backgroundPosition = -x*options.square_resolution+'px '+(-y*options.square_resolution)+'px';
					current.style.left = x*options.square_resolution+'px';
					current.style.top = y*options.square_resolution+'px';
					$(current).addClass('square'+n);
					billboard.append(current);
					squares.push(current.id);
					n++;
				}
			}
			
			// set up css for all child divs (individual squares)
			$('div', billboard).css({
				'background-repeat': 'no-repeat',
				'opacity': '0',
				'width': options.square_resolution+'px',
				'height': options.square_resolution+'px',
				'position': 'absolute',
				'z-index': 1
			});
			
			if(images[0].alt != ''){
				$(this).text();
				$(description).animate({top: parseInt(options.height) - 43 + 'px'}, {duration: 300});
			}
		});
	};
})(jQuery);