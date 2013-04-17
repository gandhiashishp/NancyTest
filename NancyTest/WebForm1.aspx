<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="NancyTest.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" action="/handler/name">
    <div>
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
