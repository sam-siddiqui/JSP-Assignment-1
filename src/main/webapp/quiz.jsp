<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Integer totalAttempts = (Integer) request.getAttribute("totalAttempts");
    Integer previousScore = (Integer) request.getAttribute("currentScore");
    HashMap<Integer, HashMap<String, String>> questions = (HashMap<Integer, HashMap<String, String>>) request.getAttribute("questions");
    Integer minScoreToUnlock = (int) request.getAttribute("minScoreToUnlock");
    Integer minAttemptsToUnlock = (int) request.getAttribute("minAttemptsToUnlock");
    boolean unlockAnswers = request.getAttribute("unlockAnswers") != null && (Boolean) request.getAttribute("unlockAnswers");
%>
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
                <h3>Total Attempts: <%= totalAttempts %>
                </h3>
            </div>
            <div class="col d-md-flex justify-content-md-center align-items-md-center" style="padding: 0;">
                <h5 class="text-center d-md-flex justify-content-md-center align-items-md-center text-wrap">Get a score of <%=minScoreToUnlock%>+ or <%=minAttemptsToUnlock%>+ attempts
                    to unlock the answers</h5>
            </div>
            <div class="col d-md-flex justify-content-md-center align-items-md-center" style="padding: 0;">
                <h4 class="text-center d-md-flex justify-content-md-center align-items-md-center">Last
                    Score: <%= previousScore %>
                </h4>
            </div>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/quiz">
            <div class="row">
                <div class="col d-md-flex flex-row flex-grow-1 justify-content-md-center" style="padding: 0;">
                    <ul class="list-group">
                        <% for (Map.Entry<Integer, HashMap<String, String>> question : questions.entrySet()) {
                            String classUnlockAnswersTrue = unlockAnswers && Objects.equals(question.getValue().get("answer"), "true") ? "correctAnswer" : "";
                        String classUnlockAnswersFalse = unlockAnswers && Objects.equals(question.getValue().get("answer"), "false") ? "correctAnswer" : "";%>
                        <li class="list-group-item">
                            <div class="card bg-info-subtle bg-opacity-10">
                                <div class="card-body">
                                    <p class="card-text"><%= question.getKey() %>
                                        . <%= question.getValue().get("question") %>
                                    </p>
                                    <div class="row" style="padding-left: 1vw; padding-right: 1vw">
                                        <div class="col">
                                            <div class="form-check">
                                                <input class="form-check-input"
                                                       type="radio"
                                                                           title="true"
                                                                           id="formCheck-<%= question.getKey() %>-true"
                                                                           name="answer-<%= question.getKey() %>"
                                                                           value="true">
                                                <label
                                                    class="form-check-label <%= classUnlockAnswersTrue %>"
                                                    for="formCheck-<%= question.getKey() %>-true"
                                            >True</label></div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                                           title="false"
                                                                           id="formCheck-<%= question.getKey() %>-false"
                                                                           name="answer-<%= question.getKey() %>"
                                                                           value="true"><label
                                                    class="form-check-label <%= classUnlockAnswersFalse %>"
                                                    for="formCheck-<%= question.getKey() %>-false">False</label></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col d-md-flex flex-grow-1 justify-content-md-center">
                    <button class="btn btn-primary d-block" type="submit" role="button"
                            style="margin: 21px 19px;">Submit
                        Answers!
                    </button>
                </div>
            </div>
        </form>
        <div class="row">
            <div class="col d-md-flex justify-content-md-center">
                <p class="text-muted my-2">Copyright&nbsp;© 2024 Brand</p>
            </div>
        </div>
    </div>
    <div class="modal fade text-info-emphasis" id="resultsModal" role="dialog" tabindex="-1" aria-labelledby="resultsModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Information</h4><button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body d-lg-flex flex-column justify-content-lg-center align-items-lg-center">
                    <p>Your score was</p><span class="fs-1"><%= previousScore %></span>
                </div>
                <div class="modal-footer"><button class="btn btn-light" type="button" data-bs-dismiss="modal">Close</button></div>
            </div>
        </div>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<% if (Objects.equals(request.getMethod(), "POST")) {%>
<script>
    window.addEventListener("load", function(){
        new bootstrap.Modal(document.getElementById("resultsModal"), {}).toggle();
    });
</script>
<% } %>
</body>

</html>
