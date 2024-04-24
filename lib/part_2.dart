import 'package:flutter/material.dart';

Map<String, bool> questions = {
  'Question A text': false,
  'Question B text': true,
  'Question C text': true,
  'Question D text': true,
  'Question E text': false,
  'Question F text': true,
  'Question G text': false,
  'Question H text': true,
  'Question I text': false,
  'Question J text': false
};

class Part2Main extends StatefulWidget {
  const Part2Main({super.key});

  @override
  State<Part2Main> createState() => _Part2MainState();
}

class _Part2MainState extends State<Part2Main> {
  late List<MapEntry<String, bool>> randomQuestions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    randomQuestions = questions.entries.toList();
    randomQuestions.shuffle();
    debugPrint(randomQuestions.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
      ),
      body: TriviaQuestion(questions: randomQuestions, score: 0),
    );
  }
}

class TriviaQuestion extends StatelessWidget {
  final List questions;
  final int score;

  const TriviaQuestion(
      {super.key, required this.questions, required this.score});

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      var dialogFuture = showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Quiz complete!'),
              content: Text('Your score is ${score} / 10'),
            );
          });
      return FutureBuilder(
          future: dialogFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return const Center(child: Text('Done'));
          });
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(questions.firstOrNull.key),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                          body: TriviaQuestion(
                              questions: questions.sublist(1),
                              score: questions.firstOrNull.value
                                  ? score + 1
                                  : score))));
                },
                child: const Text('True')),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                          body: TriviaQuestion(
                              questions: questions.sublist(1),
                              score: !questions.firstOrNull.value
                                  ? score + 1
                                  : score))));
                },
                child: const Text('False'))
          ])
        ],
      );
    }
  }
}
