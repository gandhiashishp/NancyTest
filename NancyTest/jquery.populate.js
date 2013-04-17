/*

Plugin Name :	jquery.populate.js

Author		:	Ashish Gandhi (gandhi.ashish@hotmail.com)

Usage		:	To fill the controls based on a JSON string.

Example		:

				function GetJsonResponse(e) {
					$.getJSON('/handler/name', function (data) {
						$('#divDtl').populate(data);
					});
				}

Remark		: In order to make this plugin work, a page should contain a controls whose name attribute should
			  match with the JSON response's property names.	
*/

$.fn.populate = function (obj, options) {

	// ------------------------------------------------------------------------------------------
	// options & setup
	// ------------------------------------------------------------------------------------------

	// exit if no data object supplied
	if (obj === undefined) {
		return this;
	};

	// options
	var options = $.extend
			(
				{
					/*
					phpNaming: true,
					phpIndices: false,
					resetForm: true,
					identifier: 'id',
					debug: false
					*/
				},
				options
			);

	if (options.phpIndices) {
		options.phpNaming = true;
	}

	// ------------------------------------------------------------------------------------------


	// ------------------------------------------------------------------------------------------
	// main process function
	// ------------------------------------------------------------------------------------------
	populateForm(this, JSON.stringify(obj));
	// ------------------------------------------------------------------------------------------

	function populateForm(form, jsonData) {
		var result = $.parseJSON(jsonData);

		$.each(result, function (name, value) {

			// grab the element
			var element = $('[name="' + name + '"]');

			if ($(element).length > 0) {
				$.each($(element), function () {
					fillElement($(this), value);
				});
			}
			else {
				fillElement($(this), value);
			}
		});
	}


	function fillElement(element, value) {
		if (value != null) {

			// anything else, process
			switch ($(element).prop('type') || $(element).prop('tagName')) {

				case 'radio':
					// use the single value to check the radio button
					//element.checked = (element.value != '' && value.toString() == element.value);
					//$(element).length
					var blnChecked = ($(element).val() != '' && value.toString() == $(element).val());
					if (blnChecked) { $(element).attr('checked', 'checked'); }

				case 'checkbox':
					// depends on the value.
					// if it's an array, perform a sub loop
					// if it's a value, just do the check

					var values = value.constructor == Array ? value : [value];
					for (var j = 0; j < values.length; j++) {
						var blnChecked = ($(element).val() != '' && values[j].toString().toLowerCase() == $(element).val().toLowerCase());
						if (blnChecked) { $(element).attr('checked', 'checked'); }
					}


					break;

				case 'select-multiple':

					var values = value.constructor == Array ? value : [value];
					var options = $(element).find('option');

					$.each($(options), function () {
						for (var j = 0; j < values.length; j++) {
							var blnSelected = $(this).val().toLowerCase() == values[j].toString().toLowerCase();
							if (blnSelected) { $(this).attr('selected', 'selected'); }
						}
					});

					break;

				case 'select':
				case 'select-one':
					$(element).val(element.value = value.toString() || value);
					break;

				case 'text':
				case 'button':
				case 'textarea':
				case 'submit':
				default:
					value = value == null ? '' : value;
					$(element).val(value);
			}
		}
	}

	return this;
};


