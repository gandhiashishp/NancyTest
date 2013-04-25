<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TempoExample.aspx.cs" Inherits="NancyTest.TempoExample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title></title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
	<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script>
	
	<script type="text/javascript" src="tempo.min.js"></script>

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

				Tempo.prepare('gridMembers', {}, function (template) {
						
						template.render(result);
					});

					Tempo.prepare('lstMembers', {}, function (template) {
						template.render(result);
					});

					Tempo.prepare('cboMembers', {}, function (template) {
						template.render(result);
					}); 
			}


			function errorCallback(result, status, xhr) {
				$("#divMsg").css("display", "block");
				$('#divMsg').html("ERROR");
			}
		}


		// prepare the form when the DOM is ready
		$(document).ready(function () {
			var options = {
				success: showResponse,  // post-submit callback 
				url: '/handler/name',         // override for form's 'action' attribute 
				type: 'post',        // 'get' or 'post', override for form's 'method' attribute 
				clearForm: true        // clear all form fields after successful submit 
			};

			GetMembre(this);
			$('#form1').ajaxForm(options);
		});

		//Post-submit callback 
		function showResponse(responseText, statusText, xhr, $form) {
			$("#divMsg").html("Data Saved successfully\n" + responseText);
		}
 
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<input id="Get" type="button" value="Get Data" onclick="GetMembre(this)" />
	<div id="divMembers">
	</div>
		<select id="cboMembers" style="width: 500px">
			<option value="{{c_unqid}}" data-template>{{Name}}</option>
		</select>

		<br />
	<br />

		<select id="lstMembers" style="width: 500px" multiple="multiple">
			<option value="{{c_unqid}}" data-template>{{Name}}</option>
		</select>
		<br />

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
				<tr data-template>
					<td>
						<input type="text" id="txtName" value="{{Name}}" />
							<div data-template-for="Accounts">
								Account Number : {{Number}}
							</div>
					</td>
					<td>
						<input type="text" id="txtNotes" value="{{Notes}}" />
					</td>
					<td>
						{% if  (AreYouHappy == true ) %}
							<input type="checkbox" id="Checkbox2" checked="checked" />
						{% else %}
							<input type="checkbox" id="Text1"  />
						{% endif %}
					</td>
					<td>
						<a href="webform1.aspx?Id={{c_unqid}}" id="lnkSelect">Select</a>
					</td>
				</tr>
			</tbody>
		</table>
		
	</form>
</body>
</html>
