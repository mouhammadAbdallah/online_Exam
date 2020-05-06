<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="tp6.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
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
    <footer>
        <p>
            Made by <a href="https://www.linkedin.com/in/m-abdallah" target="_blank">Mohamad Abdallah</a> & <a href="">Ibrahim Jazzar</a>.
        </p>
    </footer>
    <main>
        <article>
            <h1 style="text-align: center">About Us</h1>
            <br />
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            During Covid-19, Learning should continue, So this is a simple platform that
            help in education.<br />
            <br />
            -&nbsp;&nbsp;&nbsp;
            Each Teacher Or Student should <a href="sign_up.aspx">Create an Account</a>.<br />
            <br />
            -&nbsp;&nbsp;&nbsp;
            The teacher can <a href="profile.aspx">create</a> his own Quiz then share the code of this quiz with their students.<br />
            <br />
            -&nbsp;&nbsp;&nbsp;
            Each Exam has a Title.<br />
            <br />
            -&nbsp;&nbsp;&nbsp;
            The Exam consists of many multiple choice questions.<br />
            <br />
            -&nbsp;&nbsp;&nbsp;
            The Student can <a href="profile.aspx">enter</a>  to an Exam using its unique code. 
            <br />
            <br />
            -&nbsp;&nbsp;&nbsp; During the exam, the student can validate his answers and at the end of the quiz, he can see his Grade on this Exam.<br />
            <br />
            -&nbsp;&nbsp;&nbsp; The teacher can always <a href="profile.aspx">track</a>  his students, see their answers and check their grades.<br />
            <br />
            -&nbsp;&nbsp;&nbsp; A student can see his quizes and his grades on his <a href="profile.aspx">Profile</a>  Page.
            <br />
            <br />
            <br />
            <br />
            This project is prepared by <a href="https://www.linkedin.com/in/m-abdallah" target="_blank">Mohamad Abdallah</a> & <a href="">Ibrahim Jazzar</a> in the ASP.Net University Course.<br />
            <br />
            Date: 03-May-2020
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
