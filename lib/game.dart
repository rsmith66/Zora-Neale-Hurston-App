import 'package:flutter/material.dart';
import 'package:zora_neale_hurston/bio.dart';
import 'dart:math';

void main() {
  runApp(const Game());
}

//Own Stack class
class Stack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}

//Text Editing controller to grab text box input
TextEditingController textController = TextEditingController();

var count = 1;  //keeps count of which question they're on

int highScore = 0;  //For highscore, not implemented

class Game extends StatelessWidget {
  const Game({super.key});

  static const String _title = 'Game Page';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState()=> GamePage();
}

class GamePage extends State<MyStatefulWidget> {
  //Questions, answers, and options for Zora Herself category
  List<String> zhquestions = ['What was the name of the all-black town where Zora grew up?', 'Who did Hurston conduct research with at Barnard College and later begin field work for in Harlem?', 'Who was Hurston\'s patron in the late 1920s who allowed her to return to the South to collect folklore?', 'In which state did Hurston spend the last years of her life?', 'Who was Hurston very close friends with until their relationship was severed over the writing of the play "Mule Bone"?', 'How many siblings did Hurston have?', 'Whose literary club did she join while attending Howard University?', 'In 1928, what did Hurston receive her B.A. in after graduating from Barnard College?', 'Which literary movement is Hurston most often credited for playing a major role in?', 'In what city was Hurston sent to boarding school?', 'What was the occupation of Patrick DuVal, the man who saved Hurston\'s papers from being burned after her death?', 'How old was Hurston when she moved to Eatonville?', 'Where was Zora Neale Hurston actually born?', 'How many times was Hurston married?', 'Which University honored Hurston by giving her the Distinguished Alumni Award?'];
  List<List<String>> zhanswers = [['Eatonville', 'Eattonville', 'Eatonvile'], ['Franz Boas', 'Frans Boas', 'Franz Boaz', 'Frans Boaz'], ['Charlotte Osgood Mason', 'Charlotte Mason', 'Charlotte Osgood', 'Osgood Mason'], ['Florida', 'FLorida'], ['Langston Hughes', 'Langston', 'Hughes'], ['Seven', '7'], ['Alain Locke', 'Alan Locke', 'Alain', 'Locke'], ['Anthropology', 'Anthropologie'],['Harlem Renaissance', 'The Harlem Renaissance', 'Harlem Rennaissance'], ['Jacksonville', 'Jaxonville'], ['Police officer', 'Police', 'Officer', 'Cop'], [ '3', 'Three'], ['Notsulga, Alabama', 'Notsulga Alabama', 'Notsulga, AL', 'Alabama', 'AL'], ['Two', '2'], ['Howard University', 'Howard']];
  List<List<String>> zhoptions = [['Notasulga', 'Jacksonville', 'Springfield'], ['Alain Locke', 'Langston Hughes', 'Wallace Thurman'], ['Wallace Thurman', 'Claude McKay', 'Nella Larsen'], ['New York', 'Alabama', 'California'], ['Franz Boas', 'Charlotte Osgood Mason', 'Alain Locke'], ['Five', 'Eight', 'Two'], ['Claude McKay', 'Langston Hughes', 'Jessie Redmon Fauset'], ['English', 'Philosophy', 'Psychology'], ['Transcendentalism', 'Realism', 'Beat Generation'], ['Eatonville', 'Oklahoma City', 'Harlem'], ['Writer', 'Singer', 'Construction Worker'], ['5', '12', '16'], ['Eatonville, Florida', 'Jacksonville, Florida', 'Harlem, New York'], ['One', 'Never', 'Three'], ['Barnard College', 'Columbia', 'Eatonville University']];

