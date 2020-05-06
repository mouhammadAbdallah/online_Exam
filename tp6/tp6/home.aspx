<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="tp6.home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
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
            <h1 style="text-align: center">Home Page</h1>
            <br />
            <h3>click on the image to see more details about Online Exam</h3>
            <a href="https://en.wikipedia.org/wiki/Online_quiz">
                <img src="https://images.wisegeek.com/man-in-black-working-on-laptop.jpg" alt="this is an image of a man doing an Online Exam" class="center-img">
            </a>

            <br />
            <h3>About Tests:</h3>
            <br>
            <img id="smart_thumbnail1"
                src="https://image.shutterstock.com/image-vector/online-exam-computer-web-app-260nw-1105800884.jpg" alt="exam-image"
                class="small">
            <img id="smart_thumbnail2"
                src="https://www.iata.org/contentassets/ead7b152cd69408e832c03bee32af0a5/online-exams.jpg?w=330&h=200&mode=crop&scale=both&v=20190703101713"
                alt="exam-image" class="small">
            <img id="smart_thumbnail3"
                src="https://image.freepik.com/free-vector/online-exam-distant-education-landing-page-banner_33099-2272.jpg"
                alt="exam-image" class="small">
            <img id="smart_thumbnail4" src="https://img.collegedekhocdn.com/media/img/news/fghgjghfgd.jpg?tr=h-310,w-615"
                alt="exam-image" class="small">
            <img id="smart_thumbnail5"
                src="https://www.takemyonlineexams.com/images/about/online-exam.jpg" alt="exam-image"
                class="small">


            <br />
            <div class="tab">
                <div class="tab1">
                    <h4>Blog quizzes:</h4>
                    <p>
                        conducted by the quizzers on blogs<br />
                        may be about verbs<br />
                        Or<br />
                        a wide range of other topics
                    </p>
                </div>
                <div class="tab2">
                    <h4>Educational quizzes:</h4>
                    <p>
                        Popular websites hosting quizzes<br />
                        to educate employees<br />
                        Or
                        <br />
                        Students
                    </p>
                </div>
            </div>
            <br />
            <h3>Use our Website To:</h3>
            <form id="form1" runat="server">
                <div>
                    <a href="profile.aspx">Create Your Online Exam</a><br />
                    <br />
                    <a href="profile.aspx">Check Your Students Grades </a>
                    <br />
                    <br />
                    <a href="profile.aspx">View Your Grades</a><br />
                    <br />
                    <a href="test.aspx?testId=1001">Test Your Smartness</a><br />
                    <br />
                    <a href="about.aspx">About us</a><br />
                    <br />
                </div>
            </form>
            <br/>
            <h4 class="chead">History:</h4>
            <p class="pborder">
                Ancient China was the first country in the world that implemented a nationwide standardized test, which was called the imperial examination. The main purpose of this examination was to select able candidates for specific governmental positions.[5] The imperial examination was established by the Sui dynasty in 605 AD and was later abolished by the Qing dynasty 1300 years later in 1905. England had adopted this examination system in 1806 to select specific candidates for positions in Her Majesty's Civil Service, modeled on the Chinese imperial examination.[6] This examination system was later applied to education and it started to influence other parts of the world as it became a prominent standard (e.g. regulations to prevent the markers from knowing the identity of candidates), of delivering standardised tests.
            </p>
            <br />
            <h4 class="chead">Modern-day use:</h4>
            <p class="pborder">
                Some countries such as the United Kingdom and France require all their secondary school students to take a standardized test on individual subjects such as the General Certificate of Secondary Education (GCSE) (in England) and Baccalauréat respectively as a requirement for graduation.[16] These tests are used primarily to assess a student's proficiency in specific subjects such as mathematics, science, or literature. In contrast, high school students in other countries such as the United States may not be required to take a standardized test to graduate. Moreover, students in these countries usually take standardized tests only to apply for a position in a university program and are typically given the option of taking different standardized tests such as the ACT or SAT, which are used primarily to measure a student's reasoning skill.[17][18] High school students in the United States may also take Advanced Placement tests on specific subjects to fulfill university-level credit. Depending on the policies of the test maker or country, administration of standardized tests may be done in a large hall, classroom, or testing center. A proctor or invigilator may also be present during the testing period to provide instructions, to answer questions, or to prevent cheating.
                <br/>
            </p>
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
