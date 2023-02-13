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
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);

}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Who was Aristotle's teacher?",
    [
      Answer("Plato", true),
      Answer("Socrates", false),
      Answer("Pythagoras", false),
      Answer("Zeno", false),
    ],
  ));


  list.add(Question(
    "In what area of philosophy did Aristotle make significant contributions?",
    [
      Answer("Metaphysics", false),
      Answer("Epistemology", false),
      Answer("Logic", false),
      Answer("All of the above", true),
    ],
  ));

  list.add(Question(
    "Who did Aristotle tutor",
    [
      Answer("Socrates", false),
      Answer("Alexander the Great", true),
      Answer("Plato", false),
      Answer("Pythagoras", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's philosophy on ethics?",
    [
      Answer("Ethics is relative to the individual", false),
      Answer("Ethics should aim at achieving happiness", true),
      Answer("Ethics should focus on following rules", false),
      Answer("Ethics should focus on avoiding pain", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on politics?",
    [
      Answer("Political power should be held by the people", false),
      Answer("Political power should be held by a select few", true),
      Answer("Political power should be shared among different groups", false),
      Answer("Political power should be held by a king", false),
    ],
  ));

  list.add(Question(
    "What is Aristotle's concept of the 'Golden Mean'?",
    [
      Answer("The midpoint between two extremes", true),
      Answer("The highest point on a scale", false),
      Answer("The lowest point on a scale", false),
      Answer("The furthest point from the center", false),
    ],
  ));

  list.add(Question(
    "In what field did Aristotle make significant contributions?",
    [
      Answer("Physics", false),
      Answer("Biology", true),
      Answer("Astronomy", false),
      Answer("All of the above", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's philosophy on causality?",
    [
      Answer("Causality is the relationship between an event (the cause) and a second event (the effect), where the second event is a result of the first.", true),
      Answer("Causality is random and cannot be predicted", false),
      Answer("Causality does not exist", false),
      Answer("Causality is determined by fate or destiny", false),
    ],
  ));

  list.add(Question(
    "What is Aristotle's concept of substance?",
    [
      Answer("Substance is the underlying reality that exists independently of perception", false),
      Answer("Substance is a product of perception", true),
      Answer("Substance does not exist", false),
      Answer("Substance is the physical material that makes up the universe", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on the natural world?",
    [
      Answer("The natural world is deterministic", true),
      Answer("The natural world is chaotic and unpredictable", false),
      Answer("The natural world is designed by a higher power", false),
      Answer("The natural world operates according to random chance", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on the nature of the soul?",
    [
      Answer("The soul is an immortal substance.", true),
      Answer("The soul is a mortal substance", false),
      Answer("The soul is a divine substance.", false),
      Answer("The soul is a material substance.", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on the nature of the universe?",
    [
      Answer("The universe is infinite.", false),
      Answer("The universe is finite.", true),
      Answer("The size of the universe is unknown.", false),
      Answer("The universe does not exist.", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on the nature of happiness?",
    [
      Answer("Happiness is the highest good.", true),
      Answer("Happiness is a fleeting emotion.", false),
      Answer("Happiness is an illusion.", false),
      Answer("Happiness is irrelevant to human life.", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on the nature of knowledge?",
    [
      Answer("Knowledge is innate and cannot be acquired.", false),
      Answer("Knowledge is acquired through observation and experience.", true),
      Answer("Knowledge is acquired through intuition.", false),
      Answer("Knowledge is impossible to acquire.", false),
    ],
  ));

  list.add(Question(
    "What was Aristotle's view on the nature of the state?",
    [
      Answer("The state is a necessary evil.", false),
      Answer("The state is an instrument of oppression.", false),
      Answer("The state is an embodiment of justice and the common good.", true),
      Answer("The state is irrelevant to human life.", false),
    ],
  ));

  final random = Random();
  final result = List.generate(10, (index) {
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
