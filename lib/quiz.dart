import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizz/model.dart';
class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://th.bing.com/th/id/OIP.x9RZYWQ66XUseJxT5QB6JgHaFR?w=207&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Center(
            child: Column(
              children: [
                Center(
                  child:
                  Text(
                    getQus(),
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
                  ),
                ),
                SizedBox(height: 300,),
                 Container(height: 40,width: 500,
                   child: TextButton(style:  TextButton.styleFrom(backgroundColor: Colors.green),
                       onPressed: (){check(true);}, child: Text('TRUE'),),
                 ),
               SizedBox(height: 30,),
               Container(height: 40,width: 500,
                   child: TextButton(style: TextButton.styleFrom(backgroundColor:Colors.red, ),onPressed: (){check(false);}, child: Text('FALSE'),
                   ),
               ),
               //
                //Image(image: NetworkImage('https://img.freepik.com/free-vector/customer-support-service-hotline-center-helpdesk_107791-12895.jpg?w=1060&t=st=1684833036~exp=1684833636~hmac=6eb5afae891b5c1c88fe67f6e845c3101e09c3681a5f3f06dcb994252cf04762')),
              Row(
                children: ico
              ),
              ],
            ),
          ),
        )
      ),
    );
  }
  List question = [
    Quiz(qus: 'car have 4 wheels',ans:true),
    Quiz(qus: 'Bike have 3 wheels',ans: false),
    Quiz(qus: 'sky color is blue',ans:true),
    Quiz(qus: 'human blood color is green',ans: false),
    Quiz(qus: 'kerala is the state of america',ans:false),
    Quiz(qus: 'india is a asian country',ans: true),
    Quiz(qus: 'malayalam is the mother tongue of kerala',ans:true),
    Quiz(qus: 'lionel messi is a cricket player',ans: false),
    Quiz(qus: '125 less then 25',ans:false),
    Quiz(qus: 'cat have 4 legs',ans: true),
  ];

  List<Icon> ico =[];

  int count = 0;
  int qusNo = 0;
  void nextQus() {
    if (qusNo < question.length){
      qusNo++;
    }
  }

  String getQus() {
    return question[qusNo].qus;
  }
  bool getAns() {
    return question[qusNo].ans;
  }
  bool isFinshed() {
    if (qusNo >= question.length - 1) {
      return true;
    } else {
      return false;
    }
  }
  int reset() {
    qusNo = 0;
    count = 0;
    return qusNo;
  }
  void check(bool answer) {
    bool value = getAns();
    setState(() {

      if (isFinshed() == true){
        if (count <= 5) {
          Alert(context: context,title:' The end',desc: 'you are failed')
              .show();
          reset();
          ico = [];
        }else{
          Alert(
             context: context,
            title:'THE END',
            desc:' YOU ARE PASSED WITH $count marks'
          ).show();
          reset();
          ico = [];
        }
      } else {
        if (value == answer) {
          print(count);
          ico.add(Icon(
              Icons.check,
          color: Colors.green,));
          count++;
        } else{
          ico.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        nextQus();
      }
    });
  }
}
