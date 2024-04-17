package com.samsidd.jspassignment1;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class Utils {
    public static Iterable<Node> iterable(final NodeList nodeList) {
        return () -> new Iterator<Node>() {

            private int index = 0;

            @Override
            public boolean hasNext() {
                return index < nodeList.getLength();
            }

            @Override
            public Node next() {
                if (!hasNext())
                    throw new NoSuchElementException();
                return nodeList.item(index++);
            }
        };
    }

    public static Integer evaluateAnswers(HashMap<Integer, String> userAnswers, HashMap<Integer, HashMap<String, String>> questions) {
     Integer totalScore = 0;

     for (Map.Entry<Integer, String> answer: userAnswers.entrySet()) {
         String userAnswer = answer.getValue();
         Integer questionAnswerIndex = answer.getKey();
         HashMap<String, String> questionSet = questions.get(questionAnswerIndex);
         if(Objects.equals(userAnswer, questionSet.get("answer"))) totalScore++;
     }

     return totalScore;
    }

    public static HashMap<Integer, String> getAnswersFromRequest(HttpServletRequest request, HashMap<Integer, HashMap<String, String>> questions) {
        HashMap<Integer, String> userAnswers = new HashMap<>();

        for(Integer index : questions.keySet()) {
            String answer = request.getParameter(String.format("answer-%s", index));
            userAnswers.put(index, answer);
        }

        return userAnswers;
    }

    public static HashMap<Integer, HashMap<String, String>> shuffleQuestions(HashMap<Integer, HashMap<String, String>> questions) {
        HashMap<String, String> temp;
        int arrayLength = questions.size(), a;
        while(arrayLength > 1) {
            a = (int) Math.floor(Math.random() * arrayLength--) + 1;
            temp = questions.get(arrayLength);
            questions.put(arrayLength, questions.get(a));
            questions.put(a, temp);
        }
        return questions;
    }

    public static HashMap<Integer, HashMap<String, String>> fetchQuestions(ServletContext context, HashMap<Integer, HashMap<String, String>> questions, InputStream questionsFile) {
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document questionsXML = db.parse(new InputSource(questionsFile));
            Element rootElement = questionsXML.getDocumentElement();
            rootElement.normalize();
            NodeList questionsElements = rootElement.getElementsByTagName("questions");
            Integer questionIndex = 1;

            for(Node question: iterable(questionsElements)) {
                Element questionEl = (Element) question;
                Node questionElement = questionEl.getElementsByTagName("question").item(0);
                Node answerElement = questionEl.getElementsByTagName("answer").item(0);
                HashMap<String, String> tempQuestion = new HashMap<String, String>() {{
                    put("question", questionElement.getTextContent());
                    put("answer", answerElement.getTextContent());
                }};
                questions.put(questionIndex, tempQuestion);
                questionIndex++;
            }

            return questions;
        } catch (
                ParserConfigurationException | SAXException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
