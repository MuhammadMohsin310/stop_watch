import 'dart:async';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  Color bgclr =Color(0xfff011627);
  Color txtclr =Colors.white;

  int miliSecond = 0, second = 0, minutes = 0, hours = 0;
  String digitMsecond = "00", digitsecond = "00", digitminutes = "00", digithours = "00";
  Timer? timer;
  bool started = false;


  void pause() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      

      miliSecond = 0;
      second = 0;
      minutes = 0;
      hours = 0;

      digitMsecond = "00";
      digitsecond = "00";
      digitminutes = "00";
      digithours = "00";

      started = false;
      
    });
  }

// <copied, help from chatgpt...........start();

void start() {
  started = true;
  timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
    int locamilisecond = miliSecond + 10;
    int localsecond = second;
    int localminutes = minutes;
    int localhours = hours;

    if(started){
      bgclr = Colors.white;
      txtclr = Colors.black;
    }

    if (locamilisecond > 999) {
      localsecond += locamilisecond ~/ 1000;
      locamilisecond %= 1000;

      if (localsecond > 59) {
        localminutes += localsecond ~/ 60;
        localsecond %= 60;

        if (localminutes > 59) {
          localhours += localminutes ~/ 60;
          localminutes %= 60;
        }
      }
    }

    setState(() {
      miliSecond = locamilisecond;
      second = localsecond;
      minutes = localminutes;
      hours = localhours;

      digitMsecond = (miliSecond >= 100) ? "${miliSecond % 1000}".substring(0, 2) : (miliSecond >= 10) ? "${miliSecond % 100}".substring(0, 2) : "00${miliSecond % 100}";
      digitsecond = (second >= 10) ? "$second" : "0$second";
      digithours = (hours >= 10) ? "$hours" : "0$hours";
      digitminutes = (minutes >= 10) ? "$minutes" : "0$minutes";

    });
  });
}

// copied>



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgclr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 90,),
              Text(
                "$digithours:$digitminutes:$digitsecond:$digitMsecond",
                style: TextStyle(color: txtclr, fontSize: 55),
              ),
              const SizedBox(height: 250,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      reset();
                      setState(() {
                        txtclr = Colors.white;
                        bgclr = Color(0xfff011627);
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(color: Color(0xff45535C),borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text("RESET", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  const SizedBox(width: 110,),
                  InkWell(
                    onTap: (){
                      (!started) ? start() : pause();

                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(color: Color(0xff2DC1B3),borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                          (!started) ? "START" : "PAUSE",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
