import 'dart:io';
import 'dart:math';

class QuizApp {
  Map quizQuestions = {
    "What is the capital of France?": "Paris",
    "Who wrote the play 'Romeo and Juliet'?": "William Shakespeare",
    "What is the largest planet in our solar system?": "Jupiter",
    "In which year did Christopher Columbus discover America?": "1492",
    "What is the chemical symbol for gold?": "Au",
    "Who painted the Mona Lisa?": "Leonardo da Vinci",
    "What is the square root of 144?": "12",
    "What is the national flower of Japan?": "Cherry Blossom",
    "How many continents are there on Earth?": "7",
    "What is the chemical formula for water?": "H2O",
    "Who is the author of 'To Kill a Mockingbird'?": "Harper Lee",
    "What is the currency of Japan?": "Japanese Yen",
    "What is the largest mammal in the world?": "Blue Whale",
    "Who was the first woman to fly solo across the Atlantic Ocean?": "Amelia Earhart",
    "What is the freezing point of water in Fahrenheit?": "32F",
    "Who wrote 'The Great Gatsby'?": "F. Scott Fitzgerald",
    "What is the tallest mountain in the world?": "Mount Everest",
    "What is the capital of Australia?": "Canberra",
    "What gas do plants absorb from the atmosphere?": "Carbon Dioxide",
    "What is the chemical formula for carbon dioxide?": "CO2",
    "Who founded Microsoft?": "Bill Gates",
    "What is the largest ocean on Earth?": "Pacific Ocean",
    "In which year did World War II end?": "1945",
    "What is the chemical symbol for oxygen?": "O",
    "Who was the first President of the United States?": "George Washington",
    "What is the boiling point of water in Celsius?": "100C",
    "What is the capital of Russia?": "Moscow",
    "Who wrote 'War and Peace'?": "Leo Tolstoy",
    "What is the chemical symbol for hydrogen?": "H",
    "What is the largest land animal on Earth?": "African Elephant",
    "What is the smallest planet in our solar system?": "Mercury",
    "What is the largest desert in the world?": "Sahara Desert",
    "Who is known as the 'Father of Modern Physics'?": "Albert Einstein",
    "What is the chemical symbol for silver?": "Ag",
    "What is the largest organ in the human body?": "Skin",
    "Which gas do plants release during photosynthesis?": "Oxygen",
    "Who wrote 'Pride and Prejudice'?": "Jane Austen",
    "What is the national flower of the United States?": "Rose",
    "What is the chemical symbol for lead?": "Pb",
    "What is the largest moon of Jupiter?": "Ganymede",
    "What is the smallest prime number?": "2",
    "What is the most abundant gas in Earth's atmosphere?": "Nitrogen",
    "What is the chemical symbol for carbon?": "C",
    "Who painted 'Starry Night'?": "Vincent van Gogh",
    "What is the largest city in the world by population?": "Tokyo",
    "What is the chemical symbol for sodium?": "Na",
    "What is the smallest mammal in the world?": "Bumblebee Bat",
    "What is the largest ocean predator?": "Blue Whale",
    "What is the national bird of the United States?": "Bald Eagle",
    "Who wrote 'Hamlet'?": "William Shakespeare",
    "What is the chemical symbol for potassium?": "K",
  };

  void startQuiz() {
    final List<int> random = Random_(20);
    int correctAnswersCount = 0;

    for (int i in random) {
      final question = quizQuestions.keys.elementAt(i);
      final correctAnswer = quizQuestions.values.elementAt(i);
      
      print(question);
      final userAnswer = getUserAnswer();
      if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
        correctAnswersCount++;
       print('Correct!\n');
      } else {
        print('Incorrect. The correct answer is: $correctAnswer\n');
      }
      
    }

    final totalQuestions = 20;
    final percentage = (correctAnswersCount / totalQuestions) * 100;

    print('Total Correct Answers: $correctAnswersCount/$totalQuestions');
    print('Percentage: $percentage%');

    if (percentage > 50) {
      print('Congratulations!');
    }
    else {
      print('Keep practicing. You can do better!');
    }
  }

  String getUserAnswer() {
    String? input;
    do {
      print('Your answer: ');
      input = stdin.readLineSync();
    } while (input == null || input.isEmpty);

    return input;
  }

  List<int> Random_(int j) {
    final max = 50;
    final rand = Random();
    final randomList = <int>[];

    while (randomList.length < j) {
      final randIndex = rand.nextInt(max);
      if (!randomList.contains(randIndex)) {
        randomList.add(randIndex);
      }
    }

    return randomList;
  }
}

void main() {
  final quiz = QuizApp();

  print('Welcome to the Quiz App!\n');

  while (true) {
    quiz.startQuiz();

    print('Do you want to play again? (yes/no)');
    final playAgain = stdin.readLineSync()?.toLowerCase() ?? 'no';
    if (playAgain != 'yes') {
      print('Thanks for playing.');
      break;
    }
  }
}