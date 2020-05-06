<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myQuiz.aspx.cs" Inherits="tp6.myQuiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grades</title>
    <link href="styles.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="behavior.js"></script>
</head>
<body class="works_on_smartphone">
    <header>
        <div class="right">
            <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=5e9c2a69cc676b001933effc&product=inline-share-buttons' async='async'></script>
            <div class="sharethis-inline-share-buttons"></div>
        </div>
        <ul>
            <li class="logo">📎</li>
            <li><a href="home.aspx" class="redcolor">Home</a></li>
            <li><a href="profile.aspx">myProfile</a></li>
            <li><a href="about.aspx">About</a></li>
        </ul>
    </header>
                <h1 style="text-align: center">Grades</h1>
            <br />
        <main>
    <form id="form1" runat="server">
        <div id="div" runat="server">
        </div>
    </form>
            </main>
</body>
</html>
