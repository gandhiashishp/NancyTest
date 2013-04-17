<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="NancyTest.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
	<script type="text/javascript" src="jquery.populate.js"></script>
	<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script>
	<title></title>
	<script type="text/javascript">

		function GetMembre(e) 
		{
			$.getJSON('/handler/name', function (data) {
				//JSON.stringify(data);
				$('#divDtl').populate(data);

				//populateForm($('#form1'),JSON.stringify(data));
			});

			$.getJSON('/handler/account', function (data) {
				$('#divDtl').populate(data);
			});
		}


		// prepare the form when the DOM is ready
		$(document).ready(function () 
		{
			var options = {
				//target: '#output2',   // target element(s) to be updated with server response 
				success: showResponse,  // post-submit callback 
				//beforeSubmit: showRequest,  // pre-submit callback 

				//other available options: 
				url: '/handler/name',         // override for form's 'action' attribute 
				type: 'post',        // 'get' or 'post', override for form's 'method' attribute 
				//dataType:  null        // 'xml', 'script', or 'json' (expected server response type) 
				clearForm: true        // clear all form fields after successful submit 
				//resetForm: true        // reset the form after successful submit 

				// $.ajax options can be used here too, for example: 
				//timeout:   3000 
			};

			$('#form1').ajaxForm(options);
		});

		//Post-submit callback 
		function showResponse(responseText, statusText, xhr, $form) 
		{
			// for normal html responses, the first argument to the success callback 
			// is the XMLHttpRequest object's responseText property 

			// if the ajaxSubmit method was passed an Options Object with the dataType 
			// property set to 'xml' then the first argument to the success callback 
			// is the XMLHttpRequest object's responseXML property 

			// if the ajaxSubmit method was passed an Options Object with the dataType 
			// property set to 'json' then the first argument to the success callback 
			// is the json data object returned by the server

			$("#divMsg").html("Data Saved successfully\n" + responseText);
			//alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
		}
 
	</script>
</head>
<body>
	<form id="form1">
	<div id="divDtl">
		<div style="background-color: Red; color: White; height: 40px; width: 100%" id="divMsg">
		</div>
		<input id="Get" type="button" value="Get Data" onclick="GetMembre(this)" />
		<hr />
		<input id="Text8" name="c_unqid" type="hidden" value="101" />
		ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="Text1" name="Id" type="text" />
		<br />
		Password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="Text5" name="Password" type="password" />
		<br />
		Name &nbsp;<input id="lblName" name="Name" type="text" />
		<br />
		Notes &nbsp;<textarea id="Text6" name="Notes" rows="5" cols="100"></textarea>
		<br />
		Dump &nbsp;<input id="Text3" name="fasfs" type="text" />
		<br />
		Country &nbsp;
		<select name="CountryId">
			<option value="0" title="select">--Select-- </option>
			<option value="1" title="India">India </option>
			<option value="2" title="USA">USA </option>
			<option value="3" title="UK">UK </option>
		</select>
		<br />
		Gender
		<input id="Text4" name="Sex" type="radio" value="1" />Male
		<input id="Radio1" name="Sex" type="radio" value="2" />FeMale
		<br />
		Hobbies
		<input id="Radio2" name="Hobbies" type="checkbox" value="1" />Eating
		<input id="Radio3" name="Hobbies" type="checkbox" value="2" />Dancing
		<br />
		Are you happy With us :
		<input id="Checkbox1" name="AreYouHappy" type="checkbox" value="true" />Yes
		<br />
		Photo
		<input id="File1" type="file" name="Photo" />
		<br />
		Tests &nbsp;
		<select name="TestList" multiple="multiple">
			<option value="1" title="CBC">CBC </option>
			<option value="2" title="UrineTest">Urine Test </option>
			<option value="3" title="StoolTest">Stool Test</option>
		</select>
		<br />
		<br />
		*****************************<br />
		Second Model On the Same Form<br />
		*****************************<br />
		<br />
		Account Number &nbsp;<input id="Text7" name="Number" type="text" />
		<br />
		Account Type &nbsp;<select name="Type">
			<option value="1" title="Saving">Saving </option>
			<option value="2" title="Current">Current </option>
		</select>
		<br />
		<br />
		<br />
		<br />
		<input id="Text2" type="submit" value="Save" />
		<input id="reset1" type="reset" value="Clear" />
		<input id="btnTestPost" type="button" value="Test Post" /></div>
	</form>
</body>
</html>
