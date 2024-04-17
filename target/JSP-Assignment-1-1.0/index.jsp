<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>WebDevQuiz - JSP Assignment</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Navbar-Centered-Links-icons.css">
    <link rel="stylesheet" href="assets/quiz.css">
</head>

<body>
<div class="container-fluid">
    <div class="col" style="padding: 0;">
        <div class="row">
            <div class="col" style="padding: 0;">
                <nav class="navbar navbar-expand-md bg-primary-subtle py-3"
                     style="padding-top: 1vh !important;padding-bottom: 1vh !important;">
                    <div class="container-fluid"><a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/index.jsp"><span
                            class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><svg
                            xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                            viewBox="0 0 16 16" class="bi bi-question-circle">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
                                        <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94"></path>
                                    </svg></span><span>WebAppDev - Quiz</span></a>
                        <button class="navbar-toggler" data-bs-toggle="collapse"><span class="visually-hidden">Toggle navigation</span><span
                                class="navbar-toggler-icon"></span></button>
                    </div>
                </nav>
            </div>
        </div>
        <div class="row" style="padding-top: 1vh;padding-bottom: 1vh;">
            <div class="col d-md-flex justify-content-md-center align-items-md-center" style="padding: 0;">
                <h3>
                </h3>
            </div>
            <div class="col d-md-flex justify-content-md-center align-items-md-center" style="padding: 0;">
                <h1 class="text-center d-md-flex justify-content-md-center align-items-md-center">&nbsp;</h1>
            </div>
            <div class="col d-md-flex justify-content-md-center align-items-md-center" style="padding: 0;">
                <h4 class="text-center d-md-flex justify-content-md-center align-items-md-center">

                </h4>
            </div>
        </div>
        <div class="row" style="margin: 10vh 0;">
            <div class="col d-flex justify-content-md-center flex-column">
                <div class="row d-md-flex" style="margin: 5vh 0;">
                    <div class="col d-flex justify-content-md-center">
                        <h2>
                            Take the Web App Dev Quiz now to test your knowledge!
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-md-center">
                        <button class="btn btn-primary d-block" type="submit" role="link"
                                style="margin: 21px 19px;"><a style="color: white; text-decoration-line: none;" href="${pageContext.request.contextPath}/quiz">Start!</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col d-md-flex justify-content-md-center" style="position:absolute; bottom: 1px">
                <p class="text-muted my-2">Copyright&nbsp;© 2024 Brand</p>
            </div>
        </div>
    </div>
</div>
</body>

</html>
