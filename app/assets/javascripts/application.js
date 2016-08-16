// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require materialize-sprockets
//= require_tree .

var boxy = function() {
  $('select').material_select();
};

$(document).ready(boxy);
$(document).on("turbolinks:load", boxy)

var range = document.getElementById('range');

noUiSlider.create(range, {
	start: [ 1, 5 ], // Handle start position
	step: 1, // Slider moves in increments of '10'
	margin: 1, // Handles must be more than '20' apart
	connect: true, // Display a colored bar between the handles
	direction: 'rtl', // Put '0' at the bottom of the slider
	orientation: 'horizontal', // Orient the slider vertically
	behaviour: 'tap-drag', // Move handle on tap, bar is draggable
	range: { // Slider can select '0' to '100'
		'min': 0,
		'max': 5
	},
	pips: { // Show a scale with the slider
		mode: 'steps',
		density: 2
	}
});
