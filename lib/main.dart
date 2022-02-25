import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  /* Mon Tableau Suivi score */
  List<Icon> suiviScore = [];
  /* Ma liste de Question */
  List<String> questions = [
    "Le Piton des Neiges est un volcan de la Réunion ?",
    "Flutter permet de faire des applications web également ?",
    "Flutter ne permet pas de faire des applications Windows, Mac OS, Linux également ?",
    " PHP est le langage le plus utilisé pour programmer avec Flutter ?",
    "Fin du quizz"
  ];
  List<bool> reponses = [true, true, false, false];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
/* ------- Widget Questions --------------- */

                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Text(
                        questions[questionNumber],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 88, 242, 247),
                            fontSize: 25.0),
                      ),
                    ),
                  ),
                ),

                /* ------- Buttons Vrai --------------- */

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        bool bonne_reponse = reponses[questionNumber];
                        setState(() {
                          if (bonne_reponse == true &&
                              questionNumber <= questions.length) {
                            suiviScore
                                .add(Icon(Icons.check, color: Colors.green));
                          } else {
                            suiviScore
                                .add(Icon(Icons.close, color: Colors.red));
                          }

                          questionNumber++; // questionNumber = questionNumber+1;
                        });
                      },
                      child: Text(
                        "Vrai",
                        style: TextStyle(
                            color: Color.fromARGB(255, 233, 251, 239),
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                /* ------- Button Faux --------------- */
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 219, 27, 27)),
                      ),
                      onPressed: () {
                        bool bonne_reponse = reponses[questionNumber];
                        setState(() {
                          if (bonne_reponse == false &&
                              questionNumber <= questions.length) {
                            suiviScore.add(Icon(
                              Icons.check,
                              color: Colors.green,
                            ));
                          } else {
                            suiviScore
                                .add(Icon(Icons.close, color: Colors.red));
                          }
                          questionNumber++;
                        });
                      },
                      child: Text(
                        "Faux",
                        style: TextStyle(
                            color: Color.fromARGB(255, 233, 251, 239),
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: suiviScore,
                )
              ],
            ),
          ),

          /* ------- APP BAR --------------- */
          appBar: AppBar(
            backgroundColor: Color.fromARGB(220, 8, 64, 175),
            title: Text(
              'Le Super Quizz !',
              style: TextStyle(
                  color: Color.fromARGB(255, 88, 247, 1), fontSize: 45.0),
            ),
          )),
    );
  }
}
