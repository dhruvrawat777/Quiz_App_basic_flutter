import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int counter2 = 0;

  final List<String> question = [
    'What\'s your favourite color?',
    'What\'s your favourite food?',
    'Favourite sport?',
  ];

  final List<List<String>> options = [
    ['Black', 'Red', 'Green', 'Yellow'],
    ['Rice', 'Oats', 'Burger', 'potato'],
    ['football', 'cricket', 'badminton', 'volleyball'],
  ];

  final List<int> answers = [3, 2, 0];

  String result = '';

  void stater() {
    setState(() {
      if (counter < options.length) counter++;
      /* else {
        counter = 0;
      } */
    });
  }

  void resetter() {
    setState(() {
      counter = 0;
    });
  }

  int stater2() {
    if (counter2 < 3) {
      return counter2++;
    } else {
      int x = counter2;
      counter2 = 0;

      return x;
    }
  }

  Widget buttoner() {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FlatButton(
          color: Colors.blue,
          child: Text(
            options[counter][stater2()],
          ),
          onPressed: stater,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: counter < question.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    question[counter],
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
                ),
                buttoner(),
                buttoner(),
                buttoner(),
                buttoner(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FlatButton(
                      color: Colors.amber,
                      child: Text('Reset'),
                      onPressed: resetter,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
