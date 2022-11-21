import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ZHCat());
}

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

TextEditingController textController = TextEditingController();

var count = 1;

class ZHCat extends StatelessWidget {
  const ZHCat({super.key});

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
  State<MyStatefulWidget> createState()=> ZH();
}

class ZH extends State<MyStatefulWidget> {
  List<String> zhquestions = ['What was the name of the all-black town where Zora grew up?', 'Who did Hurston conduct research with at Barnard College and later begin field work for in Harlem?', 'Who was Hurston\'s patron in the late 1920s who allowed her to return to the South to collect folklore?', 'In which state did Hurston spend the last years of her life?', 'Who was Hurston very close friends with until their relationship was severed over the writing of the play "Mule Bone"?', 'How many siblings did Hurston have?', 'Whose literary club did she join while attending Howard University?', 'In 1928, what did Hurston receive her B.A. in after graduating from Barnard College?', 'Which literary movement is Hurston most often credited for playing a major role in?', 'In what city was Hurston sent to boarding school?', 'What was the occupation of Patrick DuVal, the man who saved Hurston\'s papers from being burned after her death?', 'How old was Hurston when she moved to Eatonville?', 'Where was Zora Neale Hurston actually born?', 'How many times was Hurston married?', 'Which University honored Hurston by giving her the Distinguished Alumni Award?'];
  List<List<String>> zhanswers = [['Eatonville', 'Eattonville', 'Eatonvile'], ['Franz Boas', 'Frans Boas', 'Franz Boaz', 'Frans Boaz'], ['Charlotte Osgood Mason', 'Charlotte Mason', 'Charlotte Osgood', 'Osgood Mason'], ['Florida', 'FLorida'], ['Langston Hughes', 'Langston', 'Hughes'], ['Seven', '7'], ['Alain Locke', 'Alan Locke', 'Alain', 'Locke'], ['Anthropology', 'Anthropologie'],['Harlem Renaissance', 'The Harlem Renaissance', 'Harlem Rennaissance'], ['Jacksonville', 'Jaxonville'], ['Police officer', 'Police', 'Officer'], ['Three', '3'], ['Notsulga, Alabama', 'Notsulga Alabama', 'Notsulga, AL', 'Alabama', 'AL'], ['Two', '2'], ['Howard University', 'Howard']];
  List<List<String>> zhoptions = [['Notasulga', 'Jacksonville', 'Springfield'], ['Alain Locke', 'Langston Hughes', 'Wallace Thurman'], ['Wallace Thurman', 'Claude McKay', 'Nella Larsen'], ['New York', 'Alabama', 'California'], ['Franz Boas', 'Charlotte Osgood Mason', 'Alain Locke'], ['Five', 'Eight', 'Two'], ['Claude McKay', 'Langston Hughes', 'Jessie Redmon Fauset'], ['English', 'Philosophy', 'Psychology'], ['Transcendentalism', 'Realism', 'Beat Generation'], ['Eatonville', 'Oklahoma City', 'Harlem'], ['Writer', 'Singer', 'Construction Worker'], ['5', '12', '16'], ['Eatonville, Florida', 'Jacksonville, Florida', 'Harlem, New York'], ['One', 'Never', 'Three'], ['Barnard College', 'Columbia', 'Eatonville University']];

  TextStyle textStyle = const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  List<int> zhQuestionNums = [Random().nextInt(15), Random().nextInt(15), Random().nextInt(15), Random().nextInt(15), Random().nextInt(15)];

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  Widget buildZoraHerselfOptions(BuildContext context, String response) {
    count--;
    bool correct = false;
    response=='2' ? response='Two' : response;  //Converting numerical responses to words
    response=='7' ? response='Seven' : response;
    response=='3' ? response='Three' : response;
    String right = zhanswers[zhQuestionNums[count-1]][0];
    for(int i = 0; i < zhoptions[zhQuestionNums[count-1]].length; i++) {  //Error here when gets to 5
      if(response.toLowerCase() == zhoptions[zhQuestionNums[count-1]][i].toLowerCase()) {
        correct = true;
        right = response;
      }
    }
    var rng = Random();
    int rightOption = rng.nextInt(3);
    int responseOption = rng.nextInt(3);
    final myStack = Stack<int>();
    myStack.push(0);
    myStack.push(1);
    myStack.push(2);
    Size txtSize = _textSize(zhquestions[zhQuestionNums[count-1]], const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
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
                                        height: 150 + txtSize.height + 20,
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
                      const Text('', style: TextStyle(fontSize: 20)),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(width: 2.0, color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  count++;
                                  return build(context);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==0 ? right : (correct==false && responseOption == 0 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  count++;
                                  return build(context);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==1 ? right : (correct==false && responseOption == 1 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  count++;
                                  return build(context);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==2 ? right : (correct==false && responseOption == 2 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  count++;
                                  return build(context);
                                }));
                              },
                              child: Align(alignment: Alignment.center,child: Text(rightOption==3 ? right : (correct==false && responseOption == 3 ? response : zhoptions[zhQuestionNums[count-1]][myStack.pop()]), style: const TextStyle(color: Colors.black, fontSize: 20)))
                          )),
                    ])))
    );
  }

  @override
  Widget build(BuildContext context) {
    Size txtSize = _textSize(zhquestions[zhQuestionNums[count - 1]], const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));

    return Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(child: Center(
            child: Column(
                children: <Widget>[
                  const Text('', style: TextStyle(fontSize: 140),),
                  Container(
                      child:
                      Row(
                          children: <Widget>[
                            Expanded(
                                child:
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(top: BorderSide(
                                            width: 4, color: Colors.black)),
                                        boxShadow: [BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.black26
                                        )
                                        ]
                                    ),
                                    height: 150 + txtSize.height,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Question $count',
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                  textAlign: TextAlign.left,)),
                                            const Text('',
                                              style: TextStyle(fontSize: 20),),
                                            Text(zhquestions[zhQuestionNums[count - 1]],
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 16),
                    child: TextField(
                      controller: textController,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
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
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          count == 5 ? count = 1 : count++;
                          String response = textController.text;
                          textController.clear();
                          return buildZoraHerselfOptions(context, response);
                        }));
                      },
                      child: const Text('Submit',
                          style: TextStyle(color: Colors.black, fontSize: 30))
                  ),
                ]
            )
        )
        ));
  }
  }