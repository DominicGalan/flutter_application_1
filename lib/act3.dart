// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Act 3 ',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Activity 2: ChatBox'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;
//   const MyHomePage({super.key, required this.title});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final commentSection = [
//     "Pumasok ka ba ngayon?",
//     "hindi man, ikaw?",
//     "Nah me chillin out my house",
//     "Hell yea! I like that",
//   ];
//   int currentValue = 0;

//   void nextLineComment (){ 
//     setState(() {
//       currentValue = (currentValue + 1) % commentSection.length;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors. grey[900],
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//       ),

//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [ 
//             Center(
//               child: CircleAvatar(
//                   backgroundImage: AssetImage('./images/profpic.jpg'),
//                   radius: 30,
//                 ),
//               ),
//               Center(
//                 child: Text(
//                 "Neil Dominic Galan",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2.0,
//                   color: Colors.white, 
//                   fontFamily: 'RobotoCondensed',  
//                   ),
//                  ),
//               ), 

// // Icons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(right: 20),
//                   child: Icon(
//                     Icons.settings,
//                     color: Colors.red[200],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 20),
//                   child: Icon(
//                     Icons.search,
//                     color: Colors.green[200],
//                   ),
//                 ),
//                 Icon(
//                   Icons.image,
//                   color: Colors.blue[200],
//                 ),
//               ],
//             ),

// // Lines
//             Divider(
//               height: 20,
//               color: const Color.fromARGB(255, 255, 141, 141),
//             ),

// // Chatting time
//           Column(
//             children: [
//               buildChatBubble (
//                 commentSection[currentValue],
//                 Color.fromARGB(255, 94, 37, 37),
//                 Colors.white,
//               )
//             ],
//           ),
//           ]
//         )
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: nextLineComment,
//         backgroundColor: Colors.green,
//         child: Icon(Icons.send),
//       ),
//     );
//   }
//   Widget buildChatBubble(String message, Color bgColor, Color textColor){
//     return Container(
//       color: bgColor,
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         message,
//         style: TextStyle(
//         color: textColor,
//         letterSpacing: 1.0,
//         fontFamily: 'RobotoCondensed',
//        ),
//       ),
//     );
//   }
// }