  //Questions, answers, and options for Vernacular category
  List<String> vquestions = ['House or apartment?', 'Aimless talking?', 'Fleeing on foot?', 'A rough man?', 'Talking without purpose?', 'Eat a meal?', 'Sex?', 'Liquor?', 'Good hair?', 'A suit or a skirt out of shape in the rear?', 'Something very hot?', 'Quit talking about me?', 'Cheap liquor?', 'A far place; a measure of distance?', 'A pretty girl?'];
  List<List<String>> vanswers = [['Pilch'], ['Woofing'], ['Hauling'], ['Tush Hawg'], ['Beat up your gums'], ['Collar a hot'], ['Jelly'], ['Juice'], ['Nearer my God to thee'], ['Butt sprung'], ['July jam'],  ['Gif up off of me'], ['Conk buster'], ['Diddy-Wah-Diddy'], ['Frail eel']];
  List<List<String>> voptions = [['Flat', 'Shed', 'Roof'], ['Babbling', 'Nonsensing', 'Yapping'], ['Flooring', 'Yeeting', 'Dusting'], ['Grimmer', 'Mean Mug', 'John Henry'], ['Chewing dirt', 'Flapping those lips', 'Burning ears'], ['Chowing', 'Cleaning the farm', 'Bumping those treats'], ['Da deed', 'Heaven\'s heart', 'Yoohoo'], ['Booze', 'Medicine', 'Courage'], ['Freshing', 'Nest is out for season', 'Hat hater'], ['Rump poker', 'Behind butter', 'Rear lights'], ['Hell\'s treat', 'Boiling beauty', 'Sun kissed'], ['Leave me be', 'Don\'t be wonderin', 'Best be repenting'], ['Silly dollar', 'Well runoff', 'Dome sizzlers'], ['The bird\'s home', 'Blur out far', 'Tootoolage'], ['Blessin', 'Little sister', 'Swanky shoes']];

  TextStyle textStyle = const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  int numCorrect = 0; //Number of questions user gets right

  //Generates random numbers that will be used to get questions
  List<int> generateQs() {
    int firstQ = Random().nextInt(15);
    int secondQ = Random().nextInt(15);
    while(secondQ == firstQ)
    {
        secondQ = Random().nextInt(15);
    }
    int thirdQ = Random().nextInt(15);
    while(thirdQ == firstQ || thirdQ == secondQ)
    {
      thirdQ = Random().nextInt(15);
    }
    int fourthQ = Random().nextInt(15);
    while(fourthQ == firstQ || fourthQ == secondQ || fourthQ == thirdQ)
    {
      fourthQ = Random().nextInt(15);
    }
    int fifthQ = Random().nextInt(15);
    while(fifthQ == firstQ || fifthQ == secondQ || fifthQ == thirdQ || fifthQ == fourthQ)
    {
      fifthQ = Random().nextInt(15);
    }
    List<int> questionNums = [firstQ, secondQ, thirdQ, fourthQ, fifthQ];
    return questionNums;
  }

  //Holds question numbers for zora herself and vernacular quizzes
  List<int> zhQuestionNums = [];
  List<int> vQuestionNums = [];

