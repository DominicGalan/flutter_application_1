import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Storyline',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Activity 2: ChatBox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _comments = [
    "Pumasok ka ba ngayon?",
    "hindi man, ikaw?",
    "Nah me chillin out my house",
    "Hell yea! I like that"
  ];
  int _currentCommentIndex = 0;

  void _showNextComment() {
    setState(() {
      // Loop back to the first comment after the last one
      _currentCommentIndex = (_currentCommentIndex + 1) % _comments.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      backgroundColor: Colors.grey[900],
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  // Build AppBar
  AppBar buildAppBar() {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  // Build Body
  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProfileSection(),
          buildIconsRow(),
          buildDivider(),
          buildChatMessages(),
          buildEmptySpace(),
        ],
      ),
    );
  }

  // Build Profile Section
  Widget buildProfileSection() {
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('./images/profpic.jpg'),
            radius: 30,
          ),
        ),
        const Center(
          child: Text(
            "Neil Dominic Galan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
            ),
          ),
        ),
      ],
    );
  }

  // Build Icons Row
  Widget buildIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIcon(Icons.settings, Colors.red[200]),
        buildIcon(Icons.search, Colors.green[200]),
        buildIcon(Icons.image, Colors.blue[200]),
      ],
    );
  }

  Widget buildIcon(IconData icon, Color? color) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  // Build Divider
  Widget buildDivider() {
    return const Divider(
      height: 20,
      color: Color.fromARGB(255, 255, 141, 141),
    );
  }

  // Build Chat Messages
  Widget buildChatMessages() {
    return Column(
      children: [
        buildChatBubble(_comments[_currentCommentIndex], Colors.grey, Colors.black),
      ],
    );
  }

  Widget buildChatBubble(String message, Color bgColor, Color textColor) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        message,
        style: TextStyle(
          color: textColor,
          letterSpacing: 1.0,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  // Build Empty Space (for spacing or placeholders)
  Widget buildEmptySpace() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 335),
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 185, vertical: 10),
          child: const Text(""),
        ),
      ],
    );
  }

  // Build Floating Action Button
  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _showNextComment,
      backgroundColor: Colors.green,
      child: const Icon(Icons.send),
    );
  }
}


// class StoryLine extends StatefulWidget {
//   @override
//   _StoryScreenState createState() => _StoryScreenState();
// }

// class _StoryScreenState extends State<StoryLine> {
//   // List of storylines
//   final List<String> _storylines = [
//     "How is your day?",
//     "I'm fine, what about you?",
//     "I'm good too, thanks for asking!",
//     "Where should we go next?",
//     "Maybe an adventure awaits us!"
//   ];

//   // Current index of the storyline
//   int _currentIndex = 0;

//   // Function to progress the storyline
//   void _nextStoryline() {
//     setState(() {
//       // If there's more story, move to the next one
//       if (_currentIndex < _storylines.length - 1) {
//         _currentIndex++;
//       } else {
//         // Reset to the beginning or stop progressing
//         _currentIndex = 0; // Loop back to the first story
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Interactive Story")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _storylines[_currentIndex],
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: _nextStoryline, // Change storyline on press
//               child: Text("Next"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class StoryLine extends StatefulWidget {
//   const StoryLine({super.key});

//   @override
//   State<StoryLine> createState() => _StoryLineState();
// }

// class _StoryLineState extends State<StoryLine> {
//     String _storyline = "You are at the crossroads of an adventure.";

//     void _showChoiceDialog() {
//       showDialog (
//         context: context, 
//         builder: (BuildContext context){
//           return AlertDialog(
//           title: Text("Choose Your Path"),
//           content: Text("What will you do next?"),
//           actions: [
//             TextButton(onPressed: () {
//               setState(() {
//                 _storyline = "You chose the left path and found a treasure!";
//               });
//               Navigator.of(context).pop();
//             }, child: Text("take the left path"),
//             ),
//             TextButton(onPressed: (){
//               setState(() {
//                 _storyline = "you chose the left path and encountered a DRAGON!";
//               });
//               Navigator.of(context).pop();
//             }, child: Text("Take the right path")),
//             ],
//           );
//         },
//       );
//     }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Storyline Dialog")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _storyline,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: _showChoiceDialog, child: Text("Choose Your Path")),
//           ],
//         ),
//       ),
//     );
//   }
// }

