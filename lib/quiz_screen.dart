import 'package:flutter/material.dart';
import "question_model.dart";




class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Center(
            child:Text('My Personality Test'),
          )
      ),
      backgroundColor: Colors.black45,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          _questionWidget(),
          _answerList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: _backButton(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: _nextButton(),
                  ),
                ],
              ),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
          .toList(),
    );
  }

  int currentValue = 0;

  Widget _answerButton(Answer answer) {
    bool isSelected = answer== selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.redAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            setState(() {
              selectedAnswer = answer;
              currentValue = answer.value;
              score += answer.value;
            });
          }
        },
        child: Text(answer.answerText),


      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;

    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.pinkAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if(selectedAnswer == null){
            ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select an answer before going to the next question'))
            );
          }
          else if (isLastQuestion) {
            //display score

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
        child: Text(isLastQuestion ? "Submit" : "Next"),
      ),
    );
  }

  _backButton() {
    bool isFirstQuestion = false;

    if (currentQuestionIndex == 0) {
      isFirstQuestion = true;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.pinkAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isFirstQuestion) {
            //display score
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cannot go back to the previous question'))
            );
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              score -= currentValue;
              currentQuestionIndex--;
            });
          }
        },
        child: const Text("Back"),
      ),
    );
  }

  _showScoreDialog() {
    String result = "";

    if (score > 1 && score <=5) {
      result = "You are a Neutral Person";
    } else if (score > 5 && score <=10){
      result = "You are an Ambivalent Person";
    } else if(score > 10 && score <=15){
      result = "You are an Introvert Person";
    } else if(score > 15 && score <=20){
      result = "You are an Extrovert Person";
    } else {
      result = "Error";
    }
    String title = result;

    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(),
      ),
      content: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
            questionList.shuffle();
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.pinkAccent, // Replace blue with your desired color
        ),
        child: const Text("Restart"),
      ),
    );
  }
}
