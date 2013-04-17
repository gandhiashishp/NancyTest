<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxPost.aspx.cs" Inherits="NancyTest.AjaxPost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
    <script type="text/javascript" src="jquery.populate.js"></script> 
	<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script> 
	
    <title></title>
		
	    <script>

	    function GetMembre(e) {
	    	$.getJSON('/handler/name', function (data) {
	    		//JSON.stringify(data);
	    		//$('#form1').populate(JSON.stringify(data));

	    		$('#form1').populate(data);

	    	});

	    }

	    function populate(frm, data) {
	    	$.each(data, function (key, value) {
	    		var $ctrl = $('[name=' + key + ']', frm);
	    		switch ($ctrl.attr("type")) {
	    			case "text":
	    			case "hidden":
	    			case "textarea":
	    				$ctrl.val(value);
	    				break;
	    			case "radio": case "checkbox":
	    				$ctrl.each(function () {
	    					if ($(this).attr('value') == value) { $(this).attr("checked", value); }
	    				});
	    				break;
	    		}
	    	});
	    }

	    	// prepare the form when the DOM is ready 
	    	$(document).ready(function () {
	    		var options = {
	    			//target: '#output2',   // target element(s) to be updated with server response 
	    			success: showResponse  // post-submit callback 
	    			//beforeSubmit: showRequest,  // pre-submit callback 
	    			

	    			// other available options: 
	    			//url:       url         // override for form's 'action' attribute 
	    			//type:      type        // 'get' or 'post', override for form's 'method' attribute 
	    			//dataType:  null        // 'xml', 'script', or 'json' (expected server response type) 
	    			//clearForm: true        // clear all form fields after successful submit 
	    			//resetForm: true        // reset the form after successful submit 

	    			// $.ajax options can be used here too, for example: 
	    			//timeout:   3000 
	    		};

	    		// bind to the form's submit event 
	    		$('#form1').submit(function () {
	    			// inside event callbacks 'this' is the DOM element so we first 
	    			// wrap it in a jQuery object and then invoke ajaxSubmit 
	    			$(this).ajaxSubmit(options);

	    			// !!! Important !!! 
	    			// always return false to prevent standard browser submit and page navigation 
	    			return false;
	    		});
	    	});

	    	// post-submit callback 
	    	function showResponse(responseText, statusText, xhr, $form) {
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
    <form id="form1" runat="server" action="/handler/name">
  <div>
		<div style="background-color:Red;color:White;height:40px;width:500px" id="divMsg">

			</div>
			
			<input id="Get" type="button" value="Get Data"  onclick="GetMembre(this)"/>

			<hr />
		<input id="Text8" name="c_unqid" type="hidden" value="101" />
		
		<asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="Text1" name="Id" type="text" />
		<br />

		<asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="Text5" name="Password" type="password" />
    	<br />

    	<asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
		&nbsp;<input id="lblName" name="Name" type="text" />
		<br />

		<asp:Label ID="Label7" runat="server" Text="Notes"></asp:Label>
		&nbsp;<textarea id="Text6" name="Notes" rows="5" cols="100" ></textarea>

		<br />

		<asp:Label ID="Label3" runat="server" Text="Dump"></asp:Label>
		&nbsp;<input id="Text3" name="fasfs" type="text" />
			
		<br />

		<asp:Label ID="Label4" runat="server" Text="Country"></asp:Label>
		&nbsp;<select name="CountryId"  >
			<option value="0" title="select">--Select-- </option>
			<option value="1" title="India">India </option>
			<option value="2" title="USA" >USA </option>
			<option value="3" title="UK" >UK </option>
		</select>

		<br />
		
		<asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
		<input id="Text4" name="Sex" type="radio" value="1" />Male 
		<input id="Radio1" name="Sex" type="radio" value="2" />FeMale

		<br />
		
		<asp:Label ID="Label8" runat="server" Text="Hobbies"></asp:Label>
		<input id="Radio2" name="Hobbies" type="checkbox" value="1" />Eating 
		<input id="Radio3" name="Hobbies" type="checkbox" value="2" />Dancing
		
		<br />
		Are you happy With us :
			<input id="Checkbox1" name="AreYouHappy" type="checkbox" value="true" />Yes
		<br />
		<asp:Label ID="Label9" runat="server" Text="Photo"></asp:Label>
		<input id="File1" type="file" name="Photo"/>
		<br />

		<asp:Label ID="Label12" runat="server" Text="Country"></asp:Label>
		&nbsp;<select name="TestList"  multiple="multiple" >
			
			<option value="1" title="CBC">CBC </option>
			<option value="2" title="UrineTest" >Urine Test </option>
			<option value="3" title="StoolTest" >Stool Test</option>
		</select>

		<br />
		<br />
		*****************************<br />
		Second Model On the Same Form<br />
		*****************************<br />
		 <br />

		 	<asp:Label ID="Label11" runat="server" Text="Account Number"></asp:Label>
		&nbsp;<input id="Text7" name="Number" type="text" />
		<br />

		<asp:Label ID="Label10" runat="server" Text="Account Type"></asp:Label>
		&nbsp;<select name="Type" >
			<option value="1" title="Saving">Saving </option>
			<option value="2" title="Current" >Current </option>
		</select>

		<br />
		<br />
		<br />
		<br />

		<input id="Text2" type="submit" value="Save" />
		<input id="reset1" type="reset" value="Clear" />
    </div>
    </form>
</body>
</html>

