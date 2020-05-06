<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Quize.aspx.cs" Inherits="tp6.Create_Quize" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Craete QuiZ</title>
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
    <h1 align="center">Create Your QuiZ</h1>
    <form id="form1" runat="server">
        <div>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Question:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TBQuest" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="all">*</asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBQuest" runat="server" Width="500px" CssClass="center-img"></asp:TextBox>
            </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;
                Choices:
            </p>
            <p style="margin-left: 80px">
                1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="choice0" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="choice0" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="all">*</asp:RequiredFieldValidator>
            </p>
            <p style="margin-left: 80px">
                2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="choice1" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="choice1" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="all">*</asp:RequiredFieldValidator>
            </p>
            <p style="margin-left: 80px">
                3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="choice2" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="choice2" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="all">*</asp:RequiredFieldValidator>
            </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp; Which is The Right Choice?</p>
            <div style="margin-left: 120px">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="0">1</asp:ListItem>
                    <asp:ListItem Value="1">2</asp:ListItem>
                    <asp:ListItem Value="2">3</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="all">*</asp:RequiredFieldValidator>
            </div>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Test Name:</b> &nbsp;&nbsp;
            <asp:TextBox ID="title" runat="server" Width="209px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="title" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="testfinsh">*</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="addbtn" runat="server" Text="ADD This Question" OnClick="addbtn_Click" ValidationGroup="all" BorderColor="Red" BorderStyle="Dotted" Font-Bold="True" Font-Size="Small" ForeColor="Red" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="finishBtn" runat="server" Text="Finish" OnClick="finishBtn_Click" ValidationGroup="testfinsh" Width="131px" BorderColor="Black" BorderStyle="Solid" Font-Bold="True" />
        </div>
        <hr />
        <div id="div" runat="server">
        </div>
    </form>
</body>
</html>
