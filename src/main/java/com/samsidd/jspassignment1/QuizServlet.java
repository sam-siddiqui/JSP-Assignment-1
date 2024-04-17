package com.samsidd.jspassignment1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

@WebServlet(name = "quizServlet", value = "/quiz")
public class QuizServlet extends HttpServlet {

    public HashMap<Integer, HashMap<String, String>> questions;
    public Integer totalAttempts;
    public Integer currentScore;
    public boolean unlockAnswers;
    private Integer minScoreToUnlock;
    private Integer minAttemptsToUnlock;

    public void init() {
        InputStream questionsXML = getServletContext().getResourceAsStream("assignment.xml");
        questions = Utils.fetchQuestions(getServletContext(), new HashMap<>(), questionsXML);
        totalAttempts = totalAttempts != null ? totalAttempts : 0;
        currentScore = 0;
        unlockAnswers = false;
        minAttemptsToUnlock = (int) questions.size() / 2;
        minScoreToUnlock = (int) (questions.size() * 0.8);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        questions = Utils.shuffleQuestions(questions);
        request.setAttribute("currentScore", currentScore);
        request.setAttribute("totalAttempts", totalAttempts);
        request.setAttribute("questions", questions);
        request.setAttribute("minScoreToUnlock", minScoreToUnlock);
        request.setAttribute("minAttemptsToUnlock", minAttemptsToUnlock);


        request.getRequestDispatcher("quiz.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HashMap<Integer, String> userAnswers = Utils.getAnswersFromRequest(request, questions);
        currentScore = Utils.evaluateAnswers(userAnswers, questions);
        totalAttempts++;
        questions = Utils.shuffleQuestions(questions);

        if(!unlockAnswers)
            if((totalAttempts >= minAttemptsToUnlock) || (currentScore >= minScoreToUnlock)) unlockAnswers = true;

        request.setAttribute("currentScore", currentScore);
        request.setAttribute("totalAttempts", totalAttempts);
        request.setAttribute("questions", questions);
        request.setAttribute("unlockAnswers", unlockAnswers);
        request.setAttribute("minScoreToUnlock", minScoreToUnlock);
        request.setAttribute("minAttemptsToUnlock", minAttemptsToUnlock);

        request.getRequestDispatcher("quiz.jsp").forward(request, response);
    }

    public void destroy() {

    }
}
