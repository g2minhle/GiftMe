'use strict';

/* Controllers */

angular.module('myApp.controllers', []).controller('MyCtrl1',
		[ '$scope', function($scope) {
			$(document).ready(function() {
				$('#fullpage').fullpage({
					sectionsColor: ['#42bd41', '#42bd41'],
					navigation: true,
					autoScrolling: true,
					animateAnchor: true,
				});
			});
		} ]).controller('MyCtrl2', [ '$scope', function($scope) {

} ]);
