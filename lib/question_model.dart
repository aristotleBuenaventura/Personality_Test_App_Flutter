import 'dart:math';

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);

  void shuffleOptions() {
    answersList.shuffle();
  }

}

class Answer {
  final String answerText;
  final int value;

  Answer(this.answerText, this.value);

}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "When in a large group of people, do you tend to:",
    [
      Answer("Feel energized and ready to socialize", 4),
      Answer("Feel overwhelmed and prefer to observe from a distance", 3),
      Answer("Feel comfortable and engage in conversation when prompted", 2),
      Answer("Have no particular preference", 1),
    ],
  ));

  list.add(Question(
    "How do you typically unwind after a long day?",
    [
      Answer("By going out and socializing with friends", 4),
      Answer("By spending time alone in a quiet space", 3),
      Answer("By doing a mix of both socializing and alone time", 2),
      Answer("By doing whatever feels right in the moment", 1),
    ],
  ));

  list.add(Question(
    "Do you tend to make decisions based on:",
    [
      Answer("Your instincts and emotions", 4),
      Answer("Careful analysis and reflection", 3),
      Answer("A combination of both", 2),
      Answer("No particular approach", 1),
    ],
  ));

  list.add(Question(
    "In a group discussion, do you tend to:",
    [
      Answer("Contribute actively and speak up often", 4),
      Answer("Listen carefully and only speak when you have something important to add", 3),
      Answer("Do a mix of both, depending on the topic and your level of comfort", 2),
      Answer("Have no particular pattern", 1),
    ],
  ));

  list.add(Question(
    "When meeting someone new, do you tend to:",
    [
      Answer("Initiate conversation and be outgoing", 4),
      Answer("Wait for the other person to initiate and be more reserved", 3),
      Answer("Do a mix of both, depending on the situation", 2),
      Answer("Have no particular preference", 1),
    ],
  ));




  final random = Random();
  final result = List.generate(5, (index) {
    int nextIndex = random.nextInt(list.length);
    Question item = list[nextIndex];
    list.removeAt(nextIndex);
    return item;
  });

  for (Question question in result) {
    question.answersList.shuffle(random);
  }


  return result;
}
