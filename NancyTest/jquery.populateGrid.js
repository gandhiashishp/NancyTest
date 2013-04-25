/*

Plugin Name :	jquery.populateGrid.js

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

$.fn.populateGrid = function (jsonData, options) {

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
					itemTemplate: ''
				},
				options
			);

	// ------------------------------------------------------------------------------------------


	// ------------------------------------------------------------------------------------------
	// main process function
	// ------------------------------------------------------------------------------------------
	populateGrid(this, jsonData);
	// ------------------------------------------------------------------------------------------



	function populateGrid(table, jsonData) {
		var headerRow;
		var itemTemplateRow;

		headerRow = $(table).find("thead tr:first");

		if (options.itemTemplate == '') {
			itemTemplateRow = $(table).find("tbody tr:first");
			options.itemTemplate = '<tr>' + $(itemTemplateRow).html() + '</tr>';
			$(itemTemplateRow).hide();
		}

		//Remove all rows from the <tbody> except first row. Because first row is an
		//item template.
		$.each($(table).find("tbody tr:not(:first)"), function () {
			$(this).remove();
		});


		$.each(jsonData, function (index, item) {
			var rowTemplate;
			rowTemplate = options.itemTemplate.toString().toLowerCase();

			$.each(item, function (name, value) {
				rowTemplate = rowTemplate.toString().toLowerCase().replace(new RegExp('@' + name.toString().toLowerCase(), 'g'), value);
			});

			$(table).append(rowTemplate.toString());
		});
	}


	return this;
};



