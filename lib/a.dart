// import 'dart:async';
// import 'package:flutter/material.dart';

// class SecondScreen extends StatefulWidget {
//   const SecondScreen({super.key});

//   @override
//   State<SecondScreen> createState() => _SecondScreenState();
// }

// class _SecondScreenState extends State<SecondScreen> {

//   int miliSecond = 0, second = 0, minutes = 0, hours = 0;
//   String digitMsecond ="00", digitsecond ="00", digitminutes ="00", digithours ="00";
//   Timer? timer;
//   bool started = false;

//   void pause(){
//     timer!.cancel();
//     setState(() {
//       started = false;
//     });
//   }

//   void reset(){
//     timer!.cancel();
//     setState(() {
//       miliSecond = 0;
//       second = 0;
//       minutes = 0;
//       hours = 0;

//       digitMsecond = "00";
//       digitsecond = "00";
//       digitminutes = "00";
//       digithours = "00";

//       started = false;
//     });
//   }

//   void start(){
//     started = true;
//     timer = Timer.periodic(Duration(milliseconds: 1), (timer) { 
//       int locamilisecond = miliSecond +1;
//       int localsecond = second;
//       int localminutes = minutes;
//       int localhours = hours;
      
//       if(locamilisecond > 59){
//         if(localsecond > 59){
//           if(localminutes > 59){
//             localhours++;
//             localminutes = 0;
//           }else{
//             localminutes++;
//             locamilisecond = 0;
//             localsecond = 0;
//           }
//         }
//       }

//       setState(() {
//         miliSecond = locamilisecond;
//         second = localsecond;
//         minutes = localminutes;
//         hours = localhours;

//         digitMsecond = (miliSecond >= 10) ? "$miliSecond" : "0$miliSecond";
//         digitsecond = (second >= 10) ? "$second" : "0$second";
//         digithours = (hours >= 10) ? "$hours" : "0$hours";
//         digitminutes = (minutes >= 10) ? "$minutes" : "0$minutes";


//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfff011627),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 90,),
//               Text("$digitminutes:$digitminutes:$digitsecond:$digitMsecond",
//               style: TextStyle(color: Colors.white,fontSize: 55),),
//               const SizedBox(height: 250,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       reset();
//                     },
//                     child: Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(color: Color(0xff45535C),borderRadius: BorderRadius.circular(100)),
//                       child: Center(child: Text("RESET",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
//                     ),
//                   ),
//                   const SizedBox(width: 110,),
//                   InkWell(
//                     onTap: (){
//                       (!started) ? start() : pause();
//                     },
//                     child: Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(color: Color(0xff2DC1B3),borderRadius: BorderRadius.circular(100)),
//                       child: Center(child: Text(
//                         (!started) ? "START" : "PAUSE",
//                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         ),
//     );
//   }
// }