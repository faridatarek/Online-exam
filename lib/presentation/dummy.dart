class Subject {
  final String title; // Subject title like "Flutter"
  final String imageUrl; // Image URL for the subject
  final List<Question> questions; // List of related questions

  Subject({
    required this.title,
    required this.imageUrl,
    required this.questions,
  });
}

class Question {
  final String questionText; // The text of the question

  final String examTime; // time for exam

  Question({
    required this.questionText,

    required this.examTime,
  });
}


List<Subject> subjectsDummy = [
  Subject(
    title: "Flutter Development",
    imageUrl: "https://th.bing.com/th/id/R.8a50b602aa79b19775c22d02a290f51f?rik=OmRPFatSEOYeWw&pid=ImgRaw&r=0",
    questions: [
      Question(questionText: "What is Flutter?", examTime: "30 minutes"),
      Question(questionText: "What is a Widget?", examTime: "25 minutes"),
      Question(questionText: "What is Dart?", examTime: "20 minutes"),
    ],
  ),
  Subject(
    title: "HTML Basics",
    imageUrl: "https://cdn.pixabay.com/photo/2017/08/05/11/16/logo-2582748_640.png",
    questions: [
      Question(questionText: "What does HTML stand for?", examTime: "15 minutes"),
      Question(questionText: "How do you create a hyperlink in HTML?", examTime: "20 minutes"),
    ],
  ),
  Subject(
    title: "CSS Basics",
    imageUrl: "https://d2mk45aasx86xg.cloudfront.net/What_Goes_Behind_Writing_a_Flawless_CSS_Code_37742e2bcf.webp",
    questions: [
      Question(questionText: "What does CSS stand for?", examTime: "10 minutes"),
      Question(questionText: "How do you center a div in CSS?", examTime: "15 minutes"),
    ],
  ),
  Subject(
    title: "JavaScript Fundamentals",
    imageUrl: "https://th.bing.com/th/id/OIP._2Czl_xx-Tq42y7dI01DsAHaHa?rs=1&pid=ImgDetMain",
    questions: [
      Question(questionText: "What is a closure in JavaScript?", examTime: "30 minutes"),
      Question(questionText: "Explain 'this' keyword in JavaScript", examTime: "25 minutes"),
    ],
  ),
  Subject(
    title: "React Development",
    imageUrl: "https://th.bing.com/th/id/R.7c1cb266703633341bea4fcf9958b583?rik=kkTw9XDSfKzK0w&pid=ImgRaw&r=0",
    questions: [
      Question(questionText: "What is JSX?", examTime: "20 minutes"),
      Question(questionText: "What are props in React?", examTime: "25 minutes"),
      Question(questionText: "What is state in React?", examTime: "30 minutes"),
    ],
  ),
];