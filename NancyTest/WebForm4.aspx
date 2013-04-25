<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="NancyTest.WebForm4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
	<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script>
	<script type="text/javascript" src="jquery.populate.js"></script>
	<script type="text/javascript" src="jquery.populateSelect.js"></script>
	<script type="text/javascript" src="jquery.populateGrid.js"></script>
	<script type="text/javascript">

		function GetMembre(e) {
			$.ajax(
					{
						headers: { "Content-Type": "application/json", "Accept": "application/json" },
						type: 'GET', /* 	Specifies the type of request. (GET or POST)*/
						contentType: 'application/json', /*The content type used when sending data to the server. Default is: "application/x-www-form-urlencoded"*/
						//dataType: 'application/json', /*The data type expected of the server response.*/
						url: '/handler/names', /*Specifies the URL to send the request to. Default is the current page*/
						success: successCallback, /*A function to be run when the request succeeds*/
						error: errorCallback /*A function to run if the request fails. */
					}
				);

			function successCallback(result, status, xhr) 
			{
//				var itemTemplate ='<tr class="itemTemplate">' +
//									'<td>' +
//										'<input type="text" id="txtName" value="@Name" />' +
//									'</td>' +
//									'<td>' +
//										'<input type="text" id="txtNotes" value="@password" />' +
//									'</td>' +
//									'<td>' +
//										'<a href="webform1.aspx?Id=@c_unqid" id="lnkSelect"> Select :  @c_unqid </a>' +
//									'</td>' +
//								 '</tr>';
//				var options =
//				{
//					itemTemplate: itemTemplate
//				};

//				var options =
//				{ 
//					dataValue: 'c_unqid',
//					dataText: 'Name',
//					itemTemplate: itemTemplate
//				};
//					$('#cboMembers').populateSelect(result, options);
//					$('#lstMembers').populateSelect(result, options);

				$('#gridMembers').populateGrid(result);

			}


			function errorCallback(result, status, xhr) {
				$("#divMsg").css("display", "block");
				$('#divMsg').html("ERROR");
			}
		}


		// prepare the form when the DOM is ready
		$(document).ready(function () {
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
			GetMembre(this);
			$('#form1').ajaxForm(options);
		});

		//Post-submit callback 
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
	<form id="form1" runat="server">
	<input id="Get" type="button" value="Get Data" onclick="GetMembre(this)" />
	<div id="divMembers">
	</div>
		<select id="cboMembers" style="width: 500px">
		</select>

		<select id="lstMembers" style="width: 500px" multiple="multiple">
		</select>
		<Br />
		<table id="gridMembers">
			<thead>
				<tr>
					<th>
						Name
					</th>
					<th>
						Notes
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="text" id="txtName" value="@Name" />
					</td>
					<td>
						<input type="text" id="txtNotes" value="@Notes" />
					</td>
					<td>
						<a href="webform1.aspx?Id=@c_unqid" id="lnkSelect">Select : @c_unqid </a>
					</td>
				</tr>
			</tbody>
		</table>

	</form>
</body>
</html>
