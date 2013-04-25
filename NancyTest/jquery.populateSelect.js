/*

Plugin Name :	jquery.populateDropdown.js

Author		:	Ashish Gandhi (gandhi.ashish@hotmail.com)

Usage		:	To fill the Drop down list based on a JSON response.

Example		:

				function successCallback(result, status, xhr) 
				{
					var options =
					{ 
						dataValue: 'c_unqid',
						dataText: 'Name'
					};
					$('#cboMembers').populateDropdown(result,options);
				}

*/

$.fn.populateSelect = function (jsonData, options) {

	// ------------------------------------------------------------------------------------------
	// options & setup
	// ------------------------------------------------------------------------------------------

	// exit if no data object supplied
	if (jsonData === undefined) {
		return this;
	};

	// options
	var options = $.extend
			(
				{
					dataValue: '',
					dataText:''
				},
				options
			);

	// ------------------------------------------------------------------------------------------


	// ------------------------------------------------------------------------------------------
	// main process function
	// ------------------------------------------------------------------------------------------
		populateSelect(this, jsonData);
	// ------------------------------------------------------------------------------------------



	function populateSelect(dropDown, jsonData) {

		$(dropDown).empty(); // empty the dropdown (if necessarry)

		$.each(jsonData, function (index, item) {
			var valField;
			var txtField;

			$.each(item, function (name, value) {

				if (name.toString().toLowerCase() == options.dataValue.toString().toLowerCase()) {
					valField = value;
				}
				if (name.toString().toLowerCase() == options.dataText.toString().toLowerCase()) {
					txtField = value;
				}
			});

			$(dropDown).append('<option value="' + valField + '">' + txtField + '</option>');
		});
	}

 
	return this;
};



