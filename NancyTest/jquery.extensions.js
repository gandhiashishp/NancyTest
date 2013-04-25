
/*
Fills drop down list from the specified JSON response.

***********
Parameters 
***********
dropDownId : Dropdown list Id
dataValue  : Property Name whose value to be set as a value of dropdown list's options.
dataText   : Property Name whose text to be set as a text of dropdown list's options.
jsonData   : JSON data to be used to bind drop down list.	

*/
function FillDropDown(dropDownId, dataValue, dataText, jsonData) {

	$('#' + dropDownId).empty(); // empty the dropdown (if necessarry)

	$.each(jsonData, function (index, item) {
		var valField;
		var txtField;

		$.each(item, function (name, value) {

			if (name.toString().toLowerCase() == dataValue.toString().toLowerCase()) {
				valField = value;
			}
			if (name.toString().toLowerCase() == dataText.toString().toLowerCase()) {
				txtField = value;
			}
		});

		$('#' + dropDownId).append('<option value="' + valField + '">' + txtField + '</option>');
	});
}