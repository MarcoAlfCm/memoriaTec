/*
=====================================================
===================== ALERT BOX =====================
=====================================================
|													|
| Version 0.2										|
| Plugin developed by Efren Pacheco					|
| Back-end developeper								|
| contact me at "efren.pacsac@gmail.com"			|
|													|
| Made on January 3rd, 2018							|
|													|
| Description: 										|
|	This is my first plugin, as you can see 		|
| in all code you can find comments that will		|
| help you to understand how the plugin works.		|
|													|
| Resources: 										|
|	To create this plugin i used different 		|
| technologies:										|
| * Font-awesome									|
| * TweenMax from GSAP								|
| and of course										|
| * HTML 											|
| * CSS 											|
| * JQquery											|
|													|
=====================================================
*/

(function() {
	
	// Create a count for create new ids
	var abCount = 0;

	// Create the plugin and its attributes
	$.alertBox = function (options) {
		options = $.extend({
			type: 'default',
			theme: 'dark',
			title: 'Default',
			text:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, ' +
				'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
				'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ' +
				'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit ' +
				'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur ' +
				'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt ' +
				'mollit anim id est laborum.',
			delay: 3000,
			position: 'downRight'
		}, options);

		// Create a correct id for the alert box, and other elements
		abCount++;
		var abID = 'alertBox-id' + abCount;
		var abiID = 'alertBoxConImg-id' + abCount;
		var abtID = 'alertBoxTitle-id' + abCount;
		var abteID = 'alertBoxText-id' + abCount;

		// Timeline for general animations
		var tl = new TimelineMax();

		// Create and instance an empty var to append html code
		var html = '';

		// Create and append only once a father div
		if($('.alertBox-parent').length === 0) {
			html = '<div class="alertBox-parent"></div>';
			$("body").append(html);
		}

		// Find the father div
		var $alertBoxParent = ".alertBox-parent";
		
		// Know if we need an append or prepend
		var appendOrPrepend = undefined;

		// Know if we need an side right or left
		var leftOrRight = undefined;

		// Set position of father div
		switch(options.position) {
			case 'upRight':
				appendOrPrepend = 'up';
				leftOrRight = 'right';

				tl.to($alertBoxParent, 0, { bottom: '' } )
					.to($alertBoxParent, 0, { left: '' } )
					.to($alertBoxParent, 0, { top: '0px' } )
					.to($alertBoxParent, 0, { right: '15px' } );
				break;
			case 'upLeft':
				leftOrRight = 'left';
				appendOrPrepend = 'up';

				tl.to($alertBoxParent, 0, { bottom: '' } )
					.to($alertBoxParent, 0, { right: '' } )
					.to($alertBoxParent, 0, { top: '0px' } )
					.to($alertBoxParent, 0, { left: '15px' } );
				break;
			case 'downLeft':
				leftOrRight = 'left';
				appendOrPrepend = 'down';

				tl.to($alertBoxParent, 0, { top: '' } )
					.to($alertBoxParent, 0, { right: '' } )
					.to($alertBoxParent, 0, { bottom: '15px' } )
					.to($alertBoxParent, 0, { left: '15px' } );
				break;
			case 'downRight':
				leftOrRight = 'right';
				appendOrPrepend = 'down';
				
				tl.to($alertBoxParent, 0, { top: '' } )
					.to($alertBoxParent, 0, { left: '' } )
					.to($alertBoxParent, 0, { bottom: '15px' } )
					.to($alertBoxParent, 0, { right: '15px' } );
				break;
		}

		// Clear the html var to create the alert box
		html = '';

		// Create the body and its elements of alert box
		// Set the correct ids
		html += '<div id="' + abID + '" class="alertBox-container">';
		html += '	<div id="' + abiID + '" class="alertBox-imgContainer">';
		// Set the icon by the type of alert
		switch(options.type) {
			case 'success':
				html += '		<i class="fa fa-check fa-2x alertBox-icon"></i>';
				break;
			case 'error':
				html += '		<i class="fa fa-times fa-2x alertBox-icon"></i>';
				break;
			case 'notification':
				html += '		<i class="fa fa-bell fa-2x alertBox-icon"></i>';
				break;
			case 'warning':
				html += '		<i class="fa fa-exclamation-triangle fa-2x alertBox-icon"></i>';
				break;
			default: 
				html += '		<i class="fa fa-star fa-2x alertBox-icon"></i>';
				break;
		}
		html += '	</div>';
		html += '	<div class="alertBox-content">';
		// Set the title and text for the alert box
		html += '		<span id="' + abtID + '" class="alertBox-title">' + options.title + '</span>';
		html += '		<span id="' + abteID + '" class="alertBox-text">' + options.text + '</span>';
		html += '	</div>';
		html += '</div>';

		// Append or prepend the html's content to alertBox-parent
		if(appendOrPrepend === 'up') 
			$('.alertBox-parent').append(html);
		else 
			$('.alertBox-parent').prepend(html);

		// Find the elements by ID that will change with an style
		var $alertBox = ("#" + abID);
		var $alertBoxContImg = ("#" + abiID);
		var $alertBoxTitle = ("#" + abtID);
		var $alertBoxText = ("#" + abteID);

		// Apply the color from options
		switch(options.type) {
			case 'success':
				tl.to( $alertBoxContImg, 0, { backgroundColor: '#4caf50' } )
					.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #4caf50, #43a047)' } )
					.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 15px 0px rgba(76, 175, 80, 0.75)' })
					.to( $alertBoxTitle, 0, { color: '#4caf50' } )
				break;
			case 'error':
				tl.to( $alertBoxContImg, 0, { backgroundColor: '#f44336' } )
					.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #f44336, #e53935)' } )
					.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 15px 0px rgba(244, 67, 54, 0.75)' })
					.to( $alertBoxTitle, 0, { color: '#f44336' } )
				break;
			case 'notification':
				tl.to( $alertBoxContImg, 0, { backgroundColor: '#03a9f4' } )
					.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #03a9f4, #039be5)' } )
					.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 15px 0px rgba(3, 169, 244, 0.75)' })
					.to( $alertBoxTitle, 0, { color: '#03a9f4' } )
				break;
			case 'warning':
				tl.to( $alertBoxContImg, 0, { backgroundColor: '#ffc107' } )
					.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #ffc107, #ffb300)' } )
					.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 15px 0px rgba(255, 193, 7, 0.75)' })
					.to( $alertBoxTitle, 0, { color: '#ffc107' } )
				break;
			default:
				tl.to( $alertBoxContImg, 0, { backgroundColor: '#607d8b' } )
					.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #607d8b, #546e7a)' } )
					.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 15px 0px rgba(96, 125, 139, 0.75)' })
					.to( $alertBoxTitle, 0, { color: '#607d8b' } )
				break;
		}


		// Select theme
		if(options.theme === 'dark') {
			switch(options.type) {
				case 'success':
					tl.to( $alertBox, 0, { backgroundColor: '#4caf50' } )
						.to( $alertBox, 0, { background: 'linear-gradient(47deg, rgba(39, 149, 45, 1), rgba(52, 238, 51, 0.90))' } )
						.to( $alertBox, 0, { boxShadow: '4px 4px 15px 0px rgba(76, 175, 80, 0.75)' })
						.to( $alertBoxTitle, 0, { color: '#F9F9F9' } )
						.to( $alertBoxText, 0, { color: '#F9F9F9' } )
						.to( $alertBoxContImg, 0, { backgroundColor: '#4F5B64'} )
						.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #4F5B64, #37474f)' } )
						.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 7px 0px rgba(79, 91, 100, 0.75)'} )
					break;
				case 'error':
					tl.to( $alertBox, 0, { backgroundColor: '#f44336' } )			
						.to( $alertBox, 0, { background: 'linear-gradient(47deg, rgba(236, 17, 21, 1) 0%, rgba(250, 58, 46, 0.90) 100%)' } )
						.to( $alertBox, 0, { boxShadow: '4px 4px 15px 0px rgba(244, 67, 54, 0.75)' })
						.to( $alertBoxTitle, 0, { color: '#F9F9F9' } )
						.to( $alertBoxText, 0, { color: '#F9F9F9' } )
						.to( $alertBoxContImg, 0, { backgroundColor: '#4F5B64'} )
						.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #4F5B64, #37474f)' } )
						.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 7px 0px rgba(79, 91, 100, 0.75)'} )
					break;
				case 'notification':
					tl.to( $alertBox, 0, { backgroundColor: '#03a9f4' } )
					.to( $alertBox, 0, { background: 'linear-gradient(47deg, rgba(17, 133, 190, 1), rgba(25, 185, 252, 0.9))' } )
						.to( $alertBox, 0, { boxShadow: '4px 4px 15px 0px rgba(3, 169, 244, 0.75)' })
						.to( $alertBoxTitle, 0, { color: '#F9F9F9' } )
						.to( $alertBoxText, 0, { color: '#F9F9F9' } )
						.to( $alertBoxContImg, 0, { backgroundColor: '#4F5B64'} )
						.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #4F5B64, #37474f)' } )
						.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 7px 0px rgba(79, 91, 100, 0.75)'} )
					break;
				case 'warning':
					tl.to( $alertBox, 0, { backgroundColor: '#ffc107' } )
						.to( $alertBox, 0, { background: 'linear-gradient(47deg, rgba(230, 195, 6, 1), rgba(255, 231, 0, 0.9))' } )
						.to( $alertBox, 0, { boxShadow: '4px 4px 15px 0px rgba(255, 193, 7, 0.75)' })
						.to( $alertBoxTitle, 0, { color: '#F9F9F9' } )
						.to( $alertBoxText, 0, { color: '#F9F9F9' } )
						.to( $alertBoxContImg, 0, { backgroundColor: '#4F5B64'} )
						.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #4F5B64, #37474f)' } )
						.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 7px 0px rgba(79, 91, 100, 0.75)'} )
					break;
				default:
					tl.to( $alertBox, 0, { backgroundColor: '#607d8b' } )
						.to( $alertBox, 0, { background: 'linear-gradient(47deg, rgba(109, 120, 133, 1), rgba(164, 164, 164, 0.9))' } )
						.to( $alertBox, 0, { boxShadow: '4px 4px 15px 0px rgba(96, 125, 139, 0.75)' })
						.to( $alertBoxTitle, 0, { color: '#F9F9F9' } )
						.to( $alertBoxText, 0, { color: '#F9F9F9' } )
						.to( $alertBoxContImg, 0, { backgroundColor: '#4F5B64'} )
						.to( $alertBoxContImg, 0, { background: 'linear-gradient(60deg, #4F5B64, #37474f)' } )
						.to( $alertBoxContImg, 0, { boxShadow: '3px 3px 7px 0px rgba(79, 91, 100, 0.75)'} )
				break;
		}
		} else {
			tl.to( $alertBox, 0, { backgroundColor: '#F9F9F9' } )
				.to( $alertBox, 0, { background: 'linear-gradient(60deg, #F9F9F9, #EBEBEB)' })
				.to( $alertBox, 0, { boxShadow: '4px 4px 15px 0px rgba(249, 249, 249, 0.75)' })
				.to( $alertBox, 0, { color: '#4F5B64' } )
		}

		// Show the alert box
		showAlertBox(abID, leftOrRight);

        // Check if the delay is noot "-1" in that case, it is meaning "infinity"
        if(options.delay > 0) {
            // Hide and remove the alert box
             setTimeout(function() {
                hideAlertBox(abID, leftOrRight);
            }, options.delay);   
        }
		// Finish alert by click
		$($alertBox).click(function () {
			hideAlertBox($(this).attr("id"), leftOrRight);
		});
	};

	// function to show the alert box
	function showAlertBox(abID, side) {
		// find the current alert box
		var $alertBox = ("#" + abID);

		var tl = new TimelineMax();
		// choose side to deploy the alert box
		if(side === 'right') {
			// animate the enter of alert box by right
			tl.from( $alertBox, 1, { x:"+= 100px", ease: Bounce.easeOut } )
			  .from( $alertBox, 1, { opacity: 0 }, "-=1" );
		} else {
			// animate the enter of alert box by left
			tl.from( $alertBox, 1, { x:"-= 100px", ease: Bounce.easeOut } )
			  .from( $alertBox, 1, { opacity: 0 }, "-=1" );
		}

	}

	// function to hide and call other function to remove the alert box
	function hideAlertBox(abID, side) {
		// find the current alert box
		var $alertBox = ("#" + abID);

		var tl = new TimelineMax();
		// choose side to hide the alert box
		if(side === 'right') {
			tl.to( $alertBox, 1, { x:"+= 200px" } )
			  .to( $alertBox, 1, { opacity: 0, onComplete: removeContent, onCompleteParams:[abID] }, "-=1" )
			  .to( $alertBox, 0.8, { height: "0px", marginTop: "0px", onComplete:removeAlertBox, onCompleteParams:[abID] }, "-=0.1" );
		} else {
			tl.to( $alertBox, 1, { x:"-= 200px" } )
			  .to( $alertBox, 1, { opacity: 0, onComplete: removeContent, onCompleteParams:[abID] }, "-=1" )
			  .to( $alertBox, 0.8, { height: "0px", marginTop: "0px", onComplete:removeAlertBox, onCompleteParams:[abID] }, "-=0.1" );
		}
	}

	// Remove all is inside the alert box to create an good effect
	function removeContent(abID) {
		$("#" + abID).find("div").remove();
	}

	// function to remove the alert box
	function removeAlertBox(abID) {
		$("#" + abID).remove();
	}
})();