<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="tp6.test" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam</title>
    <script type="text/javascript" language="javascript">
     function DisableBackButton() {
       window.history.forward()
      }
     DisableBackButton();
     window.onload = DisableBackButton;
     window.onpageshow = function(evt) { if (evt.persisted) DisableBackButton() }
     window.onunload = function() { void (0) }
    </script>
    <link href="https://www.holbertonschool.com/level2/holberton.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="behavior.js"></script>
</head>
<body class="works_on_smartphone">
        <header>
        <ul>
            <li class="logo;small">📎</li>
        </ul>
    </header>
    <form id="form1" runat="server">
        <div runat="server" align="center">
            <h1><span id="span" runat="server"></span></h1>
        </div>

        <div id="div" runat="server">
        </div>

        <div runat="server" align="center">

            <br />
            <br />
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Width="100%" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" ForeColor="Red" Height="50px" BorderStyle="Solid" BorderColor="Red" BorderWidth="1px" />

            <br />

            <br />
            <asp:Label ID="lblResult" runat="server" Font-Bold="True"></asp:Label>

            <br />
            ___________<br />
            100<br />
            <br />

            <asp:Button ID="btnEnd" runat="server" Text="End" Width="300px" OnClick="btnEnd_Click" Visible="False" Font-Bold="True" Font-Size="Medium" style="margin-left: 0px" />

            <br />
            <br />
            <br />

        </div>
    </form>
</body>
</html>
