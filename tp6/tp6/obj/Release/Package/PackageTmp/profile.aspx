<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="tp6.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>
    <link href="https://www.holbertonschool.com/level2/holberton.css" rel="stylesheet">
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
    <main>
        <article>
            <h1 style="text-align: center">My Profile</h1>
            <br />
            <form id="form1" runat="server">
                <div style="direction: rtl;">
                    User:
            <asp:Label ID="usernamelbl" runat="server" Font-Italic="True"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="namelbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <br />
                <div>
                    <h5>Here some tests you can try:</h5>
                    <ul>
                        <li>Smartness QuiZ: 1001</li>
                        <li>Math Test: 2004</li>
                        <li>Chemistry Test: 2005</li>
                    </ul>
                </div>
                <br />
                <br />
                    <br />
                <br />
                <div>
                    <table width="100%">
                        <tr>
                            <td>
                                <div>
                                    Tap The Code of The Exam you Want to Enter:&nbsp;<br />
                                    &nbsp;<br />
                                    &nbsp;<asp:TextBox ID="enterCodeTB" runat="server" Width="230px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="enterCodeTB" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="code">*</asp:RequiredFieldValidator>
                                    <asp:Label ID="validTestIdLbl" runat="server" Visible="False"></asp:Label>
                                    <br />
                                    &nbsp;<asp:Button ID="examEnterBtn" runat="server" OnClick="examEnterBtn_Click" Text="Enter an Exam" UseSubmitBehavior="False" ValidationGroup="code" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" Font-Bold="True" ForeColor="Black" />

                                </div>
                            </td>
                            <td style="direction: rtl;">
                                <br />
                                <asp:Button ID="btnCreateQuiz" runat="server" OnClick="btnCreateQuiz_Click" Text="Create a Quiz" Width="135px" Height="57px" BackColor="#FFCCFF" BorderColor="Red" BorderStyle="Outset" Font-Bold="True" ForeColor="Red" />
                            </td>
                        </tr>
                    </table>
                </div>

                <br />
                <br />
                <br />
                <br />
                <br />
                    <br />

                <div>
                    <table width="100%">
                        <tr>
                            <td>
                                <div align="center">
                                    My Own Quiz:<hr /><br />
                                                &nbsp;
                                    <asp:Table ID="Table1" runat="server"    style="text-align: center" CssClass="chead" Font-Bold="False">
                                     </asp:Table>
                                </div>
                            </td>
                            <td>
                                <div align="center">
                                    <br /><br /><br /><br />
                                    Test that I did:<hr /><br />
                                &nbsp;
                                    <asp:Table ID="Table2" runat="server"   style="text-align: center">
                                    </asp:Table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>



                <div>
                    <br />
                    <br />
                      <br />
                    <br /><br />
                    <br />
                    
                    <p>
                        <asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click" Text="Sign Out" Width="100%" CssClass="center-img" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" ForeColor="Red" Height="50px" />
                    </p>
                </div>
            </form>
        </article>
        <aside>

            <div id="disqus_thread"></div>
            <script>

                /**
                *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
                
                var disqus_config = function () {
                this.page.url = 'http://3.94.160.29/';  // Replace PAGE_URL with your page's canonical URL variable
                this.page.identifier = 'CatComment'; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                };
                
                (function () { // DON'T EDIT BELOW THIS LINE
                    var d = document, s = d.createElement('script');
                    s.src = 'https://discus.disqus.com/embed.js';
                    s.setAttribute('data-timestamp', +new Date());
                    (d.head || d.body).appendChild(s);
                })();
            </script>
        </aside>
    </main>
</body>
</html>