  //Get size of text widget, not sure if actually works
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  //Builds instruction page displayed before quiz
  Widget instructions(BuildContext context, bool isVernacular) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child:Column(
        children: <Widget> [
          const Text('', style: TextStyle( fontSize: 100),),
          Container(
            child:
        Row(
        children: <Widget> [
            Expanded(   //Create box to display text widgets in
              child:
            Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 4, color: Colors.black)), //Color of top of box
                boxShadow: [BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26
                )]
            ),
            height: 480,  //Height of box
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[ //Text within the box
                    Align(alignment: Alignment.center, child: Text('Instructions', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textAlign: TextAlign.center,)),
                    Text('', style: TextStyle(fontSize: 20),),
                    Text('There are 5 questions per category', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('', style: TextStyle(fontSize: 20),),
                    Text('Respond with your answer to the given question', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('', style: TextStyle(fontSize: 20),),
                    Text('Your answer will become one of the multiple choice options on the next screen', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('', style: TextStyle(fontSize: 20),),
                    Text('Select the option you think is right', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text('', style: TextStyle(fontSize: 20),),
                    Text('Good luck!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ]
        ),
      )
            )
    )
    ]
    )
      ),
          const Text('', style: TextStyle(fontSize: 20),),
          ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if(isVernacular) {  //boolean to send to Vernacular questions
                    return buildVernacularQs(context);
                  }
                  return buildZoraHerselfQs(context); //else, send to Zora Herself questions
                }));
              },
              child: const Text('Begin', style: TextStyle(color: Colors.black, fontSize: 30))
          ),
    ])));
  }

  //Builds page that displays quiz results
  Widget buildFinalResults(BuildContext context, bool isVernacular) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('', style: TextStyle(fontSize: 60),),
            Text('Final Score: $numCorrect / 5',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                )
            ),
            const Text('', style: TextStyle(fontSize: 40),),
            //Displays message based on number correct
            Container(child: numCorrect==5 ? const Text('You\'re an Expert!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )
            ) : (numCorrect==4 || numCorrect==3 ? const Text('Great Job!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )
            ) : (numCorrect==2 || numCorrect==1 ? const Text('You\'re getting there!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )
            ) : const Text('Tough game, huh?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )
            )))
            ),
            const Text('', style: TextStyle(fontSize: 40),),
            ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  numCorrect = 0;
                  zhQuestionNums = generateQs();  //Regenerates quiz questions
                  vQuestionNums = generateQs();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if(isVernacular) {  //Sends back to either Vernacular or ZH quiz
                      return buildVernacularQs(context);
                    }
                    return buildZoraHerselfQs(context);
                  }));
                },
                child: const Text('Play Again', style: TextStyle(color: Colors.black, fontSize: 30))
            ),
            const Text('', style: TextStyle(fontSize: 20),),
            ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  numCorrect = 0; //resets number answered correct
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return build(context);  //Sends back to quiz page
                  }));
                },
                child: const Text('New Category', style: TextStyle(color: Colors.black, fontSize: 30))
            ),
            const Text('', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }

  //Displays after user chooses option and displays if correct or not
  Widget buildResults(BuildContext context, String right, bool correct, int responseOption, String response, String question, int optionClicked, int rightOption, Stack<int> myStack, bool isVernacular) {
    Size txtSize = _textSize(question, const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
    bool success = false;
    optionClicked==rightOption ? success = true : success = false;  //Check if user clicked right option
    String verdict;
    success==true ? verdict = "Correct" : verdict = "Incorrect";
    success==true ? numCorrect++ : numCorrect;
    return Scaffold(resizeToAvoidBottomInset: false,
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
            child: Center(
                child:Column(
                    children: <Widget> [
                      const Text('', style: TextStyle( fontSize: 70),),
                      Text(verdict, style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)), //Displays if correct or incorrect
                      const Text('', style: TextStyle( fontSize: 20),),
                      //Displays exact same widgets from options page except for verdict and changing option color based off what was clicked
                      Container(
                          child:
                          Row(
                              children: <Widget> [
                                Expanded(
                                    child:
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            border: Border(top: BorderSide(width: 4, color: Colors.black)),
                                            boxShadow: [BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.black26
                                            )]
                                        ),
                                        height: question== 'Who was Hurston very close friends with until their relationship was severed over the writing of the play "Mule Bone"?' ? 150 + txtSize.height + 50 : (isVernacular==true ? 150 + txtSize.height : 150 + txtSize.height + 20),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Align(alignment: Alignment.centerLeft, child: Text('Question $count', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                                                const Text('', style: TextStyle(fontSize: 20),),
                                                Text(question, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                              ]
                                          ),
                                        )
                                    )
                                )
                              ]
                          )
                      ),
                      const Text('', style: TextStyle(fontSize: 20)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                //Change to green if right option, red if clicked by user and not right option, and white if not clicked and not right option
                                backgroundColor: rightOption==0 || (optionClicked==0 && success==true) ? Colors.lightGreen : (optionClicked==0 && success==false ? Colors.red: Colors.white),
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {},
                              child: Align(alignment: Alignment.center,child: Text(rightOption==0 ? right : (correct==false && responseOption == 0 ? response : (isVernacular==true ? voptions[vQuestionNums[count-1]][myStack.pop()] : zhoptions[zhQuestionNums[count-1]][myStack.pop()])), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 5)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: rightOption==1 || (optionClicked==1 && success==true) ? Colors.lightGreen : (optionClicked==1 && success==false ? Colors.red: Colors.white),
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {},
                              child: Align(alignment: Alignment.center,child: Text(rightOption==1 ? right : (correct==false && responseOption == 1 ? response : (isVernacular==true ? voptions[vQuestionNums[count-1]][myStack.pop()] : zhoptions[zhQuestionNums[count-1]][myStack.pop()])), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 5)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: rightOption==2 || (optionClicked==2 && success==true) ? Colors.lightGreen : (optionClicked==2 && success==false ? Colors.red: Colors.white),
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {},
                              child: Align(alignment: Alignment.center,child: Text(rightOption==2 ? right : (correct==false && responseOption == 2 ? response : (isVernacular==true ? voptions[vQuestionNums[count-1]][myStack.pop()] : zhoptions[zhQuestionNums[count-1]][myStack.pop()])), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 5)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: rightOption==3 || (optionClicked==3 && success==true) ? Colors.lightGreen : (optionClicked==3 && success==false ? Colors.red: Colors.white),
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {},
                              child: Align(alignment: Alignment.center,child: Text(rightOption==3 ? right : (correct==false && responseOption == 3 ? response : (isVernacular==true ? voptions[vQuestionNums[count-1]][myStack.pop()] : zhoptions[zhQuestionNums[count-1]][myStack.pop()])), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 25)),
                      ElevatedButton(
                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                            ),
                            onPressed: () {
                              count==5 ? count = 1 : count++;
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                textController.clear();
                                if(count == 1 && isVernacular) {
                                  return buildFinalResults(context, true);
                                }
                                else if(count==1) {
                                  return buildFinalResults(context, false);
                                }
                                if(isVernacular) {
                                  return buildVernacularQs(context);
                                }
                                return buildZoraHerselfQs(context);
                              }));
                            },
                            child: const Text('Next Question', style: TextStyle(color: Colors.black, fontSize: 30))
                        ),
                    ])))
    );

  }

  //Creates page that displays options for multiple choice section
  Widget buildZoraHerselfOptions(BuildContext context, String response) {
    Size txtSize = _textSize(zhquestions[zhQuestionNums[count-1]], const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
    bool correct = false;
    String right = zhanswers[zhQuestionNums[count-1]][0];
    for(int i = 0; i < zhanswers[zhQuestionNums[count-1]].length; i++) {
      //Checks if response was correct and replaces correct answer with user response if so
      if(response.toLowerCase() == zhanswers[zhQuestionNums[count-1]][i].toLowerCase()) {
        correct = true;
        right = response;
      }
    }
    //Get random int that tells which option will be the right one and the user response
    var rng = Random();
    int rightOption = rng.nextInt(3);
    int responseOption = rng.nextInt(3);
    //Make sure user and correct response are different options
    while (rightOption == responseOption) {
      responseOption = Random().nextInt(3);
    }
    final myStack = Stack<int>(); //Stack used to get different options for multiple choice buttons
    myStack.push(0);
    myStack.push(1);
    myStack.push(2);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Center(
        child:Column(
        children: <Widget> [
          const Text('', style: TextStyle( fontSize: 140),),
          Container(
            child:
        Row(
        children: <Widget> [
            Expanded(   //Box to display question
              child:
            Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 4, color: Colors.black)),
                boxShadow: [BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26
                )]
            ),
            //Sets the height to be value of text + 150 if not the one question that creates resizing issues
            height: zhquestions[zhQuestionNums[count-1]]== 'Who was Hurston very close friends with until their relationship was severed over the writing of the play "Mule Bone"?' ? 150 + txtSize.height + 50 : 150 + txtSize.height + 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  //Display text for Question num and question
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft, child: Text('Question $count', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                    const Text('', style: TextStyle(fontSize: 20),),
                    Text(zhquestions[zhQuestionNums[count-1]], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ]
        ),
      )
            )
    )
    ]
    )
      ),
          const Text('', style: TextStyle(fontSize: 20)),
          SizedBox( //First multiple choice option
              width: 300,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2.0, color: Colors.black),
                  ),
                  onPressed: () {
                    final newStack = Stack<int>();  //New stack to send to q results page
                    newStack.push(0);
                    newStack.push(1);
                    newStack.push(2);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //Sends all same info made in this class to results page to display if correct choice or not
                      return buildResults(context, right, correct, responseOption, response, zhquestions[zhQuestionNums[count-1]], 0, rightOption, newStack, false);
                    }));
                  },
                  //Text of option
                  //If option 0 is right option, display right result, if user response isnt right and option 0 is user response option, display user response, if neither, pop from stack and display one of the wrong answer options
                  child: Align(alignment: Alignment.center,child: Text(rightOption==0 ? right : (correct==false && responseOption == 0 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
              )),
          const Text('', style: TextStyle(fontSize: 5)),
          SizedBox( //Option 2
              width: 300,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2.0, color: Colors.black),
                  ),
                  onPressed: () {
                    final newStack = Stack<int>();
                    newStack.push(0);
                    newStack.push(1);
                    newStack.push(2);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return buildResults(context, right, correct, responseOption, response, zhquestions[zhQuestionNums[count-1]], 1, rightOption, newStack, false);
                    }));
                  },
                  child: Align(alignment: Alignment.center,child: Text(rightOption==1 ? right : (correct==false && responseOption == 1 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
              )),
          const Text('', style: TextStyle(fontSize: 5)),
          SizedBox( //Option 3
              width: 300,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2.0, color: Colors.black),
                  ),
                  onPressed: () {
                    final newStack = Stack<int>();
                    newStack.push(0);
                    newStack.push(1);
                    newStack.push(2);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return buildResults(context, right, correct, responseOption, response, zhquestions[zhQuestionNums[count-1]], 2, rightOption, newStack, false);
                    }));
                    //count==5 ? count = 1 : count++;
                  },
                  child: Align(alignment: Alignment.center,child: Text(rightOption==2 ? right : (correct==false && responseOption == 2 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
              )),
            const Text('', style: TextStyle(fontSize: 5)),
          SizedBox( //Option 4
              width: 300,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2.0, color: Colors.black),
                  ),
                  onPressed: () {
                    final newStack = Stack<int>();
                    newStack.push(0);
                    newStack.push(1);
                    newStack.push(2);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return buildResults(context, right, correct, responseOption, response, zhquestions[zhQuestionNums[count-1]], 3, rightOption, newStack, false);
                    }));
                  },
                  child: Align(alignment: Alignment.center,child: Text(rightOption==3 ? right : (correct==false && responseOption == 3 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
              )),
    ])))
    );
  }

  //Creates page displaying question and text box for user to write in their answer
  Widget buildZoraHerselfQs(BuildContext context) {
    Size txtSize = _textSize(zhquestions[zhQuestionNums[count-1]], textStyle);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green,
      body: SingleChildScrollView(child: Center(
        child:Column(
        children: <Widget> [
          const Text('', style: TextStyle( fontSize: 140),),
          Container(
            child:
        Row(
        children: <Widget> [
            Expanded( //Box to display question number and question
              child:
            Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 4, color: Colors.black)),
                boxShadow: [BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26
                )]
            ),
            height: zhquestions[zhQuestionNums[count-1]]== 'Who was Hurston very close friends with until their relationship was severed over the writing of the play "Mule Bone"?' ? 150 + txtSize.height + 50 : 150 + txtSize.height + 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft, child: Text('Question $count', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                    const Text('', style: TextStyle(fontSize: 20),),
                    Text(zhquestions[zhQuestionNums[count-1]], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ]
        ),
      )
            )
    )
    ]
    )
          ),
          const Text('', style: TextStyle(fontSize: 80)),
          Padding( //Sets the dimensions of the text box
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            child: TextField(   //Text box to get user's answer
              controller: textController, //Set Text Controller so we can get the response into a variable
              style: const TextStyle( fontSize: 20, color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your answer',
              ),
            ),
          ),
          const Text('', style: TextStyle(fontSize: 20)),
          ElevatedButton(   //Submit button
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  String response = textController.text;  //Get the response from the user
                  textController.clear(); //Clear user response from text box for next time
                  return buildZoraHerselfOptions(context, response);  //Open multiple choice page and send user response
                }));
              },
              child: const Text('Submit', style: TextStyle(color: Colors.black, fontSize: 30))
          ),
        ]
    )
          )
    ));
  }

  //Builds multiple choice page for the Vernacular quiz category, same as ZH MC but with Vernacular questions and answers
  Widget buildVernacularOptions(BuildContext context, String response) {
    Size txtSize = _textSize(vquestions[vQuestionNums[count-1]], const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
    bool correct = false;
    String right = vanswers[vQuestionNums[count-1]][0];

    var rng = Random();
    int rightOption = rng.nextInt(3);
    int responseOption = rng.nextInt(3);
    while (rightOption == responseOption) {
      responseOption = Random().nextInt(3);
    }
    final myStack = Stack<int>();
    myStack.push(0);
    myStack.push(1);
    myStack.push(2);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
            child: Center(
                child:Column(
                    children: <Widget> [
                      const Text('', style: TextStyle( fontSize: 140),),
                      Container(
                          child:
                          Row(
                              children: <Widget> [
                                Expanded(
                                    child:
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            border: Border(top: BorderSide(width: 4, color: Colors.black)),
                                            boxShadow: [BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.black26
                                            )]
                                        ),
                                        height: 150 + txtSize.height,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Align(alignment: Alignment.centerLeft, child: Text('Question $count', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                                                const Text('', style: TextStyle(fontSize: 20),),
                                                Text(vquestions[vQuestionNums[count-1]], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                              ]
                                          ),
                                        )
                                    )
                                )
                              ]
                          )
                      ),
                      const Text('', style: TextStyle(fontSize: 20)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {
                                final newStack = Stack<int>();
                                newStack.push(0);
                                newStack.push(1);
                                newStack.push(2);
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return buildResults(context, right, correct, responseOption, response, vquestions[vQuestionNums[count-1]], 0, rightOption, newStack, true);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==0 ? right : (correct==false && responseOption == 0 ? response : voptions[vQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 5)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {
                                final newStack = Stack<int>();
                                newStack.push(0);
                                newStack.push(1);
                                newStack.push(2);
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return buildResults(context, right, correct, responseOption, response, vquestions[vQuestionNums[count-1]], 1, rightOption, newStack, true);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==1 ? right : (correct==false && responseOption == 1 ? response : voptions[vQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 5)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {
                                final newStack = Stack<int>();
                                newStack.push(0);
                                newStack.push(1);
                                newStack.push(2);
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return buildResults(context, right, correct, responseOption, response, vquestions[vQuestionNums[count-1]], 2, rightOption, newStack, true);
                                }));
                                //count==5 ? count = 1 : count++;
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==2 ? right : (correct==false && responseOption == 2 ? response : voptions[vQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                      const Text('', style: TextStyle(fontSize: 5)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {
                                final newStack = Stack<int>();
                                newStack.push(0);
                                newStack.push(1);
                                newStack.push(2);
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return buildResults(context, right, correct, responseOption, response, vquestions[vQuestionNums[count-1]], 3, rightOption, newStack, true);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==3 ? right : (correct==false && responseOption == 3 ? response : voptions[vQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                    ])))
    );
  }

  //Builds Vernacular question page where user enters their response, same as one for ZH
  Widget buildVernacularQs(BuildContext context) {
    Size txtSize = _textSize(vquestions[vQuestionNums[count-1]], textStyle);

    return Scaffold(
        backgroundColor: Colors.green,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView( child: Center(
            child:Column(
                children: <Widget> [
                  const Text('', style: TextStyle( fontSize: 140),),
                  Container(
                      child:
                      Row(
                          children: <Widget> [
                            Expanded(
                                child:
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(top: BorderSide(width: 4, color: Colors.black)),
                                        boxShadow: [BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.black26
                                        )]
                                    ),
                                    height: 150 + txtSize.height,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Align(alignment: Alignment.centerLeft, child: Text('Question $count', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                                            const Text('', style: TextStyle(fontSize: 20),),
                                            Text(vquestions[vQuestionNums[count-1]], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                          ]
                                      ),
                                    )
                                )
                            )
                          ]
                      )
                  ),
                  const Text('', style: TextStyle(fontSize: 80)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    child: TextField(
                      controller: textController,
                      style: const TextStyle( fontSize: 20, color: Colors.black),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your answer',
                      ),
                    ),
                  ),
                  const Text('', style: TextStyle(fontSize: 20)),
                  ElevatedButton(
                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          String response = textController.text;
                          textController.clear();
                          return buildVernacularOptions(context, response);
                        }));
                      },
                      child: const Text('Submit', style: TextStyle(color: Colors.black, fontSize: 30))
                  ),
                ]
            )
        )
        ));
  }

  //Creates main quiz page
  @override
  Widget build(BuildContext context) {
    zhQuestionNums = generateQs();  //Generates which quiz questions will be asked for both categories
    vQuestionNums = generateQs();

    return Scaffold(
      backgroundColor: Colors.green,  //Set background to green
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('So You Think You Know Zora?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                )
            ),
            const Text('', style: TextStyle(fontSize: 60),),
            const Text('Pick a Category',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )
            ),
            const Text('', style: TextStyle(fontSize: 30),),
            ElevatedButton( //Button for zora herself option
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return instructions(context, false);  //Sends to instruction page with false passed to isVernacular
                  }));
                },
                child: const Text('Zora Herself', style: TextStyle(color: Colors.black, fontSize: 30))
            ),
            const Text('', style: TextStyle(fontSize: 20),),
            ElevatedButton( //Button for vernacular option
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return instructions(context, true);
                  }));
                },
                child: const Text('Zora\'s Harlem Vernacular', style: TextStyle(color: Colors.black, fontSize: 30))
            ),
            const Text('', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}