import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentQuestionIndex = 0;
  String questionText = '';
  String? selectedOption;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    _updateQuestion();
  }

  void _updateQuestion() {
    if (currentQuestionIndex < 10) {
      final question = questions[currentQuestionIndex];
      setState(() {
        questionText = question.text;
        selectedOption = null; // Reset selected option
      });
    } else {
      // Quiz completed, show results
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Results"),
        content:
            Text("You Scored $correctAnswers out of 10 questions correctly."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restartQuiz();
            },
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }

  void _restartQuiz() {
    setState(() {
      questions.shuffle(); // Shuffle the questions for a new quiz
      currentQuestionIndex = 0;
      correctAnswers = 0;
      _updateQuestion();
    });
  }

  List<Widget> _buildOptions() {
    return questions[currentQuestionIndex].options.map((option) {
      return RadioListTile<String>(
        title: Text(
          option,
          style: const TextStyle(fontSize: 20),
        ),
        value: option,
        groupValue: selectedOption,
        onChanged: (String? value) {
          setState(() {
            selectedOption = value;
          });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 8, 180),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QUIZ CRAZE'),
        backgroundColor: const Color.fromARGB(255, 75, 11, 86),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Answer The Quiz',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            questionText,
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildOptions(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (selectedOption != null) {
                // Verify answer
                if (selectedOption == questions[currentQuestionIndex].answer) {
                  correctAnswers++;
                }
                // Proceed to the next question
                currentQuestionIndex++;
                _updateQuestion();
              } else {
                // Display a message to select an option
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Alert"),
                    content: const Text("Please select an option"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text(
              currentQuestionIndex < questions.length - 1
                  ? 'Next Question'
                  : 'Finish',
            ),
          ),
        ]),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String answer;

  const Question({
    required this.text,
    required this.options,
    required this.answer,
  });
}

List<Question> questions = [
  const Question(
    text: "Of what wood was Noah’s Ark made?",
    options: ["Acacia wood", "Gopher wood", "Cedar of Lebanon", "Carob wood"],
    answer: "Gopher wood",
  ),
  const Question(
    text: "How long was the ark?",
    options: ["500 cubits", " 100 cubits", "300 cubits", "250 cubits"],
    answer: "300 cubits",
  ),
  const Question(
    text: "For how long did the flood rain fall?  ",
    options: [
      "80 days and nights",
      " 12 days and nights",
      "107 days and nights",
      "40 days and 40 nights"
    ],
    answer: "40 days and 40 nights",
  ),
  const Question(
    text: "How long did the flood cover the earth?",
    options: [" 19 days", "150 days", " 50 days", "15 days"],
    answer: "150 days",
  ),
  const Question(
    text: "How old was Joseph when his brethren sold him into slavery?",
    options: ["69", " 23", "17", "90"],
    answer: "17",
  ),
  const Question(
    text: "Who suggested that Joseph interpret the dreams of Pharaoh?",
    options: ["Potiphar", "The cupbearer", "Judah", "The baker"],
    answer: "The cupbearer",
  ),
  const Question(
    text: "What are the names of Joseph’s two sons?",
    options: [
      "John and Mark",
      "Cain and Abel",
      "Ephraim and Manasseh",
      "Dan and Naphtali"
    ],
    answer: "Ephraim and Manasseh",
  ),
  const Question(
    text:
        "How long did Moses’s mother hide him to escape the death edict of Pharaoh?",
    options: ["13 months", "10 months", "3 months", "7 months"],
    answer: "3 months",
  ),
  const Question(
    text: "Who was Moses’s father-in-law?",
    options: ["Laban", "Mordechai", "Jethro", "Cyrus"],
    answer: "Jethro",
  ),
  const Question(
    text: "What was the name of Aaron’s (Moses’s brother) wife?",
    options: ["Elisheba", "Miriam", "Zipporah", "Deborah"],
    answer: "Elisheba",
  ),
  const Question(
    text:
        "How old was Moses when he gave God’s message to Pharaoh: “Let my people go”?",
    options: ["80 years", "18 years", "13 years", "39 years"],
    answer: "80 years",
  ),
  const Question(
    text: "What was the first of the ten plagues in Egypt?",
    options: [
      "Frogs",
      "Water turned into blood ",
      "Plague of lice",
      "Darkness"
    ],
    answer: "Water turned into blood ",
  ),
  const Question(
    text: "Where was Moses buried?",
    options: [
      "In Canaan",
      "In a cave",
      "In the valley of Moab ",
      "In the desert"
    ],
    answer: "In the valley of Moab ",
  ),
  const Question(
    text:
        "What was the height of Goliath? In other words, how giant was this giant?",
    options: [
      "Six cubits and a span ",
      "Seven cubits and two spans",
      "Nine cubits and a span",
      "Five cubits and three spans"
    ],
    answer: "Six cubits and a span ",
  ),
  const Question(
    text: "When Saul was pursuing David, in which cave did David seek refuge?",
    options: [
      "Cave at Makkedah",
      "Cave of Machpelah",
      "Cave of Adullam ",
      "Dambulla Cave"
    ],
    answer: "Cave of Adullam ",
  ),
  const Question(
    text: "Who was the chief of the three mighty men of David?",
    options: ["Jonathan", "Benaiah", "Josheb-basshebeth", "Abishai"],
    answer: "Josheb-basshebeth",
  ),
  const Question(
    text: "Who restored Paul’s sight after the Lord blinded him?",
    options: ["Peter", "Luke", "Ananias", "Matthew"],
    answer: "Ananias",
  ),
  const Question(
    text: "How did Paul escape Damascus when the Jews were trying to kill him?",
    options: [
      "He was let down from the city walls in a basket",
      "An angel lifted him out",
      "An earthquake created the means of escape",
      "Silas came to his rescue"
    ],
    answer: "He was let down from the city walls in a basket",
  ),
  const Question(
    text: "Where was Paul stoned?",
    options: ["Melita", "Damascus", "Galilee", "Lystra"],
    answer: "Lystra",
  ),
  const Question(
    text: "Where was an altar erected “to the unknown God”?",
    options: ["Athens", "Capernaum", "Thessalonica", "Jericho"],
    answer: "Athens",
  ),

  // Add more questions here
];
